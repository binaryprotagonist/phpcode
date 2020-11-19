<?php

namespace App\Http\Controllers\Api;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Validation\Rule;
use Validator;
use Auth;
use Hash;
use Redirect,Response,DB,Config;

class HomeController extends Controller{

    public function createTenant(Request $request){

        $inputs  = $request->all();
        $rules = [
            'adminEmail'    => 'required|unique:users,email,null,id,deleted_at,NULL',
            'tenantName'    => 'required|email',
            'password'      => 'required|min:8',
         //   'planDetails'   => 'required'
        ];

        $validator = Validator::make($inputs, $rules,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }

        $insertData = array(
             'email'    => $inputs['adminEmail'],
             'password' => Hash::make($inputs['password']),
             'user_name' => $inputs['tenantName']
         );

        if(DB::table('users')->insertGetId($insertData)){
         return ['status'=>true,'message'=>'Successfully registered','data'=>$inputs];
        }
        return ['status'=>false,'message'=>'Failed to registered'];
    } 

    public function tenantList(Request $request){
        
        $tenats = User::select('users.id as tenant_id','users.user_name as tenant_name','users.email as tenant_email')
                        ->where('role','2')
                        ->where('active_status','1')
                        ->whereNull('deleted_at')
                        ->get();

        if($tenats->toArray()){
        return ['status'=>true,'message'=>'Record found','data'=>$tenats];
        }
        return ['status'=>false,'message'=>'Record not found'];
    }

    public function updateTenant(Request $request){
        $inputs  = $request->all();
        $tenant_id = $request->tenant_id;
        $rules = [
            'tenant_id'     =>' required',
            'adminEmail'    => 'required|unique:users,email,'.$tenant_id.',id,deleted_at,NULL',
            'tenantName'    => 'required|email',
            'password'      => 'required|min:8',
         //   'planDetails'   => 'required'
        ];

        $validator = Validator::make($inputs, $rules,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }

        $updateData = array(
             'email'    => $inputs['adminEmail'],
             'password' => Hash::make($inputs['password']),
             'user_name' => $inputs['tenantName']
         );

        if(DB::table('users')->where('id',$inputs['tenant_id'])->update($updateData)){
         return ['status'=>true,'message'=>'Successfully updated','data'=>$inputs];
        }
        return ['status'=>false,'message'=>'Failed to update'];
    }

    public function removeTenant(Request $request){
        $inputs  = $request->all();
        $rules = [
            'tenant_id'     =>' required',
        ];

        $validator = Validator::make($inputs, $rules,$message);
        if ($validator->fails()) {
            $errors =  $validator->errors()->all();
            return response(['status' => false , 'message' => $errors[0]] , 200);              
        }

        $updateData = array(
             'deleted_at'    => date('Y-m-d H:i:s')
         );

        if(DB::table('users')->where('id',$inputs['tenant_id'])->update($updateData)){
         return ['status'=>true,'message'=>'Successfully removed','data'=>$inputs];
        }
        return ['status'=>false,'message'=>'Failed to remove'];
    }

}
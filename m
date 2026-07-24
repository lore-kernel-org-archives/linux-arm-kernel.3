Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FFD4C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 06:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Jh2uux1jBxLqToUKJECqMG2sK7Obcmqmg4feylgaU8=; b=UTh490Sb7tVBNAkkQkpAylTSII
	Xgx5ELSRdEO77tsjxMZizTY7Sf52jmScDp9O9simpeIpaNWtbW00xccAuYNr/NVXx3UAjRMGAUC0b
	FUiQGsaGWVcjfuAPseJ68v0Bi1WsNPTSOKaTVJaynzUTLv9y/GNJ6C4d4z1NOVCaBSXf4PS7zkOFp
	6EIOfiCmpgWxSyjZx9LYFZt2YXVCVJrYOM0sGMlpoOAlbvVE7+csjGbEj3QKld6tvTy7aSfwYnhwX
	5IGYXL4RamrjlSdgGyRFSpzsmn8k1Xkl3YdrkyNfdlCcAa9GP3x3fwiLeKNCVwky1RQBWgTGYmpaO
	MwnbNYxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9RF-0000000Fbjn-1qEx;
	Fri, 24 Jul 2026 06:31:17 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn9RD-0000000FbjS-1SZl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 06:31:16 +0000
Received: from [10.94.177.11] (unknown [4.194.122.136])
	by linux.microsoft.com (Postfix) with ESMTPSA id AEFCB20B7167;
	Thu, 23 Jul 2026 23:30:58 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AEFCB20B7167
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1784874660;
	bh=/Jh2uux1jBxLqToUKJECqMG2sK7Obcmqmg4feylgaU8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IGel+OV0IHKY85p6P92wZjIKwhcuWVJFzLod6i5oBZEO+Noaj8LnAgTyG3GUMnXkk
	 qpJwNDUNJzkUAmBz/eAPshQRfgwUSMxwGVHbQSX1dsAtXl6hE0m7MNQXqqytsXU9yp
	 B5zC3+oiM2iimvE6hAqslOZojIm5kP/ZRyZU9ERI=
Message-ID: <d910521d-0446-4b78-b717-062c263eea9f@linux.microsoft.com>
Date: Fri, 24 Jul 2026 12:01:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] firmware: xilinx: Use TF-A feature check for TF-A
 specific APIs
To: Jay Buddhabhatti <jay.buddhabhatti@amd.com>, michal.simek@amd.com,
 git@amd.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260723124841.2567827-1-jay.buddhabhatti@amd.com>
 <20260723124841.2567827-5-jay.buddhabhatti@amd.com>
Content-Language: en-US
From: Prasanna Kumar T S M <ptsm@linux.microsoft.com>
In-Reply-To: <20260723124841.2567827-5-jay.buddhabhatti@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_233115_419151_7C919F64 
X-CRM114-Status: GOOD (  27.82  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Jay,

On 23-07-2026 18:18, Jay Buddhabhatti wrote:
> Currently, TF-A-specific APIs are validated using the firmware
> PM_FEATURE_CHECK API, even though TF-A provides a dedicated mechanism via
> PM_API_FEATURES API. Ideally it should use the TF-A feature check
> (PM_API_FEATURES) for TF-A specific APIs. Update the feature check logic
> for TF-A specific API calls to ensure it is validated using
> PM_API_FEATURES. If this check fails, fall back to the legacy
> PM_FEATURE_CHECK to support backward compatibility.
> 
> When do_fw_call() fails, propagate the errno from zynqmp_pm_ret_code()
> instead of always returning -EOPNOTSUPP. This applies to every module ID,
> not only TF-A, because the rewrite sat in the common failure path.
> Existing callers only test ret < 0 and are unchanged.
> 
> Signed-off-by: Jay Buddhabhatti <jay.buddhabhatti@amd.com>
> ---
>   drivers/firmware/xilinx/zynqmp.c | 31 +++++++++++++++++--------------
>   1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
> index fc7212f554ee..0b6c20a1d8be 100644
> --- a/drivers/firmware/xilinx/zynqmp.c
> +++ b/drivers/firmware/xilinx/zynqmp.c
> @@ -224,34 +224,37 @@ static int __do_feature_check_call(const u32 api_id, u32 *ret_payload)
>   	module_id = FIELD_GET(MODULE_ID_MASK, api_id);
>   
>   	/*
> -	 * Feature check of APIs belonging to PM, XSEM, and TF-A are handled by calling
> +	 * Feature check of APIs belonging to PM and XSEM are handled by calling
>   	 * PM_FEATURE_CHECK API. For other modules, call PM_API_FEATURES API.
>   	 */
> -	if (module_id == PM_MODULE_ID || module_id == XSEM_MODULE_ID || module_id == TF_A_MODULE_ID)
> +	if (module_id == PM_MODULE_ID || module_id == XSEM_MODULE_ID)
>   		feature_check_api_id = PM_FEATURE_CHECK;
>   	else
>   		feature_check_api_id = PM_API_FEATURES;
>   
> -	/*
> -	 * Feature check of TF-A APIs is done in the TF-A layer and it expects for
> -	 * MODULE_ID_MASK bits of SMC's arg[0] to be the same as PM_MODULE_ID.
> -	 */
> -	if (module_id == TF_A_MODULE_ID) {
> -		module_id = PM_MODULE_ID;
> +	if (module_id == TF_A_MODULE_ID)
>   		smc_arg[1] = api_id;
> -	} else {
> +	else
>   		smc_arg[1] = (api_id & API_ID_MASK);
> -	}
>   
>   	smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, module_id) | feature_check_api_id;
>   
>   	ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
> +
> +	/*
> +	 * For TF-A APIs, if the feature check with PM_API_FEATURES fails,
> +	 * retry with the legacy PM_FEATURE_CHECK for backward compatibility.
> +	 */
> +	if (module_id == TF_A_MODULE_ID && ret) {
> +		smc_arg[0] = PM_SIP_SVC | FIELD_PREP(MODULE_ID_MASK, PM_MODULE_ID) |
> +			     PM_FEATURE_CHECK;
> +		ret = do_fw_call(ret_payload, 2, smc_arg[0], smc_arg[1]);
> +	}

This looks like a general improvement unrelated to the other patches in 
this series. I think this should go as a separate patch (not as a part 
of this series).

> +
>   	if (ret)
> -		ret = -EOPNOTSUPP;
> -	else
> -		ret = ret_payload[1];
> +		return ret;
>   
> -	return ret;
> +	return ret_payload[1];
>   }
>   
>   static int do_feature_check_call(const u32 api_id)

The return value change is separate improvement unrelated to the series 
or to the PM_API_FEATURES API usage. I think this change can be carved 
out to a separate patch.

Except for the above nits, code looks good to me.

Reviewed-by: Prasanna Kumar T S M <ptsm@linux.microsoft.com>

Regards,
Prasanna Kumar


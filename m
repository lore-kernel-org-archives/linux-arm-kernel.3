Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D03F0C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hB6oGUDhB7NpBPwBSAbY4P+UYTTTI5VBvn+Ldw600iI=; b=ighQeorAQGymsRMnhWceL6Lt/N
	JnAm2N6Y/Ju/qkgXxgueq3MHSIETHBwfBT7n6jqoBFTDOh7jZ46QK2MuCQyeQTj61zMpFgkIRwiMJ
	BXn6VbHGZ20L52CveI49BC+WG5apv/Gt7nlPb3J72lXEThPv3qJ5d8e0rs0U+ODcr0kaXoBJUsuef
	PZEotwjFFlHR+jWqkjv8CHoMz2XLF/md3QD2A9h41Ba/2YsftU0HtJIFNG5oTXTOosNu4qWHFmVfp
	xAangCOmaFyZMp+NgguXLsGts13YaNMbjaZRyQhhZ+xPRmZ6V7FPGOA0mj3mUKTDOmY4IPObCcQgw
	XpMH0XhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vNq-000000028tR-49PK;
	Mon, 14 Sep 2026 01:21:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5vNn-000000028sz-3uey
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 01:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789348878;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hB6oGUDhB7NpBPwBSAbY4P+UYTTTI5VBvn+Ldw600iI=;
	b=BpKoTWrJGKSqPnkuKj64SpPdjmHi6vb0fq7ug8gjilpsQHHRRyK2DtBY6909RFVz8hD9ti
	2y/1OzQVl8Qbwc4VXxl7Wmj7izsqH0nbeFQdlYhIK6BgN0vg7V4OGTbxm6I0Ji8JcE4DZX
	zC3L3j36WDVYbmGt5ap455EE2xSCtUo=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-87gPw0_sN0KS2kix1swb7Q-1; Sun, 13 Sep 2026 21:21:15 -0400
X-MC-Unique: 87gPw0_sN0KS2kix1swb7Q-1
X-Mimecast-MFC-AGG-ID: 87gPw0_sN0KS2kix1swb7Q_1789348874
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso4048244a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 18:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789348874; x=1789953674;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hB6oGUDhB7NpBPwBSAbY4P+UYTTTI5VBvn+Ldw600iI=;
        b=de9vuTIwA0ZuJtu8qGE8dfk4fW4vzPFs7BOAvImyMT7W0dD15NfXGrWhllVd3WBMmU
         LbECaNVFRkNTMoamYGnZccsJhK8QrMSnUGtKp4lKrBNZI0ffJXKbEzVfLYk9WWCE4xP/
         +4C2GVZ5xI9Zr39ZMUK1TM1REjsei1+A/3td5n92rHIKXiKbHfkeUYt9jueumPOw+i61
         X52ELFvQJWPp6ZbD38ypWEInQnE5J3bXrJ5UV+e5ypHHLBdZ0zUChKOGhwaRtDTpVRQY
         jW5/C9ayB95oPffV0kzpmYQ8+zBkZib8uzCwSnJTmXArvq9zeJg5qn+sdDWu0zeddopc
         IaMA==
X-Forwarded-Encrypted: i=1; AKwUvBze9kUZFV0UHGz9mCgnWCX+G10AVRmSn1EV+RnBFyESxN/VmIDj3HLutHWRMQQjv7ZwCr4imWaO9Bwk24gzYchT@lists.infradead.org
X-Gm-Message-State: AFuF++lLT/zPVixVdq9vWdDFZpEO/GAjHlTQSsg4OMTuAf9MEDdwU3W5
	+wUOHLGKbTjBHYPgJlIJey18bVPT0ZvTfnm5VYqL0hJhkw/cx8kAH0z2srmutrB8qpbhWsFC/+6
	d4iyW7fmt/4CPjun/rxwE64sHjOv/XUkJHVLBu2ukJ4tmhTBFHEjjLgLXoh0XFWLUPBYasW4EIk
	hh
X-Gm-Gg: AYBFou3/g8jNvnMzwJetGtowKjOKWMXFiCrx/WyePmHfIQgDwGg8pyCdAmzCKKug8fw
	KPnkjfTVhmLK+5Dp8wuOcZ1odO8TY7N7CWVXPnNe61bIxhaAcxqrxDubkW1PjWAKmEWLylK5IMi
	9HjGSQKMadPs0vUbpZNFeb3LNfRu9lFl6Wl/YqA40jLyK5vfumg9nIhC7LY03RakN5ukvfLXKwg
	4xqmLeH11//oGV+ihRLBYbdWt5B1cfS9EJFxsyK/fCELsVj4Z6nODnBclh3v/ZuarUtbKUaU9tA
	VcmkArSJIezdjDfEuNdzGis+r4SbYYoiYXWu+aVsr6vPqzifWz9SU5quWz2S+enAencSCnhNOSR
	rzypAYl95/yq6UViwa6KY6liD+PkCtWPRqcCuGTSFqQ==
X-Received: by 2002:a17:90a:1041:b0:39d:edfc:26a0 with SMTP id 98e67ed59e1d1-39dedfc3adamr55101a91.1.1789348873749;
        Sun, 13 Sep 2026 18:21:13 -0700 (PDT)
X-Received: by 2002:a17:90a:1041:b0:39d:edfc:26a0 with SMTP id 98e67ed59e1d1-39dedfc3adamr55067a91.1.1789348873263;
        Sun, 13 Sep 2026 18:21:13 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39db090dfa5sm4045013a91.4.2026.09.13.18.21.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 18:21:12 -0700 (PDT)
Message-ID: <6d204c05-1338-4ee5-9ac9-5d9447e329ee@redhat.com>
Date: Mon, 14 Sep 2026 11:21:01 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 3/7] firmware: arm_rmm: Configure the RMM with the
 host's page size
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260912083611.2513845-1-suzuki.poulose@arm.com>
 <20260912083611.2513845-4-suzuki.poulose@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260912083611.2513845-4-suzuki.poulose@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WHcv3kIAeR3vMbEOanjOb-estb7aOuOFxaEPXIgQr0w_1789348874
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_182120_052817_62BB1992 
X-CRM114-Status: GOOD (  31.54  )
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

On 9/12/26 6:36 PM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> RMM v2.0 brings the ability to set the RMM's granule size. Check the
> feature registers and configure the RMM so that it matches the host's
> page size. This means that operations can be done with a granularity
> equal to PAGE_SIZE.
> 
> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> ---
>   Changes since v17:
>    * Move rmi_config_set() out of the header file.
>    * Print the error message for rmi_config_set if it fails
>   Changes since v15:
>    * Actually check the feature register for the host's page-size support.
>   Changes since v14:
>    * Move the implementation into drivers/firmware/arm_rmm.
>   Changes since v13:
>    * Moved out of KVM.
> ---
>   drivers/firmware/arm_rmm/rmi.c | 79 ++++++++++++++++++++++++++++++++++
>   1 file changed, 79 insertions(+)
> 
> diff --git a/drivers/firmware/arm_rmm/rmi.c b/drivers/firmware/arm_rmm/rmi.c
> index 2fd538c937dca..5b0e342ce3d58 100644
> --- a/drivers/firmware/arm_rmm/rmi.c
> +++ b/drivers/firmware/arm_rmm/rmi.c
> @@ -35,6 +35,25 @@ static int rmi_features(unsigned long index, unsigned long *out)
>   	return args.a0;
>   }
>   
> +/**
> + * rmi_rmm_config_set() - Configure the RMM
> + * @cfg_ptr: PA of a struct rmm_config
> + *
> + * Sets configuration options on the RMM.
> + *
> + * Return: RMI return code
> + */
> +static int rmi_rmm_config_set(unsigned long cfg_ptr)
> +{
> +	struct arm_smccc_1_2_regs regs = {
> +		SMC_RMI_RMM_CONFIG_SET, cfg_ptr,
> +	};
> +
> +	rmi_smccc_invoke(&regs);
> +
> +	return regs.a0;
> +}
> +

The comments for rmi_rmm_config_set() can be dropped since its logic is simply enough and
the code is self-explainning. Besides, I would move this right before its only caller
rmi_configure().

I would suggest drop this function by combining its logics into the only caller
rmi_configure(), seeing below for more details.

>   unsigned long rmi_feat_reg(unsigned long index)
>   {
>   	if (WARN_ON(index >= RMI_FEAT_REG_COUNT))
> @@ -98,6 +117,62 @@ static int rmi_read_features(void)
>   	return 0;
>   }
>   
> +static int rmi_configure(void)
> +{
> +	unsigned long granule_feature;
> +	unsigned long granule_size;
> +	int ret = 0;
> +	struct rmm_config *config;
> +
> +	switch (PAGE_SIZE) {
> +	case SZ_4K:
> +		granule_size = RMI_GRANULE_SIZE_4KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_4KB;
> +		break;
> +	case SZ_16K:
> +		granule_size = RMI_GRANULE_SIZE_16KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_16KB;
> +		break;
> +	case SZ_64K:
> +		granule_size = RMI_GRANULE_SIZE_64KB;
> +		granule_feature = RMI_FEATURE_REGISTER_1_RMI_GRAN_SZ_64KB;
> +		break;
> +	default:
> +		BUILD_BUG();
> +	}
> +
> +	if (!(rmi_feat_reg(1) & granule_feature)) {
> +		pr_err("RMM does not support %luKB granules\n",
> +		       PAGE_SIZE >> 10);
> +		return -ENXIO;
> +	}
> +
> +	config = (struct rmm_config *)get_zeroed_page(GFP_KERNEL);
> +	if (!config) {
> +		pr_err("Unable to allocate memory for RMM config\n");
> +		return -ENOMEM;
> +	}
> +
> +	config->rmi_granule_size = granule_size;
> +
> +	/*
> +	 * For now we set the tracking_region_size to 0 which is the only option
> +	 * for 4KB PAGE_SIZE (1GB for 4KB PAGE_SIZE, 32MB/512MB for 16KB/64KB).
> +	 * TODO: Support other tracking sizes via Kconfig option for other
> +	 * PAGE_SIZES
> +	 */
> +	config->tracking_region_size = 0;
> +
> +	ret = rmi_rmm_config_set(virt_to_phys(config));
> +	if (ret) {
> +		pr_err("RMM config set failed (%d)\n", ret);
> +		ret = -EINVAL;
> +	}
> +

I would suggest to drop rmi_rmm_config_set() by combining its logic to rmi_configure().

	struct arm_smccc_1_2_regs args = { SMC_RMI_RMM_CONFIG_SET };

	args.a1 = virt_to_phys(config);
	rmi_smccc_invoke(&args);
	if (args.a0 != RMI_SUCCESS) {
		pr_err("RMM config set failed (%ld)\n", args.a0);
		ret = -EINVAL;
	}
	

> +	free_page((unsigned long)config);
> +	return ret;
> +}
> +
>   static int __init arm64_init_rmi(void)
>   {
>   	int ret;
> @@ -111,6 +186,10 @@ static int __init arm64_init_rmi(void)
>   	if (ret)
>   		return ret;
>   
> +	ret = rmi_configure();
> +	if (ret)
> +		return ret;
> +
>   	return 0;
>   }
>   

Thanks,
Gavin



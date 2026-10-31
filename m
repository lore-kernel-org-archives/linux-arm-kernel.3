Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2AD606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 08:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EdYK2Byb;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=fencjVNn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=zyM541AR7ZZE38ApRIgXfw9vU7L1IaJEwloMzTLw3Ig=; b=EdYK2BybU0nXX+
	NvG/PaPKyfOGukhbYNXiWG6a589HEoXIWvuz0+OVnB4VX+9jrhytpuKaH3pKJxyYADfrzXHL0gfRK
	ta5p92rNCox29Ww0Q8d7fIVp5QFLdLLKiGbz4QAnucazSyolSTo+cK2BVMNnZMb4igCHOD3vf1Mzl
	8pMDYNMTkPKet9HMkiUDyTfYUNyB5XRHZxZ2OaftxSEO3xCFl2Ls6wCXlSILh8pAnTtP8xVWT9+uQ
	tnT5uHuO/gbtlCrz1ev9SieNM0147Jz6clwUmm9X8GUATt6vZqdZEokLz9BhwS5aeonmrydG23OZM
	JmXA3qeHqrJMxva96pOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4fx-0000000D55A-1EVU;
	Sat, 31 Oct 2026 08:42:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN4fu-0000000D546-2OMY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 08:42:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D2171595;
	Sat, 31 Oct 2026 01:42:48 -0700 (PDT)
Received: from [10.57.13.152] (unknown [10.57.13.152])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7B38B3F59E;
	Sat, 31 Oct 2026 01:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793436171; bh=avExJZ8pIb5Ca/dscv5M6k88MfirFVDBlv6ja+R8bbw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fencjVNnt00wM0wda3KJv3WoRmZ8GoSQNWWxyQRTkf7seFOhLkY2VnuWG+597t0Ez
	 +itFgbGaU/suCHgpoFnAbgN+AQ4E3wUGbwU9OaVV8jDvTTym1FhRUmtTgNedvKgBUS
	 uz1DkVoVayYJVDZ+51JRhGrKSIrbf6I74AdaRYLo=
Message-ID: <a1d9608c-8169-49c5-b843-ed9d304136ed@arm.com>
Date: Sat, 31 Oct 2026 08:42:46 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v5 2/6] firmware: smccc: Detect hypervisor
 via RSI host call in CCA Realms
Content-Language: en-GB
To: Dexuan Cui <DECUI@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: Haiyang Zhang <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "mhklinux@outlook.com" <mhklinux@outlook.com>,
 "will@kernel.org" <will@kernel.org>, "Mark.Rutland" <Mark.Rutland@arm.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "thuth@redhat.com" <thuth@redhat.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>
References: <20261002215725.2015959-1-kameroncarr@linux.microsoft.com>
 <20261002215725.2015959-3-kameroncarr@linux.microsoft.com>
 <auPOnb_9Jfzh-oQE@arm.com>
 <CH4PPF0966F22FCAF3D8C6535743902930DBF6C2@CH4PPF0966F22FC.namprd21.prod.outlook.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <CH4PPF0966F22FCAF3D8C6535743902930DBF6C2@CH4PPF0966F22FC.namprd21.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_014254_775379_CE3045EC 
X-CRM114-Status: GOOD (  29.96  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi

On 31/10/2026 04:47, Dexuan Cui wrote:
>> From: Catalin Marinas <catalin.marinas@arm.com>
>> Sent: Thursday, October 29, 2026 3:54 PM
>>   ...
>> + Suzuki
>>   ...
>>> +static void arm_smccc_realm_get_hypervisor_uuid(struct arm_smccc_res
>> *res)
>>> +{
>>> +	guard(spinlock_irqsave)(&uuid_hc_lock);
>>> +
>>> +	memset(&uuid_hc, 0, sizeof(uuid_hc));
>>> +	uuid_hc.gprs[0] = ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID;
>>> +
>>> +	if (rsi_host_call(__pa_symbol(&uuid_hc)) != RSI_SUCCESS) {
>>> +		res->a0 = SMCCC_RET_NOT_SUPPORTED;
>>> +		return;
>>> +	}
>>> +
>>> +	res->a0 = uuid_hc.gprs[0];
>>> +	res->a1 = uuid_hc.gprs[1];
>>> +	res->a2 = uuid_hc.gprs[2];
>>> +	res->a3 = uuid_hc.gprs[3];
>>> +}
>>> +#endif
>>> +
>>>   bool arm_smccc_hypervisor_has_uuid(const uuid_t *hyp_uuid)
>>>   {
>>>   	struct arm_smccc_res res = {};
>>>   	uuid_t uuid;
>>>
>>> -
>> 	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC
>> _ID, &res);
>>> +#ifdef CONFIG_ARM64
>>> +	if (is_realm_world())
>>> +		arm_smccc_realm_get_hypervisor_uuid(&res);
>>> +	else
>>> +#endif
>>> +
>> 	arm_smccc_1_1_invoke(ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC
>> _ID,
>>> +				     &res);
>>
>> Is this meant to be generic? I'm not sure the trick to pass
>> ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID in gprs[0] and forward it to
>> the host is a documented ABI. I think it even confuses other realm guests
>> that don't expect this (e.g. kvm_init_hyp_services()).

Yes, this is how a Realm can talk to the Host hypervisor, i.e, 
RSI_HOST_CALL. In simpler terms, HVC is routed to Realm world for
Realms (e.g., a Paravisor running in Realm world Plane-0).
A Realm must always use RSI_HOST_CALL to reach the non-secure
hypervisor. RSI_HOST_CALL expects the arguments to be passed
in a "memory" area to preserve forward compatibility with
the SMCCC standards to allow for using the full argument/result
list.

The RMM does the job of copying the arguments from the Realm memory
to the rec_exit.gprs for consumption by the Host. The host can then
return the results in rec_entr.gprs, which then gets copied over
to the Realm memory area.

> 
> Hi Catalin,
> Regarding the concern about passing ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID
> In gprs and forwarding it to the host via an RSI Host Call: if I read the code correctly,
> this pattern actually aligns seamlessly with the current KVM host-side
> implementation for ARM CCA (e.g., in the v16 patchset [1]).
> 
> In arch/arm64/kvm/rmi-exit.c, when a Realm guest triggers an
> RMI_EXIT_HOST_CALL, KVM intercepts it and invokes rec_exit_hvc():
> 
> case RMI_EXIT_HOST_CALL:
> 	rec_exit_hvc(vcpu);
> 	kvm_make_request(KVM_REQ_RMI, vcpu);
> 	return ARM_EXCEPTION_TRAP;
> 
> Inside rec_exit_hvc(), KVM copies the GPRs from the rec run structure
> into the vCPU registers and explicitly emulates a standard HVC
> exception by populating esr_el2:
> 
> static void rec_exit_hvc(struct kvm_vcpu *vcpu)
> {
>          struct realm_rec *rec = &vcpu->arch.rec;
>          int i;
> 
>          for (i = 0; i < REC_RUN_GPRS; i++)
>                  vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
> 
>          vcpu->arch.fault.esr_el2 = (ESR_ELx_EC_HVC64 << ESR_ELx_EC_SHIFT) |
>                                       ESR_ELx_IL;
> }
> 
> After doing so, it returns ARM_EXCEPTION_TRAP, causing KVM's generic
> exception handling loop (kvm_arch_vcpu_ioctl_run() -> handle_exit()) to
> route it straight into the standard handle_hvc() ->
> kvm_smccc_call_handler() path.
> 
> Because KVM deliberately unpacks the RSI Host Call structure and pushes
> it down the traditional non-CVM HVC servicing pipeline, the guest passing
> standard SMCCC Function IDs inside the gprs array of an RSI Host Call is
> exactly how the host expects to handle hypervisor services. It shouldn't
> break or confuse other standard realm implementations since this exact
> emulation block translates the RSI exception back into a generic HVC
> abstraction for the hypervisor layer.
>   
>> I thought realms should stick to the RSI interface and not try to guess
>> the host hypervisor. But if you do need this, a better fit would be in
>> hyperv_detect_via_smccc() (if realms don't boot with ACPI).
>>
>> I'll leave it to Sudeep or Suzuki to comment further.
>>
>> --
>> Catalin
> 
> As I described above, this patch from Kameron should work fine.
> 
> BTW, as Kameron mentioned in another reply, he better organized the
> code by moving the code in this patch into
> arch/arm64/hyperv/mshyperv.c: hyperv_detect_via_smccc().

Any Realm specific stuff must be handled accordingly in the 
"enlightened" path, not in the common code like this patch.

Cheers
Suzuki


> (technically, IMO this change is unnecessary)
> 
> Thanks,
> Dexuan
> 
> [1] https://gitlab.arm.com/linux-arm/linux-cca/-/tree/cca-host/v16
> [2] https://lore.kernel.org/all/20261031001412.4150488-3-kameroncarr@linux.microsoft.com/



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07D04D49237
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 21:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=glFaNkoh8KYWfLmCHCO0uc2mAujAPglg5i0xIpFSAo0=; b=wuWNiVUBVKYQYb
	5lyh0x910b9knNGC/VH2+GG84glqMXeqMGhVXNKJtJJ4Qaz8cPIhtsmDwOqgsutj4FkeU0LXbqM4s
	7udN3yhQ6/qiOD2L7YL0MyJfuoOacn5h2PEujho3+azUccuR/HfJnzmn1+WMKTos9O1YBbqVF6Mi0
	CrH7pHPeLcePwHtZK2CaqljMzEstMxW8T4b6no6nVQfWqMlNXb1BlRGepWbP15WGt+8T04jf0Tm2k
	dnPAzV7auQxCDmH2mYZwhU21cJ41H+G33zbPoz5Hgk4hjLUXNNALwRJ7ygRt1bo6C7bhka4sG2rHQ
	qY00v2FXCewO5+LiCtrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAjv-000000017Xf-0lSU;
	Fri, 12 Dec 2025 21:31:51 +0000
Received: from mail-oo1-xc49.google.com ([2607:f8b0:4864:20::c49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAjt-000000017XK-05jN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 21:31:50 +0000
Received: by mail-oo1-xc49.google.com with SMTP id 006d021491bc7-65746235dd4so1211746eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Dec 2025 13:31:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765575107; x=1766179907; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=glFaNkoh8KYWfLmCHCO0uc2mAujAPglg5i0xIpFSAo0=;
        b=2r/KUP6cWx79pV6eiedEsiBy3qdhp4j+9FoqZp05c9i/p6/UKsnbAM5gYcAdnV7GqH
         c6tDB12AHjs55pnAwwksmnQDhIXxnY1OuqXecQP0SVjuphxxk+qb5k74JaaRrAUW3Q82
         Jz1wzX8DNOYuVB98kTMeAc05OymKgj+i4Bq1jg4ROC8tEVJFHxsp9JmQisQ9ueOdrYDV
         gW6ku7yEyP90ovzeBOgW+7xNe0AA3N/3yhqRKDrN0r6rKjRmzdUH/0StpIPFNla2HQ87
         /ll2L7mDZrMZxPnpDe8P7SbDetlK8mc1tr90z+6MKS19Sb6lB2PI4X0BpxCqOJorOwGP
         pTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765575107; x=1766179907;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=glFaNkoh8KYWfLmCHCO0uc2mAujAPglg5i0xIpFSAo0=;
        b=P4C/6X6B+8temt0QpmDHlEd3SMSH7SibO/tkcaKG3g1+5fG0G/6jLwAceJmUw1J7sw
         vTzcwx60tdX4k25isrKKNtNx2KQXVyZuJ6g+vxWW3F+6Ku2a/EMgptveHYaA69JtxwK6
         h9o8VCeltZet6C4Ik9ZuBij6Ag/E2vi7g6GJxjeNrA/5XQGHxU36G8nlhI0fRA+Li6Gn
         dnfNoSAiwk2fsM2FOzrOZpAHlJ0VIfo337LVNgp8RzZMxp9QymeUyFYTXY/Clez4J02D
         vluEal8jWaAg6fvIfC1E9mWuz8/BCqvMh8wcqUnJUmjEDEALFnJETmTcWhPzSpoyYhxT
         hFiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXufae+Wz68BDZnnSWBZVouzIDewBhwj1EV1ad2J6rpVu+87+iOQYNxRDpxIUSHEOK2CR2vsETLGu4hFKeQCZk+@lists.infradead.org
X-Gm-Message-State: AOJu0YwpiGzSzvSwiQUhD11v5QpbqQqzIZQjqEmfMfbRzNnVgPGx1WDU
	4R1yipBjBp9GVIMPyT+882taqGLMIaHroQv9aT9q8eagSHZoqieEQCj+PTPLKa4hVE74ph5Z2EI
	q4zeMS4rkS9oFKOuOsYAP7Zb3aw==
X-Google-Smtp-Source: AGHT+IFo/ZiQG26nv5+gQHvcotb1AIOm/8xhz9dzc9kzbBKDKtRIGeh0RuPM+qweY1hUtH68Xze57kOA5qfLCql13A==
X-Received: from ilbbb16.prod.google.com ([2002:a05:6e02:10:b0:42f:913a:9596])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6820:1b0f:b0:659:9a49:8e83 with SMTP id 006d021491bc7-65b452c3646mr1638400eaf.83.1765575106969;
 Fri, 12 Dec 2025 13:31:46 -0800 (PST)
Date: Fri, 12 Dec 2025 21:31:46 +0000
In-Reply-To: <aTiWsAvK9krnEw7V@kernel.org> (message from Oliver Upton on Tue,
 9 Dec 2025 13:37:52 -0800)
Mime-Version: 1.0
Message-ID: <gsntms3n2xq5.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v5 16/24] KVM: arm64: Account for partitioning in PMCR_EL0 access
From: Colton Lewis <coltonlewis@google.com>
To: Oliver Upton <oupton@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	maz@kernel.org, oliver.upton@linux.dev, mizhang@google.com, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	mark.rutland@arm.com, shuah@kernel.org, gankulkarni@os.amperecomputing.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_133149_086374_2DF73952 
X-CRM114-Status: GOOD (  18.02  )
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

Oliver Upton <oupton@kernel.org> writes:

> On Tue, Dec 09, 2025 at 08:51:13PM +0000, Colton Lewis wrote:
>> Make sure reads and writes to PMCR_EL0 conform to additional
>> constraints imposed when the PMU is partitioned.

>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/pmu.c      | 2 +-
>>   arch/arm64/kvm/sys_regs.c | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)

>> diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
>> index 1fd012f8ff4a9..48b39f096fa12 100644
>> --- a/arch/arm64/kvm/pmu.c
>> +++ b/arch/arm64/kvm/pmu.c
>> @@ -877,7 +877,7 @@ u64 kvm_pmu_accessible_counter_mask(struct kvm_vcpu  
>> *vcpu)
>>   u64 kvm_vcpu_read_pmcr(struct kvm_vcpu *vcpu)
>>   {
>>   	u64 pmcr = __vcpu_sys_reg(vcpu, PMCR_EL0);
>> -	u64 n = vcpu->kvm->arch.nr_pmu_counters;
>> +	u64 n = kvm_pmu_guest_num_counters(vcpu);

> Why can't the value of vcpu->kvm->arch.nr_pmu_counters be trusted?

Similar to discussion on a previous patch, I need to move some
validation to the ioctl where it's set.

>> @@ -1360,7 +1360,7 @@ static int set_pmcr(struct kvm_vcpu *vcpu, const  
>> struct sys_reg_desc *r,
>>   	 */
>>   	if (!kvm_vm_has_ran_once(kvm) &&
>>   	    !vcpu_has_nv(vcpu)	      &&
>> -	    new_n <= kvm_arm_pmu_get_max_counters(kvm))
>> +	    new_n <= kvm_pmu_hpmn(vcpu))
>>   		kvm->arch.nr_pmu_counters = new_n;

> This is the legacy UAPI for setting the number of PMU counters by
> writing to PMCR_EL0.N.

> The 'partitioned' implementation should take a dependency on the
> SET_NR_COUNTERS attribute and reject attempts to change the value of
> PMCR_EL0.N. Just like nested.

Good! I hated making writes to PMCR_EL0.N work and only did it because
of selftests assuming it did.


> Thanks,
> Oliver


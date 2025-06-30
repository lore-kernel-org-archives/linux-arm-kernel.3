Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD55FC8302D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 18:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=zfAOZg4LwTTd8mipDsvBNOZCGjPGcqAJ6hHgzhMWsSs=; b=VEpvTJ/tnmSyrC
	mxblLaoGcF25SGSkYCsiePphopgfBvl7epaibMtckrfKJ8NNS13IBPEX/mZb7gInHQjKLNZ2iUCPP
	dzp78iKP8njQ/BX/iIjd9zvDNBbIOdV1Hm2nksyfSQqd3Im7zjquJ0UQ7qAYKASe5XUaSyTyiCKYM
	oriibz4pmqSWN6+W/dnG3G8XVPxXliTNH9NpEEZVCAG6+xMfWdsD9mFDUt323d/sqtm/i65mtZeOj
	+/Iw55ytyHBdw8cSjY+L6Ku8whGRxr7EbI9B/g++PlxKOatY39eAwnMPbTMjmIrOCvCVJgI6DBEEt
	kA3YA+VMvLGYWyUZ26Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ3m-00000003B19-15GQ;
	Mon, 30 Jun 2025 18:16:54 +0000
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWIWj-000000036JZ-1gmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 17:42:46 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-86cfea700daso182433239f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Jun 2025 10:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751305364; x=1751910164; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zfAOZg4LwTTd8mipDsvBNOZCGjPGcqAJ6hHgzhMWsSs=;
        b=VNCcZQyK8RGox+9QbO+UP1BRRkunny0tACOQ/p0tvsRJdKnTS2HYvCTUM4sc4Pxp5v
         wnjZaDVR9QlilByfO8csiahAzA6TRtLWDbItqbXGGAT0k55WggKkDjz9Oyqcjh/FG6ot
         ZSpdfbgK+mVtmksVUX1B0OL2aMPAt7uGFFbJ6ZLtSenxV57UKURhnBJ25S7KMSkj0TcL
         mYTMzEauagr+0yn5YclAYeauuZ7phgHi05jQEwK2q3b0YQfCfsq3yFK5UhyidV/px44S
         mP+uxVAoFi19kAI29eLFZF1oBhR2iaegS223eQTXgrWO9xT8MPPzBZE12aberHVMIk4G
         btAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751305364; x=1751910164;
        h=cc:to:from:subject:message-id:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfAOZg4LwTTd8mipDsvBNOZCGjPGcqAJ6hHgzhMWsSs=;
        b=JrSAGe1SrqmefE5bfitWcVyayvXwCYgF63FY/C2YCtygJsHnLd2T6uST0pegSHWAfF
         EtcBGSzi/A7MHHTWf01qha39XHhPiPyl7rQJxRazjjgjJf3kRvqmXNtJm4t9B33oX67O
         FMv4NCWemwDLHb1O/4cx1skk/hwt2hgG6/TG4vcrO03Si5zL7IAqasC+HIcF4cxIijWa
         fvp2Q3CdadwYzJBXzh762RaxFVT6Yn7CrWfdf6qBUa1BSTwavqDLZmqDytw07iB6j5X0
         RIwrvex2/vuKCpku45g9GKsP/YnzcI2qdqs5+tW+VqWp9JrbNgYVG9c6L2/7mOhLVLDi
         nwQg==
X-Forwarded-Encrypted: i=1; AJvYcCVq1wGzMRyFczaBpKXHOt7q5/KGNyACoQIklqX0klII8GLI4VOxgeX0iiCNkxUMNURb53HkvlAEoYYLGKVPk5Tf@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4CSYUq+U9ciF/lP4MUyP0er8q33yNdy27lys7x+NBFbVWd29n
	jvaP4TiVaLotUp3+ae2Wu9agupeKbPZ1dJhm9BMO13Vddd+jcBpmj2N3kjEWhbSIuIkUrs+5WSL
	2l0v1wNiDW0+CFM3ooBjqOZhCGQ==
X-Google-Smtp-Source: AGHT+IHeGVNAbtPOjDIR39vaG0kghlxZnlKsay2N4Gr5RhKF/AQPLY5SUF0a/faATBBTtFrSocpRy9rTkRcXNhcugw==
X-Received: from ilbeh24.prod.google.com ([2002:a05:6e02:4c18:b0:3dd:f56e:32fc])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6e02:174e:b0:3de:296c:a042 with SMTP id e9e14a558f8ab-3df4ab85845mr124030495ab.11.1751305363894;
 Mon, 30 Jun 2025 10:42:43 -0700 (PDT)
Date: Mon, 30 Jun 2025 17:42:42 +0000
In-Reply-To: <86qzz5b92t.wl-maz@kernel.org> (message from Marc Zyngier on Fri,
 27 Jun 2025 14:36:10 +0100)
Mime-Version: 1.0
Message-ID: <gsnt5xgd86st.fsf@coltonlewis-kvm.c.googlers.com>
Subject: Re: [PATCH v3 09/22] KVM: arm64: Correct kvm_arm_pmu_get_max_counters()
From: Colton Lewis <coltonlewis@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, pbonzini@redhat.com, corbet@lwn.net, 
	linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org, 
	oliver.upton@linux.dev, mizhang@google.com, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com, 
	shuah@kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"; format=flowed; delsp=yes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_104245_444036_9966E8C1 
X-CRM114-Status: GOOD (  20.63  )
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

Marc Zyngier <maz@kernel.org> writes:

> On Thu, 26 Jun 2025 21:04:45 +0100,
> Colton Lewis <coltonlewis@google.com> wrote:

>> Since cntr_mask is modified when the PMU is partitioned to remove some
>> bits, make sure the missing counters are added back to get the right
>> total.

> Please fix the subject of the patch to be more descriptive. It is
> worded like a bug fix, while it really is only a step in the patch
> series.

> Something like "Take partitioning into account for max number of
> counters" would go a long way.

Done.


>> Signed-off-by: Colton Lewis <coltonlewis@google.com>
>> ---
>>   arch/arm64/kvm/pmu.c | 9 ++++++++-
>>   1 file changed, 8 insertions(+), 1 deletion(-)

>> diff --git a/arch/arm64/kvm/pmu.c b/arch/arm64/kvm/pmu.c
>> index 79b7ea037153..67216451b8ce 100644
>> --- a/arch/arm64/kvm/pmu.c
>> +++ b/arch/arm64/kvm/pmu.c
>> @@ -533,6 +533,8 @@ static bool pmu_irq_is_valid(struct kvm *kvm, int  
>> irq)
>>   u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>>   {
>>   	struct arm_pmu *arm_pmu = kvm->arch.arm_pmu;
>> +	u8 counters;
>> +

> nit: superfluous blank line.

I'll remove.


>>   	/*
>>   	 * PMUv3 requires that all event counters are capable of counting any
>> @@ -545,7 +547,12 @@ u8 kvm_arm_pmu_get_max_counters(struct kvm *kvm)
>>   	 * The arm_pmu->cntr_mask considers the fixed counter(s) as well.
>>   	 * Ignore those and return only the general-purpose counters.
>>   	 */
>> -	return bitmap_weight(arm_pmu->cntr_mask,  
>> ARMV8_PMU_MAX_GENERAL_COUNTERS);
>> +	counters = bitmap_weight(arm_pmu->cntr_mask,  
>> ARMV8_PMU_MAX_GENERAL_COUNTERS);
>> +
>> +	if (kvm_pmu_is_partitioned(arm_pmu))
>> +		counters += arm_pmu->hpmn_max;

> Why the check? Why can't we rely on hpmn_max to always give us the
> correct value?

Imagine no partitioning. Then the value of hpmn_max that would be give a
correct result here is 0 but 0 is also a valid value (anything from 0 to
the number of host counters inclusive) indicating we are partitioned and
want to give only the cycle counter to the guest.

My predicate to determine if the PMU is partitoned relies on hpmn_max
being a valid value only when the PMU is partitioned.

Making hpmn_max 0 here would require introducing another flag to check
partitioning.

> Thanks,

> 	M.

> --
> Without deviation from the norm, progress is not possible.


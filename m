Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF74CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 15:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPtZhcpThqmpW9sBgHGx2WHZPgsdIbc9VGj5hGkWzoU=; b=3zgBkK2eI0NyUCJ8+c9qtWU3Kk
	/VkFAm6DrxpkBODn8ZpEiC9z3R9UgmyyTJPkAMhxv/12mEXaY4KkJbhdpFr3CuPl7g+pi8b/SZlEx
	7r5j6tMyLT6nGSVs7KvR5oozQ+Y2JLeCGyz8kfOVsqObkyL3/LIS8Axtcpfb3dLNleC7BUcO3iAU7
	8mipkC9P6zcbbPvN/LbVjHVlFZUSNTNhsl5dRppSEhU0OnYNO5EIT0dNJwTLzm152GHRAH0WcUIM6
	QxWvpJcKybjHYxDXn7+brhwro19jmCX4Cu9JZYPR+wO9DSytKSPgIg40cDgOSQ1Pyp+9oOpkyT92k
	c7a6hwUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ53J-00000008GaD-2ojq;
	Thu, 21 May 2026 15:11:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ53H-00000008GZf-3ew7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 15:11:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D8A73AEC;
	Thu, 21 May 2026 08:11:05 -0700 (PDT)
Received: from [10.1.32.22] (e122027.cambridge.arm.com [10.1.32.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 227D33F7B4;
	Thu, 21 May 2026 08:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779376270; bh=lURVKNWHaQQMr1aDM/akyvG2Umw+DyGtL0+tWM/BV7A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u3NFvO4xDafCig5AMnrdFcWSuJDzd9h+wvXdbiLbNy20Fm1boueLW0cFvhRZnAUyb
	 bCOi61DAQklFrqk7oHqiR9nJlsDbAnGdNQ4iVDmPIpmaaFpSQDkIl1yQOiALQ51+1X
	 qLurKw/y5sBHO8XbDjtLNAtGRKEP3TcRMfdNR0r4=
Message-ID: <270333f9-8993-4b1a-b242-135099193e29@arm.com>
Date: Thu, 21 May 2026 16:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 01/44] kvm: arm64: Include kvm_emulate.h in
 kvm/arm_psci.h
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com,
 Lorenzo.Pieralisi2@arm.com
References: <20260513131757.116630-1-steven.price@arm.com>
 <20260513131757.116630-2-steven.price@arm.com> <86jysxvze2.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86jysxvze2.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_081111_949880_B7CCC393 
X-CRM114-Status: GOOD (  12.70  )
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

On 21/05/2026 11:19, Marc Zyngier wrote:
> On Wed, 13 May 2026 14:17:09 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> Fix a potential build error (like below, when asm/kvm_emulate.h gets
>> included after the kvm/arm_psci.h) by including the missing header file
>> in kvm/arm_psci.h:
>>
>> ./include/kvm/arm_psci.h: In function ‘kvm_psci_version’:
>> ./include/kvm/arm_psci.h:29:13: error: implicit declaration of function
>>    ‘vcpu_has_feature’; did you mean ‘cpu_have_feature’? [-Werror=implicit-function-declaration]
>>    29 |         if (vcpu_has_feature(vcpu, KVM_ARM_VCPU_PSCI_0_2)) {
>> 	         |             ^~~~~~~~~~~~~~~~
>> 			       |             cpu_have_feature
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
> 
> Unrelated to this patch, but really easy to fix: the standard prefix
> for patches targeting KVM/arm64 is:
> 
> "KVM: arm64: [opt subsys:] Something starting with a capital letter"
> 
> where "opt subsys" could be "CCA" where applicable.
> 
> It'd be good to have some consistency.

Sure, I think back when I started this there wasn't great consistency so
I picked up something from git log. I'm happy to change this for the
next posting.

Thanks,
Steve

> 
> Thanks,
> 
> 	M.
> 



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14BF3C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 15:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HcR93FillgyEzyB6gCdbqYCeFFYYfLx2X+4k8CyJhEI=; b=D3k/Uz6XXwrb/aLUMxYnhYLkYo
	E/IEpklbd9MvvUfG1tMbdIBo+FtN3RzFMrhbRi+ZJJcTeNCBbsmd+wYFS2/AniPUL24fxHt4TwVMS
	u5X8zqXCMyUvo0f3ofbWAbcngVZpec9yw5dYb9j831sdJXAUIDQYHVSbeU9SC5zrL7Vcy30sBx7IP
	U6Hwg6uHfSAE2nHbuhre+tDjBtMkxXMm43mLIEO1hzkS6fy7qn91V8nEIpn9+1mY5+xdtnU0YimL5
	7WlP2R6Nlm70X5d3rwg8XFQb3WRW5Bk9wjIoiGhd6oBuUb1HOz9XCbpttYgjM8s+KYSFvRuPcfZDG
	JaXsbxEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVgl-0000000G4Gc-0xac;
	Thu, 01 May 2025 15:19:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAVZT-0000000G3BN-0isD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 15:11:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 02E27168F;
	Thu,  1 May 2025 08:11:23 -0700 (PDT)
Received: from [10.1.33.27] (e122027.cambridge.arm.com [10.1.33.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E55573F5A1;
	Thu,  1 May 2025 08:11:26 -0700 (PDT)
Message-ID: <9e5c26e9-a710-4ae6-ab2e-5706204d4f4f@arm.com>
Date: Thu, 1 May 2025 16:11:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 07/43] arm64: RME: ioctls to create and configure
 realms
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-8-steven.price@arm.com>
 <1802ffb9-798a-4c48-8420-c046f86c548c@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <1802ffb9-798a-4c48-8420-c046f86c548c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_081131_260356_83BECD25 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

On 30/04/2025 06:39, Gavin Shan wrote:
> On 4/16/25 11:41 PM, Steven Price wrote:
[...]
>> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
>> index 67cf2d94cb2d..dbb6521fe380 100644
>> --- a/arch/arm64/kvm/rme.c
>> +++ b/arch/arm64/kvm/rme.c
[...]
>> +
>> +static int kvm_create_realm(struct kvm *kvm)
>> +{
>> +    struct realm *realm = &kvm->arch.realm;
>> +    int ret;
>> +
>> +    if (!kvm_is_realm(kvm))
>> +        return -EINVAL;
> 
> This check is duplicate because the only caller kvm_realm_enable_cap()
> already
> has the check. So it can be dropped.

Ah, good spot - thanks!

Steve



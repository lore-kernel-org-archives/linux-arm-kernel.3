Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22689C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 May 2025 13:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39oHwL/DRLv+JOvFxysou19dZQEjs4xH7WIspHC+dFg=; b=Cuu8piGko4mxHmP+hl64+N8pRX
	Sk022TUHG3RhGLvo+nd3fAueFyBklphvQqNN4qHksDUHIc+mmRfCGcx8IpmmYoo7Ucfxg4XqG8/Tm
	iK2pPqWQ5L2WGveKjiJwhWjYaS++HiuIYjATLXqjIvBRsm6EyaKGwainxK+Z1ThgGYlaAnyvvtZno
	3stOobgFijRER6ZCtt+WnC/VN4pSp7iDSqcFDvi2Dh/rWjC+PjlBYmtIf8a/KSQn7WUMLSy1ys5cs
	WeuzjHSUzh6m5j/ZfAmm7RLESeptxC/OmxkM10WJNG9m9A+zg3It4kSJOK28ZA1nGMQE89skMTMZO
	m4qzuoJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUJK-0000000Fsel-00kY;
	Thu, 01 May 2025 13:50:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAUFr-0000000FsK8-1cVE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 13:47:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3BC701CC4;
	Thu,  1 May 2025 06:47:01 -0700 (PDT)
Received: from [10.1.37.71] (Suzukis-MBP.cambridge.arm.com [10.1.37.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B0E5E3F5A1;
	Thu,  1 May 2025 06:47:05 -0700 (PDT)
Message-ID: <9efc4db0-4264-4e8f-881e-2656c22a8b3e@arm.com>
Date: Thu, 1 May 2025 14:47:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 06/43] arm64: RME: Define the user ABI
Content-Language: en-GB
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-7-steven.price@arm.com>
 <35a91f8c-cdf6-4595-9ed2-c792a8e9d679@arm.com>
 <961bd6f8-2c0c-47d7-991d-aab7d247ffa8@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <961bd6f8-2c0c-47d7-991d-aab7d247ffa8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_064711_469661_8046202D 
X-CRM114-Status: UNSURE (   9.84  )
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

On 01/05/2025 14:31, Steven Price wrote:
> On 28/04/2025 09:58, Suzuki K Poulose wrote:
>> Hi Steven
>>
>> On 16/04/2025 14:41, Steven Price wrote:
>>> There is one (multiplexed) CAP which can be used to create, populate and
>>> then activate the realm.
>>>
>>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>>> Signed-off-by: Steven Price <steven.price@arm.com>
>>> ---
>>> Changes since v7:
>>>    * Add documentation of new ioctls
>>>    * Bump the magic numbers to avoid conflicts
>>> Changes since v6:
>>>    * Rename some of the symbols to make their usage clearer and avoid
>>>      repetition.
>>> Changes from v5:
>>>    * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>>>      KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
>>> ---
>>>    Documentation/virt/kvm/api.rst    | 70 +++++++++++++++++++++++++++++++

>>
>> May be rephrase it to:
>>
>> No changes can be made to Realm's memory (including the IPA state). No
>> new VCPUs can be created after this step.
> 
> I was attmepting to include that CONFIG_REALM cannot be called. How about:
> 
> 	Request the RMM to activate the realm. No
> 	changes can be made to the Realm's memory,
> 	IPA state or configuration parameters.  No
> 	new VCPUs can be created after this step.

Looks good to me, cheers

Suzuki



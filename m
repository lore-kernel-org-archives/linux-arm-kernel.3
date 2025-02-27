Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E105DC19F2E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 10:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4NZ1Oq/YuEIf53+LhkyfhKnDuvuNyiJURkRanXDuAKk=; b=fFWXFcPGuPuAimCXCWfgvqwGpT
	QyrKff47PLJugLliPmYofNq4Ozn/7crOF4RUPh3r9Fx54W58LgKCcfJURZPRZuOXD+VUHDkxf86Rp
	/Z35ZFBRdOSapQX2EpeMpr/d3s92BF+ybPuL3816FRZSq+tgveRFTWP+LwDJMC6tryOePBykSQjAv
	VaU+xV1UpUwOBpz5nA37I+L0Rhl6zxv7eeDgTgtjaNStgbYquLcH1ATjPY2xOXfkBnLRWJgVPzRAW
	pg6pwSLQrheI+g1dYTtK5c8/vHPSPD+7smkD6YOIBohT0p37h3Qp5TPQIi6oYXnXz88FFAABBsU5p
	jpNalePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbQU-000000072OE-2BbF;
	Thu, 27 Feb 2025 10:47:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbOx-0000000728d-0Ckn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 10:46:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F03E12BCC;
	Thu, 27 Feb 2025 02:46:08 -0800 (PST)
Received: from [10.1.30.50] (e122027.cambridge.arm.com [10.1.30.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B6B373F673;
	Thu, 27 Feb 2025 02:45:48 -0800 (PST)
Message-ID: <aec8ecd9-55b0-4690-9c54-780fc47643bc@arm.com>
Date: Thu, 27 Feb 2025 10:45:46 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/11] arm64: Enable memory encrypt for Realms
To: Will Deacon <will@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>
Cc: "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
 Zenghui Yu <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, kvmarm@lists.linux.dev, kvm@vger.kernel.org
References: <20241017131434.40935-1-steven.price@arm.com>
 <20241017131434.40935-10-steven.price@arm.com>
 <5aeb6f47-12be-40d5-be6f-847bb8ddc605@arm.com> <Z79lZdYqWINaHfrp@arm.com>
 <20250227002330.GA24899@willie-the-truck>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <20250227002330.GA24899@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_024559_185403_528C2C0E 
X-CRM114-Status: GOOD (  15.61  )
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

On 27/02/2025 00:23, Will Deacon wrote:
> On Wed, Feb 26, 2025 at 07:03:01PM +0000, Catalin Marinas wrote:
>> On Wed, Feb 19, 2025 at 02:30:28PM +0000, Steven Price wrote:
>>>> @@ -23,14 +25,16 @@ bool rodata_full __ro_after_init = IS_ENABLED(CONFIG_RODATA_FULL_DEFAULT_ENABLED
>>>>  bool can_set_direct_map(void)
>>>>  {
>>>>  	/*
>>>> -	 * rodata_full and DEBUG_PAGEALLOC require linear map to be
>>>> -	 * mapped at page granularity, so that it is possible to
>>>> +	 * rodata_full, DEBUG_PAGEALLOC and a Realm guest all require linear
>>>> +	 * map to be mapped at page granularity, so that it is possible to
>>>>  	 * protect/unprotect single pages.
>>>>  	 *
>>>>  	 * KFENCE pool requires page-granular mapping if initialized late.
>>>> +	 *
>>>> +	 * Realms need to make pages shared/protected at page granularity.
>>>>  	 */
>>>>  	return rodata_full || debug_pagealloc_enabled() ||
>>>> -	       arm64_kfence_can_set_direct_map();
>>>> +		arm64_kfence_can_set_direct_map() || is_realm_world();
>>>>  }
>>>
>>> Aneesh pointed out that this call to is_realm_world() is now too early 
>>> since the decision to delay the RSI detection. The upshot is that a 
>>> realm guest which doesn't have page granularity forced for other reasons 
>>> will fail to share pages with the host.
>>>
>>> At the moment I can think of a couple of options:
>>>
>>> (1) Make rodata_full a requirement for realm guests. 
>>>     CONFIG_RODATA_FULL_DEFAULT_ENABLED is already "default y" so this 
>>>     isn't a big ask.
>>>
>>> (2) Revisit the idea of detecting when running as a realm guest early. 
>>>     This has the advantage of also "fixing" earlycon (no need to 
>>>     manually specify the shared-alias of an unprotected UART).
>>>
>>> I'm currently leaning towards (1) because it's the default anyway. But 
>>> if we're going to need to fix earlycon (or indeed find other similar 
>>> issues) then (2) would obviously make sense.
>>
>> I'd go with (1) since the end result is the same even if we implemented
>> (2) - i.e. we still avoid block mappings in realms.
> 
> Is it, though? The config option is about the default behaviour but there's
> still an "rodata=" option on the command-line.

I think the question comes down to is there any value in having page
mappings and not setting the read-only permissions? I.e.
rodata_full=false but we're still avoiding block mappings.

(1) as I've currently proposed doesn't allow that combination - if you
disable rodata_full you also break realms (assuming
DEBUG_PAGEALLOC/kfence don't otherwise force can_set_direct_map().

(2) forces page mappings if there's an RMM present, but does allow
disabling the read-only permissions with "rodata=".

So I guess there's also another option:

(3) Provide another compile/command line flag which forces page mapping
which is different from rodata_full. That would then allow realms
without affecting the permissions.

or indeed:

(4) Change can_set_direct_map() to always return true! ;)

Thanks,
Steve



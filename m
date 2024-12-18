Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5D4E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 05:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BpTWKGRasitTkG8NOlu7biDsOIZdOwHxm5RbaGtlnc=; b=2ZqtbhEIG00k9RoJ/zxvOSCfx2
	NBeVGAaKhRNqirxTGw6szt4DhHV5w54nmW9jgOVXsio9ezgsuyX28+uXNBx7h/VGjy0c9BNbB89hE
	D0YTVjgRqPw0Q0yedHpR7q+OaLTRd8s2kxyntCeTuVXydS0KU+VwdxWl3ghtwUF8xdp8nx4/4/3dq
	IQQ4KLYQmkHLFHeu+B3lZW/iFII1z0ScFfhiZOTYQiWDOCIqZGkT4DcQaryO4f0ozgPVl/FaT/Rdh
	zsyirRDVGBpGdef/bG7X64agEEVP9ZzxYNo9ijoOsgoIIlTpB6dt+DkHR8RYu/d0np0PQv6EX0Jjv
	ZS9P9U8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmaM-0000000FduS-16ZA;
	Wed, 18 Dec 2024 05:27:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNmZF-0000000Fdm6-1glu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 05:25:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A8493FEC;
	Tue, 17 Dec 2024 21:26:18 -0800 (PST)
Received: from [10.163.50.13] (unknown [10.163.50.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E18403F7B4;
	Tue, 17 Dec 2024 21:25:45 -0800 (PST)
Message-ID: <96bae61a-c9a0-4b9a-af4f-b6fc6202bccd@arm.com>
Date: Wed, 18 Dec 2024 10:55:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 6/7] arm64/boot: Enable EL2 requirements for
 FEAT_Debugv8p9
To: Rob Herring <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 kvmarm@lists.linux.dev, linux-doc@vger.kernel.org
References: <20241216040831.2448257-1-anshuman.khandual@arm.com>
 <20241216040831.2448257-7-anshuman.khandual@arm.com>
 <20241216234251.GA629562-robh@kernel.org>
 <c64709f7-e1c6-482e-8665-912be50b15bd@arm.com>
 <CAL_Jsq+EO_s49sSK3JQQEDDpcndf4hSpM_gfoe8tZ8=4y3f-tg@mail.gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <CAL_Jsq+EO_s49sSK3JQQEDDpcndf4hSpM_gfoe8tZ8=4y3f-tg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_212553_551901_4EA18852 
X-CRM114-Status: GOOD (  16.35  )
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

[....]

On 12/17/24 23:23, Rob Herring wrote:
>> Something like the commit
>>
>> commit 31c00d2aeaa2da89361f5b64a64ca831433be5fc
>> Author: Mark Brown <broonie@kernel.org>
>> Date:   Thu Apr 1 19:09:40 2021 +0100
>>
>>     arm64: Disable fine grained traps on boot
>>
>>     The arm64 FEAT_FGT extension introduces a set of traps to EL2 for accesses
>>     to small sets of registers and instructions from EL1 and EL0.  Currently
>>     Linux makes no use of this feature, ensure that it is not active at boot by
>>     disabling the traps during EL2 setup.
>>
>>
>>>
>>> I just realized I forgot to add FGT2 setup for the PMUv3.9 features I
>>> already added in 6.12 and 6.13. So this really needs to land sooner
>>> rather than later to add that.
>> Not sure if I got this correctly. Are you suggesting to carve out __init_el2_fgt2()
>> from the series and post separately with PMUv3.9 requirements and fallback clearing
>> for all FEAT_FGT2 trap config registers as mentioned above ?
> Yes, as it needs to not be held up by any of the debug issues Mark
> raised. Also, it may need to be back ported to 6.12. And for that we'd
> want the PMU parts, but not the Debug. I still have to figure out what
> needs to be done on the KVM side.

Hi Rob,

I did go through all the five FEAT_FGT2 trap control registers and it
seems like the following are the controls available for FEAT_PMUv3p9
based registers. Although PMZR_EL0 does not get used in kernel right
now but still might be a good idea to include anyway. Please let me
know, if I might have missed something else related to FEAT_PMUv3p9.

HDFGRTR2_EL2_nPMUACR_EL1	(mrs PMUACR_EL1)
HDFGWTR2_EL2_nPMUACR_EL1	(msr PMUACR_EL1)
HDFGWTR2_EL2_nPMZR_EL0		(msr PMZR_EL0)

Following will be the change required for __init_el2_fgt2() along with
all the tools sysreg updates required for the mentioned registers here.

--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -233,6 +233,31 @@
 .Lskip_fgt_\@:
 .endm
 
+.macro __init_el2_fgt2
+       mrs     x1, id_aa64mmfr0_el1
+       ubfx    x1, x1, #ID_AA64MMFR0_EL1_FGT_SHIFT, #4
+       cmp     x1, #ID_AA64MMFR0_EL1_FGT_FGT2
+       b.lt    .Lskip_fgt2_\@
+
+       mov     x0, xzr
+       mov     x2, xzr
+       mrs     x1, id_aa64dfr0_el1
+       ubfx    x1, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
+       cmp     x1, #ID_AA64DFR0_EL1_PMUVer_V3P9
+       b.lt    .Lskip_pmuv3p9_\@
+
+       orr     x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
+       orr     x2, x2, #HDFGWTR2_EL2_nPMUACR_EL1
+       orr     x2, x2, #HDFGWTR2_EL2_nPMZR_EL0
+.Lskip_pmuv3p9_\@:
+       msr_s   SYS_HDFGRTR2_EL2, x0
+       msr_s   SYS_HDFGWTR2_EL2, x2
+       msr_s   SYS_HFGRTR2_EL2, xzr
+       msr_s   SYS_HFGWTR2_EL2, xzr
+       msr_s   SYS_HFGITR2_EL2, xzr
+.Lskip_fgt2_\@:
+.endm
+
 .macro __init_el2_gcs
        mrs_s   x1, SYS_ID_AA64PFR1_EL1
        ubfx    x1, x1, #ID_AA64PFR1_EL1_GCS_SHIFT, #4
@@ -283,6 +308,7 @@
        __init_el2_nvhe_idregs
        __init_el2_cptr
        __init_el2_fgt
+       __init_el2_fgt2
         __init_el2_gcs
 .endm


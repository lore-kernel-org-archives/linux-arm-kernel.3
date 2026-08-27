Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC07C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7AmU12qta8q1ZlLeKuVSRYaRMaQCNUV37Kfk60bXIpI=; b=LeJ1DYuEf5gAik60XmHxfb7hIM
	fZxomTCtcHpfdvqwa5qt4tSLM47URwKorqKwsjTzPGNMkHGfCqpc+S3J7jVgGcllumtca1xi0eXzx
	jStCTKDb2htKW/k2mhLXmptVAaX6KiSgNrfhmPAF3W6QpTY0zI79eh7767uN+fq1Ulypr5SveDoPw
	2acCVSn6K+/6+a7beqSPlo8Z4OmiuD3zAtjq5FxtGHH/bHXM1Pf0ChmuxrhZiUfx7Sa06L5DsXj9j
	hRlpCKj6HUynwy//CzD9fXYB8UO7H9A3a/uVTUwRs7HZg/f/3YNWSbobAJVeKb74IRP+WhmyrEcY3
	imqqpkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfi-00000003fJI-1PBI;
	Thu, 27 Aug 2026 08:41:18 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzVfd-00000003fGz-1mhi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 08:41:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7FC191691;
	Thu, 27 Aug 2026 01:41:08 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D2293F85F;
	Thu, 27 Aug 2026 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787820072; bh=vvhgs5kUI78wRuI2nWyZ8yrPiCiHvcGyGw9bisUEkfQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iU94Tvd1ILay26FL1QzG2god2cUN9C+gWw2/2/FoHU6IXZjRCaaPQGmfTvuDPGX/e
	 aXHME8J6SNADrjbksz1gyYfA67cecCeRhOhseeGkx5Wr9r5W60f68Ul8ezUwHRRPbL
	 zb3TNP2BhM3i+3HCOFoZULWbI0zjfeYGdJ+9SiWU=
Message-ID: <0b2c58d2-cc82-4c68-aaa2-83449d0b48c1@arm.com>
Date: Thu, 27 Aug 2026 09:41:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under
 arm64.nompam
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Xi Ruoyao <xry111@xry111.site>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
 <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
 <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <CA+EHjTy0jCbEb0K7Sd_+X-Ly_6fC3vuPxmyTVRkqkF_DAFMucA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_014114_950485_2FF5D7ED 
X-CRM114-Status: GOOD (  22.65  )
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

Hi Fuad,

On 26/08/2026 23:08, Fuad Tabba wrote:
> Hi Ben,
> 
> On Wed, 26 Aug 2026 at 15:48, Ben Horgan <ben.horgan@arm.com> wrote:
> ...
>>> I was wondering whether that was deliberate. AFAICT, restoring the
>>> writes would trap to EL3 wherever MPAM3_EL3.TRAPLOWER is still set, so
>>> it may not be safe on the machines the override was added for. I have
>>> a patch restoring them, but I learned my lesson.
>>
>> Yes, on a system where the firmware ignores MPAM, MPAM3_EL3.TRAPLOWER will be 1 and the traps won't
>> handled and so if MPAM2_EL2 or MPAMHCR_EL2 are touched to disable the traps then the f/w will panic.
>> As you say, if arm64.nompam is set on a platform where f/w has cleared MPAM3_EL3.TRAPLOWER to 0 then
>> the MPAM registers may or not trap . This is different from other features because the EL2 register
>> than configures the traps is MPAM specific and not in a generic register e.g. CPTR_EL2.
> 
> Marc's "Fully disable configured-out features" series [1] runs into
> this too. MPAM may be the family member EL2 cannot put into a defined
> state on its own.
> 
>> There seems to be no way round this other than documenting that you should only set arm64.nompam if
>> you are sure that MPAM3_El3.TRAPLOWER is 1 as you otherwise have a side channel. What do you think?
> 
> Documentation it is, I'm afraid... :)
> 
> Is there any way to find out what MPAM3_EL3.TRAPLOWER is set to?

No

 If
> not, could the caveat go the other way round: arm64.nompam is for
> systems where firmware ignores MPAM, and should only be set on a
> machine that does not boot without it?

Yes, seems fine.

> 
> __activate_traps_mpam() is gated on the same ID fields the override
> clears, so KVM stops trapping guest accesses to MPAM0_EL1, MPAM1_EL1
> and MPAMIDR_EL1, while still hiding the ID field.
> 
> I will send a patch for Documentation/arch/arm64/mpam.rst, unless you
> or James think it belongs elsewhere.

Thanks! Ok with me assuming you also add a reference in
Documentation/admin-guide/kernel-parameters.txt, e.g. "See Documentation/arch/arm64/mpam.rst".

Ben

> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260302115653.1517326-1-maz@kernel.org/
> 
> 
>>
>> Thanks,
>>
>> Ben
>>
>>
>>>
>>> Cheers,
>>> /fuad
>>>
>>> [1] https://lore.kernel.org/all/20260825164219.3347229-1-fuad.tabba@linux.dev/
>>



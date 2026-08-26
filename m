Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E882DC5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 14:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygp9j6ThlfTN1OYLO/etMR3Ca2p99fzc5FIDOOEydXI=; b=1sYvy9+zsgwXLYqazHOQOPAeWE
	oA5AkYnezZEEMddHmkMQEOiYzl+frhDCKP7qlfChHb7eSE3sHan7JFmbGjNG8m5Uyc0gkF1AM5q6y
	hleWynlbdmtpwrKWiJZP3slZD1ynYUayOXk5J/axkp0VJu4Ij5yDxeudhGKR1k0wjB9FXvpL6WvtZ
	y87roXV+EDsMMFu9Gi3VDChqg7XXW0LjIFzA8MVQe5v3M/guMrQBEVg5vlOwL05vfFgtLeE7z3ARx
	q5021O2rNCaC2AIxPMJM35XcgN2kKOFE+g7h2vHrC8vHN5CvTKweSzu/0eNuUcD18IPZqsyFyvM4B
	AR2Qb+OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEw0-00000002cSB-1rUj;
	Wed, 26 Aug 2026 14:49:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzEvx-00000002cR1-1Vyw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 14:48:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A7F1816F2;
	Wed, 26 Aug 2026 07:48:49 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DACB3F7D8;
	Wed, 26 Aug 2026 07:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787755733; bh=vLb0Om9UgS2n6FDS9rGiXGaZDVt71YmuY1679WKO2V4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kTtoJaFENZIGpQGgOEM6RwVAGj0gR0mVYgCS3/4s9CcdnY+LzFxgkQM0z0AKmc1JZ
	 v69DElMYWTGU8N5ROmOTX1FIJclhONhoSO/+IZBHodJ8iCJ/RWKOK4manc4Rxy6LdM
	 tCjO/WW8XaWXDziSHFDGtZYjsuKmhKeZM6U+R5EM=
Message-ID: <a491ea12-b0f6-43e4-bb5d-dba508120bfb@arm.com>
Date: Wed, 26 Aug 2026 15:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm64: MPAM2_EL2 and MPAMHCR_EL2 are left UNKNOWN under
 arm64.nompam
To: Fuad Tabba <fuad.tabba@linux.dev>, Xi Ruoyao <xry111@xry111.site>,
 James Morse <james.morse@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
References: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <CA+EHjTxeWxZiuSmnKLGLxTBXP4oJT7-LuffbPAyCSZZ5TW=5Ew@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_074857_659157_5FC67AA8 
X-CRM114-Status: GOOD (  15.31  )
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

On 25/08/2026 20:18, Fuad Tabba wrote:
> Hi Xi, James, Catalin, Will,
> 
> I'm going through the features that can be disabled on the host
> command line, checking that EL2 either traps them or leaves its own
> controls in a defined state. That quick and easy GMID_EL1 fix came out
> of the same pass [1] :)
> 
> Since 10f885d63a0e ("arm64: Add override for MPAM"), arm64.nompam
> skips the MPAM2_EL2 and MPAMHCR_EL2 writes in finalise_el2_state, so
> on an MPAM PE with EL3 implemented the trap controls in both keep
> their reset values, which are architecturally UNKNOWN.
> 
> I was wondering whether that was deliberate. AFAICT, restoring the
> writes would trap to EL3 wherever MPAM3_EL3.TRAPLOWER is still set, so
> it may not be safe on the machines the override was added for. I have
> a patch restoring them, but I learned my lesson.

Yes, on a system where the firmware ignores MPAM, MPAM3_EL3.TRAPLOWER will be 1 and the traps won't
handled and so if MPAM2_EL2 or MPAMHCR_EL2 are touched to disable the traps then the f/w will panic.
As you say, if arm64.nompam is set on a platform where f/w has cleared MPAM3_EL3.TRAPLOWER to 0 then
the MPAM registers may or not trap . This is different from other features because the EL2 register
than configures the traps is MPAM specific and not in a generic register e.g. CPTR_EL2.

There seems to be no way round this other than documenting that you should only set arm64.nompam if
you are sure that MPAM3_El3.TRAPLOWER is 1 as you otherwise have a side channel. What do you think?

Thanks,

Ben


> 
> Cheers,
> /fuad
> 
> [1] https://lore.kernel.org/all/20260825164219.3347229-1-fuad.tabba@linux.dev/



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18040C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAksvrtU3hNGaLsgmIthi0uVatNN+9PtMpDcHEvmywI=; b=tedJf3FBZPlqEbHfIWUGDrvDnw
	6ALeyXsz3Vx68nQpLbqIHmJOmlXuYkbPSA6pS23l08ggiC7Wb9GyMjfCEy3IlwNcYLXzxcrIdbkaj
	5mT/FEPOPjpbbypKWWNdORGdv+s2rSgSMXTbHoNjj0Y6M+TTi60xmlQrXSXWm/Ze6kB/8uS9cg/fN
	HQOISMst+ks/GNM2OzWjNFcl91NkwYbXIpFJLLAyQR5weUTdB8nBuZINHnl18/joqDgLwyNYKpDPI
	Nz3LbArxFeq1EG8JHuT/cj6P02txgG8xOyh+s/cjBk3o8eMs3xm4ZaWFQc9zlvDbET9lRSUA/QWwH
	YiHu6hyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmhi-0000000Ctd7-2cHC;
	Fri, 18 Jul 2025 15:08:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmbB-0000000CsuN-2eem
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 15:02:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CF4216A3;
	Fri, 18 Jul 2025 08:01:59 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 617CB3F6A8;
	Fri, 18 Jul 2025 08:02:04 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:01:58 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Janne Grunau <j@jannau.net>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>,
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org,
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple
 A7-A11, T2 SoC support
Message-ID: <aHph5u4-b6mfggPv@J2N7QTR9R3>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <aHUeUMmn_19EayL1@willie-the-truck>
 <be327242-ad55-476a-bed4-44c33c263962@gmail.com>
 <aHkRJdAuvhS2mNQj@J2N7QTR9R3>
 <705f1dfb-7e1b-4930-a1a9-c763299a4305@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <705f1dfb-7e1b-4930-a1a9-c763299a4305@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_080209_745402_354E6EBF 
X-CRM114-Status: GOOD (  33.15  )
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

On Fri, Jul 18, 2025 at 01:00:45AM +0800, Nick Chan wrote:
> On 17/7/2025 23:05, Mark Rutland wrote:
> > On Mon, Jul 14, 2025 at 11:59:36PM +0800, Nick Chan wrote:
> >> Will Deacon 於 2025/7/14 夜晚11:12 寫道:
> >>> On Mon, Jun 16, 2025 at 09:31:49AM +0800, Nick Chan wrote:
> >>>> Patch 8-12 adds support for the older SoCs.
> >>> ... but I'm not sure if anybody actually cares about these older SoCs
> >>> and, even if they do, what the state of the rest of Linux is on those
> >>> parts. I recall horror stories about the OS being quietly migrated
> >>> between CPUs with incompatible features, at which point I think we have
> >>> to question whether we actually care about supporting this hardware.
> >> The "horror" story you mentioned is about Apple A10/A10X/T2, which
> >> has a big little switcher integrated into the cpufreq block, so when the
> >> cpufreq driver switch between states in the same way as on other
> >> SoCs, on these SoCs that would silently cause a CPU migration. There
> >> is only one incompatible feature that I am aware of which is 32-bit EL0
> >> support.
> > 
> > Surely the MIDR/REVIDR/AIDR also change?
> They do not change. ID_AA64PFR0_EL1 also does not change (fixed 0x12).
> What *does* change however is MPIDR. (P-cores has bit 16 set while
> E-cores do not)

The MPIDR changing isn't ok either. You might get away with that today,
but that's not supposed to change behind the back of the kernel.

Is there anything else that can change, or are we absolutley certain
that *only* MPIDR changes?

> >> As mentioned above, it does all work fine when CONFIG_EXPERT is not
> >> enabled, and if it is enabled, then 32-bit process may crash with illegal
> >> instruction but everything else will still works fine.
> > 
> > I don't think that's quite true, unless these parts are also violating
> > the architecture.
> > 
> > If the CPU doesn't implement AArch32, then an ERET to AArch32 is
> > illegal. The way illegal exception returns are handled means that this
> > will result in a (fatal) illegal execution state exception being taken
> > from the exception return code in the kernel, not an UNDEF being taken
> > from userspace that would result in a SIGILL.
> Speaking from experience, when testing with the userspace cpufreq governor,
> trying to run AArch32 code on the ecores really does result in illegal
> instruction for that process while everything else remains fine.
> 
> Referencing ID_AA64PFR0_EL1, the E-cores does claim to support
> AArch32 EL0, even though they could not execute it for real.

Ok, so that's a clear violation of the architecture, and doesn't fill me
with confidence about anything else.

> > I do not think that we should pretend to support hardware with silent
> > microarchitectural migration. So at the very least, we do not care about
> > A10/A10X/T2.
> As explained above, what actually happens on the hardware is different
> from what you believed, so please do reconsider.

Different certainly, but still problematic.

I maintain that we should not pretend to support this hardware.

Mark.


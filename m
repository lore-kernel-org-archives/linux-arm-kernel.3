Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A24C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zLSEdggFwLwWHqRJWibkPnb537C/B+c74f3cbdMsj50=; b=pSaieetWCcIbDFrj75jIdX+j8Y
	LIh4nZSN3/+JldvPqwxyJIgs3vasE92MSy2dgsX3vf8YJ+hQHryjwgbFXOFYKVTBX3CNUXQkXwfSc
	HKs3NhlzXtEySqdzicZJfnqxb2A6+mS4S3LhgfHpNd8Q/NzaH6FxdvILX7U8ElDsL7zCYFd8Ez/FJ
	gvsxO23kwdIaO98CFBTmgaVaUdmbB4Iix+LE2iGOCLogKviPn5KOaBwBnOxvD9/+uGGSWJVmeKLIs
	f5wKtUyebLGUTqtKMM09T+WwOcjygpZdEoYv56CpGjhYgtEBESXsBMIFjEVVwphrM8qdSMClVLvZG
	I5pBS+KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQev-0000000AWHP-3rci;
	Thu, 17 Jul 2025 15:36:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucQAg-0000000ATCw-2KUu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 15:05:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D20241596;
	Thu, 17 Jul 2025 08:05:09 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0B73C3F694;
	Thu, 17 Jul 2025 08:05:14 -0700 (PDT)
Date: Thu, 17 Jul 2025 16:05:09 +0100
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
Message-ID: <aHkRJdAuvhS2mNQj@J2N7QTR9R3>
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
 <aHUeUMmn_19EayL1@willie-the-truck>
 <be327242-ad55-476a-bed4-44c33c263962@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be327242-ad55-476a-bed4-44c33c263962@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_080518_688467_82B9029C 
X-CRM114-Status: GOOD (  30.83  )
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

On Mon, Jul 14, 2025 at 11:59:36PM +0800, Nick Chan wrote:
> 
> Will Deacon 於 2025/7/14 夜晚11:12 寫道:
> > On Mon, Jun 16, 2025 at 09:31:49AM +0800, Nick Chan wrote:
> >> This series adds support for the CPU PMU in the older Apple A7-A11, T2
> >> SoCs. These PMUs may have a different event layout, less counters, or
> >> deliver their interrupts via IRQ instead of a FIQ. Since some of those
> >> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
> >> be enabled by the driver where applicable.
> >>
> >> Patch 1 adds the DT bindings.
> >> Patch 2-7 prepares the driver to allow adding support for those
> >> older SoCs.
> > Modulo my nits, the patches look alright to this point...
> >
> >> Patch 8-12 adds support for the older SoCs.
> > ... but I'm not sure if anybody actually cares about these older SoCs
> > and, even if they do, what the state of the rest of Linux is on those
> > parts. I recall horror stories about the OS being quietly migrated
> > between CPUs with incompatible features, at which point I think we have
> > to question whether we actually care about supporting this hardware.
> The "horror" story you mentioned is about Apple A10/A10X/T2, which
> has a big little switcher integrated into the cpufreq block, so when the
> cpufreq driver switch between states in the same way as on other
> SoCs, on these SoCs that would silently cause a CPU migration. There
> is only one incompatible feature that I am aware of which is 32-bit EL0
> support.

Surely the MIDR/REVIDR/AIDR also change?

In general, silent migration isn't acceptable for the kernel, even if
you largely happen to get away with that today. It is not acceptable for
architectural feature support to change dynamically.

> However, since the CPUs in these SoCs does not support
> 4K pages anyways in practice this is not an issue for as long as
> CONFIG_EXPERT is disabled.

Do these parts have EL2?

> > On the other hand, if it all works swimmingly and it's just the PMU
> > driver that needs updating, then I could get on board with it.
> 
> As mentioned above, it does all work fine when CONFIG_EXPERT is not
> enabled, and if it is enabled, then 32-bit process may crash with illegal
> instruction but everything else will still works fine.

I don't think that's quite true, unless these parts are also violating
the architecture.

If the CPU doesn't implement AArch32, then an ERET to AArch32 is
illegal. The way illegal exception returns are handled means that this
will result in a (fatal) illegal execution state exception being taken
from the exception return code in the kernel, not an UNDEF being taken
from userspace that would result in a SIGILL.

I do not think that we should pretend to support hardware with silent
microarchitectural migration. So at the very least, we do not care about
A10/A10X/T2.

Mark.


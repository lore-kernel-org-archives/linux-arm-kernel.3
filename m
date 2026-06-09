Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6438FCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 10:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y8bHjzB+Y1nVZc9YR0CyX9HxvU4vZsf002qWHNt27b8=; b=USYWz7T3q6cWduXqQ9UkshxZYP
	XtMeyv6ctvvkSnS4wgmqpbJeHpEKp9SNSzJX9fJP7mdrPY7EcMdA+V4k3IaRWZRjawbiblZ2gY6qo
	/bYknJVmnD82Ud4ljxTG86nHl3H3v0gbSvW38iBYP2ejiUxcnD91WQNXWFJKwhDN0K/PiRNnNOe4X
	p3AX8dQSJSYcpl6Sgg8ZFzRvL7BgWGqGFUskUGYr4OynNYArc5LY1b6QbWE/X73GOEMY7KJj1HM4Y
	CEP9lWNHxc0gHm5c1nR3eqiUhonSuhXhxg3RrEshwr2gf7rVMUcEd+iqIvcQQ+HNHQ96Q6IQsSIYY
	dyvAiUyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtap-00000005L3d-07To;
	Tue, 09 Jun 2026 10:21:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWtao-00000005L3R-2gvm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 10:21:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C156543512;
	Tue,  9 Jun 2026 10:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94CE51F00893;
	Tue,  9 Jun 2026 10:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781000517;
	bh=Y8bHjzB+Y1nVZc9YR0CyX9HxvU4vZsf002qWHNt27b8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=QV3MKUV2JVXXWwjRYG7XiKjAFUAKl2Jpb6V9UjF4IHLAoawWiZHZSf0z5A/xttQkb
	 wX2nq++d+ExUb/BZlUl0TC2mnX+LxUjyLOMODE63G2L9L+TIPeCXttpwIN+zq4S//F
	 1HqqydXqqQykamnHja1q18lTSdtmKd0m1jC/JT5gDdO6HxdxWVG/5oyGOzR9bHoQJM
	 2BfD/55SWYsvZa+KfpvNOUfu2zaoz74wqjUecX4HWVprTTJf+8ImA3uMmN4o/RoIOA
	 VDEAlYXGMkELksKePQQfUI8i02AzVIFfjx+nVaJMdtkItilfhX15ql/tIDzCuEQkSN
	 YYHpW8nX5dPxQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wWtak-0000000Arao-3oCd;
	Tue, 09 Jun 2026 10:21:55 +0000
Date: Tue, 09 Jun 2026 11:21:54 +0100
Message-ID: <86ik7st3nh.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org,	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,	devicetree@vger.kernel.org,	Lorenzo Pieralisi
 <lpieralisi@kernel.org>,	Hanjun Guo <guohanjun@huawei.com>,	Sudeep Holla
 <sudeep.holla@kernel.org>,	Catalin	Marinas <catalin.marinas@arm.com>,	Will
 Deacon <will@kernel.org>,	"Rafael J.\ Wysocki" <rafael@kernel.org>,	Mark
 Rutland <mark.rutland@arm.com>,	Daniel	Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,	Rob	Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,	Conor	Dooley
 <conor+dt@kernel.org>,	Chen-Yu Tsai <wens@kernel.org>,	Jernej Skrabec
 <jernej.skrabec@gmail.com>,	Samuel Holland <samuel@sholland.org>,	Neil
	Armstrong <neil.armstrong@linaro.org>,	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,	Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,	Ge Gordon <gordon.ge@bst.ai>,	BST
	Linux Kernel Upstream Group <bst-upstream@bstai.top>,	Jesper Nilsson
 <jesper.nilsson@axis.com>,	Lars Persson <lars.persson@axis.com>,	Alim
 Akhtar <alim.akhtar@samsung.com>,	Ivaylo Ivanov
 <ivo.ivanov.ivanov1@gmail.com>,	Frank Li <Frank.Li@nxp.com>,	Sascha Hauer
 <s.hauer@pengutronix.de>,	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,	Dinh Nguyen <dinguyen@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,	AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,	Thierry Reding
 <thierry.reding@kernel.org>,	Jonathan Hunter <jonathanh@nvidia.com>,	Bjorn
	Andersson <andersson@kernel.org>,	Konrad Dybcio <konradybcio@kernel.org>,
	Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>,	=?UTF-8?B?Ill1LUNo?=
 =?UTF-8?B?dW4gTGluIFvmnpfnpZDlkJtdIg==?= <eleanor.lin@realtek.com>,	Heiko
 Stuebner <heiko@sntech.de>,	Shawn Lin <shawn.lin@rock-chips.com>,	Orson
 Zhai <orsonzhai@gmail.com>,	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v3 03/17] clocksource/drivers/arm_arch_timer: Default to EL2 virtual timer when running VHE
In-Reply-To: <ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com>
References: <20260523140242.586031-1-maz@kernel.org>
	<20260523140242.586031-4-maz@kernel.org>
	<CGME20260609100324eucas1p146c5ffe86a104677143baaeca1d3feba@eucas1p1.samsung.com>
	<ea15cce1-b393-43f6-8d58-3d6f90f0c0cd@samsung.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: m.szyprowski@samsung.com, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@kernel.org, catalin.marinas@arm.com, will@kernel.org, rafael@kernel.org, mark.rutland@arm.com, daniel.lezcano@kernel.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, gordon.ge@bst.ai, bst-upstream@bstai.top, jesper.nilsson@axis.com, lars.persson@axis.com, alim.akhtar@samsung.com, ivo.ivanov.ivanov1@gmail.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, dinguyen@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@kernel.org, jonathanh@nvidia.com, andersson@kernel.org, konradybcio@kern
 el.org, afaerber@suse.de, eleanor.lin@realtek.com, heiko@sntech.de, shawn.lin@rock-chips.com, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, michal.simek@amd.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

On Tue, 09 Jun 2026 11:03:21 +0100,
Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> 
> Dear All,
> 
> On 23.05.2026 16:02, Marc Zyngier wrote:
> > When running with at EL2 with VHE enabled, the architecture provides
> > two EL2 timer/counters, dubbed physical and virtual. Apart from their
> > names, they are strictly identical.
> >
> > However, they don't get virtualised the same way, specially when
> > it comes to adding arbitrary offsets to the timers. When running as
> > a guest, the host CNTVOFF_EL2 does apply to the guest's view of
> > CNTHV*_El2. This is not true for CNTPOFF_EL2 and CNTHP*_EL2, as
> > the architecture is broken past the first level of virtualisation
> > (it lacks some essential mechanisms to be usable, despite what
> > the ARM ARM pretends).
> >
> > This means that when running as a L2 guest hypervisor, using the
> > physical timer results in traps to L0, which are then forwarded to
> > L1 in order to emulate the offset, leading to even worse performance
> > due to massive trap amplification (the combination of register and
> > ERET trapping is absolutely lethal).
> >
> > Switch the arch timer code to using the virtual timer when running
> > in VHE by default, only using the physical timer if the interrupt
> > is not correctly described in the firmware tables (which seems
> > to be an unfortunately common case). This comes as no impact on
> > bare-metal, and slightly improves the situation in the virtualised
> > case.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> This patch landed recently in linux-next as commit d87773de9efe
> ("clocksource/drivers/arm_arch_timer: Default to EL2 virtual timer when
> running VHE"). In my tests I found that it breaks booting of RaspberryPi5
> board. Reverting it on top of linux-next fixes the issue. Here is a boot
> log:

Huh.

[...]

> arch_timer: cp15 timer running at 54.00MHz (hyp-virt).
> clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0xc743ce346, max_idle_ns: 440795203123 ns
> sched_clock: 56 bits at 54MHz, resolution 18ns, wraps every 4398046511102ns

The interrupt appears to be advertised in the DT, but doesn't seem to
fire. That's obviously not going to end well. My suspicion is that
either the interrupt isn't wired (that'd be hilariously abd), or is
left as Group-0 by the firmware (copy-paste from RPi4).

Can you try the following hack and let me know if the kernel shouts at
you?

Thanks,

	M.

diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index ec70c84e9f91d..d05791e6cc0db 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -213,6 +213,7 @@ static void gic_eoimode1_mask_irq(struct irq_data *d)
 static void gic_unmask_irq(struct irq_data *d)
 {
 	gic_poke_irq(d, GIC_DIST_ENABLE_SET);
+	WARN_ON(!gic_peek_irq(d, GIC_DIST_ENABLE_SET));
 }
 
 static void gic_eoi_irq(struct irq_data *d)

-- 
Without deviation from the norm, progress is not possible.


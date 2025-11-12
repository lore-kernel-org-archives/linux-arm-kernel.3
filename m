Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD7DCD4849
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 21:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O90JdZUiA4yleNGHCWftICtw3EqoG2NMni44ZHamoXQ=; b=Xvk0SseGtfONvP7m/WIoPZfkhH
	NA88h+AW1zCjom5biIzezIOzC2GXuHk09jGaMW5U1NG4v9ZFq8JL1w5ycUxTdF6jTT+bw43omR7H0
	s5d4iJAPZ2uK/Lbu1c3bCIC5QJZtvKstEaTr0OrmyuVHdLoKnHekO0ei9kcl71Y1Jm7wvd+S321c3
	AquBgHG3ajdnnFp17UDA+e2QmZNK6roEwZTFzWeXb4nIH5CoOQHXJRXzZU+mZZVjdccZ+ps+klzzr
	liRVs2176OB1t2r51DNNkCyJiZUNmYOIGYMxM7r3Aj7FDND9mFVX6h8RK37Y7vZ1NBkA5P7n/N8zY
	NZp80nTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJISg-00000009XP4-3ven;
	Wed, 12 Nov 2025 21:33:06 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJISe-00000009XOe-0ZSc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 21:33:05 +0000
Received: from pendragon.ideasonboard.com (82-203-161-95.bb.dnainternet.fi [82.203.161.95])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A540022B;
	Wed, 12 Nov 2025 22:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1762983060;
	bh=Gj2Oh+WC8WbDf9hq+vRMY99PMDhB3Gy8yuhPGBYUzlM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3h0GxyOcHg4nEcyKB8wHsYCQpnUwEQpxIOwjq6OL2ZJiZjveX3fpcS0EQofGujiM
	 Y3zErGAGMnNYS0XUtHF++CQ9HWX17Dd9zgLOKN3im36I/cglnnImxbXTfe9gG2d3db
	 cXBRVQQK0AmSD+dmYdhdlfz3DbkdwxDVJRkVhyM8=
Date: Wed, 12 Nov 2025 23:32:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Stefan Klug <stefan.klug@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [PATCH] arm64: dts: imx8mp-debix-model-a: Disable EEE for 1000T
Message-ID: <20251112213249.GB25874@pendragon.ideasonboard.com>
References: <20251026122905.29028-1-laurent.pinchart@ideasonboard.com>
 <e87ff7f2-d16f-41f2-b781-b175cfb84b21@lunn.ch>
 <aP83bMDWCre7-Sjw@pengutronix.de>
 <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aRR-6Nl3ELB2v8gV@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_133304_706372_676E1815 
X-CRM114-Status: GOOD (  37.72  )
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

On Wed, Nov 12, 2025 at 12:34:48PM +0000, Russell King (Oracle) wrote:
> On Mon, Oct 27, 2025 at 10:12:12AM +0100, Oleksij Rempel wrote:
> > Please note, RTL8211E PHY do use undocumented SmartEEE mode by default.
> 
> Same as RTL8211F I believe (as used on the Jetson Xavier NX platform I
> have.) I submitted commit bfc17c165835 ("net: phy: realtek: disable
> PHY-mode EEE") to get EEE working on this platform.
> 
> > It ignores RGMII LPI opcodes and doing own thing. It can be confirmed by
> > monitoring RGMII TX and MDI lines with oscilloscope and changing
> > tx-timer configurations. I also confirmed this information from other
> > source. To disable SmartEEE and use plain MAC based mode, NDA documentation
> > is needed.
> 
> What I saw there was similar to what you describe (although I have no
> way to monitor these signals.) No interrupt storms, but while the
> stmmac TX path would enter LPI mode (whether that provoked anything
> in the PHY, I do not know), the RX path never entered LPI mode because
> the PHY never forwarded that status.
> 
> So, I don't think having SmartEEE enabled on the RTL8211E would cause
> this interrupt storm that Laurent is reporting.
> 
> In Emanuele's case, things are different. The TI PHY reports that EEE
> is supported, implements the autoneg registers for EEE, but *doesn't*
> implement the necessary hardware for detecting/entering/exiting LPI
> mode. So, if EEE is negotiated, the remote end thinks it can enter
> LPI mode... which likely causes the link to drop as the TI PHY can't
> cope with that, and I suspect that's the cause of Emanuele's problem.
> 
> I'm wondering why "arm64: dts: imx8mp: add cpuidle state "cpu-pd-wait""
> impacts this - could it be that entering the idle state does more than
> just affecting the CPU domain, but interferes with the EQOS domain in
> some way. Given that the entry/exit to this state is all buried in
> PSCI stuff, without digging through the ATF implementation for this
> platform and then cross-referencing the iMX8M documentation, I don't
> know what effect this has on the system. Is it possible that PSCI is
> messing with the EQOS?

I'm running the mainline Trusted Firmware-A v2.13. I'm not familiar with
the code base, but tracing the cpu_standby operation, I haven't seen any
code interacting directly with the EQOS.

> What about the clock tree? Is it possible that the stmmac and/or RGMII
> clocks could be lost when cpu-pd-wait state is entered on all CPUs?

That's something I am suspecting too, but reading the code I don't see
where it would occur. I've also tried to see if we could be missing
power domain handling for the EQOS, but I don't see a mention of a
related power domain in the reference manual or the BSP kernel.

Interestingly, running `stress -c 5` helps, so the issue seems related
to CPUs getting suspended. However, I appear to have previously spoken
too fast. While reverting the cpuidle state commit helps with the
interrupt storm, it doesn't fully get rid of it. I still get several
hundreds of thousands of EQOS interrupts during boot. The situation then
appears to calm down after boot completes. Adding the `eee-broken-1000t`
property, on the other hand, gets rid of the problem completely and
interrupt counts return back to normal. It may therefore be that the
problem was present before cpuidle states were introduced, but with a
low-enough impact at runtime that they went unnoticed.

> Has anyone checked whether there's anything in the errata
> documentation?

Yes I have. The document is available at
https://www.nxp.com/webapp/Download?colCode=IMX8MP_1P33A (it annoyingly
requires an NXP account, but is otherwise publicly accessible). There
are three items related to the EQOS:

- ENET_QOS: Failure to generate Fatal Bus Error interrupt when
  descriptor posted write is enabled

- ENET_QOS: MAC incorrectly discards the received packets when Preamble
  Byte does not precede SFD or SMD

- ENET_QOS: Scheduled transmit packet not sent in the allotted slot or
  the remaining fragment of a Preempted Packet incorrectly dropped due
  to scheduling timeout in the EST GCL

Those do not seem related. I haven't seen any other errata entries that
seem related.

Here's a lockup report I've received from the kernel while testing:

[  156.563792] CPU#0 Utilization every 4000ms during lockup:
[  156.563799]  #1:   0% system,         26% softirq,    75% hardirq,     0% idle
[  156.563808]  #2:   0% system,         26% softirq,    75% hardirq,     0% idle
[  156.563818]  #3:   0% system,         26% softirq,    75% hardirq,     0% idle
[  156.563827]  #4:   0% system,         26% softirq,    75% hardirq,     0% idle
[  156.563836]  #5:   0% system,         25% softirq,    76% hardirq,     0% idle
[  156.566161] CPU#0 Detect HardIRQ Time exceeds 50%. Most frequent HardIRQs:
[  156.566167]  #1: 2030282     irq#200
[  156.566173]  #2: 5           irq#11
[  156.566181] Modules linked in: gpio_adp5585 pwm_adp5585 hantro_vpu v4l2_vp9 rockchip_isp1 v4l2_jpeg dw100 v4l2_h264 v4l2_mem2mem videobuf2_vmalloc videobuf2_dma_contig videobuf2_memopsr
[  156.566335] irq event stamp: 6180519
[  156.659469] hardirqs last  enabled at (6180518): [<ffff800081285d88>] exit_to_kernel_mode+0x10/0x20
[  156.668532] hardirqs last disabled at (6180519): [<ffff800081285e68>] enter_from_kernel_mode+0x10/0x40
[  156.677848] softirqs last  enabled at (633238): [<ffff8000800cafe4>] handle_softirqs+0x4ac/0x4d0
[  156.686644] softirqs last disabled at (633245): [<ffff800080010394>] __do_softirq+0x1c/0x28
[  156.695008] CPU: 0 UID: 0 PID: 0 Comm: swapper/0 Not tainted 6.18.0-rc3-dirty #915 PREEMPT
[  156.695020] Hardware name: Polyhex Debix Model A i.MX8MPlus board (DT)
[  156.695028] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  156.695039] pc : handle_softirqs+0xfc/0x4d0
[  156.695050] lr : handle_softirqs+0xf8/0x4d0
[  156.695061] sp : ffff800082aebf30
[  156.695066] x29: ffff800082aebf30 x28: ffff800081bea000 x27: ffff800081cd60c0
[  156.695090] x26: ffff800081ce0e00 x25: ffff800081ceaa80 x24: 0000000000000000
[  156.695110] x23: 0000000060000005 x22: 0000000000000008 x21: ffff8000800101a8
[  156.695128] x20: ffff800082aebf30 x19: 0000000000000000 x18: 0000000000000000
[  156.695148] x17: ffff7ffffded5000 x16: ffff800082ae8000 x15: 0000000000000000
[  156.695168] x14: 0000000000000000 x13: 0000000000000000 x12: ffff0000019714f8
[  156.695187] x11: 0000000000000039 x10: 0000000000000039 x9 : ffff80008128a08c
[  156.695205] x8 : ffff800082aebe58 x7 : 0000000000000000 x6 : ffff800082aebf00
[  156.695224] x5 : ffff800082aebe88 x4 : 0000000000000000 x3 : 0000000000000001
[  156.695245] x2 : ffff7ffffded5000 x1 : 00000000000c48c4 x0 : ffff800081bea510
[  156.695267] Call trace:
[  156.695274]  handle_softirqs+0xfc/0x4d0 (P)
[  156.695289]  __do_softirq+0x1c/0x28
[  156.695301]  ____do_softirq+0x18/0x30
[  156.695315]  call_on_irq_stack+0x30/0x70
[  156.695330]  do_softirq_own_stack+0x24/0x38
[  156.695344]  __irq_exit_rcu+0x174/0x1c0
[  156.695356]  irq_exit_rcu+0x18/0x48
[  156.695370]  el1_interrupt+0x40/0x60
[  156.695385]  el1h_64_irq_handler+0x18/0x28
[  156.695405]  el1h_64_irq+0x6c/0x70
[  156.695418]  default_idle_call+0xbc/0x298 (P)
[  156.695430]  do_idle+0x21c/0x288
[  156.695445]  cpu_startup_entry+0x40/0x50
[  156.695459]  rest_init+0x100/0x190
[  156.695472]  start_kernel+0x7e0/0x938
[  156.695483]  __primary_switched+0x88/0x98

-- 
Regards,

Laurent Pinchart


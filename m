Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E683BCA5FE6
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Oct 2026 06:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jkeBQXMC0mxk0cVDHkusiZ0VJqmjJ/qXxgzgEOL765k=; b=D2Pu9/Z2kEQJtR/qebk5vpvMAY
	HYcTsP/nv5WL2ekpF7yHSxFsk41BsYK8s7QMMXmAwY1vWFml9h+ksdQwPO4LyILhisXZk79kG+wrH
	SFQvv1ZzveMT/tjMXH+ayML4KlPZztxXdINQVTj32r/2peaS0o2m159xUtafQI0O8gjU1ug9/jmAu
	xAfYxSZ0Ev4EJ3M/c36NanKcKUndu0I2qW38++LY1av163AE45DoZhFIOMFRbYWuBeeydIXy6s4Yl
	+AHhX+liilM7YdjVRnfxBw/68z4xtskfZUNprI7TgkfA2/Fm0FiGyabb1a3sbVqNLE6YyCenb5Fw7
	4g5nWn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFsI-0000000EQyM-1zRl;
	Sun, 04 Oct 2026 06:39:06 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDFsF-0000000EQy0-3UrT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 04 Oct 2026 06:39:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ypm3tercgjcidctqjyemeslyim.protonmail2; t=1791095940;
	x=1791355140; bh=jkeBQXMC0mxk0cVDHkusiZ0VJqmjJ/qXxgzgEOL765k=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=E2Ez0S4tFO8YVQ8T5qWnVIic2lvgr3uh0+BneFzPTl3KOrw/shTnKvF9OrARpxbl9
	 p03kHEZDlviTZPO3vjguFBd1Fd/ypPxNdH3jJdwBq/RoGgCD4YK1TeIN2sWZEIpEhw
	 OL7zWysttLIM+ka6wB+hWoWgcf9VkX7OMObcCozhI68Ej6WGmu3oN4uBs+pFH9Z22E
	 8F7Elywq9okdORKCk22Y2YHkvW3uHjZb98eHXULmXerj47t2Mfu2TcwSdPb/iccbxm
	 /CpXcM5zZ3l+WhTyr4imdHXixLGOKvyKTTAb3Om5fQgXWaU1SWErzz5YSU8zImtvjp
	 84KUwJA+ryfFg==
Date: Sun, 04 Oct 2026 06:38:56 +0000
To: Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
From: Norman Herms <dockseed@proton.me>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: pinctrl: sunxi: a733: irq_banks too small for port K
Message-ID: <lqyUiTS5jK5vqN8dT8ByLl8sBPTW6eSDG_13v8UAkVIUCnnxLv4UBrlHTm0c7f4brqOd5ur4sDdgld0Ol4usnXOHgJscjqwJl2BrzPpJk5Y=@proton.me>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 9d76db5c45f7d18900f3d56a77fb38acbbf9487a
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_233904_501607_9C1056B1 
X-CRM114-Status: UNSURE (   7.95  )
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

Andre, Linus,

Observation on "pinctrl: sunxi: add support for the Allwinner A733"
(Andre's series [2], now in linusw/devel for 7.4):
the A733 pinctrl description sets .irq_banks =3D 10, but PA does not
exist there, and prepare_function_table() in pinctrl-sunxi-dt.c counts
IRQ banks from PA, so PB is 1 and PK is 10. This is the same
numbering problem as in Pablo's thread [1].

With irq_banks =3D 10, PK (26 pins, bank 10):
 - sunxi_pinctrl_init_with_flags() allocates irq_array for 320
   entries but sunxi_pinctrl_build_state() writes PK to 320..345
   (104 bytes past the end) at every probe;
 - PK gets no parent interrupt and its hwirqs are outside the IRQ
   domain, so there are no GPIO interrupts on port K.

Measured on two Radxa Cubie A7S boards, same kernel (v7.3-rc5 plus
this series), once as is and once with irq_banks =3D 11. Requesting
edge detection on PK0 through the GPIO v2 character device fails
with ENXIO as is and works with irq_banks =3D 11. PB0 as a control
works in both cases.

KASAN (generic) does not report the overflow on either board. devres
rounds the allocation up to the whole kmalloc bucket, so the 104
bytes still lie inside the object. The out-of-bounds write is
therefore invisible to KASAN here.

Regarding Pablo's thread: with the convention Andre preferred there
(count from PA, placeholder interrupt in the DT), the A733 needs
irq_banks =3D 11, which also matches the binding (exactly 11
interrupts). 10 would only be right with the renumbering from
Pablo's patch, which is not applied.

I am not a kernel developer. The measurements were run on my boards
by AI agents, and the analysis was done with the help of an AI
assistant (Claude). This is a report, not a Tested-by.

[1] https://lore.kernel.org/linux-sunxi/20260929203634.32998-1-pmazzini@gma=
il.com/
[2] https://lore.kernel.org/linux-sunxi/20260910133519.459011-1-andre.przyw=
ara@arm.com/

Thanks,
Norman


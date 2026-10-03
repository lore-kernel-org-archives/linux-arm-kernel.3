Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6D81CA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 14:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXJZsVteBsFqjHbXMx/x9zuPLikQCN04yzIKRIVguww=; b=i4mQc18XigPewb6kpDGrKy6qKv
	Sqxx9B+MUkBfPz9PPjpgf9Eyw7kfglq7hdQL+8XoW89dCcgF37Y9BdvMOUOy8UlMiX2RHaFfr4bjn
	YwQxoYDl7v3XuzGJ9Ds0pCTsZdfvaQxXqQ4vsWSHBUF1yFl/KVsSnqNvdSNW8a9KMuQBjEQORCwmR
	UpkS04H7zyUQ/y8xS3No4D9N6j2I6bcvxbA4iXMlLIffCsKQJ7KsCu1yt9qmn31d7xD2Ydu1yxTi7
	2XW2m+IUTo3dIRqi/JzmOrzNZ3VtoFKlNCeq3GsOb0Z8F3XMtBlGtWmkq4L5sYkkg8fYKjAVEGxBm
	nBiDQ/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Ay-0000000DeaT-3Kbu;
	Sat, 03 Oct 2026 14:57:24 +0000
Received: from mail-4316.protonmail.ch ([185.70.43.16])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD1Aw-0000000DeZd-0tGk
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 14:57:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791039437; x=1791298637;
	bh=uXJZsVteBsFqjHbXMx/x9zuPLikQCN04yzIKRIVguww=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=krETLDSJFteY5BJdc1leBNvIaU/JT5EvBg0qmMKmXAMGCIixEkKBV1/RvNOYdQNw4
	 ZsMOUI8PVJcNmD4cwCsqYEwSO1hPSPcxcghYh0Y+2aJWcf1SfpWdekhQ7DuhwqBykO
	 VUXFMH0QoyueBEwkYDaSW5eMsWpZ3fEFxIQDnQOk+IZ3JV/xbTQWlVPnCa1ElVBqgg
	 YKWVur9NcKXLKhovIH7SaxfSVYNlUVkXUxk0Dw2Pjp40jnM5TAuc74RmvmTek+xenm
	 ANkIPCqfLyq9n/Z/WaUiiHW4GS1/o4g8n/OdqjVoRtyEpC0OMBhPTiMFBBWjDUGyK6
	 NyyvFIp5tt/Lg==
Date: Sat, 03 Oct 2026 14:57:11 +0000
To: wens@kernel.org
From: Norman Herms <dockseed@proton.me>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Message-ID: <Xss-x8UR9RSDehrUzeE27kgFWXhob67jMdSrxfgSV5FIhrtDiD5VRcpJYP2-j7itF4eArxOmzsGWXqQucflO9EJqt7LK70OVjFmCjsaqHc0=@proton.me>
In-Reply-To: <CAGb2v65q8w6NLzTtuMX3HZR98nAvR=Z4ODUCFZb5j3TgkDu_3Q@mail.gmail.com>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech> <CAGb2v65q8w6NLzTtuMX3HZR98nAvR=Z4ODUCFZb5j3TgkDu_3Q@mail.gmail.com>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 1db97b86471db45a5d153e83a4f06e314e249029
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_075722_869246_C9998475 
X-CRM114-Status: GOOD (  10.51  )
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

Hi ChenYu,

Measurements for your comments on this patch. Same two Radxa Cubie A7S
boards and boot chain as in my reply to the cover letter (SID + 0xA0 =3D
0, no secure boot). Cold boot, register reads from U-Boot at
non-secure EL2 on both boards (same values). On one board also a
non-secure write test, and reads from EL3 with a test BL31 that only
reads, before and after sunxi_security_setup(). Again done by AI agents
(Claude) on my boards, so a report, not a Tested-by.

> The three bus dividers are secure by default, and either need to be toggl=
ed
> to non-secure by the bootloader, or (I'm guessing) the system is running
> without secure boot and the secure access bit isn't in effect.

On our boards the bootloader toggles them. Bit 0 of PRCM_SEC_SWITCH_REG
(UM 4.2.5.26) covers exactly AHBS/APBS0/APBS1, and TF-A's common
sunxi_security_setup() writes 0x1 to that register (our BL31 and the
vendor BL31 set 0x7). From EL3 it reads 0 before and 0x7 after that
write. From non-secure: 0x07010290 =3D 0x7, r-ahb =3D 0x03000000, r-apb1 =
=3D
0x04000000. Both differ from the reset value 0, so these registers are
readable. We have not checked non-secure access to them before BL31
sets the switch. Note that secure filtering is active on these parts
even without the fuse, see the TWD gate below.

> > +static SUNXI_CCU_GATE_HW(bus_r_twd_clk, "bus-r-twd", &r_apb0_clk.commo=
n.hw, 0x12c, BIT(0), 0);
>
> User manual says this is secure only.

On our boards it behaves like that even without secure boot. From EL3,
S_TWD_BGR_REG (0x0701012C) reads its UM default 0x1, before and after
the BL31 security setup, so the gate is open after reset. From
non-secure it reads 0 on both boards, and a non-secure write of 0x1
does not stick.

> BSP sources say there is a "dma-clken-sw" gate at 0x1dc bit 0. Same on th=
e
> A523, though it's unclear what it does or controls.

The A733 UM lists no register at 0x1DC (the S_PRCM list goes from
0x01CC to 0x020C). In the Radxa BSP (radxa/allwinner-bsp, branch
cubie-aiot-v1.5.0) "dma-clken-sw" exists in ccu-sun55iw3-r.c and
ccu-sun60iw1-r.c, but not in ccu-sun60iw2-r.c, the A733 one. On our
boards 0x070101DC reads 0 from non-secure.

Thanks,
Norman


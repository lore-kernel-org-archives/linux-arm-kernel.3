Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59440CA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 16:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jhnKxC1jfYQTIuTmaIFSI31CFkT8/+tMwqpFmimI1mE=; b=FKgSV6HonIEAITNG38bSxgSN8N
	ogs0Ymjbn6nb9qJ+55tlouCUFRW7tRlpVGlx+1N3atu1SkxoaqasnupTQwIqcP4jYb2pD2vEw8byK
	JHJOxj2tDHeWuaW3KTupcF1LDmo4gwIW/K0hyeO5Mwvm5V10W5D3rYJeJq4ayBtSDhlO7ju2kb+0v
	hxaBwY8x2cFsCnpcuOQicRIzfHIG2K8gSbzKJyTpJY2kMG6ZmtZtVweFw4iByeBJyk74/ozLddUyY
	XtS+IGW+3PcAnDRPnVQjDvK9RVj0LD8IihJqVJOBQS4SAmAzpDijgmbzMFJw6kLcgwObONDA9v8t7
	e3P+GzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2xW-0000000DniR-0qFX;
	Sat, 03 Oct 2026 16:51:38 +0000
Received: from mail-43100.protonmail.ch ([185.70.43.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD2xT-0000000Dnh9-2NyF;
	Sat, 03 Oct 2026 16:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791046291; x=1791305491;
	bh=jhnKxC1jfYQTIuTmaIFSI31CFkT8/+tMwqpFmimI1mE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NPj4ASj3XEB0AC4FSjoNSNY4thPPfkhDBceN/B6WWS+OtBflPV1mvNX8MFPV4VWrJ
	 GkSGEHVXJAlj863kX7PKt3+YeM/wbnItd53pFWe9wJrrvhLcW5llncYSe4ERPi+kO2
	 p7MNtEO4eHGAVsLe3q/7l28e68457E8nhgNnpp5sVYNeMaeCWxaSvsXWhwamcRYQMY
	 jdR2D8BWxlanXhb46a6pJgkqEBFU4aVU6ZKDv/7jG2NY/PzJ3mOrUzC/suFYCKdfpm
	 mt+AAma/lVJL5I9QzILJvPtnP+WwNmtEXWwt9WDETHlRbbx2Gj2a0UBn0FrypYQpgW
	 sKWGp2wa3lCTw==
Date: Sat, 03 Oct 2026 16:51:24 +0000
To: Junhui Liu <junhui.liu@pigmoral.tech>
From: Norman Herms <dockseed@proton.me>
Cc: wens@kernel.org, Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, Enzo Adriano <enzo.adriano.code@gmail.com>, Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v5 3/8] clk: sunxi-ng: a733: Add PRCM CCU
Message-ID: <IX5E2OTO5TApj5Vn4djIoBmcguIRvSNmVwcbXPiXUUGdVZr1NAJHSRomSnI2U5zgW9LWkNXJUpSIlkvHGCwlb1n6mYkGZoH4l1EOvNgua38=@proton.me>
In-Reply-To: <DLVAHLGLB6W5.1X87X6JJ6MY5H@pigmoral.tech>
References: <20260930-a733-clk-v5-0-11175b41cd2d@pigmoral.tech> <20260930-a733-clk-v5-3-11175b41cd2d@pigmoral.tech> <CAGb2v65q8w6NLzTtuMX3HZR98nAvR=Z4ODUCFZb5j3TgkDu_3Q@mail.gmail.com> <DLVAHLGLB6W5.1X87X6JJ6MY5H@pigmoral.tech>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: f0d0ad3ff4b1cce1df4b4fde15de0e8f3c9593c9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_095136_233784_CB965558 
X-CRM114-Status: GOOD (  10.38  )
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

Hi Junhui, ChenYu,

> > The three bus dividers are secure by default, and either need to be tog=
gled
> > to non-secure by the bootloader, or (I'm guessing) the system is runnin=
g
> > without secure boot and the secure access bit isn't in effect.
> >
> > Please add a comment about this.
>
> Okay, I will add a comment explaining this.

A data point for that comment, measured since my last reply. For the
registers behind a security switch, ChenYu's guess holds on our boards.
Two test BL31s, each clearing a switch again after
sunxi_security_setup(), then reads and writes from U-Boot at
non-secure EL2:

- PRCM_SEC_SWITCH_REG bit 0 cleared (0x07010290 reads 0x6): r-ahb
  reads 0x03000000 and r-apb1 0x04000000, the values EL3 reads, and a
  write to r-apb0 (0 -> 1 -> 0) sticks.

- CCMU_SEC_SWITCH_REG cleared to 0 (PLL, BUS and MBUS secure): PLL_PERI0,
  AHB, APB0, APB1, TRACE, the AHB and MBUS master gating, NSI and MBUS
  read the values EL3 reads. Writes to PLL_NPU pattern 0 and to TRACE
  stick, and U-Boot's own write to the MBUS gate enable register
  (0x4 -> 0x804) sticks.

So on these non-fused parts (SID + 0xA0 =3D 0) the switch bits do not
gate non-secure access, as the UM notes on these registers say for
non-security mode. With secure boot enabled, the bootloader has to set
them; we cannot test that.

That narrows what I wrote earlier about secure filtering without the
fuse: on our boards it applies to the registers the UM marks as fixed
secure (S_TWD_BGR_REG), to CCMU_SEC_SWITCH_REG itself and to the SPC
status words, not to the registers behind a switch. We tested a sample
of each switch group, not every register.

One board, AI agents (Claude) on my board as before, so a report, not
a Tested-by.

Thanks,
Norman


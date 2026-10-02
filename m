Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E2D4CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 11:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qxlsjfiu3Uk314e2HuEHN/RbLbuxNZG+LxGzQcGs6lo=; b=aWFAh1WEGxXh5GI3DoLebljAl7
	1NYlkeUcn5fnXNw5lwe5UVI6C/7NJs8Q95PKBInSnhNfD+WFVXaU1O4IU/R0lgDh4E4OECkejT2v+
	UDv6wHAWsvmIJpz7t0p8JrWwHDG5UMK1OaK6+gzz/c7X+Yii7hVfo6FuBbwLSEThxeZt4MAs7SN1x
	wQ+aX5DGLl8ULw7Z+IZo0xxJv4AaMrZKO37ewEXEnFtqaVsWGzHlVV/TepMNwvuiw8HdiRNj5FUUN
	abVbvGaPcNJ/vRJ1x9G8lnPzJZ6cz9NqVQFX5o/an7LTAAnNccnV6EBvBt86ko2HK8Ts+7hb6OYr5
	7ln5chiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbRd-0000000BTep-182q;
	Fri, 02 Oct 2026 11:28:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbRc-0000000BTei-2q7Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 11:28:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 65B0D409B8;
	Fri,  2 Oct 2026 11:28:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64621F000FF;
	Fri,  2 Oct 2026 11:28:50 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 0/2] Renesas SoC updates for v7.4 (take two)
Date: Fri,  2 Oct 2026 13:28:38 +0200
Message-ID: <cover.1790939711.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

	Hi SoC folks,

This is my second pull request for the inclusion of Renesas SoC updates
for v7.4.

It consists of two parts:

  [GIT PULL 1/2] Renesas driver updates for v7.4 (take two)

    - Select core functionality that will be required for proper operation
      on RZ/G2M v3.0, RZ/G3E, and RZ/V2N.

  [GIT PULL 2/2] Renesas DTS updates for v7.4 (take two)

    - Add PCIe support for the RZ/G3L SoC,
    - Add ADC DMA support for the RZ/T2H and RZ/N2H SoCs,
    - Add initial support for the RZ/G2M v3.0 SoC and the HopeRun HiHope
      RZ/G2M v3.0 board stack,
    - Add USB support for the RZ/G3E SoC and the RZ/G3E SMARC EVK board,
    - Add SPI (MSIOF) and I2C support for the R-Car X5H SoC,
    - Add support for various SolidRun boards based on RZ/G2L, RZ/G2LC,
      RZ/V2L, and RZ/G2UL,
    - Miscellaneous fixes and improvements.

Note that the second PR includes DT binding definitions and updates for
the RZ/G2M v3.0 and R-Car X5H SoCs, which are shared by the clock and
pmdomain subsystems and DT source files.

Thanks for pulling!

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0735C7EE33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 10:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j6b10aMis3ktGbbQV4iKxfVCRdQZAqi8im59mNtPBjw=; b=qZ0wViFkbjOBee2HtwJ/e4L1YO
	yYXKe0Y2cr+Y/lpqg1CnwUcnPKNR/2kd8TRGhMyvEvZ9H2TOm5ZR0mno5VU21mYWWPrnhhJpQvRI3
	XbRfGDhxTJO7DJUhNjt02bY6L9oro/dN/mIhxurTG5cdnH9FA+9I86HrHQe3xezOW4tcJIfYTGZ4q
	Hm0pRyCDzQAnVGZxQ/e5EwPmFvXy9ZjC1NQQq6jTfdi1heylgYj1Wd79NzY497XSrCNOIWeenNvjQ
	2FnzslxHfaZNgpZeHlHjB5UCSJMY5NPnr/tmr3PsbhYImwf4SDrMwRJ/rvC36e/cHFpHeuUy7KcHw
	Dkww9Gaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjYu-0000000BFWt-1DjZ;
	Thu, 26 Jun 2025 10:10:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjGh-0000000BCmE-0RB7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Jun 2025 09:51:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AA05617F1;
	Thu, 26 Jun 2025 09:51:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89DC4C4CEEB;
	Thu, 26 Jun 2025 09:51:40 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] arm64: renesas: Add support for Gray Hawk Single with R-Car V4M-7
Date: Thu, 26 Jun 2025 11:51:31 +0200
Message-ID: <cover.1750931027.git.geert+renesas@glider.be>
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

        Hi all,

This patch series adds support for the Gray Hawk Single development
board variant equipped with an R-Car V4M-7 SoC.

Changes compared to the internal RFC:
  - Correct board part number.

I plan to queue this in renesas-devel for v6.17.

Thanks for your comments!

Geert Uytterhoeven (3):
  dt-bindings: soc: renesas: Document R-Car V4M-7 Gray Hawk Single
  arm64: dts: renesas: Factor out Gray Hawk Single board support
  arm64: dts: renesas: r8a779h2: Add Gray Hawk Single support

Tam Nguyen (1):
  arm64: dts: renesas: Add Renesas R8A779H2 SoC support

 .../bindings/soc/renesas/renesas.yaml         |   7 +
 arch/arm64/boot/dts/renesas/Makefile          |   2 +
 ...-hawk-single.dts => gray-hawk-single.dtsi} |  12 +-
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 855 +-----------------
 .../dts/renesas/r8a779h2-gray-hawk-single.dts |  17 +
 arch/arm64/boot/dts/renesas/r8a779h2.dtsi     |  12 +
 6 files changed, 43 insertions(+), 862 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a779h0-gray-hawk-single.dts => gray-hawk-single.dtsi} (98%)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2.dtsi

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds


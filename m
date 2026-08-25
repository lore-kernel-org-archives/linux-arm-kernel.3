Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2461C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 05:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9vjujonXqfB1ZkfrEbqAqnsBz3mueWzOTaR5aSM5UVI=; b=QukBcVKPGzJ5uuadyLBvMz11kz
	K0yKYTaRgo9dnkZ0h37ILWUv8enge76j8rTqiqUZaAFERAV9+c6pJaVq2W3wIoEifj+jGpe1MuqBm
	XLP6YYNAYY6P17YjJzAp4seB1Sp9nJIH2kbogHnUfXgnkiyYybyYsIby7eH6TJrp1qdd1SMH6+Z6E
	RXTch/vqoqPrdnVj94P8TszVg2e0QSLmb25UUjfquSuOPIvK30mSoWkIRl9RAws0MRPRBs6+PdZQg
	hHN/QbC3XovAbf89WiNAdQ6fdjEXe9CRYJhwR6EdVcWkJ+cm5YH1E2r6QjCwvesYDKJanw076ZZJ+
	7LJw833w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjYD-00000000AVt-0Mb5;
	Tue, 25 Aug 2026 05:18:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyjYA-00000000AVK-1j6w;
	Tue, 25 Aug 2026 05:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B27A6438D0;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86997C2BCB8;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787635097;
	bh=c8m+kP4UJbinGZZP2vZ7BLyVif62dvbVb9w5w4QtJ2c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GlvZm08+42w6wLq6hwEcRYRNHi+RyJXY9zp8MJI4NpgWSBe7BaDWDXlpkF7QVZcx5
	 bNR1NCG61x3IqaWsFIgol7BKR+Mdyp292HyRHWaWZlWKn2wONi8W3Z6FWawpfs+zCC
	 +ITBBUPWd+B9tMIrbJCmDgutdeLcdcDb5fshQJfCHe21V5bbWhS1aaYustaSPSbqSS
	 079hLZLMhQcgu2OA2Z4VyI2WvgG92VltBphNoJsczaTp9uSgOsMhw/uvSpvyRrscQ5
	 cD8CF3ssojd/SEf3M251aS1lJhDR0lepakd5GUOGKwmiIuIiyY0ercEMiBnBlOjPD7
	 wwyaGhfJom5SA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62541C5B572;
	Tue, 25 Aug 2026 05:18:17 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] Pinephone Pro Connectivity: Adding Modem,
 Bluetooth, and Wi-Fi
Date: Mon, 24 Aug 2026 22:18:15 -0700
Message-Id: <20260824-ppp_connectivity-v2-0-a4b0e11cd62c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WOQQ6CMBBFr0JmbUlbEZSV9zDEQBlhEmlrWxsJ4
 e5WWDu7N/nz5i/g0RF6qLMFHEbyZHQCechAja0ekFGfGCSXJRdCMmvtXRmtUQWKFGZ2wj5N1RU
 XXkA6sw4f9NmUt2Znh693Mod9CV3rkSkzTRTqLFa5hF9uJB+Mm7cmUWzB/0+jYJzJc9GXeD52U
 sjrMLX0zJMVmnVdv9b81hvYAAAA
X-Change-ID: 20260112-ppp_connectivity-5edddd7b4904
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, linux-clk@vger.kernel.org, 
 mfd@lists.linux.dev, Martijn Braam <martijn@brixit.nl>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787635096; l=3246;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=c8m+kP4UJbinGZZP2vZ7BLyVif62dvbVb9w5w4QtJ2c=;
 b=eDOMM9OmCwYq19j0gxgg9RZnGrdgNhF6ujkRI210fik9net1+FPePUNOMqma7F1PoPW9p2xeD
 a56SRW7MxFjBjIRkeG3gkYif1H3LKFgLDw4rHnhD4d1/WZDeoDS1HWG
X-Developer-Key: i=guptarud@gmail.com; a=ed25519;
 pk=ETrudRugWAtOpr0OhRiheQ1lXM4Kk4KGFnBySlKDi2I=
X-Endpoint-Received: by B4 Relay for guptarud@gmail.com/20240916 with
 auth_id=211
X-Original-From: Rudraksha Gupta <guptarud@gmail.com>
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
Reply-To: guptarud@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Continuing the work on upstreaming Pinephone Pro functionality,
this patch series gets the connectivity side of the Pinephone Pro
mainlined. Here are the following sources:

- https://codeberg.org/megi/linux
- https://gitlab.com/pine64-org/linux/-/commit/f9f847c6fd1

All credits to the following folks:
- Martijn Braam: original author for the Pinephone Pro bringup
- Kamil Trzcinski: original author for the Pinephone Pro bringup. No
  longer credited as I can't seem to contact this person
- Ondrej Jirman: maintains https://codeberg.org/megi/linux
- Dang Huynh: for the modem patch above

As far as I can tell, I've credited everyone that I know about, but
may be missing some because of how long its been since the original
implementation till now has been.

I've also included a short guide on how to test these patches. This
generally follows this page:
https://wiki.postmarketos.org/wiki/PINE64_PinePhone_Pro_(pine64-pinephonepro)

To test, please follow the following steps:
    https://wiki.postmarketos.org/wiki/PINE64_PinePhone_Pro_(pine64-pinephonepro)#External_storage_(microSD_card)

To build your own image, you will need to do something like this:
pmbootstrap init    # I typically choose Phosh. Defaults should work
wget https://gitlab.postmarketos.org/postmarketOS/pmaports/-/raw/main/device/community/linux-pine64-pinephonepro/config-pine64-pinephonepro.aarch64 -O arch/arm64/configs/orangepi_defconfig
make LLVM=1 CC="ccache clang" O=.output ARCH=arm64 -j $(nproc) W=1 orangepi_defconfig all
pmbootstrap build --envkernel linux-pine64-pinephonepro
pmbootstrap build --force device-pine64-pinephonepro
pmbootstrap install --sdcard=/dev/sdX    # Change /dev/sdX appropriately
pmbootstrap -y zap -a    # Cleanup everything

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Changes in v2:
- dropped removing the interrupt GPIO for Wifi as that is now merged into mainline
- reworked clkout2
- dropped all the signed-off-by's. credited in cover letter
- Link to v1: https://lore.kernel.org/r/20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: mfd@lists.linux.dev

---
Martijn Braam (2):
      arm64: dts: rockchip: Enable the EG25-G modem on the Pinephone Pro
      clk: rk808: Select the clock function of CLK32KOUT2 on the RK818

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 69 ++++++++++++++++++++++
 drivers/clk/clk-rk808.c                            | 46 ++++++++++++++-
 include/linux/mfd/rk808.h                          |  1 +
 3 files changed, 115 insertions(+), 1 deletion(-)
---
base-commit: 237a1c39e8dfd3e1c6f1f023eea37a48ec04cc63
change-id: 20260112-ppp_connectivity-5edddd7b4904

Best regards,
--  
Rudraksha Gupta <guptarud@gmail.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495B6D29DDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 06:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ih2kvUoSPdL/dppfqPXOQWIjXkmkAaWZeoPFefsc64s=; b=SHFh9HHVpTdA0c55P+ZyFZT6SR
	6MsvOcpvW33Pf/+OA0osdtWLr56KN7eWLfa0nK4MC78shhHYTz4e6YeU1VrA5kFKrGAYQwsm7eXWl
	NtHeX3E9VxZErA/+45i4u+qron6rollHX+IjINy6mlqamRe52OAAwF/hZIhnJVzKDfV+AuanfY1Cj
	3L5/sHYClTCnFlhJRm5jujaKgnprOpuAbWZ5FJ9Fo0sriaaK2L+QFeOnmPOZ/LIzGWbi8/ETWc2up
	fV55Y8D5j2VsdEhsTnteDDttigWTPptmU5BJ9bDmqjhBmZOfTI7VZs91tk0SA+7+QGHaDM791chRQ
	buOtRzYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY6m-00000006bdw-0Hq2;
	Tue, 13 Jan 2026 06:42:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfY6k-00000006bdQ-44zY;
	Tue, 13 Jan 2026 06:42:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 132E46001D;
	Tue, 13 Jan 2026 06:42:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3F15C19421;
	Tue, 13 Jan 2026 06:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768286545;
	bh=8tXZjIGktkSj/gIsBOODpm0xDPGQpoD1AscqdH+ddjM=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=jUJ7yxR3zF7iMneSOtjf32VJ2lqx02jnF6tHFVQSHPXMhiU2MNm/VKm2ACxEx7sz7
	 njtst3O8l4UEiPGdfpiL/9Qd/5mDZKYOADJ0Ouge3eDJ9VPPgo4FalS6zgMjv7Q7dy
	 QO4xoGykMTc0ndD/t4MWnlL9zqFceCEIEzVf731yLgvMptpPdBof89zMfUZMUkYdQy
	 yBAL1rwRnv3ldJrf/R6RJMeUR7TDbbcBQFtbrHS7OQtxd/XSwDkAM0cMyJ4a09ZljL
	 TweD/lBJujQZFY8Ed6c5zFrDb/BmUTZ15hd/8OLtgptEP8foRr1n6nXD8S9m+eFpSO
	 Bl/ajQof/1u5g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A11F6D29DC3;
	Tue, 13 Jan 2026 06:42:25 +0000 (UTC)
From: Rudraksha Gupta via B4 Relay <devnull+guptarud.gmail.com@kernel.org>
Subject: [PATCH 0/3] Pinephone Pro Connectivity: Adding Modem, Bluetooth,
 and Wi-Fi
Date: Mon, 12 Jan 2026 22:42:23 -0800
Message-Id: <20260112-ppp_connectivity-v1-0-284d6e83b212@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFDpZWkC/yXN2wrCMAyA4VcZvTbSlh3cEPE9ZIzaxRlY29nWq
 ojvbp25+wP58mYBPWFgXfFmHhMFcjaH2BRMX5WdEGjMzSSXNRdCwrIsg3bWoo6UKL6gwjFPcy5
 bXrJ8tni80HMlT/2/Pd7uWY7/JTMYglrlrthnuBJSVis803SNg9Ia58GoaUhuhtE9LKQaOOx00
 6oSdw3n4jgZRfNWO3P4PT2rgJDDUOyKVG9FC15XrP98vtxVLGDiAAAA
X-Change-ID: 20260112-ppp_connectivity-5edddd7b4904
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Lee Jones <lee@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Rudraksha Gupta <guptarud@gmail.com>, Martijn Braam <martijn@brixit.nl>, 
 =?utf-8?q?Kamil_Trzci=C5=84ski?= <ayufan@ayufan.eu>, 
 Ondrej Jirman <megi@xff.cz>, Danct12 <danct12@disroot.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768286545; l=3352;
 i=guptarud@gmail.com; s=20240916; h=from:subject:message-id;
 bh=8tXZjIGktkSj/gIsBOODpm0xDPGQpoD1AscqdH+ddjM=;
 b=zixIm9Y8C+p6V0XPwI08j+ah9mKT91Eo3L76RzVp8W0TjkE+M7AfqSyS7f5AfgUzSQLMyLDEY
 Evxb8NGmqQvBlzyD44ElB20KzPu0uvR7fz8zWayHjnDK1RRsv2JfkCE
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
mainlined. Here are the following patches with sources to the original
implementation(s):

arm64: dts: rockchip: Remove interrupt GPIO for WiFi for the Pinephone Pro
- arm64: dts: rockchip: Disable interrupt GPIO for WiFi for the Pinephone Pro
----- https://codeberg.org/megi/linux/commit/7395662eb6700ba19a92fbfb244d4858f08404f3

mfd: rk8xx-core: Configure `rk808-clkout2` function
- power: rk818: Configure rk808-clkout2 function
----- https://codeberg.org/megi/linux/commit/75be96faf939504d0fd5112846e73e437573f716

arm64: dts: rockchip: Add modem to the Pinephone Pro
- arm64: dts: rk3399-pinephone-pro: Add 5V power supply
----- https://codeberg.org/megi/linux/commit/808e7cdaf3ed
- arm64: dts: rk3399-pinephone-pro: Add modem support 
----- https://codeberg.org/megi/linux/commit/8f7e3464
- arm64: dts: rk3399-pinephone-pro: Change modem codec samplerate to 16kHz
----- https://codeberg.org/megi/linux/commit/3bea535
- arm64: dts: rk3399-pinephone-pro: Remove modem node
----- https://gitlab.com/pine64-org/linux/-/commit/f9f847c6fd1

I've also included a short guide on how to test these patches. This
generally follows this page:
https://wiki.postmarketos.org/wiki/PINE64_PinePhone_Pro_(pine64-pinephonepro)

To test, please follow the following steps:
// Follow pmbootstrap installation instructions:
//   https://docs.postmarketos.org/pmbootstrap/main/installation.html
// Next, follow the instructions here to put the Pinephone Pro into USB Mass Storage mode:
//   https://wiki.postmarketos.org/wiki/PINE64_PinePhone_Pro_(pine64-pinephonepro)#Internal_storage_(eMMC)
cd /to/linux/directory/with/these/patches/on/top
// I typically choose Phosh. Defaults should work
pmbootstrap init
wget https://gitlab.postmarketos.org/postmarketOS/pmaports/-/raw/master/device/community/linux-pine64-pinephonepro/config-pine64-pinephonepro.aarch64 -O arch/arm64/configs/orangepi_defconfig
make LLVM=1 CC="ccache clang" O=.output ARCH=arm64 -j $(nproc) W=1 orangepi_defconfig all
pmbootstrap build --envkernel linux-pine64-pinephonepro
pmbootstrap build --force device-pine64-pinephonepro
// Change /dev/sdX appropriately
pmbootstrap install --sdcard=/dev/sdX
// Cleanup everything
pmbootstrap -y zap -a

Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
---
Kamil Trzciński (1):
      mfd: rk8xx-core: Configure `rk808-clkout2` function

Ondrej Jirman (1):
      arm64: dts: rockchip: Remove interrupt GPIO for WiFi for the Pinephone Pro

Rudraksha Gupta (1):
      arm64: dts: rockchip: Add modem to the Pinephone Pro

 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 86 +++++++++++++++++++++-
 drivers/mfd/rk8xx-core.c                           |  1 +
 include/linux/mfd/rk808.h                          |  2 +
 3 files changed, 86 insertions(+), 3 deletions(-)
---
base-commit: d0e305301e82474223bf26185e86e7dc2eb85350
change-id: 20260112-ppp_connectivity-5edddd7b4904
prerequisite-message-id: <20251225-ppp_light_accel_mag_vol-down-v6-0-8c79a4e87001@gmail.com>
prerequisite-patch-id: 8b32de16edffc9f81d299e40107c95908ead6a81
prerequisite-patch-id: 7714aa0d065ea9bc58a8fe67f04d738153752221

Best regards,
-- 
Rudraksha Gupta <guptarud@gmail.com>




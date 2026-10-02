Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC34CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 18:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B8f+Sz7z6t18XL/8KS8izxVayxS8+1642uI7Sr8Z9FI=; b=FGdKJ1hF7BRQ2yGLD2v4OVpbdH
	LiCTeuGtTKxEo0ra6sZTxGmFvcp4gvvvjhAJpwW2jQpSFjJd3DDq69gPAGdSk+ko5+ftYCr4tCLKw
	3n6SwJNNEeyo0r29n1gOxbZeW8rNI6Vv16JiixJ7NnfN2J+V+Wam9ADGkKaLJ/nhUJB3YfAipyC1e
	627S0ncLnBxh0XDgARnBqRit8gbmJ79OLzZqXTYz51z2tdjutZk+cN79AjYgA83suoi+1AQ/G6NIX
	UAa3xXmvy3JCFsPiZaFJPSK4iokF9v0XN39WC+KmJA7muz8FQ7bhpxYbz1FZJ/3+P00+SAQWjUoe6
	zsJ5MxcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCi7m-0000000CHdX-3Pmb;
	Fri, 02 Oct 2026 18:36:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCi7l-0000000CHct-0Zuc;
	Fri, 02 Oct 2026 18:36:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8307140527;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56E09C2BCF4;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790966208;
	bh=b1yPZi82g5YJjfiKmfE3necw60fkrcFAPcinKeqKRUs=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=XH3mdsOou+EpbPmhJ04gKwYHqxuNG2AmXt+q+1soAqXmfGMbkT37SD9HcFG1P29tg
	 HFYHX0nvLqq9Oaq9Wj0PoWmOoX66/sGkTjl88ho84FeprwKYKLzcNz2mKUQZkKpJtG
	 uDgq276zv2LoSurCUQydAyzawVw/3iJXBnHdhoYeOByL7rvgcuOAhvxZkVwdwqo27u
	 4T4oD/397qJ19RK8TsP0cCGOt/ej/p7NYeuH8vslg9dzNVPXN1RKKyzTO0RJMfzoby
	 abYS30w1H9/Plfo0HHu79ToTPz8bDRe1IvNBIp4WqC1av2l45ogj0kdLv9JSyWPxIf
	 +XK6kUt69ckrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3241CCA5FE0;
	Fri,  2 Oct 2026 18:36:48 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH v2 0/2] arm64: dts: amlogic: meson-sm1-odroid-hc4: fix the
 SPI NOR
Date: Fri, 02 Oct 2026 21:36:45 +0300
Message-Id: <20261002-hc4-spi-nor-v2-0-8366a4f91049@iav.lv>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL35v2oC/23MQQrCMBCF4auUWTsySVppXHkP6SLU0QxIUhIJl
 pK7N3bt8n/wvg0yJ+EM126DxEWyxNBCnzqYvQsvRnm0Bk36QtYQ+rnHvAiGmNCNpAbNhtgpaI8
 l8VO+h3afWnvJn5jWAy/qt/53ikJC64wZFGs79nwTV87vAlOtdQfMm6CfowAAAA==
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Christian Hewitt <christianshewitt@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=b1yPZi82g5YJjfiKmfE3necw60fkrcFAPcinKeqKRUs=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFn7f+4N1HnAzNsq2ufuFNnO8HmGxIMWXVHutOxnZT6yQ
 ietzuZ1lLIwiHExyIopskw4pHErY8nVv/4e5g9g5rAygQxh4OIUgIncTmf4X2Ha9crFovxM0lWX
 lX9qDv35fcD/REMti3+LrbDwn/MWtYwMK/u33irZ21L6sMJk1oQtlQUym7cFMt9vtp1qUCN361k
 wBwA=
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Two fixes for the SPI NOR flash on ODROID-HC4. Patch 1 lets the flash
probe after a boot from SD that bypasses the SPI flash. Patch 2 lowers
the clock to 40 MHz, where reads stop returning corrupted data.

U-Boot takes this device tree from dts/upstream and gets the fixes with
the next sync.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
Changes in v2:
- Patch 1: move the HOLD#/WP# group to meson-g12-common.dtsi (Neil).
  The HC4 dtb decompiles identically to v1.
- Link to v1: https://lore.kernel.org/r/20260930-hc4-spi-nor-v1-0-9a3351e2984e@iav.lv

---
Igor Velkov (2):
      arm64: dts: amlogic: meson-sm1-odroid-hc4: mux the SPI NOR HOLD# and WP# pins
      arm64: dts: amlogic: meson-sm1-odroid-hc4: run the SPI NOR at 40 MHz

 arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi    | 9 +++++++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid-hc4.dts | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)
---
base-commit: 065957517880dc7053e0723cc9532b6e78c8855c
change-id: 20260930-hc4-spi-nor-a80152e30ea1

Best regards,
-- 
Igor Velkov <iav@iav.lv>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA73CA5FD6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 17:49:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLcIgqVhaprqkzKPZI+fwqpmS8MYJ0DbDKbC0H5N2uU=; b=g8FBzYoBZYJ6QzOKDLHc0pyjl3
	wU1o8gwCS4hbXKWVp7duzfhZdv5dyjCg4YELPJZu2rP0G1pnEpZF7vXuDjtgMu0/UCrJn9zvi6dU2
	HjA/S37au6sZU3CcVGSSwTGZln3wEfLS+5Ey//EksH4/sasztm4nKc0Y7m12NqGUsYoFj7mltDn4g
	vOIBX++qYcl4CAx7eg7T7y/Xpkrvzv1Z7RzrBIBcgijwVGzcGcqN3obSRza2KWgkSV8cjfCn150qt
	WiBlGppcACFYIWOWljPrmyKtPWwpAbEwTL8buJO2NRzeOcI6clgKq/wiBZLe3dYQd8CmMTh4ktPjA
	a1jlLsRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuY-00000009u1n-0cph;
	Thu, 01 Oct 2026 17:49:38 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCKuW-00000009u0d-0Bs6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 17:49:37 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 6C74120003;
	Thu,  1 Oct 2026 19:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1790876972;
	bh=JLcIgqVhaprqkzKPZI+fwqpmS8MYJ0DbDKbC0H5N2uU=; h=From:To:Subject;
	b=BjqA0IdQv9WcbS9kSeHnFxzTGROq4YJyABwH18v4K6p4Rbm0djmJ3ghhYFKzzJKaC
	 FdMHrExU4RXxrBpFJmL2mztvIlg20DW49Jkd86wMJ+lMM34Oiqn+5itqqZP394JWfA
	 6dAQoos+NcP5r/HGsrnRraZaSLTTzLnsDCPPZf9c/PoIbTH6ilyaB2XPownFuMG1qj
	 RXiHxtPXNfKWav0N8Mw/Sf/k2cOih5YMgcv11II48I33UjRGNv/CgcdHNgTSN1oJyX
	 HdrUaQ3TNtlPe3he18b9UfA5JV3nvQ7lfN3kfOSrM7GA9uO/eKSSA2KuH97bVi/EMA
	 3jGE3cqtCj6kw==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/7] ARM: dts: imx7d-colibri-emmc: Add missing touch display overlays to dtb-y
Date: Thu,  1 Oct 2026 19:49:11 +0200
Message-ID: <20261001174924.3831455-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261001174924.3831455-1-francesco@dolcini.it>
References: <20261001174924.3831455-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_104936_237564_153DE091 
X-CRM114-Status: UNSURE (   9.35  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

The Capacitive Touch Display 7" Parallel with Touch Adapter and the
Resistive Touch Display 7" Parallel overlays are only built as a
dependency of the combined Eval carrier board DTBs and are not listed in
dtb-y, so the standalone .dtbo files are not installed by dtbs_install.

Add them to dtb-y like the other Colibri iMX7 eMMC overlays.

Fixes: 64e7d6ba2037 ("ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7" Parallel with Touch Adapter")
Fixes: 392bbdb0357b ("ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7" Parallel")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index c5caca92ea10..0aece8cc9fe4 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -468,6 +468,8 @@ dtb-$(CONFIG_SOC_IMX7D) += \
 	imx7d-colibri-emmc-eval-v3-panel-res-touch-7inch-parallel.dtb \
 	imx7d-colibri-emmc-eval-v3-vga.dtb \
 	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtbo \
+	imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtbo \
+	imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtbo \
 	imx7d-colibri-emmc-vga.dtbo \
 	imx7d-colibri-eval-v3.dtb \
 	imx7d-colibri-iris.dtb \
-- 
2.47.3



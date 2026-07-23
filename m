Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2252CC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 10:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yAtmVwwG7NwqUnf243ukuW2WaRPFl9N+D4QXJl5egn4=; b=1GXEbvdYg8al/OukySdtmOSp+D
	71+/nFnjaQvacKPEkLQAZVaDNW3PUh830X02moQbUkxGikl3vKzs9JC7IgrizARva7TTAv8Fd21W4
	HKbcjuzadbM57+k0Xk1GF4Yo4P1DKQrj28ZNSulwX6tYXTaDpFS9Yco18ADKDDKz2dikl1ogNHPAG
	ytFXJvVgErNJ38I2wiN8Gyy7s/K9ECZu54GhwmAaCncs/PlXPtQD2zrf3+PCJDz5hO4+in5wVnljW
	IrKQfoqvgcw+TsK+RMf8DiZvmaeV82+M7OcLqemAksWHr7ZbGlyVJdIwMDsIqidXwRo7N1NKYlePi
	yLK7RSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmr2q-0000000E4TO-3Gxh;
	Thu, 23 Jul 2026 10:52:52 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmr2n-0000000E4SO-0ZJ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 10:52:50 +0000
Received: from francesco-nb.. (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id F0CBA1FFD0;
	Thu, 23 Jul 2026 12:52:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1784803966;
	bh=yAtmVwwG7NwqUnf243ukuW2WaRPFl9N+D4QXJl5egn4=; h=From:To:Subject;
	b=vHpLqG4iqYhOPcNkGv+pHi9qy33Hh+xtYwpfVbAUhEYOEhNwEBS4MrmWu68WAQ+UW
	 UW3Kkx7Jf5TCa1l92dP/MYKxN8NECpEGR+N5crSxb6EupVV16GnvvXJh8kMWfKbFEd
	 HYZBSDpn2zWPRz1ppui0BDNrmy7o3Mhz3vNTao5k4BEy1igBrgfIcjiTnDWIochXD4
	 +lhGqM2rTtCZVJbEXUL+9fVZ0Uta5eUKk3timDQsB4swLjTLYrc7XyugrlB2/XNe3Z
	 E/ElaINQe37XogXfnYUMYZp2dViUrifdDasZKLj5fJKfp662CA8yE4SAO5o1IdG5p2
	 9GIPXAHf1975g==
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
Subject: [PATCH v1 0/3] ARM: dts: imx7d-colibri-emmc: Add Toradex Displays 7" Parallel
Date: Thu, 23 Jul 2026 12:52:16 +0200
Message-ID: <20260723105225.194366-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_035249_822731_24EDF94F 
X-CRM114-Status: UNSURE (   6.96  )
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

This series adds device tree overlays to support the Toradex 7" DPI displays to
the Toradex Colibri iMX7 SoM (eMMC variant).

Francesco Dolcini (3):
  ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
    Parallel
  ARM: dts: imx7d-colibri-emmc: Add Toradex Capacitive Touch Display 7"
    Parallel with Touch Adapter
  ARM: dts: imx7d-colibri-emmc: Add Toradex Resistive Touch Display 7"
    Parallel

 arch/arm/boot/dts/nxp/imx/Makefile            | 22 +++++++
 ...ap-touch-7inch-parallel-touch-adapter.dtso | 58 +++++++++++++++++++
 ...i-emmc-panel-cap-touch-7inch-parallel.dtso | 43 ++++++++++++++
 ...i-emmc-panel-res-touch-7inch-parallel.dtso | 32 ++++++++++
 4 files changed, 155 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel-touch-adapter.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-cap-touch-7inch-parallel.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx7d-colibri-emmc-panel-res-touch-7inch-parallel.dtso

-- 
2.47.3



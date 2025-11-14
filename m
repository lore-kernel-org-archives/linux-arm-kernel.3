Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE67FCDE018
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dI6WITLQ2fq69bFuFHyCICgNgDab3LNXcWrZiPn0ZOQ=; b=FbzEhWyPH/6FvQ
	xfPDcn/cqUDyhiO/7JbaEackTDFJmv4OmGQ+LDvDPuUZFn7CriLbGR1QPoIzQlkJ5UTCYyGOaGGAF
	8zZOyrdTZFfVqggu6oVwksICCmA7dXG1UcpP0vrXtXYztUmMos5ReU9KZm4gI+gzXNsTf/KhqbhBv
	lLOGnDjWJkLxxibW4+rOXUdiotMJQbrbX4a3g4WC3cNpkgN0pLV7HCZUl2hJA7bo6K9ee0V8fgh4b
	4n2L2LEvkiTvZm56ZNynyhGzUniiknAYQQrlZAXuimYHfl4lj3Yq5YP5+rjtjKjiDuKZGPb3zp8Bb
	Q3Izw7Gt79zv4jUdLW9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnil-0000000Bh0p-00tR;
	Fri, 14 Nov 2025 06:55:47 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnii-0000000Bgzi-2iWI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:55:45 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0DC5B200C48;
	Fri, 14 Nov 2025 07:55:41 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CC2E3200C56;
	Fri, 14 Nov 2025 07:55:40 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id BA3671800091;
	Fri, 14 Nov 2025 14:55:38 +0800 (+08)
From: Joseph Guo <qijian.guo@nxp.com>
Subject: [PATCH 0/2] Add FRDM i.MX 91 Development board support
Date: Fri, 14 Nov 2025 15:55:31 +0900
Message-Id: <20251114-imx91_frdm-v1-0-e5763bdf9336@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGPSFmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MT3czcCkvD+LSilFzdxJQUoySjZAPzVHMLJaCGgqLUtMwKsGHRsbW
 1ADiQr3BcAAAA
X-Change-ID: 20251114-imx91_frdm-add2b2c07e78
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Justin Jiang <justin.jiang@nxp.com>, Joseph Guo <qijian.guo@nxp.com>, 
 Tom Zheng <haidong.zheng@nxp.com>, Steven Yang <steven.yang@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763103338; l=704;
 i=qijian.guo@nxp.com; s=20250519; h=from:subject:message-id;
 bh=rmkBAKWf4/tK+exu+WFt8u7DjEM6gjNCN0eLf4uTrd4=;
 b=kZlYUQ8RwDWIdWyIBvX3uN/6I641a03ENmZSX1Cy0sxCz8Lses1+2tCTaLPGEvfd+//Mg5TX6
 bYhFlpbF2bBCye7OVpZwy/p9tqnpI4j8Ylo08BKKgPmo4xMptZFvGc/
X-Developer-Key: i=qijian.guo@nxp.com; a=ed25519;
 pk=VRjOOFhVecTRwBzK4mt/k3JBnHoYfuXKCm9FM+hHQhs=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_225544_826858_82E227B5 
X-CRM114-Status: UNSURE (   5.64  )
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

FRDM-IMX91 board is a low cost development platform based on i.MX91 SoC.
Add device tree and dt-binding for FRDM-IMX91

Signed-off-by: Joseph Guo <qijian.guo@nxp.com>
---
Joseph Guo (2):
      arm64: dts: freescale: Add FRDM-IMX91 basic support
      dt-bindings: arm: imx Add FRDM-IMX91 board

 Documentation/devicetree/bindings/arm/fsl.yaml     |   1 +
 arch/arm64/boot/dts/freescale/Makefile             |   1 +
 arch/arm64/boot/dts/freescale/imx91-11x11-frdm.dts | 823 +++++++++++++++++++++
 3 files changed, 825 insertions(+)
---
base-commit: a39fa74eefcd9d7c2f7d4afb5894131d82f5aac5
change-id: 20251114-imx91_frdm-add2b2c07e78

Best regards,
-- 
Joseph Guo <qijian.guo@nxp.com>



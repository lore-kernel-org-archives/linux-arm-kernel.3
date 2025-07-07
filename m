Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BB9C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 06:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3ey0KOqIFMLMo58U0vqHhdMfDbzoC1S9v3w7BI2SsB8=; b=3xS14C/X6kM393jip2n18qnDCL
	Zro8bERBAPAhtLnLf60nr2N/wTwG2KRC6bFerW0GeJnGwRmkCv8/bsy7BGFbpiyn3ovI4ofSnH76F
	eWSBlX7FIC838i2gv7HYidvAhzcksHnVLnr1tD+8/y/ahtZq4YHgO5SjHPG9mWUSWbsdVppT81hL5
	ao7qWbt3h5roYdS6ODps0WVSAu4gq81EMFNt1ibgKFu+J89jJC0zs36HIkumUR3oTzDUb9dcr/w0S
	jNuAlcGWAWou+63uP3pA09A0BGtaJS1luEJ24Wrt6fJgzPe3QuDcCB6PYOMNIFfeGwiT8umNNpqOK
	c9ue+9qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYf8p-00000001WNU-1Xib;
	Mon, 07 Jul 2025 06:15:51 +0000
Received: from cpanel.siel.si ([46.19.9.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYf4D-00000001Vsc-1hYj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 06:11:07 +0000
Received: from [89.212.21.243] (port=56226 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYf4B-00DKr8-07;
	Mon, 07 Jul 2025 08:11:02 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 0/4] Initial PHYTEC i.MX93 overlays
Date: Mon,  7 Jul 2025 08:10:57 +0200
Message-Id: <20250707061101.1194618-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_231105_599872_C9D970E2 
X-CRM114-Status: UNSURE (   5.32  )
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

Add initial overlays for the PHYTEC phyCORE-i.MX93 SoM based boards,
that is the phyBOARD-Segin-i.MX93 and phyBOARD-Nash-i.MX93.

Overlay #1:
 - imx93-phycore-rpmsg.dtbo
 - add support for M33 core RPMsg on phyCORE-i.MX93 based boards
 - applicable to both phyBOARD-Nash and phyBOARD-Segin boards

Overlay #2:
 - imx93-phyboard-segin-peb-eval-01.dtbo
 - add support for PHYTEC PEB-EVAL-01 evaluation adapter
 - applicable to phyBOARD-Segin board

Overlay #3:
 - imx93-phyboard-segin-peb-wlbt-05.dtbo
 - add support for PHYTEC PEB-WLBT-05 WLAN/BT adapter
 - applicable to phyBOARD-Segin board

Overlay #4: 
 - imx93-phyboard-nash-peb-wlbt-07.dtbo
 - add support for PHYTEC PEB-WLBT-07 WLAN/BT adapter
 - applicable to phyBOARD-Nash board


Changes in v2:
- reorder reserved memory nodes by address

Link to v1: https://lore.kernel.org/all/20250619063954.1730231-1-primoz.fiser@norik.com/

Primoz Fiser (4):
  arm64: dts: imx93-phycore-som: Add RPMsg overlay
  arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
  arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
  arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay

 arch/arm64/boot/dts/freescale/Makefile        | 10 ++
 .../imx93-phyboard-nash-peb-wlbt-07.dtso      | 88 ++++++++++++++++++
 .../imx93-phyboard-segin-peb-eval-01.dtso     | 52 +++++++++++
 .../imx93-phyboard-segin-peb-wlbt-05.dtso     | 93 +++++++++++++++++++
 .../dts/freescale/imx93-phycore-rpmsg.dtso    | 60 ++++++++++++
 5 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso

-- 
2.34.1



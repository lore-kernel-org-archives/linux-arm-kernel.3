Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A45C61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lENhC9l4y00VQAZ3iK23TWepRGyZIbhD/oicMmV6hkU=; b=TyjsfVqDLZsyYx
	CPaz6CGSEI69E4tUpAIRsxicUH2uaJJejq5GVCfqwqCnbGeLKP73zs13diXGZdaS70YMS10i7dPec
	Zm+985XSvUEmZEfhpeDd2SZAlY2zDqDbLQZXswPoyFBVzqT0aJIsh6dExU5zIPqpIqqoI2CBj/hfj
	Si5+yYewWke6+R8zADM43QD9aNiinUWUyeIXBYWtQ8AM6sITx/cqTbSs9DRB8nyWHvMxOrBX8qqM1
	g2k+M8mFd0bEtHRZHsvOu7T0/AHG0EdqHhzLrWGCed54MhOcTqDheLfhvGRqZjmgREHHV69LbGEVM
	BzlNnGQPa7ieTrD6x0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xDW-00000008or2-2WcY;
	Mon, 31 Aug 2026 08:18:10 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xDT-00000008ooI-0p99
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:18:09 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 5C7D820098F;
	Mon, 31 Aug 2026 10:18:02 +0200 (CEST)
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v8 0/5] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 31 Aug 2026 10:17:37 +0200
Message-Id: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/53QPU/EIBjA8a9yYRYDD6910rg4OrgZB0rhypkrT
 Wmbmku/u7QOd4ldegsJ5J/fA1xQcl1wCT0dLqhzY0ghNnmjHw7I1qY5OhyqvEdAQBIGAo8KE9z
 HNlgczpM+tzh9xxFXfcKnoY+DrbEKTV5ZVdqSC2JYYVHm2s75MK2jPtH7y8frG/r6O05DeXK2X
 8YsYR1SH7uf9UojXfP900eaQ0pAiAqY5Kx4bl1zHPouNmF6rNw6e4SrzkHt0CGHDkpVeAsZp5s
 6u+qK0B06y2GluFeOeQ0F29T5rS536HzRvSVWa1CWwKYubvRdPyNyKJU3RjhHSi83dXmvLnPoj
 faK5hcI6Td1da++hNZoQziXVErzT5/n+RdQR7A+MgMAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=Jwaigwxg+oOUl4+0PNzsgeyS37Xy8CqmxzYbZoDBLCM=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9ZUi5036zNCPxWuut++8N/umysUfz5ni6mpeb79rNlRC
 eez4lMvdJSyMIhxMciKKbKoLKzgE/X44Bk5TYQLZg4rE8gQBi5OAZhIZi8jw5qru+5P11gUeq3h
 A39C/BODTdyz7T+kxO1RZVl773aq6TWG/xV+h86zH62TTJn0RC5r55+Ml92MDq0B943sls94n6L
 /iwUA
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011807_389858_545A47B3 
X-CRM114-Status: UNSURE (   7.80  )
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

Add a new board variant for the Skov i.MX8MP based family of boards.

This variant uses a different 7" panel than the existing ones.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
Changes in v8:
- add #address-cells and #size-cells to i2c2
- fix touchscreen resolution
- add missing binding includes
- Link to v7: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v7-0-ca8a0446166a@pengutronix.de

Changes in v7:
- address more of sashikos rightful feedback
- Link to v6: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v6-0-fa8f71dfc56f@pengutronix.de

Changes in v6:
- address sashikos rightful feedback
- Link to v5: https://patch.msgid.link/20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de

Changes in v5:
- convert to overlays
- Link to v4: https://patch.msgid.link/20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de

Changes in v4:
- fix Makefile sort order
- add touchscreen fallback compatible
- fix lvds_bridge comment
- Link to v3: https://patch.msgid.link/20260701-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v3-0-d74f7e3f8293@pengutronix.de

Changes in v3:
- rebase to v7.2-rc1
- Link to v2: https://patch.msgid.link/20260427-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v2-0-e2b79fc24391@pengutronix.de

Changes in v2:
- rebase to v7.1-rc1
- Link to v1: https://patch.msgid.link/20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>
Cc: Søren Andersen <san@skov.dk>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (5):
      arm64: dts: freescale: imx8mp: skov: fix sort order
      dt-bindings: arm: fsl: add compatible for Skov i.MX8MP revC Touch
      arm64: dts: imx8mp-skov-revc: convert to overlays
      dt-bindings: arm: fsl: add compatible for new Skov i.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  2 +
 arch/arm64/boot/dts/freescale/Makefile             | 11 +++-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dtso       | 58 ++++++++++++++++++++++
 ...ts => imx8mp-skov-revc-jutouch-jt101tm023.dtso} | 46 +++++------------
 ...07017.dts => imx8mp-skov-revc-tian-g07017.dtso} | 44 +++++-----------
 .../boot/dts/freescale/imx8mp-skov-revc-touch.dts  | 45 +++++++++++++++++
 6 files changed, 140 insertions(+), 66 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>



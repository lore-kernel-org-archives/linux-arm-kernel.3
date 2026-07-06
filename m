Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C023C43602
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vHiFghJ17IaCD+JEl3H0S48jmXzlpZ0Do6k0P3Y77aw=; b=1vq9N2a5FwwrSs
	lE81FJGiBtxoOY9Pz6LxkLqfexcNSIZ+oX8PQzIrsDOTQtVZ6kHqO8cdna3HnEHldtc8qGRcyZcX6
	SyAoxtfj1MkjyOEbCGXWctZp1GJZBKImivauyNsgNdqq+s3Os8HGbfwxGFbVR9ZHfWXqsXyFt7hZ9
	GCS0dbQv72eV+zHyh9kpnLDgesuAXWiaOuqfRZMgQBZMztqh0u8nfd9G0XrtjsIn8jIC5dzZWuOcu
	7yw76mZdATxBF4M4zXpfhGARRz0iEmY2LFX7rcIi3a6JzbT5XSv2qttCr7iQhRVl7TpwlJzHZCKhU
	u257h2tHYY5HTnGVrBOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdbK-0000000Bi1F-09Dr;
	Mon, 06 Jul 2026 07:18:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgdb8-0000000Bhwc-0js3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 07:18:38 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1wgdal-0002vc-QD; Mon, 06 Jul 2026 09:18:11 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH v4 0/3] arm64: dts: imx8mp-skov: add new 7" variant
Date: Mon, 06 Jul 2026 09:17:54 +0200
Message-Id: <20260706-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v4-0-dfc0c8827c02@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKJWS2oC/5WOsW7DIBBAfyViLhU+cIgzteqSMUO3qkMM5/hSB
 SzAyFXkfy9xhwzt4uWkOz29dzcWMRBGtt/cWMBMkbwri3raMNOf3Bk52bIzELAVEmqeNRc8+YE
 Mp+u0uw48fvnMbYr8MiY/mp5rcmVK25pW1eIkG8OKbgjY0bSkPtjx9f3twD5/z3FsL2jSPXMHe
 4rJh+/lpVwt+Pp6rgpYCahrC3KrZPMyoDuPKXhH07PFpZ3hYVegV9ihgAitbjoDRV79a5cPuxb
 VCrssoNWq0yi7HTTyj32e5x9Cvdh0ugEAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1902;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=sDeoUq1u/Am1yCm4MTDWcmJbLvqrCVZvES/IEZ4gWis=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ5Z32FoWX2FfvYjO3d8Om2bqxtxL9l16dZfIgpS2D7WaB
 1SD95l0lLIwiHExyIopsqgsrOAT9fjgGTlNhAtmDisTyBAGLk4BmIjyPEaGo//b056mJ5+KbvFV
 uht45KL/2/9T0tqYS9USlotoTY7oYPgrd+VbxmOJ55EGe7w2uspsunWr6qT1g2bJ9ve5l0Ua/8/
 gAgA=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_001834_217969_8E5C8E36 
X-CRM114-Status: UNSURE (   9.68  )
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
To: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
To: Pengutronix Kernel Team <kernel@pengutronix.de>
To: Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org

---
Steffen Trumtrar (3):
      arm64: dts: freescale: imx8mp: fix sort order
      dt-bindings: arm: fsl: add compatible for new Skov I.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 arch/arm64/boot/dts/freescale/Makefile             |  3 +-
 .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
 3 files changed, 82 insertions(+), 1 deletion(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E86103A9BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 11:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3/ssN5o2u6miEt3fIfb10TO787WrQuZTwJgnaYKYhXE=; b=d+aOxZxDpI+wCF
	TgOiNWEF01eYRSppmeyB06DrkbcMGnzMydZr1uNQAvAWHNhingVJ8XVWhADIFIM4BDSjW/0nnMm0u
	HSK+LUbym/6UChQ/BqFee+I4mxphIDhe4VnGIbCjRpeVzZpQvgFjqrHoDFcIQy7O1vbwUxaCz2IXL
	C7jdt6NqsR0IlJj4OMfGkFNS448QsF9nKIi6y7BUcGH57AS/aqnFllPmKAIWVHnkgr1Hvmi3+jEhO
	ENwaChRbbGYo50rpffV63+6WejhPYQ4Ijk8JNSK0MKSbDKQ74g6rrSgMhABjFcK/+atXk/4MYucTu
	ek+tZIxJo7ZovNmnJNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MTe-00000003GU8-0fkO;
	Wed, 25 Mar 2026 11:32:46 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5MTX-00000003GQm-0dyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 11:32:44 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1w5MT7-0005WU-3u; Wed, 25 Mar 2026 12:32:13 +0100
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Subject: [PATCH 0/4] arm64: dts: imx8mp-skov: add new 7" variant
Date: Wed, 25 Mar 2026 12:31:58 +0100
Message-Id: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK7Hw2kC/yXNyw7CIBCF4VdpZu0kCNaqr2JclIt2agqEAdKk6
 buLujnJt/nPBuwSOYZbt0FylZiCbzgeOjDT6F8OyTaDFPIslOyxDigwh0gGaVkvS0R+h4o2M84
 lh2ImHMi3VVYbferFqK4GWi4m96T1d3V//M1Fz87kbx/2/QPSDRtvjAAAAA==
X-Change-ID: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.15.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_043239_203601_732BC1D4 
X-CRM114-Status: UNSURE (   7.17  )
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
Steffen Trumtrar (4):
      dt-bindings: display: simple: Add JuTouch JT070TM041 panel
      drm/panel: simple: add JuTouch JT070TM041
      dt-bindings: arm: fsl: add compatible for new Skov I.MX8MP variant
      arm64: dts: imx8mp-skov: support new 7inch panel board

 Documentation/devicetree/bindings/arm/fsl.yaml     |  1 +
 .../bindings/display/panel/panel-simple.yaml       |  2 +
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../imx8mp-skov-revc-jutouch-jt070tm041.dts        | 79 ++++++++++++++++++++++
 drivers/gpu/drm/panel/panel-simple.c               | 32 +++++++++
 5 files changed, 115 insertions(+)
---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-3dbcb450a39c

Best regards,
--  
Steffen Trumtrar <s.trumtrar@pengutronix.de>



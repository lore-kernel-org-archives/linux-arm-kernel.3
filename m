Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBDAC43638
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 10:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSDJWZBo8YS09Pl4HqHRXUz1TmzglxecE4GZRTDUz5w=; b=XAA07IpjSKZzUefLryh9Qf+5xW
	SWZTkfkJJUhrq2uPXA9TfOd30wyZAIPkgWM9vprEOQnr3W5WNGyLIjNHfWL/CeucXZxTpKTRWCBJ6
	5YAAWiwYxdAdFyuX1y7XARoE8IMa6c9iWvWHSqOMUs3rYyZK9/XCcydwfh6ZKYeunIr2tKEYzqHFA
	2yJ5dq/KyaFtzBO57lnnfL/eG9Ca5tHFujLghCz8noOpCqYo0afarPm9RoVsbUjNcZmCrnk6cCXnq
	uwOuM+kLJO3IbfblLyTnQyYC/ukZ4wuS5YmNvdhHRFTX6dfYqcBXnHVLHK+j14q0AXJHWjwq6DA5C
	YwDL5TuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmev-0000000D2Nx-1QvE;
	Sun, 28 Jun 2026 10:22:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdmei-0000000D2Gr-2Q06;
	Sun, 28 Jun 2026 10:22:31 +0000
Received: from ping.linuxembedded.co.uk (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9893E99F;
	Sun, 28 Jun 2026 12:21:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782642102;
	bh=UHzs5h1vqIyZpZgqg+2ewdEQWX0v5SbmO7TA7HMs/v4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ruc+K7Jg9vWakwg3Rfa0ZfI0F9W84leQdv1g+BftZ0q/TkLokW82sNL8E/Zopv47K
	 pWLAbBYZRSFqMCLlQT9Eg+Pth96lSJO/WTaqkWPKwGO+NVdB/3AtKXm81/U22D3gKh
	 pwMja/3YMNX0F4Y2n+WG2c1wZ/f7VEihocUYp2WQ=
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Sun, 28 Jun 2026 11:22:17 +0100
Subject: [PATCH v3 2/7] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-kbingham-orientation-v3-2-4ed92968aff8@ideasonboard.com>
References: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
In-Reply-To: <20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
 Matthias Fend <matthias.fend@emfend.at>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Paul Elder <paul.elder@ideasonboard.com>, 
 Martin Kepplinger <martin.kepplinger@puri.sm>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux@ew.tq-group.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782642139; l=2444;
 i=kieran.bingham@ideasonboard.com; s=20260207; h=from:subject:message-id;
 bh=UHzs5h1vqIyZpZgqg+2ewdEQWX0v5SbmO7TA7HMs/v4=;
 b=KT6apJA/GtGNIVhQ5eW/HBAjZTb30RnYg9LvUG9miUzlOCp29AZgehi/Vh38BX3/9VXkb6fgm
 viFFx3Wbqc9BGC65P1tWJOd+C0Fs37P8lc0ghGGDmGC2iE2wnGpnJMn
X-Developer-Key: i=kieran.bingham@ideasonboard.com; a=ed25519;
 pk=FVXKN7YuwHc6UtbRUeTMAmranfsQomA+vnilfglWdaY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_032228_801318_89394C9A 
X-CRM114-Status: GOOD (  12.05  )
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

Expand the documentation of the video-interface-devices orientation to
reference the include/dt-bindings/media/video-interface-devices.h header
which provides human readable defines for the orientation enum, to help
avoid hardcoding values in dts.

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
 .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
index a81d2a155fe6..c9c3f4f16719 100644
--- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
+++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
@@ -392,17 +392,22 @@ properties:
       The orientation of a device (typically an image sensor or a flash LED)
       describing its mounting position relative to the usage orientation of the
       system where the device is installed on.
+      See include/dt-bindings/media/video-interface-devices.h.
+
     $ref: /schemas/types.yaml#/definitions/uint32
     enum:
-        # Front. The device is mounted on the front facing side of the system. For
-        # mobile devices such as smartphones, tablets and laptops the front side
-        # is the user facing side.
+        # MEDIA_ORIENTATION_FRONT
+        # The device is mounted on the front facing side of the system. For
+        # mobile devices such as smartphones, tablets and laptops the front
+        # side is the user facing side.
       - 0
-        # Back. The device is mounted on the back side of the system, which is
+        # MEDIA_ORIENTATION_BACK
+        # The device is mounted on the back side of the system, which is
         # defined as the opposite side of the front facing one.
       - 1
-        # External. The device is not attached directly to the system but is
-        # attached in a way that allows it to move freely.
+        # MEDIA_ORIENTATION_EXTERNAL
+        # The device is not attached directly to the system but is attached in
+        # a way that allows it to move freely.
       - 2
 
 additionalProperties: true

-- 
2.52.0



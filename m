Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BAB0C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eEDHK7+f2a7GTsailp0osONPm9ZTOxQs0lpfnAgPQlw=; b=qHfbLgxx0yfYClUZFr3ZxR3Fjs
	erMV4DGZrvUcaoh3flkIt8hfnTT8pC2GM7hgqArG9bANbjxDlg/hio/Sxi1rpfx5Ic7NswSBs2lFk
	VAIZ0i1nPe5CdS3gsD6wVIevPgQtL9M3lBUUlHizBX3TCPkoM/UcTWIMnhe3aamN1FG1jg/3+hPAf
	Z3HzZujjTEkqIGOmR9jVwAxWXIkaVeU91M4gC5J+/0DNo0uR7o0Av28h/An60ThtV0cT2mx6//s9l
	brOLenaJh77BAgQesFofGoXPz0vX7EhTZ2cWh05gGu+Edmk3ogaHt2rQj9PuMIDyNG4P8aX/7qQZF
	5y+oVDCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYvP-0000000DzCj-0NSC;
	Mon, 24 Feb 2025 13:55:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrR-0000000DyC7-2see
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:51:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CF3815C6DC5;
	Mon, 24 Feb 2025 13:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2800AC4CEE8;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405064;
	bh=0mZGCuRUu8bHqSrP5214OTRBF/zAooyQDahu/9GP8OI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=RbHNcOUpp0bNIuC0zRogKbb3rn7e0998K4wPPN7PYwTDJmbHl6xwpLzA6z5TtvF1n
	 PZEyRTaFmwm9tED4Hi03GxN0FCiZApo57Q+EApwspIRmNfk+vLnK5ucBjxj4t3AAMf
	 LOnbi1iNApjHQ1ecnj2kDCAZswQnTRfKqNATv9gW+FAwx/IqGecSqBzq+R7YyVyg7i
	 oTIMervG6gCgS5sbdnniFtar0p/Dmy5Ypl8F/wbXrEoMwqtdkzWQn7DmMMWMkU4Zcl
	 K6gwd4Tj3Y10n4wQb+IXBxIfby++Ih7u/Mbqb/9LMSXLKNnGCxBkCHbLvxYlU1UD53
	 ik2DFrcLenxKw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 107DBC021B5;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:50:51 +0100
Subject: [PATCH 01/14] dt-bindings: display: simple: add BOE AV101HDT-A10
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250224-initial_display-v1-1-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=1040;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=40zl28floi4M3jn7zLafA4I2SyrY1dnpQAFmoqwqXJY=;
 b=LLEVcADTtIeah3vQnwyqh6H6KYxyToPG8cRuzaIyjCyCSUvmauoZpOiqQDaZczem8xps+vaW1
 HGncx4sAL6dC7u+v73HIGHWpBAoE0EtsHLPn0l6slp4ol77GtQC/CPU
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055105_813136_E36871EB 
X-CRM114-Status: UNSURE (   8.21  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

add a compatible string for the BOE AV101HDT-A10 10.1" LVDS panel

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index e3ee3a332bb7e1736a8d44773b0aef4873153be1..b0de4fd6f3d4129d10e07b46533bb551784d8d53 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -63,6 +63,8 @@ properties:
       - auo,t215hvn01
         # Shanghai AVIC Optoelectronics 7" 1024x600 color TFT-LCD panel
       - avic,tm070ddh03
+        # BOE AV101HDT-a10 10.1" 1280x720 LVDS panel
+      - boe,av101hdt-a10
         # BOE BP082WX1-100 8.2" WXGA (1280x800) LVDS panel
       - boe,bp082wx1-100
         # BOE BP101WX1-100 10.1" WXGA (1280x800) LVDS panel

-- 
2.48.1




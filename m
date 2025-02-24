Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E53C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUpknMqhTztPHEbf0/y4csN+qIPlPvjMN8jUpWjuFVQ=; b=KEdTU+Kg4zRK4HtH4vIKSDlsuF
	CwDwlHe4RitPdTvjjjG8WlkUAjbl+A7D/Jj0/d4TPdRJvaQeOqt3I1sGwKbfaCBPPpD8UsEcJOLsQ
	ThUc0nbZSceJB+PUNfYO5n8yto+uMjnvkev4WE1Xt+2p+jC/rtdwf/sBl2bY0cCzILy/TWmq4e+We
	cf02yGjWM+DN2nzaaeXANEjtS/pXUFuD7CHVTCzEx9h2GKaDSjdcwQmNzc9EU3Np7dKCh/iC/t3og
	wWup24rMftsICkaGk/QzZV81kdGEUMWkKjo1wvbscXU6RTI66SN2EiF8/IeeEPnybDvRDTwgBhJ/B
	9gBn+STQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZ1C-0000000E0D2-3WcX;
	Mon, 24 Feb 2025 14:01:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYrT-0000000DyDP-1HxP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 13:51:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 44FB55C6DDF;
	Mon, 24 Feb 2025 13:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D657C4CEEA;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740405064;
	bh=wRgNXeJ1Ayqgv2ycTvaPbaECbrRkwjK4JSom4J2mOQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NpguweDd/TvRZcKLVI0z04YHV1XH+lfa8VN8A9HJuZKZc0HmLrc7ngHHCDjURRr/r
	 IjvSl3WYd1LLYqSS5k1LafWR3nu0fWahIB65cKEXzs6Q5jiHnbzhaqZ+0MA9pdp1HG
	 ce/EScfmF67lYz5awhh8wvoH/lW0eGkYmcUnqMhCFI5jOOKGh0riSVXF5YKBFQ4I+N
	 F3b+/7ZYqvjBSJv0maORKx0o69hYIdz3bxorngKLmuH8R5WMmdLs3Ze12J3XFQ8+t2
	 paRlXSUrbgEnDuCev48o1JT1vuB7gGYLjnqpTSCup7aKmt9b2PY7QDJ4QBfqHJYzwP
	 U5+/jelv2fSoQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33353C021A6;
	Mon, 24 Feb 2025 13:51:04 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Mon, 24 Feb 2025 14:50:53 +0100
Subject: [PATCH 03/14] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250224-initial_display-v1-3-5ccbbf613543@gocontroll.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740405062; l=1177;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=scPD+OgNUAYsQVTxMgUj2Bfa1YhpGLs4x0xykI3n24k=;
 b=mYX3R22poxBhjhAZBjz4BDirZm2V7dy8Vnyk1tTLA7TnHBsc6hztIBhrUrX8dCAQ/CvcOVSaP
 rezkBfC/jvxAX36FpuRCqK/iIbM7tWJfZtXqCn1nfTENLh7RD4vW5Dz
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_055107_430593_654D8215 
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

Document the compatible strings for the Moduline Display controller.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index db781d31569811ca241b5bd9a32a0896f7d9c3b9..40b2734f0caf3c431f05d33637a6bed8312c9d10 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1099,6 +1099,7 @@ properties:
               - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
+              - gocontroll,moduline-display # GOcontroll Moduline Display controller
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revb-lt6 # SKOV i.MX8MP climate control with 7” panel
               - skov,imx8mp-skov-revb-mi1010ait-1cp1 # SKOV i.MX8MP climate control with 10.1" panel

-- 
2.48.1




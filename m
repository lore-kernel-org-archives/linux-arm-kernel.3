Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85C3AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 15:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uVPa/Mq55TU532D1KZ7GBrznPDtMYp5lXvGro3KW/gU=; b=OMzjwhCtekZGblIxUaq0zM4f9Y
	t4Z+RPrDfw9sF9YVixsZ4CmMR+RLHnqFPK9IXFk78td8q6gqlfE/kbShJzetLnuc81nM84Sq56bVQ
	oOjFRKU7B+Nt7SsmpB4Y36JD20ApAzpUaCloZhmsp/q6AxG1PXKk7ETdB2Rp/CnkAQlMjZhAXOXzJ
	SKrO8al8MdbDRlHEn37m9wJ7nD0sey7XPmfH3MWdo3eFMtaz7BEsUO8Thj+HlpjJfADVWGCWCDZqf
	PxODK6DTZNqUA+98ym2Oqc4c+YvQ9pSqZrEzlSDGKme/tt4WXRmsSisGiBomV0I+PHtl4cLowrR2u
	GOCnfupQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpYp-0000000BQZT-0owu;
	Thu, 27 Mar 2025 15:54:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txpX6-0000000BQD3-0b6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 15:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72F0C614BC;
	Thu, 27 Mar 2025 15:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F383AC4CEE8;
	Thu, 27 Mar 2025 15:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743090759;
	bh=xj1/d4nkyU14Uz0z2ygXiCJS8S9VEH7Pg1iUVkAGGlY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=KWCIJNeR6lDuePraK3O1cPSaZLP7G7Knsk7m4Ltov64ZE/K/A5MY0Cvhyx1sLKTTW
	 HDufXnKWVsJcp9/4A67eSlf0kOy2BAwLU7Exa+7qDANTxZ1ajjEkZdZHPD+8AuoYG1
	 EwPHlFXw+iCriiuwsUirwiQe7VICG8jZG/AmBNfBs7A+vavftTon5z80o7+lBb6LbN
	 QnNNHG6mLPnV8jyBg6+5dY6Av4nbw3vXmiuDjEP5BbyOLGMyKymIsn1Ii2Z5vIq9/t
	 C99tPZWjH+cnkvx/0G7EmIQPjmtZn61ApFQukGpqSOK6KhBCNzgwE9BNRJSH5U0BQF
	 0S9/gZs+Rv9QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCEE8C36010;
	Thu, 27 Mar 2025 15:52:38 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Thu, 27 Mar 2025 16:52:36 +0100
Subject: [PATCH v3 1/8] dt-bindings: arm: fsl: Add GOcontroll Moduline
 Display
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250327-initial_display-v3-1-4e89ea1676ab@gocontroll.com>
References: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
In-Reply-To: <20250327-initial_display-v3-0-4e89ea1676ab@gocontroll.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743090757; l=1206;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=7LK5io9tXyJrf5fT7pNPykcX/YAUSsMUIEqjia8Pbmw=;
 b=Ci9zEyHGluWtFXDpsIS5IxH7Uq6QR2lofbpjZgcJjYhQfKRKhDKVnPBOMXIS0Y82m2RTYDjOl
 a0oz/fkDTq6AhV5Ddbc2sBre0Do9g/0XdYegz2yqWBIqwmlZIa7JnGt
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1b90870958a22e49355dd1f932bf3d84cd864b5f..ecde2123ea0fae38ef233929c7ad343812851a58 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1095,6 +1095,7 @@ properties:
               - gateworks,imx8mp-gw74xx   # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw75xx-2x # i.MX8MP Gateworks Board
               - gateworks,imx8mp-gw82xx-2x # i.MX8MP Gateworks Board
+              - gocontroll,moduline-display # GOcontroll Moduline Display controller
               - skov,imx8mp-skov-basic # SKOV i.MX8MP baseboard without frontplate
               - skov,imx8mp-skov-revb-hdmi # SKOV i.MX8MP climate control without panel
               - skov,imx8mp-skov-revb-lt6 # SKOV i.MX8MP climate control with 7” panel

-- 
2.49.0




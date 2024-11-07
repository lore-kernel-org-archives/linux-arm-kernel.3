Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84FFD5AE74
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 08:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FVx91PzaBK98MLZQYwY4FrPtcC5DxNlPD2xbYW+sIEw=; b=2IOg/fMU+b0uULiN1Ziml5r2cN
	cLAA4+xtOSz38JP1I2DofLdrdp1O/F89KPSH2CIHAzB2QaabIZHmPczUZxnc56ymtGqQH2+7PGm6n
	0rFhr4nw+GjU9RnkYWU8OezN4AQheJc6SJNOjw8m9X9rdAC/0fdydEBWTh8c+PLT2wF+uvdbUubvI
	enXY1FpBOaHMoi1H9Q5cqkfDm6uXXSUa7WP0YHrkyFZNomwWkhaq8BqVkXHugrd2+jj3CYoYXPHQS
	5+1Ee682qZ+/2nCKXpZMZEgACG2RAt13kQe+Qpq+KLLpDmeEtz5/dyb372mSzv9vPT+1Rw19j4Eiq
	CN6Kmhdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yMW-00000006E6s-09Do;
	Thu, 07 Nov 2024 08:59:32 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8yKl-00000006Dl6-2DMA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 08:57:44 +0000
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BF0DE8904D;
	Thu,  7 Nov 2024 09:57:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1730969862;
	bh=FVx91PzaBK98MLZQYwY4FrPtcC5DxNlPD2xbYW+sIEw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pht0m1onep92FMEx1yTFQwV0QkfLKjFLvHkjT3tJ7kf9n20jiHyNbsn24YvWuvHGp
	 FOXA/NzMBQ3OtXvp8gR19xjN8Iu8sij7yPPOI3+Q3GQjC31pCwiVHnGh6Cmzqjl74Y
	 aYLkhqM4YL0FxMT0uI/YlL85LQiujca+roAzk9adhsMn1L6AknmuvoDiqf0TbpoKW3
	 qKv6cjrL5zchsMYG34ULnCMht7g6YTYUNe6IbTRYbW6Pk3t1T1e69xz9/oYVBxZrVg
	 aLCIhZwSUHW97edrb66hzDv2xeJ/0DNWn6KOSQVKCypfNL5ZnyUImOjmYbJwUVGF0r
	 ZSLvP5/5mDygQ==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Lukasz Majewski <lukma@denx.de>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v11 2/3] dt-bindings: arm: Document the btt3 i.MX28 based board
Date: Thu,  7 Nov 2024 09:57:04 +0100
Message-Id: <20241107085705.490940-2-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241107085705.490940-1-lukma@denx.de>
References: <20241107085705.490940-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_005743_740932_8253FE3B 
X-CRM114-Status: UNSURE (   9.19  )
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

The imx287 based btt3 board is very similar to xea in terms of used SOM
module.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

---
Changes for v8:
- None

Changes for v9:
- None

Changes for v10:
- None

Changes for v11:
- None
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6e0dcf4307f1..abebf8e2a298 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -97,6 +97,7 @@ properties:
               - i2se,duckbill
               - i2se,duckbill-2
               - karo,tx28                 # Ka-Ro electronics TX28 module
+              - lwn,imx28-btt3
               - lwn,imx28-xea
               - msr,m28cu3                # M28 SoM with custom base board
               - schulercontrol,imx28-sps1
-- 
2.39.5



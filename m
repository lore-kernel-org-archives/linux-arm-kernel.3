Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6449EC369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 10:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHfS9Ayq+62ZEPKyiIIGlUUpg7PHKrYF5eIEp4kJv8I=; b=iAFPJhTSeumaDXupuq3MTJ7rcD
	XpYri1aeI8rnPktHmC6nt5IwhiHeIglGRPFyt3AxTntAuZ7LNM31yFA/UsmlLe9v1hl7mWHLCQbrk
	cZ50srqOVCKsXtW/NnSVX2jyyqsZIgC8awQgSu3ChlGqzB0EPG4hV5sRtNbSTHAW0PDT8WplAVeck
	NRFHtiYEpxVaXCZJgx0EMrW3iHHxQk6l1d87S+UQ2IBZ/ZdlE4DtQmmQmSsAV4M9Vx0IOQUYHctNS
	B1Mpta5cvFJowE8kCM565luGbNLurfLhsEmQ0Y4h3g759uxEUgKdKjq1ljN3keb0TMhPUlyhGhEqs
	4T4bgUng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25vc-00000003axT-42gc;
	Tue, 08 Apr 2025 10:11:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u25d4-00000003W8N-2cCV;
	Tue, 08 Apr 2025 09:52:27 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so52749625e9.3;
        Tue, 08 Apr 2025 02:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744105945; x=1744710745; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHfS9Ayq+62ZEPKyiIIGlUUpg7PHKrYF5eIEp4kJv8I=;
        b=G/yZNF+04jpGaNx345DTfNp0HRPnj2oDDmWujxlwq4xQoFDzaHBLSmfUt82qcaHgd4
         fT1EM5KOg8ZIgVxSbhQKnEhHiKNXCmhMJ3k2hK4sJqgbItbT1YJc2d7KpyGxwdLUceU5
         YWD5fqiDTqivU1T+HeJxmByOzsZNrmeGDfCEaK/p8iLAt6aIa9Obmck36TTNaPPKHzm6
         StmSTAFnjUM4F7TC3cSei2hX9kvB95TjSoBkiq2HflWZMAu/xoaE97cI/vFTag6p9u8Z
         Qbld0oH1tTMDLGn5CdjeHAcMP8q2kx4sN2y6wjpSb+bOGWh5XwBrNQX9KvnEn0C1Od9X
         B34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744105945; x=1744710745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHfS9Ayq+62ZEPKyiIIGlUUpg7PHKrYF5eIEp4kJv8I=;
        b=sA92bd4uybYfBp5l2LypGPlEllEU4RmT2ycfTEIM4TAFUeWiD908Ey1V/BThxHoTEg
         du6Z5azAlYQIPJS0pTHJlETkeRENor4fNFyBYSPKTi4q0RmRmPuqO+xjKxa8vwqQKV48
         4w58yd3m4250c3VrYoGrreommDYi95Jp2+vdMI5GpU255EvT4KcXcAmdyLoXts9ptUP+
         ahxcfNCOyQx/6/gPMtTCuGjGMHuxgQHDBpECFJehEOQFW5lcBAAWq9TDc49/uNlp540f
         tOfilWbEbiVxO3l9aVOJZeUxiF1eMchV8VNPtLUM498QmAtNvwstRET6NRuBYuuLW0YP
         YBjQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6Z3fWcRYV1wXIoYMd+tUZxsyYVSwTmBPJFKt2tYKbR7No6bY/Sup5Xdes2oQUlE0fxgB2t3Efyrq4SViNqIg=@lists.infradead.org, AJvYcCXmzV8X2u7uvFTlQFMON55t+xL10mRYKZE0INUOLrrXlWvLchPavQ6cAxquSmTerCZYHWTkcAiK1nxaQB4SCOJk@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+2z3mnUFpMINe3jR0JMzDwMMbQUkJB0Z/6ag/WNhGSp/wm+FM
	V90AGltPj03yj23wKtUz62OqOp9w21y9IQZYoLg41lOWQXCu50QB
X-Gm-Gg: ASbGnctd8CA77t3D579kE8XOLpGw6OW9+X8sEVbmVC7NiYRSnE4Nvws/5ANm6kOY+0s
	fMvUAuo2NqF0G/1j8lN30OfoMI9ynfLwkwv+HFBWSKMl53gm8Y9DS6Ym94XoL/st1ZfqLlPVeqs
	xXwNrtUhCVj1u0tVVk1A4IoFc6eD+UDmE8Glp6QzcLS4z0iYytzDt5W4xtfonZok/xDYUN29e0T
	jwmE7FG0CUiqarAtCdyC25lc4SS8HeUS+N8U8G3Y0UqzpyARdFpkXYeSETF1dsREZwLr8EbFOoy
	QJmX/JbsA62X5YJ4OYjuTawfKs0hxgeDcURwvDeAFuSzhZL7YwWAon4tOz81jojrqiAZIXg2/Jv
	NeOo+i8oyvcPB4khCwdkes3FO
X-Google-Smtp-Source: AGHT+IHs+RYORl9SDyQYvbJFkJWKqxzv51lL0XqnDQTULLmNslDEtLs39z+pWyUEwouddd/Lq6+k1Q==
X-Received: by 2002:a05:600c:848d:b0:43c:f969:13c0 with SMTP id 5b1f17b1804b1-43ecfa1874emr139943075e9.29.1744105945053;
        Tue, 08 Apr 2025 02:52:25 -0700 (PDT)
Received: from localhost.localdomain (93-34-88-225.ip49.fastwebnet.it. [93.34.88.225])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39c3020dacfsm14493310f8f.72.2025.04.08.02.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 02:52:24 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@airoha.com
Subject: [net-next PATCH v14 09/16] net: mdio: regmap: add OF support
Date: Tue,  8 Apr 2025 11:51:16 +0200
Message-ID: <20250408095139.51659-10-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250408095139.51659-1-ansuelsmth@gmail.com>
References: <20250408095139.51659-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_025226_664298_AE9B8679 
X-CRM114-Status: GOOD (  15.81  )
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

Permit to pass a device tree node to mdio regmap config and use
the OF variant of mdiobus_register.

This is done to autoprobe PHY defined in device tree as the current
mdiobus_register only permits probing PHY using the MDIO mask value.

Previous implementation is not changed as of_mdiobus_register fallback
to mdiobus_register if the passed device tree pointer is NULL.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/mdio/mdio-regmap.c   | 2 +-
 include/linux/mdio/mdio-regmap.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/mdio/mdio-regmap.c b/drivers/net/mdio/mdio-regmap.c
index ed0443eb039f..8e89068c844d 100644
--- a/drivers/net/mdio/mdio-regmap.c
+++ b/drivers/net/mdio/mdio-regmap.c
@@ -143,7 +143,7 @@ struct mii_bus *devm_mdio_regmap_register(struct device *dev,
 	else
 		mii->phy_mask = ~0;
 
-	rc = devm_mdiobus_register(dev, mii);
+	rc = devm_of_mdiobus_register(dev, mii, config->np);
 	if (rc) {
 		dev_err(config->parent, "Cannot register MDIO bus![%s] (%d)\n", mii->id, rc);
 		return ERR_PTR(rc);
diff --git a/include/linux/mdio/mdio-regmap.h b/include/linux/mdio/mdio-regmap.h
index bb0e7dc9c0dc..228f12e90750 100644
--- a/include/linux/mdio/mdio-regmap.h
+++ b/include/linux/mdio/mdio-regmap.h
@@ -14,6 +14,7 @@ struct regmap;
 
 struct mdio_regmap_config {
 	struct device *parent;
+	struct device_node *np;
 	struct regmap *regmap;
 	char name[MII_BUS_ID_SIZE];
 	u8 valid_addr;
-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A66C83F27
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Jul 2025 13:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=; b=uf9qOA3CFnYX95auUYBYyK3/ZN
	wif5e5CSX/iWaOTbLiIRWTrXh8QA7bk4ZoCzwc6+PIpv+V0YwbMk8YJyCdOeh9nJMUX3NzPIuadT4
	NqbildtERsMjxqMtzQwZVvtiy4Twg2heGUaRYhStFUKL/pyvfO/+DUNBDht7B3dDosHVTaLA5PVRt
	t4sGL+/ZxWdaygQMKpeY4JIaU9b5ukWVzS4q0gGZg6aUgzHZQ37S0Dc1GG7f0rbrk2dBJKsp7ljZh
	DWuqSupVex1j1q6bAVfiyLBKnfl76HQjrgHvu6INuj8VYgfz9MXtXVG2/wkJ2u/BahvuH+ze1dvqv
	a7/RwxHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud7OO-0000000EI5c-0PGM;
	Sat, 19 Jul 2025 13:14:20 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud77H-0000000EGWG-3qhM;
	Sat, 19 Jul 2025 12:56:40 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3a575a988f9so1723889f8f.0;
        Sat, 19 Jul 2025 05:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752929798; x=1753534598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=;
        b=SgT3ELf954zDOrWi7Bf+Wi1fQ6aCKlkxjF4v3P9H2CQYVJBA+HfMNUrOn8HGHwBJkK
         j+MoMA57cQSKCsAJE2TdKcdUn1NMVlZEFOpS6FFyalIzK4GMv4GTmpA7QPx3aRbiuEqk
         4WPFm7tDl628aYQe1B68rFzDrIWgJSz357+7MVNvzRnWzU/Cat11aUoCz2DlUC3AEmdp
         cmwSPi7gcWw4stog+D9UrYIz9t9M10f/UQ/6henCvhQ5oZgvPA+u6t12iiCt2rO3kigX
         DqNsJHpzRMOTw62olJ9wxAGSmM+EWj2w7ylm7ooF8e3S0+SB40mkXICpVkDDAi0arBqv
         br3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752929798; x=1753534598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flp2kuB43upoDmZKHtPKy1TYQrSu+LhhKaLm1sYr4pw=;
        b=WU9lFcZ+SHudE6eFVSM9bidHDO2mwK4w6AQAzOqZsvYC06d3WHRouWsxxsK9J9CHUB
         50eD4x4zx54/NaFNaqGx9cTNZ1cX64/Po+UtpqpXxxLKfOsDgnzft6xvtD8VmDzzcq18
         4H4MgYxFM2XroLkZY0/LYcpOnUGudEkAlp8IBXeqO2ECNE3JXISBTVb6HeWptOTJ1/jp
         2YpXC9ORWPyv+4QByygCj+5NVjFVUnRnrrnUGJFfY8PnjsSgaE/ySvur39fovOoodaEm
         eH2Z/OzmwsKcdi9e68CDv+1w9bM3zJLb9linrMh7bUXTMZR8KUdliVhZ+mDnC2dHKRqh
         mmwg==
X-Forwarded-Encrypted: i=1; AJvYcCUsDdJg3qxpGVyzBG8TP4KnQ2RF3L7rkFjFMaaB9yrvZbQh7n6uVdUJd+ZPTi5JLH5mqSU2KJ+Iizx3y/XT2iDP@lists.infradead.org, AJvYcCXMPgxxnhr8FL75icVzr3s+4FFkvR05fiEW3n7CUkRPpR1CIzeN/fpr/3KmcQDl6U4NMwSDVlw407DX47CJf+0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAI9W61SsQuhPKsmLGzjAfUx9TNQvw/789fR7CCPxOSx/7YlAr
	GmXksY4Zh3HOGrYgu6n0quYwap7yt+OrYx/j5pVQ5W6YLPK6fRmBI1kCwI4Vrw==
X-Gm-Gg: ASbGncsfMVKcnRx5DhnJ8mtTpnrVq/YBVha/8StkRBuMmrADvNNR4y1joVdNXKjaQJk
	uc05z/JyRukWbn9dcO9PaT8MiJiD71m3nbxt5mt3+A9T25Vu0e2B2QPuGyqlI0dE/8LEbepbim1
	3E7l8f8h9ekS1/9Iu8DSYDp6U8NTGe+73TzJetGrz+3i06+f8W6+N6vSJnugVTRR4BjFmsalIbF
	uyO8jYlYkgQeoiX2qoE+d3cVi9gI/wjrM5sKLuzmDFoM689fTviyXz+qwTwtFdgLQqp2GwUi/QJ
	yf+EIhYU8ctWkXwueXx8TyxiNv4iN6sW5RUWgH/nz/W2Rz/3cRDIWbM3nNoXqUcDOLQnTjuBnf9
	6MdFAcZQQU5Nez4p6rd7uz6/s6fRCgANsPn/5NtCNoA8rG/EMVOySQZ0ToL0pt7KzThhpgoIIr4
	U+
X-Google-Smtp-Source: AGHT+IE4JOLUnKqTG+RRT3va8EmyFFWbs2GSaAaRZYzN4jRFgloh4aLC71f8N6Pli1m8JiHLL5dIBg==
X-Received: by 2002:a5d:64cd:0:b0:3a4:f7e6:284b with SMTP id ffacd0b85a97d-3b61b0ec05bmr5500785f8f.10.1752929798033;
        Sat, 19 Jul 2025 05:56:38 -0700 (PDT)
Received: from Ansuel-XPS24 (host-212-171-170-230.retail.telecomitalia.it. [212.171.170.230])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4562e81ccb4sm106688005e9.17.2025.07.19.05.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:56:37 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stefan Roese <sr@denx.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 5/5] i2c: mt7621: make device reset optional
Date: Sat, 19 Jul 2025 14:56:15 +0200
Message-ID: <20250719125617.8886-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250719125617.8886-1-ansuelsmth@gmail.com>
References: <20250719125617.8886-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_055639_954132_39066C3D 
X-CRM114-Status: GOOD (  11.93  )
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

Airoha SoC that makes use of the same Mediatek I2C driver/logic doesn't
have reset line for I2C so use optional device_reset variant.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/i2c/busses/i2c-mt7621.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index b4dc1fb269a6..6e3848f163f0 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -91,7 +91,7 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	u32 reg;
 	int ret;
 
-	ret = device_reset(i2c->adap.dev.parent);
+	ret = device_reset_optional(i2c->adap.dev.parent);
 	if (ret)
 		dev_err(i2c->dev, "I2C reset failed!\n");
 
-- 
2.50.0



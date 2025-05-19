Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA60AC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PvrmvTBRC7+gKdP2WldTaX5PIzdSfeV89pU408M+ad8=; b=jJkhrAJlgMWdCV1K3SbQcXUT+H
	RQVD5NfjC5TdOPDgWPhQh5vCsqiw1EVFMzHKGEPmVT0oxbks4EyOXkUf5pk9H0Y2MqQZVHCGoqKSc
	6OPlg2bwfnfrBujZze5nSvW/er6U6WCw4Ox4igPgIIBzHF5oLz5ENpCqLmK6O8nn8AyQFNsnRrBbL
	IHyP6O1p4WITXexLF6sZnuE7PhvsHa3U8TN7MRhNBxWNHMKMGtlHuD9AGbx15FKZ7XiMhqu6b5enm
	DLES/md+RWP5N6S2XMOnLn2Sci0PXzidsVUlb0bRRfpP1+CnDfYnZ4h0YS7olwEp5ngxnaKQ/Omzn
	78MjkvDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4S9-00000009zFK-3mAa;
	Mon, 19 May 2025 17:39:05 +0000
Received: from mail-vs1-xe2e.google.com ([2607:f8b0:4864:20::e2e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3ks-00000009sgi-3yO0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 16:54:24 +0000
Received: by mail-vs1-xe2e.google.com with SMTP id ada2fe7eead31-4e2900db5f1so452580137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747673661; x=1748278461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PvrmvTBRC7+gKdP2WldTaX5PIzdSfeV89pU408M+ad8=;
        b=RhuHiVimpmz0OSsFUOGz9ZCw9wSR6TimZc/F0jCSGCdcij6u9zI4uCCip58povqR4m
         3EM2i6GHG70JoxymdqZb+IXJXGt3eE9L/L71pN1i0qdITCe6nmHInOSKSUBTj6MKrZG+
         D0+5endx3uS9sjLGOvAYatMmzeAwh+jISL72DiByfdNNuT1qqHtJ69AgoIYeGpKM0wI6
         IhTiG0fdcQ2dfBZ5TwLz5mU67bELngDOpmLfZ6XlSx68SCvDnEJ4UBr/VFBbGoHVmKG4
         KtgryNKzy9ImEu30u2droE4srg+ARno8bkyhtjPajK9WXhgmLI9/aDvo9A3IPwpNz+X3
         cn9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747673661; x=1748278461;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PvrmvTBRC7+gKdP2WldTaX5PIzdSfeV89pU408M+ad8=;
        b=ohPon7wjTN+qUisepiuzBPUzdRUUdxKHbCnLETbGdd131vISwAXFbI5y31OIsyRhez
         PAiLfZxt6w9SGytgX3oRoQhbmK+EXIlBr6xchsiInqnZHtfHAkj1JcbhFjrottVQ+8v3
         k95cA6xw8fpVeqbBtznOaoGgfzY9sETzZhsUmjuEji4ula8V46iR2O+O8A6bT3AiMiOa
         whP6CTDr8geLLw56TgcQ5eE6zkwYSuZPB1IPwnZZeJaerdf2hDI9WqdAw3VjMSYBEa42
         iagtVdXzzku4xSRiRqb2IE9pPQsbByj0YdMynZLAk32Ej4i8+mMJAWFKWVsaaEZEUR00
         DOwA==
X-Forwarded-Encrypted: i=1; AJvYcCWTDoVO/4S+nZgE9xEMunH7hojWfiDGvPeeQ5fHenLwOTd4oDrteSsgasgUj5bEUAFIJW7uoJ61Dzgpv+A0pSf5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw01dbwIgiOHfGFD2P3w89oacb3ZKXGaU3dFRVlvtO9rN0ZVa7u
	q2pAT5HzILf/yctv9MP0+xSojXqcBXBb09SfKB+G7Wv3O8TmfmOKJWyC
X-Gm-Gg: ASbGncujyjXtum38rU+dW1PLLPWtnpk3MKAPkMNJ390NfoNgvYkl5geO0m6YbTNyAvw
	bwaEGUYuX7cYGufV/ZYmELtbL8SjVnnI629woVQR5ffW5QedIjuehhtizNE74zW0ZHmpbVrbLH2
	G46FTX5eBedm9iTzqBIWMAnehHVyE/Vp2sRkIPvagy1Qb9GPgo6+w59EUnsmX6Ai9gVWO8GmcvQ
	ZCbFGZjmC3Rjb+lKeBrZZjkXTJhuMYjRjE9/jqrN2lEEU998bJeGaKmKmIvxSPgqj18cbPrKvpx
	+OTDsnMEwZmKjyIBu0QSaCg1fiR5nZJRH4bVlCmTx68r10gfDMKLQRomZq3Im9lN6w==
X-Google-Smtp-Source: AGHT+IGsGGCwR14ysp3X7Q4/R75dAsctNzgUJHfstdrWpquusQuxBnEWddVcnV/eJhwMQi66e3mGbg==
X-Received: by 2002:a05:6102:1517:b0:4c2:d9d3:2aae with SMTP id ada2fe7eead31-4e053c6091bmr11919316137.21.1747673661134;
        Mon, 19 May 2025 09:54:21 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:276e:c8c9:6d13:9b45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4dfa687ed41sm6671528137.25.2025.05.19.09.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:54:20 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: nicolas.ferre@microchip.com
Cc: alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] ARM: dts: at91-sama5d27_wlsom1: Improve the Wifi compatible
Date: Mon, 19 May 2025 13:53:51 -0300
Message-Id: <20250519165352.1314199-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_095422_985486_7C0A5331 
X-CRM114-Status: GOOD (  12.47  )
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

From: Fabio Estevam <festevam@denx.de>

The at91-sama5d27_wlsom1 SoM has a WIL3000 Wifi SDIO device populated.

Improve the description of the Wifi compatible string by passing the
more specific "microchip,wilc3000" string. 

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
index ef11606a82b3..e35dd79beb16 100644
--- a/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
+++ b/arch/arm/boot/dts/microchip/at91-sama5d27_wlsom1.dtsi
@@ -385,7 +385,7 @@ &sdmmc1 {
 
 	wilc: wifi@0 {
 		reg = <0>;
-		compatible = "microchip,wilc1000";
+		compatible = "microchip,wilc3000", "microchip,wilc1000";
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_wilc_default>;
 		clocks = <&pmc PMC_TYPE_SYSTEM 9>;
-- 
2.34.1



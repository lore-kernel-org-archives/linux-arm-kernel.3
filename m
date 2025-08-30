Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD0ECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 21:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rY/JPOchmMvWF/419gMe9g7EplINNEPxkeuggdXANUs=; b=bxqcvzPDDXsVWTAIjQ0hFoHjM7
	dab3nrMmDzdnZdlmpjhIS7DfIiJWxdvzge5k4DTPWIqOg0qSwn8V2pBgzwH0nm9mHFL8FcFvg5LiO
	qNG6FSwLTbsmCnjY8mbSn8Pea+hOz7Sa/Nz4KZF2i4t+ukducqTzDGbIcw3V+5EmCuwg7qxkZkuU4
	nUD+j7+evrq8CaguPlwKYRRhHt/ykiS4yem6DDPVhZVlEW58mmSdyFNk/Zlk1UaQQVlQaqlrHTxNi
	dOlLA2cBlJzqXVRPkr3uD4DUU3QnbW1nhLNIz01Vi+KiSKY97bm5SSkVVDbFU8ugqinParAPgo3Fy
	QeNN/irg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTOG-00000008Suh-19gS;
	Sat, 30 Aug 2025 21:45:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usTL2-00000008Shy-1Q4O
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 21:42:21 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-248de53d12dso18695185ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756590139; x=1757194939; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rY/JPOchmMvWF/419gMe9g7EplINNEPxkeuggdXANUs=;
        b=m3dx3wVtTv+iuHPxd4232mQRvbY7741obKQ/e6wmLKRwTrrLwEPD1MJ7pMk6iml1ju
         MQWGq9PzeUpqcJlxCHvgD/pMyu8cLDls+Kl1fwSb1QzHwNg/daXact20n2zqaF+xUcWS
         fG+Xycy5vrMAL6okY28wgNLa8bI51/ggaHaQfPdjM7WbMAuE/D5wzLVxrnAZCqq+UTWh
         yOQTGufFJwnM3xNP1ksPAJ83sAIy6maj08ZSn0IHBsEsRqnuKCSdMr+j02T38ylJOOPO
         Pcf+NdiWJBOXjw3gaIvjtx1E7vBBdfmaNLIdZ1zXODYQsHGXPVEMFhoV7Lekyt77lcT8
         La+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756590139; x=1757194939;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rY/JPOchmMvWF/419gMe9g7EplINNEPxkeuggdXANUs=;
        b=th3xohTvp1c+bzEu4DCavTfrGV10OCc1I0KfQwT+rlA2kQCu0yk8V4J0A+ByX/TFgc
         0RNuVafRwpnTKfvQmlzWkIMLdmx3OoWIBVXYQMepEdqYixVdjU655SWLHhBv+CmRazkg
         kTL+dBu3dAZAFDGuUfZeFEK6nHbnH6ZO9CSFzmw9zjMof88SkRA1fcMZMFfRbDUhkV1t
         z/P6ksZ+69sXqYN5eSRzcDuNGwxUGFUYps6JvXeuAQeY91SRuSmlaPNBSEYm0eI77DXI
         oJBud2D8hWm143h3A+PRQxOfb0rJqXUFjon3GkxCzADpg7GdQJBINRk580r7YcNsuF/J
         AUJw==
X-Forwarded-Encrypted: i=1; AJvYcCV1/Yq5DB2V6JVVm1gn4PHQBs7OPnPSe1CMLl0ISeo69Uort1IC1QxvfDlqKm4xaZ58lvy52s33dAumZRaOX2Uc@lists.infradead.org
X-Gm-Message-State: AOJu0YzGHIqVD2Y+3z5j+3QuRW3rGVJ8+VWxjesJzAfrex/I3U1VZKSV
	E6xH4AfC0y8dkzMYliXQucl0SN39kor1l5KDM7zyK+rKKtmxPoJsltWF
X-Gm-Gg: ASbGnctRPinWHwW5yFQ/tU63eAyYoovmWO17w3DVKBEkz1DwsaVN38kiOdLgPpdKtOh
	eHnUPXzZGMdaQXO2SI1yKUlTyU9r4i3DoVRajh90fGRYV7R77cj2heMD4VSDXh50WfhcuaxMq92
	LFXtpfFDUBvXcBVyChGPmOMRM4XFJNYbycnEKvokp3Ep5ZSDbWb9ZsxmKx4TSYb+kh3kkyE+nc8
	x9tsRjotIEKGiT3+CdBD7xSjEk/wF43SUhh4/J9nNv507qw/zIxvjDDcww4hsgGJ6d5I6M77ivP
	F4JoT7xXEtiCcWB06LGP7i3Vfp7xQ2X5V9FRYRMB3bPVmqtCkdOP8EdDVxIqpzutBcwZwQfLn7D
	iPEpRrsay9ZbJMbm4Et2fKm2ucwx5WL5ZXnuBN0P8UH4y5jd9JiFmLBlDtycM5Mtpug==
X-Google-Smtp-Source: AGHT+IHYPQqDFERxJIFwA2J1mhv1++eW9+/JHW6fdC9Qqbwf7Tr3rlueFCxnKmqLcI/MrNfBQSmW/w==
X-Received: by 2002:a17:902:e751:b0:248:a054:e1c4 with SMTP id d9443c01a7336-249448f8ad8mr39874385ad.23.1756590139262;
        Sat, 30 Aug 2025 14:42:19 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:acc7::1f6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24903758b89sm60807735ad.59.2025.08.30.14.42.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Aug 2025 14:42:18 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: netdev@vger.kernel.org
Cc: Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/CAVIUM THUNDER NETWORK DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] net: thunder_bgx: use OF loop instead of fwnode
Date: Sat, 30 Aug 2025 14:42:17 -0700
Message-ID: <20250830214217.74801-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_144220_377551_DF08854E 
X-CRM114-Status: GOOD (  14.95  )
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

The loop ends up converting fwnode to device_node anyway.

While at it, handle return value of of_get_mac_address in case of NVMEM.

Simplify while loop iteration.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../net/ethernet/cavium/thunder/thunder_bgx.c | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 21495b5dce25..eb5525c1482e 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1468,27 +1468,23 @@ static int bgx_init_acpi_phy(struct bgx *bgx)
 
 static int bgx_init_of_phy(struct bgx *bgx)
 {
-	struct fwnode_handle *fwn;
-	struct device_node *node = NULL;
+	struct device_node *node = bgx->pdev->dev.of_node;
+	struct device_node *child;
 	u8 lmac = 0;
 
-	device_for_each_child_node(&bgx->pdev->dev, fwn) {
+	for_each_child_of_node(node, child) {
 		struct phy_device *pd;
 		struct device_node *phy_np;
+		int err;
 
-		/* Should always be an OF node.  But if it is not, we
-		 * cannot handle it, so exit the loop.
-		 */
-		node = to_of_node(fwn);
-		if (!node)
-			break;
-
-		of_get_mac_address(node, bgx->lmac[lmac].mac);
+		err = of_get_mac_address(child, bgx->lmac[lmac].mac);
+		if (err == -EPROBE_DEFER)
+			goto defer;
 
 		SET_NETDEV_DEV(bgx->lmac[lmac].netdev, &bgx->pdev->dev);
 		bgx->lmac[lmac].lmacid = lmac;
 
-		phy_np = of_parse_phandle(node, "phy-handle", 0);
+		phy_np = of_parse_phandle(child, "phy-handle", 0);
 		/* If there is no phy or defective firmware presents
 		 * this cortina phy, for which there is no driver
 		 * support, ignore it.
@@ -1504,7 +1500,7 @@ static int bgx_init_of_phy(struct bgx *bgx)
 
 		lmac++;
 		if (lmac == bgx->max_lmac) {
-			of_node_put(node);
+			of_node_put(child);
 			break;
 		}
 	}
@@ -1514,14 +1510,13 @@ static int bgx_init_of_phy(struct bgx *bgx)
 	/* We are bailing out, try not to leak device reference counts
 	 * for phy devices we may have already found.
 	 */
-	while (lmac) {
+	while (lmac--) {
 		if (bgx->lmac[lmac].phydev) {
 			put_device(&bgx->lmac[lmac].phydev->mdio.dev);
 			bgx->lmac[lmac].phydev = NULL;
 		}
-		lmac--;
 	}
-	of_node_put(node);
+	of_node_put(child);
 	return -EPROBE_DEFER;
 }
 
-- 
2.51.0



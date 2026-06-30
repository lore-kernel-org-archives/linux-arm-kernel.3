Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD743C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 01:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZMntIY/oIRlFlSwXUFg7FvdarFRfsXqKfjADcyhhzcM=; b=IAGxRiREUqT10DX9Fg46og9ygB
	veH8cCBHwBS47De6kif12rn/idByasG+DSKF0HLAn5aP4Cb7zifwn4m4QiQYuIEKpnJ3bnyDAEVLa
	Oe8rDy1gGJ2TXTPJfRkBnpeyCtiCBTbyn+Cj/5V6tRftZrC0drHP+aRjJ9WUPJ6M+cVOuS7OGTVck
	jS+xwkBiGUlCmUzZ2cTMHi0iU9iBllZxthP2mFp7gD/P0jfTGc2rvYFHJNptxC7L4rVm+5sXTlIT4
	5x5XI51VkRL4qL1M0DcrN9Y39UCnQHjj+kH9CoOc5NVqkCi/gJ1V6u4JRD3NgE5Cwl7+JWxKukqGG
	9hff32pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNCM-0000000FeqD-1z4L;
	Tue, 30 Jun 2026 01:23:38 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weNCK-0000000FepO-0QoW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 01:23:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9f44ddf26so6869905ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 18:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782782615; x=1783387415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZMntIY/oIRlFlSwXUFg7FvdarFRfsXqKfjADcyhhzcM=;
        b=rwVMHIjaJmJ8P88hS1Qg85bF0YrB631+H2HJdJaePYdhcKRREmZ1Swj6nAQOhV+R59
         GS2izM5CPscHd9fuFACrjSKaYy84jaluLM8P7ZypchZVCBeYbTVFrztozpheMu8Hbq71
         qPwt+vuqzRGrnvpi0t44Zcsw2aJOmBAT823GFtvd2F31vnjSqhQvZiFrmnT//f36binl
         1uySiBEUwUk6R5ObQ90eT3+IFT0gx4mwyKNGvL50obP1C3az92ItbJvE4ZZUegUrpcyo
         Xj3AUtJdvfSKv+6YFYR+fDbMHXf5IYcqYiI7v4dJ4leTBTqPkAO0hse8N+mPnvbAOd+N
         j18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782782615; x=1783387415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMntIY/oIRlFlSwXUFg7FvdarFRfsXqKfjADcyhhzcM=;
        b=kta63JIr1KOgBBopA3kyyMCTMCoV2JyTzc3eoSlDnjrwewQffi/5ijxX6/6hOKXR7b
         vTpeuYikkByQrrOhgjR6CEE5MjCIoXvY1xaGf7RBOgH98teBaKQfB28OfU1xYbmGs4ge
         75LyScEkf0pQ48dDY/fC8IvFXA72eh6Mk5GyjAw82DU1GnZh5UmPk0IFQu9vC/sAKftm
         3h2oVwWSMF0Qo3xIXc+ZlL9T3lbmc13dUyOUnhGoCpA8EcLaWRk2pKe0K4ICI/LCRWo5
         P3KgoIyhi6z3l3puENawLLuAAj94Ese/3ysPG7yG5ip/sRtDDNMjWW5yqs1bEqx28qAa
         MEJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpQMpmAJPWzO7FSPTIxGz2TkNIoAwUPDa2TwfJBfnS2PL8GAbXYpHW5I3d8R5WjuiAIvBT9q35aclTqejnmp7wz@lists.infradead.org
X-Gm-Message-State: AOJu0YzkI3zbg1nDLikVGkWj+Js1HNUcI/CU0ZWcTrhGFj1FupxEG355
	lHEchRGicmyW6XOO7MeTyHz/k1hj2ZAHJ1VNteEXwOTHEMdODKWEJm4M
X-Gm-Gg: AfdE7cmTJU32yeL8rHU/VgzsjXL69vzdDZUp7/8R0lZdcAZUF7638o5fllKsNNpVSdS
	zFFzGknUTUglZk9AI2Msl/idlvpQZMWmW//bJynNp6e+J9K6OEsg9MiuT2+ZNWa7BzuzPkGYUTj
	wdeHKrPNoemGHZT+oZVG3edNqIHX645bCxWcTRl8v2A/Wog5YQ+i3jynhMKvNNd/2IYSVIOf39b
	Ep3jIEQLKidU7uUZHaDF0e/tQ2vL4KUbiTRpGLrTBeEIpwiQ0zOx3NkX5XE2uJJx6YSkcgJzy5j
	3aUK1Y/kY/hV/skEzZ9bC8lwKtjZiRKhL3wkr+Dgzt7cUdFIk5eiFH7gaRgBaDL8yLrm/4tlzL2
	rXwSCiOx/hhQJ24h69tN/wImgC7cOKJJAqsmwy+Z9zo+chnxD2pq/WaS29LgLbn4hfVCUTrt2Js
	gYNeOczcSehJg1mC4s01rgl3xe3zCLAeKN19nHHlaC8otNWmvRq+ABbAJn6mklMok66poH2xplb
	L5ppvWPpAqYVegTUnQz
X-Received: by 2002:a17:902:dac5:b0:2c9:d8c6:1dc3 with SMTP id d9443c01a7336-2ca2d3eb9b1mr11411705ad.0.1782782614641;
        Mon, 29 Jun 2026 18:23:34 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382c5c48sm2440165ad.78.2026.06.29.18.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 18:23:33 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Microchip (AT91) SoC support),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] mtd: rawnand: atmel: use struct_size
Date: Mon, 29 Jun 2026 18:23:32 -0700
Message-ID: <20260630012332.1471829-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_182336_143802_F2804E69 
X-CRM114-Status: GOOD (  11.05  )
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

The comment above makes it clear that this is a single element for
legacy handling. Clarify that with struct_size and avoid manual pointer
math.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/mtd/nand/raw/atmel/nand-controller.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
index e7fdf532c5fe..8a19408abb63 100644
--- a/drivers/mtd/nand/raw/atmel/nand-controller.c
+++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
@@ -1799,8 +1799,7 @@ atmel_nand_controller_legacy_add_nands(struct atmel_nand_controller *nc)
 	 * Legacy bindings only allow connecting a single NAND with a unique CS
 	 * line to the controller.
 	 */
-	nand = devm_kzalloc(nc->dev, sizeof(*nand) + sizeof(*nand->cs),
-			    GFP_KERNEL);
+	nand = devm_kzalloc(nc->dev, struct_size(nand, cs, 1), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
-- 
2.54.0



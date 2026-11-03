Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED1F6606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 21:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hSISnEtm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aN9dMpw/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=; b=hSISnEtmCjyYdn
	mfJbGLcuM/2EbUhZZNoft9HgHkOLbOKaYq7TfvuYd5MebBoP5PgbwguELKL/ZMNRlMexYXghXUHPe
	A427GDcCx9cMb5TBNJivTxQsgBHsE7WEQy7IJ0CN3TUorQRvY39DutLR3fNbVm7gs/E9yZn8xUYKB
	is3IXP4n5xC6xWAzEfzMY17606rQwcCW2bNxONnhoGqkvphM3CYf54vVW6ktWq9H/5Bx+/2ChV4KS
	slLwUoSaelXgF3eP2e3y7WaGQrLmGL5x+LmvEJ73eddzcXiMm6uaajxfJRVTHsKzEzXw/2dcScRkY
	7dZYqCYLwIVvykJ6wYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLhj-00000003f5Y-14lf;
	Tue, 03 Nov 2026 21:06:03 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOLhe-00000003f2b-1DsD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 21:05:59 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48e0d1c095dso13481f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 13:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793739956; x=1794344756; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=aN9dMpw/SnFk7Eu4cY7cXh/zg40JuF1BparjpUdBcsJdqHU63ZsLge/8roHjrj2ZSK
         uwHPSa9b0+g2uUijskOta6LXkt3wZIRUGiIfRbOZABVZ2eSGcy7w9MpDKySwzmMstpd9
         8Ki+CzdcVaYewHsj14I75QRgcMyGY8HEfS7nxKKHU+xPbYkAKd6HFnj8r6PYyCdGLCOY
         xhoYCUnuKlxGWWxVqKxT1yvrCBQRrIco7a2YfoLltg9HCPZUQQ5z/hgEIgZaGvpcJWFl
         GhfE4kbNimYrlUoczlqkDvNkVziQwuIfR/qzHq7bVMNp/x8TpObOVSSK23NkrVbBDs1d
         nufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793739956; x=1794344756;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=Qqw95dwYttUOzxNZHs5Z/u5wbtaiVUqgvK23KV1gzQVSZRskbXgVA+5xD5PbDvKrEU
         xv9LMFm40+b+GPEdaESILUgAzU0RMqA5goeCOjlSyD3P2JqVAsgBHrOccD61t2GpvWtQ
         eHGSnnnjpnBDH9IXPlhJZcl1ZkPiF0vFNZUAf6NAl1ThZoCNZrD1AUDBIa0yNxaZtqB9
         o6o13Cyyw1FTBUGxNxxtbqaWQeF2r6E+a3HUQ16+o2YdO6MFymXy8/Q4rJfbYTYo0E2y
         9psPjQ6WaaIOmvGIbtT+mG9yzVhUeh7h8wDOkpc04UiOYCppRiKZAtapM1u1pF5Dy4kO
         w0yQ==
X-Forwarded-Encrypted: i=1; AKwUvBwIW8oVu7UhJrcPbCILeRTUL9R2E04MYZzTsjHaknrXbCXfgfoI0PZsEB/4KvouVdM7N+ReTXVlzsCcK8ijU1Yt@lists.infradead.org
X-Gm-Message-State: APuU4Z8JsjXmJBG7Ol+uBq7IaPGnwWEjZCZgFukSFW4/I7HTUBl1gUHy
	4+MOGrYapV8aEnFwA/FtGodBVGSIqYPGslEfXEbjzcWRjsu1WpTHsjWM
X-Gm-Gg: AYBFou0DseX/QfkNceYf1b1TkqKY9rE45jiEY/XenS+abUHLicJG37wuTY+FvNGG80J
	EtkRj29uprybTcyVUErOc+2HLvpOW/A5AV+T52P3oomWFlZ11n9lrShBwjtRDwS8WuWApW/XR8E
	6whK8qTLoQG0zYqYalqMdyvjYyVT7vJ1O0CJgyvy/8Q9mS48y2II4slccJgnKfVe5YBdAJOVCaz
	F1dppzUooinOELKI6zM/YjVBGx+Vkrq9qe2KagKBLryY/4qTPlRYuKtRZsRWfxwl78K6YKBIeLm
	NHtYX8R4YNLI8adhxeKENA48eWJkLue1iyi/lT4NIZB4icWhmP6JDD4wQ71fhgERfx1NujvVT1z
	VXjMMvjcTuLtnA2yHmN0BQ/ZLk80M8dFLxgaUh9h7GEGafJWnMBY1vihKz/WPQLfrVB3GwfjxZi
	r0RRW0GT9XMT5SXv4GnUqe389fg/tM330p660E1UFa36a8KPl7VnwEp34Tpx1A2Q4Ux4y4SCRN1
	kJ1OXp1QX0kQ1a6cKWfyoadwgsuXMngh5XKXT5hXM0fSUTTECTOk4gp/VGe+0geL3XSWiHF5JEl
	0ActLvoKZGSekClODcd78bTaiwUoCg2dNFrYIUe0O7rX4kNAsLQRVH5Qe9uEaRJwRS8Wgdb69IF
	MILf/9wDNPl3PbGKz0E7eSVSKNTJESvzHXg==
X-Received: by 2002:a05:600c:8b2c:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ac150b3dbfmr345625415e9.4.1793739956406;
        Tue, 03 Nov 2026 13:05:56 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fed553441sm41850f8f.43.2026.11.03.13.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:05:55 -0800 (PST)
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
Subject: [PATCH v3 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Tue,  3 Nov 2026 22:05:41 +0100
Message-ID: <20261103210542.15965-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103210542.15965-1-ansuelsmth@gmail.com>
References: <20261103210542.15965-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_130558_347378_EB349002 
X-CRM114-Status: GOOD (  18.38  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The same I2C driver is also used for Airoha SoC with the only difference
that the i2c_reset should not enable SCL_STRETCH for Airoha SoC.

Introduce a new compatible for Airoha and limit the SCL_STRETCH only to
Mediatek SoC.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
Changes v2:
- Use match data for storage

 drivers/i2c/busses/i2c-mt7621.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mt7621.c b/drivers/i2c/busses/i2c-mt7621.c
index 0a288c998419..fa1f32d4f046 100644
--- a/drivers/i2c/busses/i2c-mt7621.c
+++ b/drivers/i2c/busses/i2c-mt7621.c
@@ -57,9 +57,14 @@
 /* timeout waiting for I2C devices to respond */
 #define TIMEOUT_MS		1000
 
+struct mtk_i2c_data {
+	bool have_scl_stretch;
+};
+
 struct mtk_i2c {
 	void __iomem *base;
 	struct device *dev;
+	const struct mtk_i2c_data *data;
 	struct i2c_adapter adap;
 	u32 bus_freq;
 	u32 clk_div;
@@ -83,6 +88,7 @@ static int mtk_i2c_wait_idle(struct mtk_i2c *i2c)
 
 static void mtk_i2c_reset(struct mtk_i2c *i2c)
 {
+	u32 reg;
 	int ret;
 
 	ret = device_reset(i2c->adap.dev.parent);
@@ -93,8 +99,11 @@ static void mtk_i2c_reset(struct mtk_i2c *i2c)
 	 * Don't set SM0CTL0_ODRAIN as its bit meaning is inverted. To
 	 * configure open-drain mode, this bit needs to be cleared.
 	 */
-	iowrite32(((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN |
-		  SM0CTL0_SCL_STRETCH, i2c->base + REG_SM0CTL0_REG);
+	reg = ((i2c->clk_div << 16) & SM0CTL0_CLK_DIV_MASK) | SM0CTL0_EN;
+	if (i2c->data->have_scl_stretch)
+		reg |= SM0CTL0_SCL_STRETCH;
+
+	iowrite32(reg, i2c->base + REG_SM0CTL0_REG);
 	iowrite32(0, i2c->base + REG_SM0CFG2_REG);
 }
 
@@ -247,8 +256,17 @@ static const struct i2c_algorithm mtk_i2c_algo = {
 	.functionality = mtk_i2c_func,
 };
 
+static const struct mtk_i2c_data i2c_mt7621_data = {
+	.have_scl_stretch = true,
+};
+
+static const struct mtk_i2c_data i2c_an7581_data = {
+	.have_scl_stretch = false,
+};
+
 static const struct of_device_id i2c_mtk_dt_ids[] = {
-	{ .compatible = "mediatek,mt7621-i2c" },
+	{ .compatible = "mediatek,mt7621-i2c", .data = &i2c_mt7621_data },
+	{ .compatible = "airoha,an7581-i2c", .data = &i2c_an7581_data },
 	{ /* sentinel */ }
 };
 
@@ -286,6 +304,7 @@ static int mtk_i2c_probe(struct platform_device *pdev)
 	}
 
 	i2c->dev = &pdev->dev;
+	i2c->data = device_get_match_data(&pdev->dev);
 
 	if (of_property_read_u32(pdev->dev.of_node, "clock-frequency",
 				 &i2c->bus_freq))
-- 
2.55.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7273606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Oct 2026 10:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O3pGeTb2;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TJnjp1H5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=; b=O3pGeTb2bkEnpo
	t4Fn8QU0OgoWLCjqfPdl1OpE1VGhuL/mYReL/zHEduUZKRnGGEOJT9/4ZmKlqKn56WgSC/Iso9PzJ
	sRefXbBrVKKCzPlP/UOF4H8aRdIfCuQsDdZHGWj+5BFIQqg1XQJ0o6gkZ258ff1nr75oPKiQY7OS7
	etiIGmnO/cu1H66snKS4Lc1qjuf9duXwao/mgRNbNClpKUvIPCR9/w49jZS4untzh5sPlwZMB8BVE
	n3uzJ7zukzpn8EBzgAKnxpFrwcUHJrWuaQlmAMQYCtcPmaXvekS8HuRbnDmcpjNJeCcUSCbggWv3e
	YxA3cc/PrSTDCdDYgEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6Ie-0000000DDDN-3EZN;
	Sat, 31 Oct 2026 10:27:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xN6IV-0000000DD9M-2Xsl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Oct 2026 10:26:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a210470b49so11835955e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 31 Oct 2026 03:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793442410; x=1794047210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=TJnjp1H57YwHpMUYX9Pnbm75jZ6q+MkanVIJMWw3/20IIFsiCv1r/DXqgV2pX8UX75
         N2IVIrRjOuxjjwV+rFI2c6tS/CYyRVwCbDCRoTVYyAJ3GfaRAc9KGTGZEsOdi5oqs9LA
         ARir6AJlhm5vBxcrpJPruKhqKr5aMdGiQDN2o29WHV3pODf7G6yBPNrYxFhoz+FpG3+y
         kO+QcCJc25Yt26bzGnepGKQms24yXJz3z1Lws7gDMPs6Pq87cMqFsTk/mbsrO/upPOBP
         he/x50r3pHW+WmShJ1z284TSDpl48AHIjwVDSVg++xljhtk8u/NPt0S705F7a2SZyljf
         iKOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793442410; x=1794047210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QI5qU1trTwZm0S8t5gCAWIJ9CPL9O0gAUfA8IjPCltU=;
        b=NCTf5gLqGUtB0+5tvCG6LapbXXhIuSQTLSlJG+y2k59kPZTcUMCcOZQV3CfWdbTKho
         vjg/zg+Fw+Znw/1Do4ZU1YvPfilFfUVv+Bpbl4pXwTifD2l70pKXCmnLc7eAoXsYHvpZ
         IuSwE1hMBBYSDCt+np5IJmlRnpe7p4OJ6v8FGuGn0GUuK9PuB6AhYWwXkwoInkQQtLYn
         70YEcs2Kc94GOHncKGPJ/DrGDa2UqksqbvcVbjp9V/TZWq8rPzcz4iI7UpgVkjGnA6CH
         H8Xhx8eKo8tHHDZnybmG9Dem7kzPIaxbjMwGWVUmv6VW8hac6TglW56oqTMP25CREeGT
         +CvA==
X-Forwarded-Encrypted: i=1; AKwUvByqB2AWQdFhtojOCj5hPx0Vw6s+oeCNT5iJtkyFR7PD2k2823ihTU/YVevrai43RxCLzhU1NZ6rW6x18G3TX5nm@lists.infradead.org
X-Gm-Message-State: AFq9FYK5r1VLKW6Tg1WFQpe2b3S3R7zcQ9/UuylS8hB4aR9fleYNCJtN
	x3JR4tUttS+Pln1kJhvMwyp8ccvEDt4vmpKj1cobdgSgMFTONYZOkE0c
X-Gm-Gg: AYBFou22CiX7KtTZYTRHozOJ5ZeVIViRFmRUUIMyVvyGGMZ3iR6I3MKfilza1aMXDxA
	Cqg9JwuKTFdYPyOhTwf5MQ5eMNZve3nH9GesRZ47jWpOOOW1XFEvg7MFIzdSnLu+ARpL/GEwEAZ
	bRcM/gI29yg0mGT3tEy5JltNP994M5JBp300N4pR9dopieRV9dNGVaPVxPRFZpR6WLVOcrE5sTk
	02QLrYC9xIWyE6sg0KaD2S+1JVrOPYJ3OApdL2QoI7hWZbkf4rjaTUTnIOcrI5f0aPGxf26NNCT
	/dKxH1F2pUjuIihARSreiWe7ECyNW771hftwuPcHJbJ0yS9xbcylgQ0M+jOtIpondH138LxelRw
	IQoLS7zSs6TmWarNMgAt5d1HeG1eEQbT3pGKggQZIJNBEGn8ebBcT8fo16Cn8QRmdE248rpLUVo
	/0W78KNCbgCO8g1ENGvI9vk8IXD5ZnIXRFfs/k4w2xaHew2/gnun6yfvQUwKNv61cor+ctudnEh
	GBu+KOhxdj13JYjoAwSvvRuTLD+7ILo4xSE6YIHTjp5V8t55DNpO64+pQ8neXCWRksvpgdnAHbx
	Mu0n3BnLZJ8EeTgmmczhXcx/K149lfph0Shkj6sE7Q9C4kd1RDw15ddLnWd5I9tZ3zliejC9h7a
	3uV33W0Kb95/I1w==
X-Received: by 2002:a05:600c:5246:b0:4a1:d459:db4b with SMTP id 5b1f17b1804b1-4ac1889c7bdmr110005305e9.24.1793442409529;
        Sat, 31 Oct 2026 03:26:49 -0700 (PDT)
Received: from Ansuel-XPS24 ([2a0d:3344:54ec:1210:f1b7:9ece:c6e2:5df8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4abebe33e79sm90903535e9.2.2026.10.31.03.26.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 03:26:48 -0700 (PDT)
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
Subject: [PATCH v2 2/2] i2c: mt7621: limit SCL_STRETCH only to Mediatek SoC
Date: Sat, 31 Oct 2026 11:26:40 +0100
Message-ID: <20261031102641.12649-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261031102641.12649-1-ansuelsmth@gmail.com>
References: <20261031102641.12649-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261031_032651_661057_B77BA932 
X-CRM114-Status: GOOD (  17.40  )
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



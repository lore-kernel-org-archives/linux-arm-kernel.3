Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0001606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gFg6qMG3;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=L2WgO7gM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=; b=gFg6qMG32/z/r2
	E+DjhSm8Cw9ASj0i0dTjN7QkQHVTS5ehAlRvCIl+3JrB207GksFapTbc7i6zxwUH4AtD1zbjp8i5W
	0M0FHhRxSVA4bgFHORILrq2C9R0FL3WJSx8AioNX71tyQuGXGt8IRT/KUjJ6dr0w7BGXWPzx9Hk6H
	mo3xkj4KVKGH11kvL8xHHm44EIU2IVEfyiOPanRobHoFVLwATy2eHES339sBHHoEp2P245h2eb/TL
	AgluGvbWLQ4xkVHQcUgu3XQXKFITX33zWBJns5WBKpLEqvxAtWIa8qaBtbtV4yX46En6zu8Q6uAqu
	/v0TgDchSgMKrWIyunMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKmB-00000002bNk-34vI;
	Mon, 26 Oct 2026 13:30:11 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKlx-00000002bGF-28nl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:29:59 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so13198075e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 06:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021395; x=1793626195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=;
        b=L2WgO7gMTxl7BJBlV4LG7E68WjGhWNAK34CtxM9p42n2x30Gd2ZalgEtLX10ZWNqkp
         yJ7dZK1OAUxumweC0EM8IpVkz5bHkEkoKVP4uWKHnloTo9RFPAReT2nNK0XFX5uCaZye
         E7AbKQUAYtIAS5odapEDR8sDNOGPUDw0gf08FT80U/cSjOR8EkKYUkDqIQOrihKGOGSK
         LbG4DlwonsrD3z0K9xI2erCa1Hh49oNAMgVlDAwuuHbvuiWJoB972eUGwuN/YfZdgfIf
         OZ8pRdklx2Nnu5+MxpJu6pdZZ7s7t8pzp0GSzCPSIgN9TQnWeEKqkVmdYOVEYc4351zQ
         V/oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021395; x=1793626195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BO6aaS6rcK9WalnH265ep27g6d3OOM+TLOjjpCjcQ0M=;
        b=fOY1zgFwjZaijQBpyA5FYyxWqdFPjv09s8dZzYaFkag9IJ6IciK1aZOqDh86otO5NZ
         vZ6FOR4W9ScynnLuM5NB9j3FQexfBg7mRPCisEuBGCuh2qxN0HFT0JYddTjIZtVV0qRK
         ofyovgovWcgcoa5hxyiCzMXxCR6Sil7jWxkb3qPeVyAOhTjVWmagOkfjyijVHE0NC9yV
         3ZzQHteGyPaGbX8A7beXuA7YhuC2LQcpA3E8D7a/ZG70tKDnfMIcbmtm5YQo2TYa7PuP
         J4hlAg4/F/8aZH+8v9mX8AHmrZOOU/nuCaBO6jdr+DBav5DEkDBrUKE0y5fqVpsuJhKl
         V3/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxikoTtsZxjdBwHNGnI9IXBZFwTlkE13HZUCBTfYOyefC88lffOP2kpl2B6W9yY/J3P8d7iN7yb9qPwzn50pOTV@lists.infradead.org
X-Gm-Message-State: AFq9FYI2QdBPieG/vIoOVvFJKH4KLkExAUx7CTlfAE5Rz2twgPDOWBW7
	TpcIB/Fj8yv/WzgMf7+OpLZe7fjd3xVd+hrEX1ho7Ur2+KHAnDZu1di3AnyWBkPGXns=
X-Gm-Gg: AYBFou1RE8BBFdOzUNbiMQQLSPFv2OmOFHkfm3R0Gz4b2/YqzKj43V/VJ9C1t/r8bQv
	lxX3rLyx1DlBAg81APuns93sIDPe3coGEY5SFIlLp0byTp917uuG2xfGCd/Sis1HjN5uz4Osol7
	4uWfm+DJxFyMzUiZrv3uaT3tXwm7GWMJqFBI2mBJuVDeeLdEjCL/BO94zAdndHPkxBQBkLapP0T
	A8N2A+IVa0aaQEJX8UwTKeIMpHovEw1Bk3n0l/dlSfymcOI5kgNJRTButToykM5Wne7ETXw68I3
	9RAjYFAkmx28EhoaBfGC8wBJEAD6Rtp3VFG5Xi1omLMeWAQMdiIu3FYaqY43q9hqvnIZ5q05aHK
	Bvi3I1jvEg07TqWAVBtdRcPYqcsTHlXM0Oha75diE/rlV4bsIefTMa07Tks8y41yHYkJrXmgk+b
	V9muar2c+tjZKJtgOaCTLx+ETo9EK1RplV7tKutYBaiCkdluD4dfebn3f5F+5lc/iQBNpVHEVVB
	GjNQRCP2uswmUb3bc5RBYv8kYCnfdhPfRNQieyTovqv9t4axFA27Db+/SDhC7NHQfFdAXaWRup5
	RcrioFjAX3WzvJslxMQXpmJv8BH86+X2vxEpH/9CYSh1Pou3BWkA3zpNaUrGYnDnGstfTjMO
X-Received: by 2002:a05:600c:3e10:b0:4a1:9661:14b5 with SMTP id 5b1f17b1804b1-4a35acba868mr111743135e9.29.1793021395526;
        Mon, 26 Oct 2026 06:29:55 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 26 Oct 2026 14:29:45 +0100
Subject: [PATCH 2/2] clk: meson: regmap: use the current divisor for
 read-only clocks
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-2-c8216b0fb93a@baylibre.com>
References: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
In-Reply-To: <20261026-upstream-clk-regmap-ro-divider-v1-0-c8216b0fb93a@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_062957_602312_444ABD81 
X-CRM114-Status: GOOD (  14.21  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

None of the Meson clocks using clk_regmap_divider_ro_ops set
CLK_DIVIDER_READ_ONLY. Without that flag, the shared rounding callback
can choose a new divisor even though these ops cannot program it. The
clock core may then adjust child clocks using the wrong parent rate.

Make the read-only ops always round using the current hardware divisor.
Parent rate changes remain allowed with CLK_SET_RATE_PARENT.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-regmap.c | 34 +++++++++++++++++++++-------------
 1 file changed, 21 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
index 1ed56fe63cae..002e16865109 100644
--- a/drivers/clk/meson/clk-regmap.c
+++ b/drivers/clk/meson/clk-regmap.c
@@ -120,26 +120,34 @@ static unsigned long clk_regmap_div_recalc_rate(struct clk_hw *hw,
 				   div->width);
 }
 
-static int clk_regmap_div_determine_rate(struct clk_hw *hw,
-					 struct clk_rate_request *req)
+static int clk_regmap_div_ro_determine_rate(struct clk_hw *hw,
+					    struct clk_rate_request *req)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
 	unsigned int val;
 	int ret;
 
-	/* if read only, just return current value */
-	if (div->flags & CLK_DIVIDER_READ_ONLY) {
-		ret = regmap_read(clk->map, div->offset, &val);
-		if (ret)
-			return ret;
+	ret = regmap_read(clk->map, div->offset, &val);
+	if (ret)
+		return ret;
 
-		val >>= div->shift;
-		val &= clk_div_mask(div->width);
+	val >>= div->shift;
+	val &= clk_div_mask(div->width);
 
-		return divider_ro_determine_rate(hw, req, div->table,
-						 div->width, div->flags, val);
-	}
+	return divider_ro_determine_rate(hw, req, div->table, div->width,
+					 div->flags, val);
+}
+
+static int clk_regmap_div_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct clk_regmap *clk = to_clk_regmap(hw);
+	struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
+
+	/* if read only, just return current value */
+	if (div->flags & CLK_DIVIDER_READ_ONLY)
+		return clk_regmap_div_ro_determine_rate(hw, req);
 
 	return divider_determine_rate(hw, req, div->table, div->width,
 				      div->flags);
@@ -176,7 +184,7 @@ EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, "CLK_MESON");
 const struct clk_ops clk_regmap_divider_ro_ops = {
 	.init = clk_regmap_init,
 	.recalc_rate = clk_regmap_div_recalc_rate,
-	.determine_rate = clk_regmap_div_determine_rate,
+	.determine_rate = clk_regmap_div_ro_determine_rate,
 };
 EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ro_ops, "CLK_MESON");
 

-- 
2.56.0



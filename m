Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D4BCA0FF6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 02:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c3u7x/K6tl9OG9wiIGh8KHdwHeRRIahMnviBLAU+NwA=; b=rVLe/o2UmyjP9Rlk1M2yWfbNlr
	2cMdeZAqCdEGNOcFXzwGVwLeNL9WaI/7Lu6PVG41h3wkkLP7b4LLjJmAyc6aiU7r6Zi7xQf1olGTW
	ifatpkHfb3f08VMj6O/yN1zORGK0D1C2fNlpgzHI2V+upCQUWgWGTFqoyhYKz/DqvoNaFYAqP9aHw
	m9StWS8aoIIONxPo9rZijLRJjGrbJgmmiyWK56YrzbqExqFIV6Qgv+lcheJmHtrZ/pnM9/b2bTrIQ
	JmrophUaMcJvUgaYT/H8hncPf/m2APbf8reteCRekIC2K7878z8bTcz0wlAucnBQM/Jz4bxiaiIq+
	P7q9muuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uromX-000000046t6-3tMv;
	Fri, 29 Aug 2025 02:24:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8i-00000003tb8-1iDB
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 29 Aug 2025 00:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c3u7x/K6tl9OG9wiIGh8KHdwHeRRIahMnviBLAU+NwA=; b=ZkWLFbKywwyEspir6mwyP5cwKg
	JeMn4V6uqBK9wrDLLKvEA1/8k4zR5iDq1NSKbKg5wdkqLFRRSH523Y62m6twVi4vq+HYGHmvLY483
	Y25jRIXEnKKGQkllwicEmNaCpPDRXkmWpIICKALORmts6UB65JLXt3bsMJ9fB9jkzSyBR227MeCE4
	Ipey2uAkLssYTzHd2dTTqhs+KKcCzDABZeXAGc+sDKDuXWgS0BukfjepZQ8CC7Dl7zb1giqhWYr8v
	sFu8u/MZVPKw8LQOSM80N+WQmV4FdZiyPXF68Ci+9fukmuiRiTBj+9+W8gxx/4aACslpRVRrL8YxP
	LyNeMveg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urn8e-000000030Hb-3Yie
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 00:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3u7x/K6tl9OG9wiIGh8KHdwHeRRIahMnviBLAU+NwA=;
	b=PqmkND7M44usJYlRY1zs1BxeQQGR9HXa2q+OcRYpd1O8e4HJM8sQthmiFLcB0koT2SJJkc
	pLStHnjAHVgjJffvUs6hP44nczjdhZcDIezvuIc85CpmdRYHSFvhlIw0Y+pdsbEq7Etkl8
	ZQnIIjt1zSAAnCk1dkzMLsPAdQ6MwYU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756427921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c3u7x/K6tl9OG9wiIGh8KHdwHeRRIahMnviBLAU+NwA=;
	b=PqmkND7M44usJYlRY1zs1BxeQQGR9HXa2q+OcRYpd1O8e4HJM8sQthmiFLcB0koT2SJJkc
	pLStHnjAHVgjJffvUs6hP44nczjdhZcDIezvuIc85CpmdRYHSFvhlIw0Y+pdsbEq7Etkl8
	ZQnIIjt1zSAAnCk1dkzMLsPAdQ6MwYU=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-331-_ghqgneQNs6V3oeX-4tKhg-1; Thu, 28 Aug 2025 20:38:39 -0400
X-MC-Unique: _ghqgneQNs6V3oeX-4tKhg-1
X-Mimecast-MFC-AGG-ID: _ghqgneQNs6V3oeX-4tKhg_1756427919
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70ddbb81696so30352586d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 17:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756427919; x=1757032719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c3u7x/K6tl9OG9wiIGh8KHdwHeRRIahMnviBLAU+NwA=;
        b=Czyf/A1d/Bjx/kfKb27avrqlKyGcVQhAd/9XSLvK0vdDFM6Xs1Ph/Au5TE/8OiDGqk
         nNAU06MeE7yjVGNfJS3hkilvSqpot899sGR2A18QNOiRrH0OGvsEHXvMVA73/k1LgIBc
         w2aD/pQZS7xymRMpVfVpytHJHGEpg37UOiRa7vfMsmmLucYUCUJEXL16r3MJILqiA/0Q
         ARqUyeexyj08fxNXf9nOv1N5KL2nROtPm6fHisxVZhtiroYCEIVCsQomhsB/0JR8BKPs
         K/CaT2xGbnn9P03ntGRGZOTwaPZH+5wE9b3zFhj+sbj/n0PW+3Bvr4Oy2bCa5LeZhKGc
         4a+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVoPFFcXJFMfYbmD1mV6rBxMVCjQ9VesopQ9qZJ0xQBLL+gLY9hibzkBnYgM0KI4kY++PEPJzOaQ9dVTXkzf+Y7@lists.infradead.org
X-Gm-Message-State: AOJu0Yyis8sDrFdTyTS8IfwFNMns/RbOC8bjKeww6ubAym10pjOVv1V1
	39McF4KmiS6Dgl642NVb7vG7NU077Pa3PS6fFb1p8OnEYUxsjx2U7Cq0rFti2+/ZvnOnfZV4FlU
	nYrPb7ZpSkE6BPat6ErAZB/4bgaJLHXBTBsi6RNTUaz9uTus0IYq+monur5w7JbHegLQ0VsUjuQ
	0s
X-Gm-Gg: ASbGncub5COOYpbk/SkMMot2owosxvLBKS/paEYogekqvCiZKLI9sG/2jPPLuxmO3wd
	cwlTz9ATjNoB3/Gyfwwv5sPb2wUqtrrvfGmj7L+8m85OMN+74oR8Q2tGDRrugK+NUSlGLnHa4DW
	462l+hk0HHy3SSNB6tLll04XVZ9Fz88npm9b6OAMGv9FJ7B/v4a63Qbtij+ZvG91O+aCvxSYKs9
	IA9/KoeP5309lQ7FD3a3B8QH3XSKnY6MIQ9BjH5Gn3fJy9pRskZiLMkoFad9BKc0wmE/u1X6LjC
	qIG/xzwgKuKCwSunY1dQOG9kUvnygls3ra5fbs3+cA4gPpA1r6CG8FONRrPeGB3lJVKdwIiAaUf
	SrODwPuftbBw7V2muqAkgFw81mFEzXGemPQ==
X-Received: by 2002:a05:6214:238e:b0:70d:b960:22d9 with SMTP id 6a1803df08f44-70dd59c0dc5mr108738076d6.0.1756427919306;
        Thu, 28 Aug 2025 17:38:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9Y+srjMYTUDi85Cn0pJcSe0dbGIf69GdJd8S7Yq6E+2fhSrZboCv3tbgRe/rYDM8Hmu9x3A==
X-Received: by 2002:a05:6214:238e:b0:70d:b960:22d9 with SMTP id 6a1803df08f44-70dd59c0dc5mr108737916d6.0.1756427918880;
        Thu, 28 Aug 2025 17:38:38 -0700 (PDT)
Received: from [192.168.1.2] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70e6264141asm5588696d6.65.2025.08.28.17.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 17:38:37 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 28 Aug 2025 20:38:20 -0400
Subject: [PATCH 1/8] clk: nxp: lpc32xx: convert from round_rate() to
 determine_rate()
MIME-Version: 1.0
Message-Id: <20250828-clk-round-rate-v2-v1-1-b97ec8ba6cc4@redhat.com>
References: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
In-Reply-To: <20250828-clk-round-rate-v2-v1-0-b97ec8ba6cc4@redhat.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Michal Simek <michal.simek@amd.com>, Bjorn Andersson <andersson@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Maxime Ripard <mripard@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756427914; l=6057;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=3ht1wGseKshyK0elknVvnPuwk+xst31YCIMTYyJbsnI=;
 b=vBgDN2UolIYgWOoWXbkA84AYONG/GqJkkikThkMURYKOSkSyvbFpmEqJUiCoeaUkKgCqq7nEQ
 DFy61Z9uuUoC1htEQWfzBbUhQKFicg1qdsl//DSZRp+vreyJtcnSot0
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XejLrZbRdOpE3eVygtnfl_FSmjXbzvTqPrNaPjB7kKE_1756427919
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_013845_323960_0FC4E6DE 
X-CRM114-Status: GOOD (  15.97  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Note that the changes involving LPC32XX_DEFINE_PLL_OPS were done
by hand.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/clk/nxp/clk-lpc32xx.c | 59 ++++++++++++++++++++++++-------------------
 1 file changed, 33 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/nxp/clk-lpc32xx.c b/drivers/clk/nxp/clk-lpc32xx.c
index 96a1a527b3808573d3ce2c73af066a0bf37f1245..23f980cf6a2b59ee1c93a2519fe5188d251fa12f 100644
--- a/drivers/clk/nxp/clk-lpc32xx.c
+++ b/drivers/clk/nxp/clk-lpc32xx.c
@@ -578,17 +578,17 @@ static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
 	return regmap_update_bits(clk_regmap, clk->reg, 0x1FFFF, val);
 }
 
-static long clk_hclk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				    unsigned long *parent_rate)
+static int clk_hclk_pll_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
 {
 	struct lpc32xx_pll_clk *clk = to_lpc32xx_pll_clk(hw);
-	u64 m_i, o = rate, i = *parent_rate, d = (u64)rate << 6;
+	u64 m_i, o = req->rate, i = req->best_parent_rate, d = (u64)req->rate << 6;
 	u64 m = 0, n = 0, p = 0;
 	int p_i, n_i;
 
-	pr_debug("%s: %lu/%lu\n", clk_hw_get_name(hw), *parent_rate, rate);
+	pr_debug("%s: %lu/%lu\n", clk_hw_get_name(hw), req->best_parent_rate, req->rate);
 
-	if (rate > 266500000)
+	if (req->rate > 266500000)
 		return -EINVAL;
 
 	/* Have to check all 20 possibilities to find the minimal M */
@@ -613,9 +613,9 @@ static long clk_hclk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 		}
 	}
 
-	if (d == (u64)rate << 6) {
+	if (d == (u64)req->rate << 6) {
 		pr_err("%s: %lu: no valid PLL parameters are found\n",
-		       clk_hw_get_name(hw), rate);
+		       clk_hw_get_name(hw), req->rate);
 		return -EINVAL;
 	}
 
@@ -633,22 +633,25 @@ static long clk_hclk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 
 	if (!d)
 		pr_debug("%s: %lu: found exact match: %llu/%llu/%llu\n",
-			 clk_hw_get_name(hw), rate, m, n, p);
+			 clk_hw_get_name(hw), req->rate, m, n, p);
 	else
 		pr_debug("%s: %lu: found closest: %llu/%llu/%llu - %llu\n",
-			 clk_hw_get_name(hw), rate, m, n, p, o);
+			 clk_hw_get_name(hw), req->rate, m, n, p, o);
 
-	return o;
+	req->rate = o;
+
+	return 0;
 }
 
-static long clk_usb_pll_round_rate(struct clk_hw *hw, unsigned long rate,
-				   unsigned long *parent_rate)
+static int clk_usb_pll_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct lpc32xx_pll_clk *clk = to_lpc32xx_pll_clk(hw);
 	struct clk_hw *usb_div_hw, *osc_hw;
 	u64 d_i, n_i, m, o;
 
-	pr_debug("%s: %lu/%lu\n", clk_hw_get_name(hw), *parent_rate, rate);
+	pr_debug("%s: %lu/%lu\n", clk_hw_get_name(hw), req->best_parent_rate,
+		 req->rate);
 
 	/*
 	 * The only supported USB clock is 48MHz, with PLL internal constraints
@@ -656,7 +659,7 @@ static long clk_usb_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * and post-divider must be 4, this slightly simplifies calculation of
 	 * USB divider, USB PLL N and M parameters.
 	 */
-	if (rate != 48000000)
+	if (req->rate != 48000000)
 		return -EINVAL;
 
 	/* USB divider clock */
@@ -684,30 +687,30 @@ static long clk_usb_pll_round_rate(struct clk_hw *hw, unsigned long rate,
 			clk->m_div = m;
 			clk->p_div = 2;
 			clk->mode = PLL_NON_INTEGER;
-			*parent_rate = div64_u64(o, d_i);
+			req->best_parent_rate = div64_u64(o, d_i);
 
-			return rate;
+			return 0;
 		}
 	}
 
 	return -EINVAL;
 }
 
-#define LPC32XX_DEFINE_PLL_OPS(_name, _rc, _sr, _rr)			\
+#define LPC32XX_DEFINE_PLL_OPS(_name, _rc, _sr, _dr)			\
 	static const struct clk_ops clk_ ##_name ## _ops = {		\
 		.enable = clk_pll_enable,				\
 		.disable = clk_pll_disable,				\
 		.is_enabled = clk_pll_is_enabled,			\
 		.recalc_rate = _rc,					\
 		.set_rate = _sr,					\
-		.round_rate = _rr,					\
+		.determine_rate = _dr,					\
 	}
 
 LPC32XX_DEFINE_PLL_OPS(pll_397x, clk_pll_397x_recalc_rate, NULL, NULL);
 LPC32XX_DEFINE_PLL_OPS(hclk_pll, clk_pll_recalc_rate,
-		       clk_pll_set_rate, clk_hclk_pll_round_rate);
+		       clk_pll_set_rate, clk_hclk_pll_determine_rate);
 LPC32XX_DEFINE_PLL_OPS(usb_pll,  clk_pll_recalc_rate,
-		       clk_pll_set_rate, clk_usb_pll_round_rate);
+		       clk_pll_set_rate, clk_usb_pll_determine_rate);
 
 static int clk_ddram_is_enabled(struct clk_hw *hw)
 {
@@ -954,8 +957,8 @@ static unsigned long clk_divider_recalc_rate(struct clk_hw *hw,
 				   divider->flags, divider->width);
 }
 
-static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
-				unsigned long *prate)
+static int clk_divider_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
 {
 	struct lpc32xx_clk_div *divider = to_lpc32xx_div(hw);
 	unsigned int bestdiv;
@@ -967,11 +970,15 @@ static long clk_divider_round_rate(struct clk_hw *hw, unsigned long rate,
 		bestdiv &= div_mask(divider->width);
 		bestdiv = _get_div(divider->table, bestdiv, divider->flags,
 			divider->width);
-		return DIV_ROUND_UP(*prate, bestdiv);
+		req->rate = DIV_ROUND_UP(req->best_parent_rate, bestdiv);
+
+		return 0;
 	}
 
-	return divider_round_rate(hw, rate, prate, divider->table,
-				  divider->width, divider->flags);
+	req->rate = divider_round_rate(hw, req->rate, &req->best_parent_rate,
+				       divider->table, divider->width, divider->flags);
+
+	return 0;
 }
 
 static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -990,7 +997,7 @@ static int clk_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 
 static const struct clk_ops lpc32xx_clk_divider_ops = {
 	.recalc_rate = clk_divider_recalc_rate,
-	.round_rate = clk_divider_round_rate,
+	.determine_rate = clk_divider_determine_rate,
 	.set_rate = clk_divider_set_rate,
 };
 

-- 
2.50.1



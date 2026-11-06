Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC60D606D816
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 08:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dLX5kN74;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=TZaJjITw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=; b=dLX5kN74uNksD7
	xRAMTSHaL6uJSELta+uyFLqO0U2nSHcV6nj0/E35y0Zk/T+d0hcZQRnpfvSgqf7Er62Xdi1AxypuP
	Ky+JZZHpWA/rkQDQIYkdMYUV171QIU3fpoHDoDh0BoJqcn5poBDbRMK3dC+lpFI77GefXrkrb+H6Q
	XdqoErAR59JunugaaNxM8rXpWRX1ITIczpOVO43PWLhufeGwA7RUeYgG3PpZpqJLQcxCcKOP6GZKv
	tgzgvdrxxmGhE5P9mvlo+l7Li7LG62eAKf7qyTOumDZ2ZajUM1kVrUHGHae9MmFT4zeBEbSExbavC
	Qb6TKtpW+z35gYugyffQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLP-0000000BZnZ-2Khj;
	Fri, 06 Nov 2026 08:30:43 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFLJ-0000000BZeo-3759
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 08:30:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-492f0a1b685so170571f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 00:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793953836; x=1794558636; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=TZaJjITwT/fujtiax5HqxslbxQ6chHl6ICQayE+EHbD/Og0Vmi6uaGC2m1BgbIsLeW
         rWTcYf9S4883c40QhwjaOwBoIQU87q91jN9XGzUXuLOcRN+49YdhK8dmrX/bhJkrz7jL
         2GxReI98P1k5xB67mbdPZ1/qi+XTcYR4neFg2B7HbuskFz0J1fZWmIxVNRVzP8prfoGj
         3857GaVyWCgvA5MtAAA/G1q22zmGM8s36wneAGzErLKEVczQF0X+ljLrICyNvo97koiJ
         y6CHKC9h82mRUCmtohhyVSIpzCfc5cayufuTgN+RJxU386QfADAl2UqAyaNXgbC/alvr
         UEtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953836; x=1794558636;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5PBEnq7VF6lYD89KsFrntzTjwO4LYAxU3lHBv/vL7c=;
        b=I9l6sc5TezJ2EJVJAnHiBsg3Hf4rQbflrtixFPVTA7EhCzuHDUnPyFlaKaSpiNLElC
         HkCKVWaInwMWVQJ7LREDIzEtCYeuMNDXyd+zeVcLGZ2h6lfbLaruqXjg3uP7VcnSyTra
         R62mCkLn1+mEm5VyhlXXwlt9fta3u20Bzblk3GZCu6awMzn01SzjPdKBfjwmsvwFo2Ba
         pQLbFyqubrip/JjpOd3urktxDApA05Chqhri1cYFgcO0SMTWkdWf2BM4UCI1+XFODQ3n
         /UXkUkdVR+bOr04mLGjqYs17rdpc28zDP1d660QJYuDzCuDPvIpDIcMeuh+AJe77iquO
         Z/Fw==
X-Forwarded-Encrypted: i=1; AL+hErFDRfk7FcZT8ouR+ThDv9X83F54YdedQSG3VbNXDd3MMxCjA7/HZtRfYO8ictWy51mzi3ZZQYXWxCGWNkoxBpYq@lists.infradead.org
X-Gm-Message-State: APuU4Z9oXqgpamD2kAWic4593F0kO7BxiiW7r8c/AlLiu5zYs+ANBKMj
	0XMMlG5s56/SvuBErIt1OUxunQiPRU/SAH8xpLMtOSJyECyTFJfiR8xWF3jaAL5yGUg=
X-Gm-Gg: AYBFou0GALXTSuxEgiJpLRRBYYhMB7d6HFYQZYJt+mCfUvwC7Abg7Ql/wAcsGtDd9JK
	A/N9nU8szKi6987TZkh0lFZXEBdn6VTS/X+Ifox/hND67/ek8Y5WdU39Zt9PrThvZxxYIk3awii
	zZgYWU166uuq/IaSJ+IiN2x0D4IYoRqNQSqGFH4TFDhVf9Ci3C8Z62SnlVt720bNVQAxYaUtMQg
	zQU2TCvqO4AVQ9JcJJeDPW7pbt7VO0m+8e1sAABjS+qUnOVh/swgJsmxi0a5L0boXK3HC1b4Rde
	E3kl6pj4T1IbM5ukWNpVMXtzaYSumvPDBmQqhApFu0+62RKXNZoEeZ4l54q3KvTxlMCytS0lvjA
	HfTN0Ey9EeAJYQs919BxIDsg7RagbpfFuF8rz1ARM+Y0L/CCKMFDLOH+c0m1QZtt5NK+0deAcOS
	nGPtM+dXmlU6tBx7CsN2GJ4mStMrCVPse48MoxJplcamGye0cLqQ0ecGLVqqiQgYAa1vMKNWGs0
	qWIsd1Ssy00a9qZ+wn0DhDJs1+ePgVlVEd+clNl9+nwlYnUHF+QlV8lel+wpBb3zyzadLfSNCSW
	/VV0HOox91vI4puSYbfwarqLM0ycthlPOKBNrdYT5dirYJ93xemn659r46IIAQcCUAX+opmQM91
	YOYiMT7LTq/BqRAnwTbN0eF8dsbhMTTg6IHPB39nZeexmUg==
X-Received: by 2002:a05:6000:1882:b0:487:27f9:834 with SMTP id ffacd0b85a97d-492778d1739mr3822099f8f.41.1793953835726;
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d8472969sm2366839f8f.58.2026.11.06.00.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:30:35 -0800 (PST)
From: Carlo Caione <ccaione@baylibre.com>
Date: Fri, 06 Nov 2026 09:30:26 +0100
Subject: [PATCH 3/7] clk: meson: pll: Support active-low resets
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-upstream-s7-clk-v1-3-7d501d62621f@baylibre.com>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
In-Reply-To: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Carlo Caione <ccaione@baylibre.com>
Cc: Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_003037_837904_DFDAEEC2 
X-CRM114-Status: GOOD (  17.12  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The common PLL code assumes that the reset of a PLL is active high. The
S7 HDMI PLL has an active-low reset, and its lock flag only rises
reliably when the PLL goes through it.

Add a flag for PLLs with an active-low reset so this PLL can use the
common implementation.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/clk-pll.c | 43 +++++++++++++++++++++++++++++++------------
 drivers/clk/meson/clk-pll.h |  1 +
 2 files changed, 32 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 44b33051405f..4ac5e45c1e9b 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -293,13 +293,37 @@ static int meson_clk_pll_wait_lock(struct clk_hw *hw)
 	return -ETIMEDOUT;
 }
 
+static bool meson_clk_pll_in_reset(struct clk_regmap *clk,
+				   struct meson_clk_pll_data *pll)
+{
+	unsigned int rst;
+
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return false;
+
+	rst = meson_parm_read(clk->map, &pll->rst);
+
+	return pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW ? !rst : rst;
+}
+
+static void meson_clk_pll_reset(struct clk_regmap *clk,
+				struct meson_clk_pll_data *pll, bool reset)
+{
+	if (!MESON_PARM_APPLICABLE(&pll->rst))
+		return;
+
+	if (pll->flags & CLK_MESON_PLL_RST_ACTIVE_LOW)
+		reset = !reset;
+
+	meson_parm_write(clk->map, &pll->rst, reset);
+}
+
 static int meson_clk_pll_is_enabled(struct clk_hw *hw)
 {
 	struct clk_regmap *clk = to_clk_regmap(hw);
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
-	if (MESON_PARM_APPLICABLE(&pll->rst) &&
-	    meson_parm_read(clk->map, &pll->rst))
+	if (meson_clk_pll_in_reset(clk, pll))
 		return 0;
 
 	if (!meson_parm_read(clk->map, &pll->en) ||
@@ -328,14 +352,12 @@ static int meson_clk_pll_init(struct clk_hw *hw)
 		return 0;
 
 	if (pll->init_count) {
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 1);
+		meson_clk_pll_reset(clk, pll, true);
 
 		regmap_multi_reg_write(clk->map, pll->init_regs,
 				       pll->init_count);
 
-		if (MESON_PARM_APPLICABLE(&pll->rst))
-			meson_parm_write(clk->map, &pll->rst, 0);
+		meson_clk_pll_reset(clk, pll, false);
 	}
 
 	return 0;
@@ -365,15 +387,13 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 		return 0;
 
 	/* Make sure the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 0);
+	meson_clk_pll_reset(clk, pll, false);
 
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
@@ -406,8 +426,7 @@ static void meson_clk_pll_disable(struct clk_hw *hw)
 	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
 
 	/* Put the pll is in reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 1);
+	meson_clk_pll_reset(clk, pll, true);
 
 	/* Disable the pll */
 	meson_parm_write(clk->map, &pll->en, 0);
diff --git a/drivers/clk/meson/clk-pll.h b/drivers/clk/meson/clk-pll.h
index 949157fb7bf5..8384b75ae38d 100644
--- a/drivers/clk/meson/clk-pll.h
+++ b/drivers/clk/meson/clk-pll.h
@@ -29,6 +29,7 @@ struct pll_mult_range {
 
 #define CLK_MESON_PLL_ROUND_CLOSEST	BIT(0)
 #define CLK_MESON_PLL_NOINIT_ENABLED	BIT(1)
+#define CLK_MESON_PLL_RST_ACTIVE_LOW	BIT(2)
 
 struct meson_clk_pll_data {
 	struct parm en;

-- 
2.56.0



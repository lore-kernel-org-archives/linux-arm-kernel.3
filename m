Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4748606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 12:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d+GNBHcd;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=lsdqO7RQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=; b=d+GNBHcdE1dPQO
	cshWpTCnAOOINkhV8tFjqzpUVXn1ontDyQIfTkuXm7vRFn2K2X4T0lhtjIUc2dWi3pNo7DjXKohtg
	e0dDW1wy8Y/EC8uAYghY385Wz7MGXtbeFz77pQr0H3DVBUtkERNKzTDCx2UZNv0K08YwRVlY0b+01
	LJ9ww2h70ZOiP+eUyriBFWTNIfS8EmrFuuf8ygamzXGRvGJjQ0Zsv0mcIg5XNtnx8+3b/XNZkX6uR
	k8C2jgWnVrxRoU7bo7TjMgwDI5mbGYtpi2ATusMvChpNOB2OHy5zr6rMs9DKzNmdyOtbvkCXDnCnE
	d9mWCgbmT7RYrr40lSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeU-00000009FWw-2cwv;
	Thu, 29 Oct 2026 12:54:42 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMPeI-00000009FQ4-3Hlt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 12:54:34 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48df54150dfso1177588f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 05:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793278469; x=1793883269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
        b=lsdqO7RQsu/tLTBbCl7cYPpWb1buQhjbROld6vBJbJ8Qel2sR5XO/DlK/Hv9pDKF8y
         Xp00BnPqJX5d4Qth7evrf0w0mRhB76NLYZOmHJj06wTqVWYgtDa8PtkqjNDYk3oXYUF6
         nifKQbfb6cWPxFXNFje8irSJ2WXM/agOhYyObV3qbtQw7i8CpToLmlN05U6jFIoc7Rwy
         EhsJ25+yPCzSw0i+ns64D8rsKiL4WL9Yi/sAP7HSwojte1D5qyZCAnTK9KNTTzwFNJ4r
         S68YPxhJIPIXk+mC+XFzKn/JwJWB6B/jG8768u7CUrLJ37Pcrc45LYxdeEndxmgglbAw
         0vqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793278469; x=1793883269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YCZa7OrCfiqCW2NQ+HdDQnKwWKIbdOgXD9yC1aIimaI=;
        b=dYiYhsOAbES6AFK7lS4WjfdrULjQ8+I1JOl7pGgGF6Pp1JTe8kX20Lmr/W5N/vop1b
         Axf5Rr6qHDnCfkyZy2IzvltgVpn/nTsiVaETs9FYA8qf9yPkU/M/alUdyYROmAb7ClDs
         67ni1dCseqV3vyv6wOGm+uFF4uFIaPUBoMEPdrYme9EYbPUE0NxuecYFiG8apVKeWiYm
         Z7RUZxRaWXh9Ce9bTBbBfWs45Fj3AyzzWY4T32tND4hczdYKHHTGPmZ407B0E5kYiAvY
         xmQd/zQvq2rA+hraeDHIvzDOY8Ije5D4nEXVmTeeXlliFqEd4374+Nul83sC7ieYYIVj
         ULrQ==
X-Forwarded-Encrypted: i=1; AKwUvByEB/pHsuFrKZqI3fpkaCFx5170gEkO5ZLgVc9NkqJAreSw3kHh0naKX/yTAb58J8dWwZuKsdB4y0P6I18oEOhG@lists.infradead.org
X-Gm-Message-State: AFq9FYIINBV1ODwRtxs26CrMrt3MuV0QQkf5hpuSpV3ZJfdJcxl+tnHP
	gTMMb51pznHgSMYwUTARFr0m6DIWII7cIi7K3tfv8A4NgA3MqFpiDZNEmw+kwwpfmLo=
X-Gm-Gg: AYBFou2hsfd1KMlUbN3YvRPiN6hvLwcRBcsnRw0WwZsgpQYI6oc1UrzfNEUGrpbE4wD
	hldWFBxF06fLoslQjUjtuDsfYSrxrav/eYxNgvILw3/LUVDMn06od16+b245KjCFyrGcSqKWKvR
	7IIE67iPiHzuL9HNImL63Eeuw0N5wieJKcKs5K1QuL3pVhGAGh9/JhzM/Yq3eYQ9oPSqBp2A7n1
	iPBS8b4tZwHSn/PkO/BzA4Nd+wNeK3LYc4A/4DrrCEa3pisXipSxtOl9qouKtzkJY1i318xvjEf
	jcbWlbL7dagVfgCAdZwp9OgDGMydwnt+Fj2+V74pDpyXGUXWwL7/UO2k17BnvyFRDnZfHUXBJTs
	TxUilPQUCTxPZ1wx1HuHz8Cflj0spYZesGSCbq73up6rc/dgMLXXg1xfeVaO57Vk8E58gcNZ1Mi
	f735kJQnriDMK2j1cK0br4iHmcBWUpTlk+6Ko7dgA1RhCEciUKTm5FFLp/6Us+19h0ayJDQNbnF
	q4IfEVuUKYsI0U82f5VoTEPPr755tsLedRsVj0bb7h/RW5yBro/a9mjKOdjEESge8ww+C6OPVs8
	NDeHiPL4omRR5q2S9ziLNgp4xTltkNw3Vby62pCqJpdipy2QQZvhqFK+I0WTSZ24czr1g2/YK6u
	+nrmLmVEdUFQaPsgesBDnpy5UyavlDda2pxAyr1kz5dm5gq4=
X-Received: by 2002:a05:6000:607:b0:48d:f034:7fcd with SMTP id ffacd0b85a97d-48e5d5d1486mr12914361f8f.51.1793278468880;
        Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc39a8sm35034622f8f.11.2026.10.29.05.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 05:54:28 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Thu, 29 Oct 2026 13:54:20 +0100
Subject: [PATCH v2 2/3] clk: meson: g12a: add the missing HDMI divider /4
 alias
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261029-upstream-clk-regmap-ro-divider-v2-2-7a375fd8f88e@baylibre.com>
References: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
In-Reply-To: <20261029-upstream-clk-regmap-ro-divider-v2-0-7a375fd8f88e@baylibre.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Carlo Caione <ccaione@baylibre.com>
X-Mailer: b4 0.16.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_055430_847079_15181AFC 
X-CRM114-Status: GOOD (  13.84  )
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

On G12A, HDMI PLL divider values 2 and 3 both select /4, but only value 2
is listed in the table. Reading value 3 therefore gives an unknown
divisor and an incorrect clock rate.

Add value 3 to the table. This also avoids a division by zero when the
read-only rate-rounding helper uses the value read from hardware.

Fixes: 7aa6c24697ef ("clk: meson: g12a: Limit the HDMI PLL OD to /4")
Reviewed-by: Jerome Brunet <jbrunet@baylibre.com>
Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..b23b9514fa91 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -779,12 +779,13 @@ static struct clk_regmap g12a_hdmi_pll_dco = {
 
 /*
  * G12/SM1 hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table g12a_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0



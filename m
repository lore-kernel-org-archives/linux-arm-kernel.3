Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C86606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tvAnDZr6;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=cPOpoIF+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=; b=tvAnDZr6wdO+O0
	NMjBV5Au4pAm+uTT+TYYUkjyufuOUREpe/EnT0Nn0BYCCL0tf8i/NycLeKRSJ0SuIq6y97bc7DdTA
	XsXw70TdfuhIfClP6N2Ythph/XDjiYODqINVazE8nH8gogtGS6I6a/xZLY4bvb32gb97GuzR0N4Tp
	plZeNUNvtrza+vsWDKszqNl3p1ksihzuABLlKW5ZPpPEkrRDD83Jd8xFUSmicM0ZE/XA1mIiPqQRX
	uigtj92Jk5ad+qWWXKUCH4QlaJpqCeLEGGe7Vse3/hKo6/79wq+A+CB6SUGl4JxEF+vXMX/zWhIVC
	g9G/woVG/YXSgkZyh8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKm6-00000002bJk-1pvB;
	Mon, 26 Oct 2026 13:30:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKlv-00000002bFc-3tdM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:29:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a7992e2f7dso567175e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 06:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793021394; x=1793626194; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
        b=cPOpoIF+RrqjFPTvcJKE5jAit3ZnZgbOyrft0Buh8bI55/f7NtEdMuc+1bVfv+nviS
         1ED39CAFqt+oc5NKKn4lznQqHYPn2wHEY0zbMJJkq5OP7ECF9ML2siDJl95B1g514e6E
         ld0Ut5jUGI7RlCDTnW18/1ixsTznKsvk26/biDQqKalq+lV8rJ3oe/JT3X6Sf1WdWlFa
         VBhdYbse6vhshjvrkU/Z+5BO71JFuluns3W46wY9kn4FuYEjOx9U/Ogw5sZ0iIeGB7Wt
         c5SLcFK8sMIGL3UxOYtAntrDbPQ6gBpHLiZdCzmUXz3E2vR4is91paX/y+9wn4uo7389
         oFzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021394; x=1793626194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iiDTsK3ygekIQj3ntqY+O/GObcC7NdXYPBilD7+mkLE=;
        b=vbQNT5O7EjpWp2JYt46EzUf5sBP+fKY/3+qLiXeYmnypvqcPiT1dQZG/G1mAB8z7UV
         qOYgnvjbo0qYtlsS3WSeb4Uwds+UcWk/xORWotHXfkxAXGOC828r/KwzhY7wxHpMiazw
         TDG4umpHHVDI9mja3mcnX7kN1SU0poZ+lBreoxup/zQscIFeAihX+NMZfgV2FK9TND3E
         LfO4cTtw5zACdjp/3p0kT2r1BvRe2z9QER9zJZIFf/gLPmny8utg1T6m4Rh44NgL4RZT
         Ny3uUWbJ2qlC8ptpj/2xUUQK+YdAmlYifHonMDytHx7dKUycKY/0hL4dFmidEtBaJuMx
         FuWg==
X-Forwarded-Encrypted: i=1; AKwUvBw2Wb/iTrfI+LQmNvNKf/Muv20EtG+Oy/w15g7NeIZ3HZil56OWFusfXj7hNF0dLFYiQ2cEgLe/RIcIAYDy2fJo@lists.infradead.org
X-Gm-Message-State: AFq9FYKfFZn86HKt+U3udLkI+VFqR5ZfWUl+Dhy79jC/a+3q29+zS7h9
	Xs1MTsUjceANde3VJl6FSjHfPQKM/I6UVxxUWm1glBCnMJIyfIo1ZeeD9i4d1xLmPgU=
X-Gm-Gg: AYBFou0yyMJA2uLJqG21tJ/lb359grQEKeMpzPoIp/yE0itlDcV0hfCxiLlPDMn7URL
	tnoJH2zaWZrnmguOzZNWk1EDy4BsumM7lWrjsuHGN8AihDFSUcyzsyG6tNee8UN9EEmkQcRJ7Fn
	IllbNdOEZ7bYb+DkGoYxKD7CaVqOOCzdF4yAMgwTIyFap+0C2N8A8pOgyF+8/Djf0f2W79GxDj2
	/93UUCJEzjeNurqlsy5VL/zbypd5zsMjI4JdKMseI0d2VqiJ7E24tHw5M4uVWPet6biaLdZoWBG
	f7zMJg6K3wFnzffgO4y9fds+ZTihNN6ckb8V6RL5faYA5b7pSjJBvauMQ5A8RcfYryr9Oe5zfiU
	zqcutqXgZdyytCOTaRfCRnus7noGKJ7ar1egHXPACzXPiNDuw2ZLYE7cE94Nql6JeKUmNGGZUZT
	dFeg52QX0iY2PECxs35gdTWwNUh4ve5MhWYWaDKibmmJYt4b5JXJdIvlSc1CZW2O1vSAPZpLtO4
	xwtAz+BpjvcKnsUbpu6sZymPvjy0ZOn4G95La9SDVNT2YLXC1OR4OvfabAa8saENhqdWnfIO9d/
	1bqSnojlHzvZ0dDmDiq8jfRx48frl3QHrxfOKRwWqL7cbpvzTpEY22Z60j0QB3XJ84lrQfd0
X-Received: by 2002:a05:600c:5307:b0:4a1:d456:ddc8 with SMTP id 5b1f17b1804b1-4a35ac8bb56mr121212915e9.7.1793021394320;
        Mon, 26 Oct 2026 06:29:54 -0700 (PDT)
Received: from macbook.homenet.telecomitalia.it (host-95-246-144-141.retail.telecomitalia.it. [95.246.144.141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359fbb725sm194507095e9.0.2026.10.26.06.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:29:53 -0700 (PDT)
From: Carlo Caione <ccaione@baylibre.com>
Date: Mon, 26 Oct 2026 14:29:44 +0100
Subject: [PATCH 1/2] clk: meson: add the missing HDMI divider /4 alias
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-upstream-clk-regmap-ro-divider-v1-1-c8216b0fb93a@baylibre.com>
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
X-CRM114-CacheID: sfid-20261026_062955_993332_424F83EB 
X-CRM114-Status: GOOD (  13.57  )
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

On GXL and G12A, HDMI PLL divider values 2 and 3 both select /4, but
only value 2 is listed in the tables. Reading value 3 therefore gives
an unknown divisor and an incorrect clock rate.

Add value 3 to both tables. This also avoids a division by zero when
the read-only rate-rounding helper uses the value read from hardware.

Signed-off-by: Carlo Caione <ccaione@baylibre.com>
---
 drivers/clk/meson/g12a.c | 3 ++-
 drivers/clk/meson/gxbb.c | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

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
 
diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 7a7b104182ff..8cb6404c0efd 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -350,12 +350,13 @@ static struct clk_regmap gxbb_hdmi_pll = {
 
 /*
  * GXL hdmi OD dividers are POWER_OF_TWO dividers but limited to /4.
- * A divider value of 3 should map to /8 but instead map /4 so ignore it.
+ * Divider values 2 and 3 both select /4.
  */
 static const struct clk_div_table gxl_hdmi_pll_od_div_table[] = {
 	{ .val = 0, .div = 1 },
 	{ .val = 1, .div = 2 },
 	{ .val = 2, .div = 4 },
+	{ .val = 3, .div = 4 },
 	{ /* sentinel */ }
 };
 

-- 
2.56.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4549CD8CA4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 09:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A73y2Pg16zM1/WvH9t48h/2ALu7N8J70iHXokd8IsZ0=; b=by/ebcV0jDIHzcApyYVw+V2UDU
	eDS73/H1y230PZzuiWgtNoxxTaweAXh0ZZoRyqt866wAxWI5bhDtQhxirozVwTQmoC3XZ0IBvdrKP
	fB2FzyGN5grrLFmVRqfkJQxK67x+ZC7NNPDYVVGrfCbv879t3+CDsZYUmmaDNQxma7plF0EybzKuc
	grukiHVfDLAsOUGCHpGim5Q4DOHH1zgH5fj4O45uvED9B7yj01P/FayYbKW5T2wWvOKsDEHlCacf5
	pe3aEgigwwi/AO+ZL9hX3hwgzuhzLTf+CBeyl1HtFawWcd8MU6SeNY5luVBGvS6RtjQP39d2Zwk+m
	W9hyxXxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt8r-00000005GYO-203A;
	Tue, 09 Jun 2026 09:53:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWt8q-00000005GXO-17rg
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 09:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=A73y2Pg16zM1/WvH9t48h/2ALu7N8J70iHXokd8IsZ0=; b=HbtFQKqlYnoutPsGWdfcibs9zu
	bXEMoqUihrV4ORXxi1p5fQer/OVoSb/ehyxA7eSVs4y8HOXzglUcsHklWEYlXlFlsrWNiiKkLourK
	/mrDEE4aDbj2allUpr0hqsLPE41lnsohcmK/IxmcasvcbPSlei08r35mQgGYHWq0iPWP/FBqFRESS
	pfq0qpTMetbMeTmeWW/PLFKtkiDAV/aakThZIYTnIqsOtdZEbqQm0UCY2tEX6PTo4C1bq1yFJsrJg
	4DcdqLo2xo9V0QXJ/mJBI5Z26DqgCKIGh3WFiWu0GrYUkxW3hC9+2pJHVcHrQNtTOZgdYTAQHLncR
	eb42o3hw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWt8b-00000002HSc-0fDM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 09:53:00 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-37474afe908so709940a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 02:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780998767; x=1781603567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A73y2Pg16zM1/WvH9t48h/2ALu7N8J70iHXokd8IsZ0=;
        b=I8VUUHXkskmXpNw1c+yj5wctereNyx6b79I0WB/fFI9zI76SfmaUN5ZCvKBweQGJnU
         on9SwwTJYdm7PRUyXUoR5TTXPMNg6ojN45Z+ktAi6aX0vc6UcWnKXfVEt2y/AzVOcl7z
         nVlHlkCqoae27wcddjqQl7rDItciUbaROuu2F4HHoXn+Wp8ImFUT55unOfN+u0EydCCL
         ajNMcyHbsUMGzd82Tc9MkH7zmnFMRGeYYwDWvaJX8XrbTwK9F9jtwugDPHUtiYyw8dBK
         ScN8A87nnK+zrK0ZE6NTMD3yYQSDKSDUDVSYCOB+Q1cezkye4bbkN6gH9EuugRFCByCM
         GrRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998767; x=1781603567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A73y2Pg16zM1/WvH9t48h/2ALu7N8J70iHXokd8IsZ0=;
        b=nCrPshPRC+oIv+/OWZFSlEIFfo+wGbSAp64tF6ic+FQGdvbDlwAkh8ZfSa15r32EJ+
         VA3a6vnb2gdT7SSZiWJgkoK1ihZrPLq89y8WRBYuXic2yPuu4huaJMXT0wZZsfCXwwfl
         eSzOKhGdrUqOuC2QvhWmXpvuZDFfCicSeZYDvrkI+RsXwXLpOvO3Q3xKyQGfgZ1p2K04
         3S4TCmyfWf4esk9hJgQqAtkGCZIPLhN1PgovMbxYQExvlR7GUMO3Ez2nhJHlrJOKvRbZ
         M7h7DC2Xh6g0AdFCqEiYQFv4JuG8QlbKc1nvJfbDzuEHheRI0x+3awo3gxKumk05dote
         LnrA==
X-Forwarded-Encrypted: i=1; AFNElJ9bCbki7nzWwJMEaD9PRUyHfMJzipXWsE3zDLUpjcVmlQ0dULFCxAvYxjHFJeA+OHC/V50/XoyP22fpHfrE0m8Z@lists.infradead.org
X-Gm-Message-State: AOJu0YwB/ivuyEfiGOfkuCkota9C47jy2WDCgVk1hq79d7INbi+Y3X6K
	GMK73UIZWieeMeyzxeES5KIjX0kr3hDEu09DtvAElrWJT8OZah7i41PJ
X-Gm-Gg: Acq92OE/ZMANzPBxQlTb00N1zYq2ib6UhR6z6+Dt2/xFF1U2sKDKIRcYlllpGVMKjwz
	h+yIMYpXrMif4uXztF/y3F5D/ivnwFJGJXN6s4Kn26wUOxXi/1rMm1oF+8Kr6hc/y/oXpnWbwoT
	erqSP4uwvEgnistMe/4kVsxsUbfScsZHr7Fr4sJMXH4IiaJH3YLrC7++6rTavxKfeUWJXyy5GS2
	wUuNDeL2a2NDdIHY0iGV8OyTvDq32/Zrc/Z17kteE71UUptu9ouYcaz2rl5+vqOimaXU0qW7nD0
	CFXELvcUUTm0L1c4KaK4HZNDbCoBKvxVHjgPOvYZVRtTDHekZ2aCEuqQR7+yQJ1UBadXA2qNM/h
	VotYTv+izDfs/KKXte8Onk3tksLnLXIid/hLzaEZ3hjMfGia/JwLpZodqwx0/lk/gvJ0ReYWVln
	hwUuHodMi4AmS3aOrdNxyd62vt6k2IUytGezYqFqAjBTSiOs6ua08nV6hJvrhz2ZHrdPTq7vX7o
	zljH1huud32fi8IrutjsrmXJNbvievLAPMgWVZ4knorOFqhUuHrlA==
X-Received: by 2002:a17:90b:5210:b0:36a:1ed8:6fe6 with SMTP id 98e67ed59e1d1-370f0b58cefmr18409046a91.24.1780998767310;
        Tue, 09 Jun 2026 02:52:47 -0700 (PDT)
Received: from localhost.localdomain (n49-176-80-106.mas22.nsw.optusnet.com.au. [49.176.80.106])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3713346cd9fsm13185172a91.2.2026.06.09.02.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 02:52:46 -0700 (PDT)
From: geoffrey <geoffreyhe2@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Tomasz Figa <tomasz.figa@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Weigang He <geoffreyhe2@gmail.com>
Subject: [PATCH 2/2] soc: samsung: exynos-pmu: refactor PMU regmap lookup helpers
Date: Tue,  9 Jun 2026 19:52:24 +1000
Message-ID: <20260609095224.1706036-3-geoffreyhe2@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
References: <20260609095224.1706036-1-geoffreyhe2@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_105259_294186_37C8AC3B 
X-CRM114-Status: GOOD (  18.20  )
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

From: Weigang He <geoffreyhe2@gmail.com>

With the of_node leak in exynos_get_pmu_regmap() now fixed, the remaining
reference handling is still awkward: exynos_get_pmu_regmap() obtains the
PMU node by passing NULL to exynos_get_pmu_regmap_by_phandle(), which then
treats its np argument as the PMU node directly.

Factor the common PMU-node lookup into a helper,
exynos_get_pmu_regmap_by_node(), which only borrows the node. Each public
function then owns and releases the node it acquired: the node from
of_find_matching_node() in exynos_get_pmu_regmap(), and the node from
of_parse_phandle() in exynos_get_pmu_regmap_by_phandle().

exynos_get_pmu_regmap_by_phandle() now rejects propname == NULL with
-EINVAL. Passing NULL was never a documented use of this interface, which
looks up a PMU node through a phandle property; the only in-tree user of
that form is exynos_get_pmu_regmap(), which no longer needs it. Document
the requirement in the kerneldoc.

No functional change for the supported callers.

Signed-off-by: Weigang He <geoffreyhe2@gmail.com>
---
 drivers/soc/samsung/exynos-pmu.c | 57 ++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 24 deletions(-)

diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exynos-pmu.c
index a5da2741852b4..ab19ad265aeb1 100644
--- a/drivers/soc/samsung/exynos-pmu.c
+++ b/drivers/soc/samsung/exynos-pmu.c
@@ -157,6 +157,28 @@ static const struct mfd_cell exynos_pmu_devs[] = {
 	{ .name = "exynos-clkout", },
 };
 
+/*
+ * Look up the regmap of an already-probed exynos-pmu device. The caller
+ * retains ownership of @pmu_np; this helper does not take a reference.
+ */
+static struct regmap *exynos_get_pmu_regmap_by_node(struct device_node *pmu_np)
+{
+	struct device *dev;
+
+	/*
+	 * Determine if exynos-pmu device has probed and therefore regmap
+	 * has been created and can be returned to the caller. Otherwise we
+	 * return -EPROBE_DEFER.
+	 */
+	dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver, pmu_np);
+	if (!dev)
+		return ERR_PTR(-EPROBE_DEFER);
+
+	put_device(dev);
+
+	return syscon_node_to_regmap(pmu_np);
+}
+
 /**
  * exynos_get_pmu_regmap() - Obtain pmureg regmap
  *
@@ -174,7 +196,7 @@ struct regmap *exynos_get_pmu_regmap(void)
 	if (!np)
 		return ERR_PTR(-ENODEV);
 
-	regmap = exynos_get_pmu_regmap_by_phandle(np, NULL);
+	regmap = exynos_get_pmu_regmap_by_node(np);
 	of_node_put(np);
 
 	return regmap;
@@ -184,44 +206,31 @@ EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap);
 /**
  * exynos_get_pmu_regmap_by_phandle() - Obtain pmureg regmap via phandle
  * @np: Device node holding PMU phandle property
- * @propname: Name of property holding phandle value
+ * @propname: Name of property holding phandle value (must not be NULL)
  *
  * Find the pmureg regmap previously configured in probe() and return regmap
  * pointer.
  *
- * Return: A pointer to regmap if found or ERR_PTR error value.
+ * Return: A pointer to regmap on success or an ERR_PTR() error value;
+ *         -EINVAL if @propname is NULL.
  */
 struct regmap *exynos_get_pmu_regmap_by_phandle(struct device_node *np,
 						const char *propname)
 {
 	struct device_node *pmu_np;
-	struct device *dev;
+	struct regmap *regmap;
 
-	if (propname)
-		pmu_np = of_parse_phandle(np, propname, 0);
-	else
-		pmu_np = np;
+	if (!propname)
+		return ERR_PTR(-EINVAL);
 
+	pmu_np = of_parse_phandle(np, propname, 0);
 	if (!pmu_np)
 		return ERR_PTR(-ENODEV);
 
-	/*
-	 * Determine if exynos-pmu device has probed and therefore regmap
-	 * has been created and can be returned to the caller. Otherwise we
-	 * return -EPROBE_DEFER.
-	 */
-	dev = driver_find_device_by_of_node(&exynos_pmu_driver.driver,
-					    (void *)pmu_np);
+	regmap = exynos_get_pmu_regmap_by_node(pmu_np);
+	of_node_put(pmu_np);
 
-	if (propname)
-		of_node_put(pmu_np);
-
-	if (!dev)
-		return ERR_PTR(-EPROBE_DEFER);
-
-	put_device(dev);
-
-	return syscon_node_to_regmap(pmu_np);
+	return regmap;
 }
 EXPORT_SYMBOL_GPL(exynos_get_pmu_regmap_by_phandle);
 
-- 
2.43.0



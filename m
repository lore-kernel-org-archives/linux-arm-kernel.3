Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83321606AD7C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WMT3O1iU;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S4ozr7jE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=; b=WMT3O1iUZ8iojB
	B/6+5vfsZ+aC7jYppuG8xy01lP6Uw1JwbsIt0naJ6pU3yzUpsffGQyvuOeafvWtWsHFMVsmxQrQL3
	0Ubg/NJ7AMvfW5JLt77SFK69Pqv+oNpB6NIH4w4/jq8iv5dWvsmJ3jbe1SLAdLsiPJTgA8wFpvaIq
	j2vQtGwEY+JyThD2FQJgzWJREr9vquaw4OlTLEoRFIHrvTnygHjaIh86VFbix/T+w7W0QK3tGGxwn
	7v9fqIA1ikDyMPYH6ji6pK2KGPyW/IFK2AlXaUxPbUxvROjW21ikAh4R3g7S1z2oMm8lc9qYhLMsq
	X5UDeJQVlIrIud8EEgFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8b-00000002oIp-23C5;
	Mon, 26 Oct 2026 16:01:29 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8Z-00000002oHI-0hfo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:28 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso472374166b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030485; x=1793635285; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=;
        b=S4ozr7jEU+rTifiGcAOZ2h2AtWT2UPbJsxtqqvmXJpWmXmGD/N25KyPRZGonYMVhOj
         hOLM3yf45WKyi0xMPJ1sltaaET858kBXoYvlkPqBDtwweMqCnTH94KfAd6kAaHrPyuiz
         XK22dpHJFOscB+unrPlyr3bYLIg+D10WkOPISgS4e59DA3u+fvtjv8sINzBVJTl4L4Bg
         rSrkgx1UrFSGVfmPt3UAYQY9/b0yIg3/UTmGyuIQBDIZwQTQWfVoz3mC10x98s+cUfZw
         en6TPnKzUpSS4Z/liLOFjLgY861ZlIRLdi4wuYK9GjoQC1IluCkVafSBRSO+CxtAfSNg
         wy/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030485; x=1793635285;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieFDF25dHP1edNybu7K5/jDCEdFup8w+Bgydwx+0E/0=;
        b=CudX0NvzMSxbzywdnaCzspH4ZwE+LhoeICngeAv0cUhfie1WBbUNiCybno9KnCIWmD
         fFAaLklTRyUlMr4X/cajVsLQTgJ4npMxTJG9svQzgyJOn2RiKIBsnb9QYvJeYZ1Uj4Xl
         mwTkLTMgySVG7FGRh96ARI7Bf8dkuEQaVHRB71f5et1f2lG9H+V9bvPeVcA4LaIerYm0
         jnYogFdZ3EWBms3UFD1e/ZF/zv/nxIP6s1N+RDM4wcelFDIN1pi6PVETaLARecrmmwH3
         NYxIieHJdxeC8aFgF2c3kAw1AFNlkz66QpFWYO8ftmdkd4FDrJNFr2hMg+GViN5yIExh
         5bxQ==
X-Forwarded-Encrypted: i=1; AKwUvBytT330fEyOScv4LDgYfgkbwPtmHubGZzGWj52tRZSTMsiXHNQlDXC7y4iSDwkwghyaSfcjldQnGinVdxxrO7mT@lists.infradead.org
X-Gm-Message-State: AFq9FYLy9hMGtIQcggoFEgiyedlQ21qY856aDjHjBAKCzzJL2sQUXx8p
	OQEoA8De35lwaCCMsZhdP3f7cv8yTi7EDTWcLalnhhKYE17CKRqbscb0s6c+O2rzC6s=
X-Gm-Gg: AYBFou0JuLOXUg/RnDTCuWosBdGkYScUg06ksiboRiLjT/4T3u5c3xjmdHjAK1WG1m4
	efx4/DLCmQPgfA4t1BwVp2zdvTCXNHyixWS3ECGfvueEdoHO7YTdF0t+VmNBBX1SODdN1Hbp7Q9
	QEePMrUT/GnGX7DA0/alODc9Ke9nF9I6pJGYxlVzOTToRyW2Wp3TMu7Caj5T/yA+6faTHzIPsG2
	ZwUb50fibUmL+kp8I79WftVorZe3zRMerJegeaGVfBVZaGLAfqqKmOrIHNk11I+Mv9feJoMLAae
	zcFUz5EMDYXIR4s9WmSt9mFkCSd7ef1h30X9p/1+PwXPFmvEhJBWwRfDZ15hcRuE1vaiuzRV7Gd
	zkkgnO9W/zDkZGxyDqkGEGS8lClpfKH6PIW1JUmDpQIzp7xXneudnwWl/r9MKfI+71uBcJxY6Vt
	7q5x6gBGgeChTSRnr4pgoYZJTEC5gIx+U4tMmrrh59BRhOhkrelAOPGrjYbng+TBNnXQrLUgWwZ
	RbA8HQzOQafXcTskcFRBPG/3Ip9QLs4b3PkN3d8WcWN+HK1mXTdhqeFI/xFal92pvy1WZWJAjOV
	la53uJa2/Qwjwzt+4ABCv0B9S+gV+hAXoYqY
X-Received: by 2002:a17:907:94ca:b0:c3e:34fa:611d with SMTP id a640c23a62f3a-c46bde7eaf0mr1008564766b.35.1793030484647;
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:24 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:18 +0000
Subject: [PATCH 01/15] thermal/drivers/samsung: Select REGMAP_MMIO for
 EXYNOS_ACPM_THERMAL
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-1-0637431b7268@linaro.org>
References: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
In-Reply-To: <20261026-acpm-tmu-fixes-v1-0-0637431b7268@linaro.org>
To: Daniel Lezcano <daniel.lezcano@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
 Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Juan Yescas <jyescas@google.com>, linux-pm@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1279;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=+KG/D0KvZbRCiAETwTUCvZNQ2kPMmB1TmI4WJYpa5dI=;
 b=2yYo0FGBL9w+ojSMILSlcsZfUlNX7O+SioBKk1y25nYproZ23ihVuFC9rL3cKbPnDkrkXyVRX
 NrWjK5uLAq8B/i+SeoGzPZ+7+BlB12MD0bUop+iIEYL7ezkPiyFgupH
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090127_239436_5A4E9033 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

The Exynos ACPM TMU driver calls devm_regmap_init_mmio() in
acpm_tmu_probe(), which requires CONFIG_REGMAP_MMIO.

When ARCH_EXYNOS is enabled, REGMAP_MMIO is selected transitively via
EXYNOS_PMU. However, both the Samsung thermal menu and
EXYNOS_ACPM_PROTOCOL allow COMPILE_TEST builds with ARCH_EXYNOS disabled
(COMPILE_TEST && !ARCH_EXYNOS), where nothing in EXYNOS_ACPM_THERMAL's
dependency chain selects REGMAP_MMIO, resulting in build failures when
REGMAP_MMIO is not enabled by another driver.

Select REGMAP_MMIO under config EXYNOS_ACPM_THERMAL.

Fixes: 50a2c5d4062a ("thermal/drivers/samsung: Add Exynos ACPM TMU driver GS101")
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/thermal/samsung/Kconfig b/drivers/thermal/samsung/Kconfig
index f63eeae304b7..18ab4ffc8671 100644
--- a/drivers/thermal/samsung/Kconfig
+++ b/drivers/thermal/samsung/Kconfig
@@ -16,6 +16,7 @@ config EXYNOS_ACPM_THERMAL
 	depends on THERMAL_OF
 	depends on HAS_IOMEM
 	depends on EXYNOS_ACPM_PROTOCOL
+	select REGMAP_MMIO
 	default ARCH_EXYNOS
 	help
 	  Support for the Thermal Management Unit (TMU) on Samsung Exynos SoCs

-- 
2.56.0.257.gf7497c7d27-goog



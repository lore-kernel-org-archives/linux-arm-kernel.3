Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE608606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1jI9WVap;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=a52g/HHC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=; b=1jI9WVapKrRfoC
	vukH5tm5ty0uiVHe/bw5pYetAd75XcyHfKnmRzKUscBcxQYkTJD8S23DBbO8NcFuV37JquEFe4dO9
	0pcJlOk+xzV55zosPsHHmaNe8tBG2YsS8sjgFadeZoysqJ9FF8djjXpffJvYp0I7oKEZe6Wyu8py9
	fuqKA5lN4vlyPQBC12IC2qRd6sq3c4RQ/pUifD+Z8CLfYiwfCagbONFpqNABuRB+IIxPvb8A38OOO
	HFVAv65INtf/HZIJt8QPG3zHzNwd/Rk3DYKH2ip6jTxlgcIEGUinZ0fzeusN8wefGEIdpLKreukP/
	HUmr9MrWJxnfZSO0V9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8p-00000002oV0-0dTL;
	Mon, 26 Oct 2026 16:01:43 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLN8g-00000002oLq-0AKL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:01:35 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c3f8d72d7ceso487770766b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793030492; x=1793635292; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=;
        b=a52g/HHCc81L9JwW75kd2IKPmt/UXobn0DmdiPQKkWuXYEREn1/2/llmsTQznbQZXT
         QTIb6++GoqJGR7ONStFq/x/J/EFnGzkspjX9xShJKi0GpcRDRZuM9TYeGt9ua9H1BAqU
         Rv28IyHXimP3RuP/zm59hYe5Gt/guMpBmjyDLRYXSkvRy3Su7h4jh8gPWnfdZAE9iUj6
         4j4V5fflnsnW/mTTjiyuFMud8nfcNqscQ/Oz6FzM6PLqO6FhM2pj46HQ7nGg5g9+Inp0
         HbYD4pLcCJX3ktwlheWw5aLyVSRDRQPv+vfK6ASD86g/sgU40CRyy03A8DgqU4gxE5HX
         9gJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030492; x=1793635292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3sKvuhBViiGlLU3TkCVl1Keg1pObMrKBIESSV0t2zI=;
        b=ZLTiFos6crj0jVbfmKIfhj0V4mte7ltebC8rzHRQTIqqgH6EvBBQquUFw/QW84mGZ4
         XA0neiWmwQ/zAq7ZgaLmgE/RELcIovmhTWpNzYFyv66AMOf/UcX/DQfG520G6QHKqLOw
         SwB9AwH5rykCFujlLnYwJTaTtZBtCMQmI56KDe3IRabt6K2fSbJPA/dC/PTIkorCGglD
         bLGZIhLQZQah0/16QmTZ/jb3sv5LGCl5Q2n8T5dLK0K+2AcDuj6kQMzZMEs17iPUAu9G
         IQ477J/cYysHgRRi24pq1vKAW5+efyKh1gbTLHmKwizICXa5z8ntYBJTgs43w+vo+n7i
         LZGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWdYKnyyxeBeFHulWC4lNPWTTYN7orGmcsoOg3dK5cm+KB9ipPkpjFaQuE87O2gUG5bgUWcchfd7QJq1ADa3nn@lists.infradead.org
X-Gm-Message-State: AFq9FYJGTaMSCqonOXUuw0j1a9TR5HqtsZafE7IcVlzmBkJvevDkjjtG
	8ELF9TZf8INItclKy9f6VLkYpmV/xY9Y8U6JOhwKEgLuj7UyXmWNO46P/oUSik+TTWc=
X-Gm-Gg: AYBFou0fpf1IkWWxRVl1DUKo4ZU0kcWbGbOsK3/qfgzNBMKtD0e+6y+Dt7IXVOCm7Mv
	0r52zxulgqU5Kxb+bXuvkpKPYDydYmWef6hHCaTRmoLXGCl00kDwSX/Db5Oi+/LSV7wxmcn1KYG
	mKAvmL3IcpZN/sHk7Q7WrEArlGYgvFOPk14a+fl6KvwDfvt6u62m+ItJON4Wciu/del3N4gGL+R
	iBeqUub9Cd+/3wLfRxm4EQ3wqEVeyvX0t+05P8LaUYasjxNeXmTX0YC/jnZqaUlHh0VUWNvC63t
	opg42yS1Os+55auVx0uF/Gs59Tk+M+WvkA+RF4+mCQ5AN2/Ynn7CWPP/SP31JNogD3lqxHwoGSr
	rET2R+Mm7k133OBMFUA1QypVNxh27jL4Uqc3pQF+gQMtlypmQXY3yt+mmgwF5+lRoZUXR26p6UP
	Gy33y27oN3uJMUU/0txetXjDr7heti/JtHQWHYFgMv7mlsYP2qaVnoAixiXFV/LjGb4SNh0PxqL
	wsH1T6G/2etWbgL6ianLSDgyFHxt8iW4P6nox4ae2ySavktme0VTAWN60ampjpAlHPYNaWxaxMA
	Ro2PHv8x2zDZJlInPs7vco/bFjr1rrHGrdDf
X-Received: by 2002:a17:907:3f1e:b0:c3e:d0ca:d2fd with SMTP id a640c23a62f3a-c46bddaefadmr876184966b.12.1793030492156;
        Mon, 26 Oct 2026 09:01:32 -0700 (PDT)
Received: from ta2.c.googlers.com (231.141.38.34.bc.googleusercontent.com. [34.38.141.231])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm17307466b.23.2026.10.26.09.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:01:31 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Mon, 26 Oct 2026 16:01:28 +0000
Subject: [PATCH 11/15] thermal/drivers/samsung: acpm-tmu: Rename platform
 driver to "exynos-acpm-tmu"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-acpm-tmu-fixes-v1-11-0637431b7268@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793030483; l=1029;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=kKFEY7/HvEq+100xRnR+XskO/ds5n+vISMebLJ4Xmr4=;
 b=ec7B0504Wi6Z8WS8KfhDktthnTx3XbHQeg00S34wCbflTe0KQVBU5L4yBFWkH1RAfbPukMl7S
 +PP33+KjN88BE+Y3NUBrjPmJBAV/M7X3mNPO26BGuX5nceHOnSZjuZL
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_090134_105594_B44BDEAB 
X-CRM114-Status: GOOD (  14.81  )
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

Rename the platform driver from "gs-tmu" to "exynos-acpm-tmu" to reflect
that the ACPM TMU architecture is shared across Samsung Exynos SoCs
(such as GS101, AutoV920, and Exynos850) rather than being specific to
GS101, matching "exynos-acpm-protocol" in drivers/firmware/samsung/.

Suggested-by: Alexey Klimov <alexey.klimov@linaro.org>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/thermal/samsung/acpm-tmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/samsung/acpm-tmu.c b/drivers/thermal/samsung/acpm-tmu.c
index 42b338d8d093..2324efcffb84 100644
--- a/drivers/thermal/samsung/acpm-tmu.c
+++ b/drivers/thermal/samsung/acpm-tmu.c
@@ -597,7 +597,7 @@ static const struct dev_pm_ops acpm_tmu_pm_ops = {
 
 static struct platform_driver acpm_tmu_driver = {
 	.driver = {
-		.name   = "gs-tmu",
+		.name   = "exynos-acpm-tmu",
 		.pm     = pm_ptr(&acpm_tmu_pm_ops),
 		.of_match_table = acpm_tmu_match,
 	},

-- 
2.56.0.257.gf7497c7d27-goog



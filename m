Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5388EEB7EB6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 10:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uakOWlLezjhnuaH8mro0N46VAkqU0tG4gdp3L9C60EM=; b=zYIhGZxo3x4oOhnsqFf9uZiH0E
	4QTWBQNjQUVcV5UfkBF0/ADeBKLjyOcq7QCDjQSsiUXpWnkYUFO1bWdJe56DGrn/LCVUnaaABYyP+
	otuyL0fEs3iYYL4uhVf+g8oKwQx/xmUWR+V3kmLhzTDL+7Epg6rfkNpqmNai9NA0lJ47cJbcYcEQ7
	FzffJwNMOlvOs7R9bgJmbuPr3QU+1IiHBP6Nu43aLmVC2p9Sa0R13973jy/RwNjag1UBUD567P3Ue
	GcmWVBJiqweIJP7IusCXPt3v6xgO8nrY/lQHILT4ffBpLQ9IIzKnTE6OasBJ4vt7letha29cdTZUU
	Dy3NnxKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjFx-0000000Gxgj-37DO;
	Wed, 04 Mar 2026 10:15:05 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxjFu-0000000Gxft-4B1T
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 10:15:04 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-38a29187394so13498041fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 02:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772619301; x=1773224101; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uakOWlLezjhnuaH8mro0N46VAkqU0tG4gdp3L9C60EM=;
        b=u70zwNeqq99262jYlflMjTvY5HcsinQET5dM92TvcKpWeChJHIJ0stK1kq5GKxdg5v
         P2IJcm9YN+25CoOnfdrYbKaXMaFXcNk/7i+Taj9s2wQa3uMF1mM+GZSF9hvmQGDs875/
         QZTva1D6pXjwgvqiL/cunMJugi1jN+MrzR1TFQhir8lp0RRCJ7ESvVSOcvovvHGc+uFG
         8/sXuaxlzbuwkStwueVoy8mF58DiMF8eV4VI1m5qkd1o4AM7dJ9hRcJD7qDx0gprxTui
         blpEc9de3rBOQOkuuArXmBp4zpow5KHulSai9t+VLjk64K/NMkRkvqIzT7RpRBM7S9kN
         iSRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772619301; x=1773224101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uakOWlLezjhnuaH8mro0N46VAkqU0tG4gdp3L9C60EM=;
        b=HQtX3oXQZvvuX3zilNA+LpsOtyNpJnHkD9beqd9XDmnJQEWmtPKapwE18WR/UJXqZx
         YvO11KXGaS9xX3mr3nCyabavlGvPFFM+vFhWjC9V4cfI9NmH57BQNTJgETE+YmNQcsvV
         pt1KIYLIee0yjJg84XwVv1iEF91/VpNf093biXRlabO2uvrlEuPPSG9MQDuLO96cHhA/
         jkIGnRph8MsQGET5AAAYdbatW2S5tgJxHNXNR2VWORBG5iX0zlbl58Mp+AHjWf5yG4nD
         D51GSB3AP3U0NBrZOzheN+9ddxCWaOlISYzmIGrACulAy3/7H74ms3Q18gql0/dMoxDh
         HNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj17DmmWRNucAd2ZK54/SF1FKlK5geeoh95KIE5UGr2SmoVOJsL8k/yMoSt29SD50LG5eUH5x3kOlXDRVIKgm6@lists.infradead.org
X-Gm-Message-State: AOJu0YykvDlBgtxiOpUg4rkZB81xZZHkHzXmxuSaaWlkfoc/A72IY0H9
	4u7YD5ARviD16xjLyqo5FST0snmnyYcRRwM2hnQcS6pdE80OSyDfg3mhi+NnC54pI5SW7C6fL2t
	Hj63NQj4=
X-Gm-Gg: ATEYQzwNzZjPo7pUzEVTi6jNqUGJphROse3Ncg8z6uITGc2AqF5t1gEVAls91i/JWpU
	f1sL+dh2ekA4+rPfooC0aXq/bytRO0OzXJjwTzDHqtyChLaRqEA0+ROHgo6rlOYK/FjaFVb2xLQ
	C7YaueaPZmtj7Yef+i7rWFLmuzvjvtuocENhvKICk5p0uKwNX6WFmv2LQ5Z/N+A1LMVjCrXQUFC
	dQjrroO8jNWAFjvuYtmVNyx7KxJnx/PxiOFUNOgE5M8cGZHtwpD0xmY12gZO+kRfCPVMeHinX8i
	xNTrSKz+Ni+XE75PAUBxBurtjhmAZ9B+pUesqkmdTWCC/5eW4XLQpfYTBY2cnF1Vpt8PiK1zXWC
	PW1zQycOgeOFna5W/ieXavgTl63liH1r5JYRPUm3MdaTqke/fLJOWMAyDmm5a72qfzawKd01Bqw
	gR+2nRGFzQxvx3li5ab5cdFOujlOfnTCAuYlswmUep4DPVJjvRFX0GEuz7uHLm+PqcBSGh97HT
X-Received: by 2002:a05:651c:1509:b0:386:91a1:f1f2 with SMTP id 38308e7fff4ca-38a2c55fac0mr11929111fa.7.1772619300617;
        Wed, 04 Mar 2026 02:15:00 -0800 (PST)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a123573db0sm1200985e87.67.2026.03.04.02.14.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 02:15:00 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pmdomain: arm: Add print after a successful probe for SCMI power domains
Date: Wed,  4 Mar 2026 11:14:57 +0100
Message-ID: <20260304101457.7470-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_021503_086187_FABC1313 
X-CRM114-Status: GOOD (  10.37  )
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

It can be discussed how useful a print is after a successful probe. In the
SCMI power domain case it's seems valuable, as it let us inform about the
number of initialized power domains too, which is fetched from firmware.

Therefore, let's add a print about this, which also aligns with the
behaviour of the SCMI perf domain driver.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/arm/scmi_pm_domain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/arm/scmi_pm_domain.c b/drivers/pmdomain/arm/scmi_pm_domain.c
index b5e2ffd5ea64..5454faed7d5d 100644
--- a/drivers/pmdomain/arm/scmi_pm_domain.c
+++ b/drivers/pmdomain/arm/scmi_pm_domain.c
@@ -113,6 +113,7 @@ static int scmi_pm_domain_probe(struct scmi_device *sdev)
 		goto err_rm_genpds;
 
 	dev_set_drvdata(dev, scmi_pd_data);
+	dev_info(dev, "Initialized %d power domains", num_domains);
 
 	return 0;
 err_rm_genpds:
-- 
2.43.0



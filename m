Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6DDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 17:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sNq0f4XftzS2xuukWCisc0SEMMCFATHmfoybwHMaJnU=; b=Gm3nISCEK4Oma5E+CfOy089HIi
	h4rW0c9LGNWpbNFuts2zVkXNKFLfFHOWQk78+WfU56VjdAn92xmJPxua6kUsOXYuZzZp2MTPop/a9
	btDrPlgqV9N0s9zhQZzHX4qVLWsjudyE8UAFfKxly7wED5ScWRsrbOEkcX5RmUtGFU4zZ12Cx1GqF
	Je1xP6t2s7904fI5yhdirQW2EwyJW54r5M1gvgQzRQN7QYss73B1m1FJFTzlIFepfNPgiCeAJGOEK
	TdiMOr+jJZLls+H9vrUgWjRWx0m9GlIETG10pj4n6We5tDHwPOokV6rKwkIi7pUyabeWv9Db4uMVY
	dRr+GwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIw9-0000000GSR8-2tJG;
	Fri, 10 Jan 2025 17:36:45 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWIuu-0000000GSEU-3G6p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jan 2025 17:35:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21669fd5c7cso40118015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jan 2025 09:35:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736530527; x=1737135327; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNq0f4XftzS2xuukWCisc0SEMMCFATHmfoybwHMaJnU=;
        b=Bb6Un3R7KjvqPYCjYy9tLqdPqnEN6EgNP3MRc2dNMiB7fjv3mIHcXDAAxeD7RAIIEO
         CiBHiBNBRBosEBVyDcaAI/Z4f9DXvTSnEykpS7knwllGm8N3oCJbQaQ5KrtbgY6WsSd3
         8TWSbs1yOL5MEh7W+6w4KRSgCrmzGt3vUBVZ8KUgcqiYD/tpEGiCO7STQOTObzZQzf8P
         JdpwwMb8+TnU8qEyJSDLXHQ/0NZ65Qa/qhzQZ0gDar1fFBdbRKnXeGzizDFe+NsK1drO
         Q/WIPL3t/3JroMc4hjUCwh9HRqoVHsvsCfQby2sOTkldl6E8gmwflE5ICutMooiofVfj
         cv5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736530527; x=1737135327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sNq0f4XftzS2xuukWCisc0SEMMCFATHmfoybwHMaJnU=;
        b=u/GKxNwbAOIEgOKW3zh/GQc4NuFvcqN+Z/IS5OavKNlC0Q8er6v31tMDn6pFdrPgd2
         HhWTvhgxI67UJ8ePKngTX4aZCys0MnqEqdUTMq9HK+gd3t3w8mPib85fcviREdLLqwLQ
         bOtKmqnLNTW8Nt+vO4YtAueUDuWju4b11c4SFZ2Pj0NX+xrLLtMIRPAOR6heuOqbf5IZ
         7A0aqczJEeEczgwE1HZQHzcegOChR/jfQVO8M/sx/KVXOYWe3ppBcAyieXXjCnOeO7O5
         vYcei8ZOmLCfe4b8CL81dcCQxC0sp96xtZ5J2biZ/amyCRyriAeDliDoxNbJ8FINYBIW
         yqbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXMkw3YaRobYeXz/UpxM7XCx4AkUKy8upjWucuE24AlfDMb1HRbDpeaKPvet331dXtuvp5+vmm4tRNn62CBjc2f@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9+NP1tq/heuZXdnk50bXauGnisnlFPiK3PJ8DBObV+2tk+his
	qoFpV+kOn6Qo/tCdv5dcdRgwahj4pKEW54EyGREnFobbSVXx/6Fh
X-Gm-Gg: ASbGncvKiACS9wg0M1sksR3CaMUekmKaCe17TCgAuCo0wx/Qho9GXP2VXWtFL/E9HU0
	A8tTk9+sYQEka85JzPGaRqFvRbMn0DRyJgExVJt9kTbfLKEWAIeUKj/Qo49ykMIz8U7XZ6PYl+e
	lKoKTo6cPmI+4lNatcOx+GNKP1QVCKD3eC7QUO411c4vCIBsiEvzXTaBqCh9Px/VulFyne9+Bph
	VIDKKdCGPk/M7C+wmqMiYLSoYfdJEzXMWFCewVYWGjnI20q7mrTs087qpf9sBbM7hR3GK87PUa0
	IkmH7Q==
X-Google-Smtp-Source: AGHT+IHz3J3zjghGX0Jx5hU6nlWiQnwp59UrsYV6wKHypX5OcQXwxsWlNvJPg+GwCc78s1/h/I9Flw==
X-Received: by 2002:a05:6a00:1152:b0:72a:8461:d179 with SMTP id d2e1a72fcca58-72d21f161a7mr15449756b3a.1.1736530527393;
        Fri, 10 Jan 2025 09:35:27 -0800 (PST)
Received: from localhost.localdomain ([121.185.186.233])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d406a94edsm1839963b3a.174.2025.01.10.09.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:35:27 -0800 (PST)
From: Jeongjun Park <aha310510@gmail.com>
To: cw00.choi@samsung.com,
	myungjoo.ham@samsung.com,
	kyungmin.park@samsung.com
Cc: krzk@kernel.org,
	alim.akhtar@samsung.com,
	linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jeongjun Park <aha310510@gmail.com>
Subject: [PATCH] PM / devfreq: exynos: remove unused function parameter
Date: Sat, 11 Jan 2025 02:35:20 +0900
Message-ID: <20250110173520.78464-1-aha310510@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_093528_809710_CBA5BEC2 
X-CRM114-Status: GOOD (  14.13  )
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

exynos_bus_parse_of() still declares a parameter struct device_node that
is not used yet. This parameter is unnecessary and should be removed.

Signed-off-by: Jeongjun Park <aha310510@gmail.com>
---
 drivers/devfreq/exynos-bus.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bus.c
index 7d06c476d8e9..b9ea7ad2e51b 100644
--- a/drivers/devfreq/exynos-bus.c
+++ b/drivers/devfreq/exynos-bus.c
@@ -236,8 +236,7 @@ static int exynos_bus_parent_parse_of(struct device_node *np,
 	return ret;
 }
 
-static int exynos_bus_parse_of(struct device_node *np,
-			      struct exynos_bus *bus)
+static int exynos_bus_parse_of(struct exynos_bus *bus)
 {
 	struct device *dev = bus->dev;
 	struct dev_pm_opp *opp;
@@ -408,7 +407,7 @@ static int exynos_bus_probe(struct platform_device *pdev)
 	}
 
 	/* Parse the device-tree to get the resource information */
-	ret = exynos_bus_parse_of(np, bus);
+	ret = exynos_bus_parse_of(bus);
 	if (ret < 0)
 		goto err_reg;
 
--


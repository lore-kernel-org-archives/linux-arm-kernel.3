Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57406C02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 06:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LChxgmsrm+IsRJfStzI5DKSDQc5PaCLSyKr6GH2r5K4=; b=ESWk+5hlZLETFiR4KakvorhRRS
	u1WcYLBb+odWcZRqkgcuvGAhaiHeDP9jnK0F/DzZZ9X3pYHVapb1G12a+L5JR0F7gsUFGp3bpcke2
	UQEp/+Yh9UNLie98QrwUxUonW7qR4rjrZ8T+cjyqM93ja3xKRJcmnMZc65ETTL4YRd9cnyp1FO+ID
	aHeckkRnSSdw1KkmvLpaX6TqzBoJmLkL117UQM+W6z/LV9yarfZGdevoSofdOcZ12H2SSq554wqGy
	Xm3oJggMsyWgjFQOJPbmt3tCyM94L0mQ6JvnXSYJZgLSQDOrtN3SauuHRNcv4w3gAKgKIWlLbsvP8
	zLqtCt7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUcP-00000009Xyx-0tfz;
	Wed, 22 Jan 2025 06:53:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUb7-00000009XsA-3IMQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:52:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 943F5A41ADA;
	Wed, 22 Jan 2025 06:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0406FC4CED6;
	Wed, 22 Jan 2025 06:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737528740;
	bh=OPbsc/iFv+2Ie29vvqz4aZo2VNR5oU66zmiFZJ/qliE=;
	h=From:To:Cc:Subject:Date:From;
	b=g7MXG8LNQQL6ft2UljHLXvXHYXHRqCsOvHdPGACtnPEXsD9ACk2hnVntQ1oltCIcT
	 OGAKLSXmNGDRcU4LSmJBCsLd07rtEYWD+zw/w4MGe7snncwAdDQpJmhWz6Z7fqJgEl
	 C5td6s+M6Tb9MFf7hj17JTo7SAUUmHAikXM5ZsffJ6S5zClVju2Gbckcl1IRs/hoWF
	 s+qefllLgSCQjykcNc9G9FDjhWYWvrYMk5Z9xmYuTLgmCbAVQE7C/+bP8PeyNEF0Br
	 ezBDQwYSCFPWaOdg9LvexShaq2cwy7RQ33zgyytS9u3nbEYcL6loZALs7p6pL+SrTY
	 y3aHNPNFBm4QA==
From: Arnd Bergmann <arnd@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: s3c64xx: hide unused variable
Date: Wed, 22 Jan 2025 07:52:10 +0100
Message-Id: <20250122065216.1371158-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_225221_886205_9A5E1787 
X-CRM114-Status: GOOD (  11.55  )
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

From: Arnd Bergmann <arnd@arndb.de>

A previous compiler warning fix extended an #ifdef block, but that
led to another warning in some builds:

drivers/cpufreq/s3c64xx-cpufreq.c:27:28: error: 's3c64xx_dvfs_table' defined but not used [-Werror=unused-variable]
   27 | static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {

Add yet another #ifdef check around that variable.

Fixes: 76b218721e5f ("cpufreq: s3c64xx: Fix compilation warning")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I wonder if the driver should instead depend on CONFIG_REGULATOR
and drop the #ifdef checks.
---
 drivers/cpufreq/s3c64xx-cpufreq.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index 8fc43a74cefb..9cef71528076 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -24,6 +24,7 @@ struct s3c64xx_dvfs {
 	unsigned int vddarm_max;
 };
 
+#ifdef CONFIG_REGULATOR
 static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
 	[0] = { 1000000, 1150000 },
 	[1] = { 1050000, 1150000 },
@@ -31,6 +32,7 @@ static struct s3c64xx_dvfs s3c64xx_dvfs_table[] = {
 	[3] = { 1200000, 1350000 },
 	[4] = { 1300000, 1350000 },
 };
+#endif
 
 static struct cpufreq_frequency_table s3c64xx_freq_table[] = {
 	{ 0, 0,  66000 },
-- 
2.39.5



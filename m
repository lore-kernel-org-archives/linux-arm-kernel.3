Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EEBC02185
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 04:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FW6GDAHddcOMPFKJEakNdIWoZuUyT1szsyK8VMgB8Uk=; b=boc+dgAexHIoOwoiwgN1pbpUSM
	9qcjoaXbYyXZ7KWWMW1PXfRywIQB+k92HDK7boXzku56d47tqcG5LdRfnPGDGNxxY3mnPNOS8yXfq
	N9VRAAjYBkg3y40nxHyHj2jrMfxKRaZxVai09uI9n/W9FJUMDiXTApN7R653zFD4GVCPrmmkV1ED6
	vv58FbPK4P4rxAynG2s/wysnpc8okxpocOPM8IQEy2rYlunQeroBPTsHk488Hez2gGRvN5q/V8y2c
	22cp1FgFQvrnJ6U+ZzbdcjiaFdWV8zL41PucRTxLsh3pijO5I+ALOseo+/Y7xHJtD6QzyprPxuS1T
	JpBu6wEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZjlS-00000004jh0-0q0R;
	Mon, 20 Jan 2025 04:51:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZjk9-00000004jXB-40AZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 04:50:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21a7ed0155cso62285255ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jan 2025 20:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737348633; x=1737953433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FW6GDAHddcOMPFKJEakNdIWoZuUyT1szsyK8VMgB8Uk=;
        b=Rz/OGVwcMYQ+rv8yNt/8AMP7EoItjzkBRw16TwtLj++Wl+i4ZA5U88aWg7h5Kzyy14
         Fp4Q7JiNEcdPS6BXFQRo4rImm8ONCe6jUs/kEDSj+R4uybSRGziAQZHT4aPg/wKOzV8g
         je6OiLxRM6kYbAxXuS85jJQBWVIs+ewMSeonA+08iwZkkCFrlkngGMcbTgln8rCAUQL5
         s65kXx6uy6Vao2+uvI399erJjMvon+vOJXkpMf7RXShOEnAtOGhtfTc0YYQmjD6Y8Em3
         XezETbsaDojgK/VZGjGiwA16vr5rChdoNucIIXAgKJxkAtJ3MZ/4P4EULu5IFwoJplzt
         WWFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737348633; x=1737953433;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FW6GDAHddcOMPFKJEakNdIWoZuUyT1szsyK8VMgB8Uk=;
        b=nivfZcq4Hk/eRPOb5glgprS6E8cw1hThWuW67BQS1Lh/aUA7YCPdn/uAwEOkAzTEix
         ADleCMsZEQkSfHlrfTM5nw/aOGuY0T5Ed9DZp9JAoMkFK5RGMt2dEuKXkHpZbF0LXJO8
         URER6yGUREVnM3Ja0IT+agkBue+46Qe3l6QjCAT3bpyO4ZEawgnMvf+bHfH9VBMfUFTz
         XUoj4uODxGx+dyWJWv0pjZ0lIrdrE/QIBn1rw8UBcbRLo8vY6UulQT4+6vIeirsmUXJ9
         nN6yVtAD2drZwlxJ8CoUqNewoIiHCSsBfAKTpeT6fXWeBcUlAU3QlevO1dt2t9IWkWaj
         990A==
X-Forwarded-Encrypted: i=1; AJvYcCUEvDn4LaXmvTB06Q+hdx9q7n7AzVCOLAvu5etixjfEyTyOBB48Q4JdVd0P0A4HgF9W+zini75eknNC8BkRt9T2@lists.infradead.org
X-Gm-Message-State: AOJu0Yw61QJo13UZwGs0n1jlF8hXcG4G5rKa1Ku/bii7zC86NjX243u0
	ay3hdk8qcETqlCZdYpThkjih8UvHAXnJmVHwlIuw8icpzBQVt4KfeMR/JA8TZLQ=
X-Gm-Gg: ASbGncu0QPlxVCYl9PY0ZM8o691OJ9wFHMU8us929mDPbzrxxW4T8W6uOATW/35PzF6
	7nUyTTDBZ0Lw0Aqk6CS4oi5tQI+Ftk8tKIalfNNptplEr+Qihyc50UmBmsygcjkqXIBgaH8Tlmb
	EoMCiaHHTvv4bsfGhRLAVJsKXV3O5sY9d4bbWyjZnvKa7wAp4//sTsIFITmfWjK3SRa1MDl5r9S
	vDXs6vuppCcgXCG+ZGBVz6OFbnvOnKSu6ptAOJYkD2t8t3aIdd+Rbw/1DcjEdB7QCGiNVPP
X-Google-Smtp-Source: AGHT+IGFk0vEdymtZTj+lLuHlMGCHpVVSzOjAS6UfJXaYfWRkrCAng+HqZSDbAH8bdLeqj6n7JsTPA==
X-Received: by 2002:a17:902:ce8a:b0:216:32c4:f7f5 with SMTP id d9443c01a7336-21c3540c7a1mr174490975ad.19.1737348632564;
        Sun, 19 Jan 2025 20:50:32 -0800 (PST)
Received: from localhost ([122.172.84.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3a91cesm52428625ad.133.2025.01.19.20.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 20:50:32 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	kernel test robot <lkp@intel.com>,
	stable@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] cpufreq: s3c64xx: Fix compilation warning
Date: Mon, 20 Jan 2025 10:20:25 +0530
Message-Id: <76b218721e5fd5ac2fc03e1340595c9a56c1613d.1737348588.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.31.1.272.g89b43f80a514
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250119_205034_059391_BA4E0979 
X-CRM114-Status: GOOD (  12.36  )
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

The driver generates following warning when regulator support isn't
enabled in the kernel. Fix it.

   drivers/cpufreq/s3c64xx-cpufreq.c: In function 's3c64xx_cpufreq_set_target':
>> drivers/cpufreq/s3c64xx-cpufreq.c:55:22: warning: variable 'old_freq' set but not used [-Wunused-but-set-variable]
      55 |         unsigned int old_freq, new_freq;
         |                      ^~~~~~~~
>> drivers/cpufreq/s3c64xx-cpufreq.c:54:30: warning: variable 'dvfs' set but not used [-Wunused-but-set-variable]
      54 |         struct s3c64xx_dvfs *dvfs;
         |                              ^~~~

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202501191803.CtfT7b2o-lkp@intel.com/
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/cpufreq/s3c64xx-cpufreq.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/s3c64xx-cpufreq.c b/drivers/cpufreq/s3c64xx-cpufreq.c
index c6bdfc308e99..8fc43a74cefb 100644
--- a/drivers/cpufreq/s3c64xx-cpufreq.c
+++ b/drivers/cpufreq/s3c64xx-cpufreq.c
@@ -51,15 +51,16 @@ static struct cpufreq_frequency_table s3c64xx_freq_table[] = {
 static int s3c64xx_cpufreq_set_target(struct cpufreq_policy *policy,
 				      unsigned int index)
 {
-	struct s3c64xx_dvfs *dvfs;
-	unsigned int old_freq, new_freq;
+	unsigned int new_freq = s3c64xx_freq_table[index].frequency;
 	int ret;
 
+#ifdef CONFIG_REGULATOR
+	struct s3c64xx_dvfs *dvfs;
+	unsigned int old_freq;
+
 	old_freq = clk_get_rate(policy->clk) / 1000;
-	new_freq = s3c64xx_freq_table[index].frequency;
 	dvfs = &s3c64xx_dvfs_table[s3c64xx_freq_table[index].driver_data];
 
-#ifdef CONFIG_REGULATOR
 	if (vddarm && new_freq > old_freq) {
 		ret = regulator_set_voltage(vddarm,
 					    dvfs->vddarm_min,
-- 
2.31.1.272.g89b43f80a514



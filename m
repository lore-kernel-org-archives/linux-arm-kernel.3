Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20DC2CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qszteeIIfZdimRIQpgCn+/pEks4QjoflEtrgND3FgTs=; b=DSynmeU0tBrfPMk4aGeZw4DIVB
	5upnHOSbsyHFIlYPzFnCJgkfsC7/6mFEEdf7J7tH0zwQjZGrUJVa9JRIC1FAZBSPgqQSry1DC1UM0
	izNKrtRPP0iycFXbh2Qnbxxv7cf6iWAxXTKgMbPsSGBiG5lqdU6xdQr2WIgTKTO1D/7lW3a3Cq5cn
	4euIYT+DOAJnp5OJm7NnenyZqe+XXz1tO67CrrvYNmzv+dV5jFNXkix/wPLqYV7sA7APXMDgidLVX
	NJoZQQQrmCFVhrLE2giSjBcFuvW0saB3pJujVtiEmgkApkMCLYv/jk6RW20bEIntSG4pX1OWKvPAW
	iUeMc1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtkM-0000000681Q-2NjV;
	Thu, 23 Oct 2025 11:44:46 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtkJ-0000000680C-3oK3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 11:44:45 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-58b025fce96so652951e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 04:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761219882; x=1761824682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qszteeIIfZdimRIQpgCn+/pEks4QjoflEtrgND3FgTs=;
        b=JmVAMdiDns9thKZjfa1u+Mxth+wWcN/qw3+TsVgVk7DBnN/Iy+cRuhE6FTXdh9f6e5
         348glbRVp/Dk5oa6nDc4/8XUApG2dvadZE0bsOIrZmMO2CDpEH1kQvKTCAL/h3nw6ROU
         tPTP8eUh8+nKvqYDRN1GCmS7KV3sQGohwjUvwNc+YHLOEsVJvT3JlHxMsMnvP+xXIvfm
         qC6w35Hb09B+b/X68WBg5c0+inV5Tq70OC0K2EeZPIu3df4142BAy6XQkXm+FzxDjrqT
         6quNz2DJmqrDUgBLxND5+TQVMPBOQ9ZaqVSqpPzW8pWnNXEI2aGajWhd4zwiORJ0/Lcr
         0TCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761219882; x=1761824682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qszteeIIfZdimRIQpgCn+/pEks4QjoflEtrgND3FgTs=;
        b=QqzAQ99Jui8GPqBaEHONAcLzdZtl3/4Q0pxEdlzyE6bb8e39x3LMDb1bTMWnPjezbK
         uXqY3Sk2ojMN/UpJW24npBApQmmMuUmph9I6878VY3S/A3x5l3KGYUDASAs25UH92ySn
         czYqhOsObgbUHZfI5He0mYXdhSsD1e+reYYCv49fio0Hh/yn7t5cj2v+8eySmu4viWQ0
         OOOixP1Dr4qv1EESfQ5XsezV6qcH02bpX8soakXFyWtwp8zO0llhff2umGvyJY0m/JMD
         3UGpS+OijNR+L7kK3uM195q/IqIcClKSD9z68g3n+yQ7UQUvwr1HUwRQ2yCpCiyH3BRP
         QdzQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7muDxdqpJPUdCgQCE0p4EXOVI1aEWCuxq0r9+n6NS+RCE73basu0ScFi1beG2lnOMnV7aW60uG9OdWJsDyfmO@lists.infradead.org
X-Gm-Message-State: AOJu0YzFjdEW1054Yv8TlaEav3bo57LU7JrOveAorv+0w9Lczr4Xn9sP
	W89/eqW+vMLCg4O0n8gqw3RgWL+pXn244j76lk9zxQP0J6yHDvl3IHpE7Eb2aQ5uCC8=
X-Gm-Gg: ASbGncvqESuJv/0PPxLEudLMqVrCEH284eXwvTa9+m5DYJq3lqEIz9yZ/JRALtMGCe1
	7yaM+kOK1ddY+KBUFrIB7qfqcJ/bUpBnakrtOdJb42xL4YIO/rCi2FftH6fI6bYoIxddRLzwvN1
	VfwXy9RZMYm+EZwXw6ZcRhAyRwA9Jh0XJ6Bsqywt8SWSVreI0HLNFNVUFsPnbZmijCz8n7TAt8K
	Nb21RJYdpgCBOgZ5QVztzvou/M7GB8uyY1KElBUMNxKbH3epAC/31yXJg8ivntp/E24cl//Yfub
	Q8eOBlmXKuKx+XLUMc6m6DQq4YwWaP37ZbWkbEFbb8B5slHNXf53z+zgYNKeaD+GeTdS8DX5ZNH
	hEpWXPgJUtPRSsgHGu1fjmhXlmcluTPvfzzcebrCdVwunMJRQ2tPcUzgkSJmrbn/rI1n96O6MVx
	pdiNy/LTa0h86ow+L1L0slxXyOxIQdqFPZH03osmfM56uw+LYRTwM6htw3I6Vs
X-Google-Smtp-Source: AGHT+IFbZ8ea+fRAWMZHdLU+mWJ2Ags/jNDklnyMrW7cZ1hIy3jawsjZE8i2C+6eDVs0jg2Q6h0Kww==
X-Received: by 2002:a05:6512:3da8:b0:57e:f60:2327 with SMTP id 2adb3069b0e04-591d85665e1mr7456130e87.49.1761219881746;
        Thu, 23 Oct 2025 04:44:41 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-592f4d1f26bsm687596e87.77.2025.10.23.04.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 04:44:40 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-pm@vger.kernel.org
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pmdomain: mediatek: Fix build-errors
Date: Thu, 23 Oct 2025 13:44:36 +0200
Message-ID: <20251023114436.185320-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_044443_954415_28C863B9 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

Let's add the missing header to fix the reported build-errors.

Fixes: df4e9ec1ed86 ("pmdomain: mediatek: Add support for secure HWCCF infra power on")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202510231317.ZZxNaFG0-lkp@intel.com/
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/mediatek/mtk-pm-domains.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/mediatek/mtk-pm-domains.c b/drivers/pmdomain/mediatek/mtk-pm-domains.c
index ac144ab8fce0..164c6b519af3 100644
--- a/drivers/pmdomain/mediatek/mtk-pm-domains.c
+++ b/drivers/pmdomain/mediatek/mtk-pm-domains.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020 Collabora Ltd.
  */
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/init.h>
-- 
2.43.0



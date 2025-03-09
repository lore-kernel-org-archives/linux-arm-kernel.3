Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC84CC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jo5cZzus0FAHnZneWz5yvUV4j+MaUQTnWxm1PiFIAZI=; b=hFAaAID1FL+v7ziui/xUqvwxNL
	8Q2vpB4JrUU1fU3f1u0opJmBkaNRaKXQUW4v5aA6CsPzyWZXOkJzGz+WiJO/sZU3eeA7UwLg9bK6S
	SUYUUvYDujTmuP6Fo/4ug0yada1CfLDuVpP25SwZTt6m12Mc+itTI6OU80aM9QWoyvlWSlKKiwG0d
	tN53H6+Wunt0R08e80daXn9N5Qi8qnyicH24b8QGsPXA22AoYN19NyDhndG1Z47awBnKTTWf5jVt6
	gXQQTfy/T3gb3lV2iYukX+e3X/TPVCrelG6s826tDia6KjsUPIYeZ/Y3lZKAvNv+Q9euAw12N5zX3
	GoeBikjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKz1-00000000v2O-33GD;
	Sun, 09 Mar 2025 18:02:39 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKoi-00000000tCj-1ev6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 17:52:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43938828d02so4682085e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 10:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741542719; x=1742147519; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jo5cZzus0FAHnZneWz5yvUV4j+MaUQTnWxm1PiFIAZI=;
        b=NSdhab+2F8w0bZm0t4eGEDSPSMoz1NME+YTg2CZ1RxO0wWI/5UY4umD5hKUs+kY6CF
         NiamCRiWNxb3snUKYFKW3/Fo5v+rk55DjQJjKSvrtkYj1fauvsVG+i9Ieu1r2jlYCAhA
         T6DsUCmcjdPenJUikgK3WcH1ZScAKZ3AkOXK0y+XgvsBgW28aZooNxnxn6cethgxVhQA
         9yqwv9KToDctwPeWvb8rFv+q8BMON7uWL1gDX4iCp3GSlwS23DWMV96qa69BossvZ/8T
         LIBTfb3niFhVFc2+ba3Y44kUikf903v+X+hD2WfIvWaDVonkLgJMM+qK7M7zLDudQ2Dx
         FdNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542719; x=1742147519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jo5cZzus0FAHnZneWz5yvUV4j+MaUQTnWxm1PiFIAZI=;
        b=ZmXOsaWpEeth8xktSeg7ElC39k9Khdt6ZYvu5BmzlsgwuHBumYNu9OFeQVRMHGkiA8
         GhyeZoEXMPwE4VyP8R/BSYdYFaQ8rTWEJhJQbq46+sv8eERvJGFcpgnib3Ch6W1+6Uof
         bfCkPwuJvb/2Tf21206MzXwZbkpfuNu676cfA4qoyilgqCAHpOKvE/kTc8zGc1JSNlfM
         GCEzcez/sTNvNs7uzYxNRq+ZMLpmpwRHUMQWOe5AAq2oKav5o7GLN3UsZ01qm/w0vcA/
         PlKPmQPd1t40PaFYkLdds458NgyxUrOOwMy+qdTpJqKiLW4Jq0PorHnUH1Zz22w8IwVl
         xDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhqm6OIMFt41UKYkpjKFqIdVPWalrtwWM3Qw0EvQvRTWPgHLQ7n4vDIlcECbloRchliMBWTxc2+fyZKp+wL+1Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwDfityHgw3eRMmXAMDqi4cWQmDko8JNP7yvLQrDdmvIRBit4z/
	sUe8aat43oVjPSABmnmxdV8aao1h5JMLdG4ObY8IX4utrPYVMZ5CdkrkzmCDi+g=
X-Gm-Gg: ASbGnctc/ROjtEWoO7p1kN5T4TqRr8hDlOsRlC4gtAAOWgDehvUQzHjOpytZ/XjrWhf
	rnksgNY6PcgnAFwnte+muk29RC2PQYAN8xe+mUDzq9pXAuJR0H/WMJghlFWJ4UXGeLhRztgcAjk
	VLaBnKW0uq/XVoE+YJl9KsM61iBjZ0vJI5FxcxMaHeiP0D19PehFjFj2YjGRP0Ystp5MPSmit3e
	c558ZDZOpK0zQs8R2oZMDTbCBgXxFDxQY9NzlwDwCW8MMmjHa9wBgzKSWx8uwfliXyMxoHJ1YDT
	xRGLmAGcGiqQ5aGV/JDZU+SIrx8MD+ZOtNk2aq7ZrQwjKCIFpzZ21wP8Cjs=
X-Google-Smtp-Source: AGHT+IHFXC5otRZ7F4yGnhvywHvWeRyg1x0RiP0aY2UeNSAgYGd4FzPX32gmebfW67foinZiceGAog==
X-Received: by 2002:a5d:64ec:0:b0:391:2acc:aadf with SMTP id ffacd0b85a97d-3913bb4709bmr1218934f8f.6.1741542718937;
        Sun, 09 Mar 2025 10:51:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3912bfb7934sm12638173f8f.12.2025.03.09.10.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:51:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: Fixes for v6.14
Date: Sun,  9 Mar 2025 18:51:53 +0100
Message-ID: <20250309175154.6701-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_105200_431754_B1FD214A 
X-CRM114-Status: UNSURE (   8.41  )
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

Hi,

Fixes for current RC.

Best regards,
Krzysztof


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-fixes-6.14

for you to fetch changes up to 53517a70873c7a91675f7244768aad5006cc45de:

  clk: samsung: update PLL locktime for PLL142XX used on FSD platform (2025-03-05 20:13:25 +0100)

----------------------------------------------------------------
Samsung clock controller fixes for v6.14

1. Google GS101: Fix synchronous external abort during system suspend.
   The driver access registers not available for OS, although issue
   would not be visible in earlier kernels due to missing suspend
   support.

2. Tesla FSD: Correct PLL142XX lock time.

----------------------------------------------------------------
Peter Griffin (1):
      clk: samsung: gs101: fix synchronous external abort in samsung_clk_save()

Varada Pavani (1):
      clk: samsung: update PLL locktime for PLL142XX used on FSD platform

 drivers/clk/samsung/clk-gs101.c | 8 --------
 drivers/clk/samsung/clk-pll.c   | 7 ++++++-
 2 files changed, 6 insertions(+), 9 deletions(-)


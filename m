Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E381D58CAF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 23:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kU0acvfqOp1dQM/3PUz94K3T5EGGl6FMD6BKWt5VIr0=; b=XpAmlEM26lmBz/5W8XGXnJkGxu
	rpePBKoNa+tXi2S886nOsm3n6x/Fh7CWlKfJlf5BsJSIOTd+ZhQyEHtV+7GmSb8PPGa8IjYWwK0nK
	tI7ZwB7lAJHsN/gtlAYgNnKKbpqyjmWuuW/XkvHAHd4cZnlBjvj0algPzO4/m8jzrupOL606wVfIl
	mDf29ze3r9z+l1xVQ+tWQLOUUhnGf45hSo/MA3GwaU2GVSkZejEPr2Af1IYu6lFBJPDsLTPbc8Nbs
	VlZMu76H1OIEmHQSVve5+rZnmnPP+bnCDYHx15j5nwiTKU1EX0G/CCWgRBDDWx8GSYeAUiGxCQQnM
	jQWTRHGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4RoW-0000000FjXx-3eMp;
	Sun, 22 Mar 2026 23:02:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4RoU-0000000FjXa-3B6k
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 23:02:31 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-486fd3a577eso17723975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 16:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774220547; x=1774825347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kU0acvfqOp1dQM/3PUz94K3T5EGGl6FMD6BKWt5VIr0=;
        b=EE/S992OcifojAVeWUo0dgvZZ5EmBAU35ObEx9kPvmRayxsy9ELZT9ufn9Li0YKJw7
         cx3lWK+MHPHFazdOJMP7baisTc8buGyhgI9AjvrUl8OGtqs6b1cUvL0hhlDRqb8fBqrb
         /SUpbpum8t1bZJAJij0phVme+C2wlTQ5VoKA2uDiyx/M2ZFDDXKmp3ctkjsmgPAGAfKa
         iIhL7xVKUiGbQ3TJMsL7/qH/VQejnQydhMvA5UvoFxgYcbj7QqlogEwTuvWkLZERmwIw
         uXXdC5m+/dynuM0ghcKfuapA+CuyIGBvA5kMcX0f9DofIssBitRUNzCvRVDKNTAi4MvZ
         0SKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774220547; x=1774825347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kU0acvfqOp1dQM/3PUz94K3T5EGGl6FMD6BKWt5VIr0=;
        b=LNiEawLGF6vEXnxadYgeWdBIBy31nw7bF/lQarOBZEpAuHnQnLsMPA6LzdAGrtCsOe
         0OYMRs68U9Mw9vIedEnPoyCu4MnvCvbSK64dZ5DtsiF5kiYw6zpAA1x0TnWExG9yGFq3
         sUshtA3mgGNG4/T6dFKkMo26Zbg5B5pK2Hx7jFqWuZpVmQ/OmUqL6ARcd/2MRjTxUX24
         wOzMCilnIykzEZJ++mYA563eAO15Rm1r5/mUBPQS6htf/3Xh4nlakhf+FXKDKrR1dfdL
         8+meQ5rQ8dl+sVe7a1vugTqbqzNIN+CzH4Sx2c8sLAOnwPSfkLZ3zEsXlRber5me5Zd5
         49+g==
X-Gm-Message-State: AOJu0Yx04L3tRC70gWQfbyWGPSIxmLPNMmiAfSwJGiOXTwT90EkVmji5
	nIm/ORLB3tYxNegelbyAZONznvyV/5PpUE1WIn4tcAXuL6+oVhhtdHIq39tiB2LFtZez7A==
X-Gm-Gg: ATEYQzwFEnwzUuPqcJdL0M/ihXWmVr8DLOHXehjUOp6RgzLZb8wQlhmJxCfUs+wtqmt
	jJrsWEhKngIHGR8BCWBLLh15PeZoL3bvqAu3PDLvI6WlXCqbcNSvYAbjhg88rddNPBNS4mQ0q9e
	vf7t4OprkTa/USipPMXvKdRqwxsaN7iJ6WfCMrjUrb8chi7otJP4mNWzczF70kyg3C8gQ4covbc
	xLSpe6tXDHeKEVx7UXrA9+A+N4jM2Khh2lSC2PzQjFvWTsOn34LJDj1XACHZsl4tDEIk8j4zBg/
	lzdOop6WM9CCwPSYJGtJI75/r5lqS9HFwll4LrAIuwYBJQUfIrXZal6E0X5ebSTitl3t/+Vu+nq
	qrrUMFiFmDKPMbyhAcQsx+ZeMf3kfhYDQLvGoXEgG36FJQaFwP74O+DBwFiY8O+XVHBbdKMirYJ
	ikcLL2GxGURu7deMQj4ekOAtZhOy6yhal/PxlI3YS0uP+xySAoDq6KUJk=
X-Received: by 2002:a05:600c:4705:b0:485:3a86:6392 with SMTP id 5b1f17b1804b1-486fee0d816mr141768745e9.20.1774220547399;
        Sun, 22 Mar 2026 16:02:27 -0700 (PDT)
Received: from nixos-office (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fc4d90f4sm325617155e9.1.2026.03.22.16.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 16:02:26 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: joel@jms.id.au,
	andrew@codeconstruct.com.au
Cc: linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] soc: aspeed: cleanup dead default for ASPEED_SOCINFO
Date: Sun, 22 Mar 2026 23:02:23 +0000
Message-ID: <20260322230223.1393885-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_160230_854756_BEEC8E97 
X-CRM114-Status: UNSURE (   9.30  )
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

The same kconfig 'default' statement appears twice for ASPEED_SOCINFO,
which is unnecessary.

This dead code was found by kconfirm, a static analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 drivers/soc/aspeed/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/soc/aspeed/Kconfig b/drivers/soc/aspeed/Kconfig
index f579ee0b5afa..63a656449a1a 100644
--- a/drivers/soc/aspeed/Kconfig
+++ b/drivers/soc/aspeed/Kconfig
@@ -46,7 +46,6 @@ config ASPEED_P2A_CTRL
 
 config ASPEED_SOCINFO
 	bool "ASPEED SoC Information driver"
-	default ARCH_ASPEED
 	select SOC_BUS
 	default ARCH_ASPEED
 	help
-- 
2.51.2



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E50BD13570
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 07:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vQpKY05JOYjPURTPx5+mIgiP69yD+/zLK9ykR+kpvfU=; b=PSeV6BJYmBPLMGQQOQEJ9gKdIs
	W1i1l8xTbnIHUA/Nesh9hGwTLfs8yux/iskOkYxeXdWdBLoAFE/dZxohF9Wvkx4H8DiHZLe9LP1dg
	gfV3DdmOQTUIxf0HWjdagAWewU2VUlwMvs/9RtGgSg7z7YQj6dZqZwWwyQlkVh13SrJKZZyMUD7bK
	2a0FBD8WxO81Vo/Se/pg+mtuc+Cj+jlI15DqdA4P3VAPrQ+gXeiU2Zpxm9KgS22iCgvkElGcrKcEI
	hVw9osqaBrBc12g+8vCWEojQ5YQLQLJKb9ADdk2I7eDd1EqGuH4oYz4DnEiVVkT+aoydoRnxyOX2X
	X+itOUBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KFC-00000009sMj-2lLe;
	Mon, 28 Oct 2024 07:32:54 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5KD3-00000009rfS-4AVL;
	Mon, 28 Oct 2024 07:30:45 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-207115e3056so32335925ad.2;
        Mon, 28 Oct 2024 00:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730100640; x=1730705440; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vQpKY05JOYjPURTPx5+mIgiP69yD+/zLK9ykR+kpvfU=;
        b=Al3o7m49B6PBmzzFF8uNKig9aMsc9NaiRYA7Yfby3AX8EUlG2/9eFVHh74wwW1Ztvb
         MbRMvYMqCOXv6sRyIOf8gnLv7iEXkKnt7gI+OTyXuRK/Cd8PKmxUWlYqncglBNNtkxqx
         /zNV84hL4sDY3mO4bjjO7CCsS0A+2DJ0y2AhF6UY1kKqL/e6n4pYH3fh8BEUtYKqeJt5
         6UhLT+gTmGs0oj5pybC0Jl5DHxApaz9fYSprQ+foUOaMdEso+W/5oAL2dFi/tEB23sIY
         srOkEvIo1fnem8qLPcTNyytMbpqSSIexXJrjd4if0RSK/IxhvK9lYp7acn17PrOLO5JF
         FfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730100640; x=1730705440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vQpKY05JOYjPURTPx5+mIgiP69yD+/zLK9ykR+kpvfU=;
        b=pqAOVYO26MaoClh8eRgTLV3++Baz5UyaTS2jnKE2SWn2H3e+n8mpWW7UKQ/SWi6Tnm
         OYv661HYzuhLryAdV6lJHe74YBtAHblixVx8MzwzPeAdHUWPAQUhAnqH7LdHl6P/UV0l
         K4NXNBUOpzkRRh1xMu0x9lNdtgmQ5llsPZyGAdf3gne8f96jHj+GlCkRM8mnj3iRP4s3
         5yTlm0z3EPJQtgWCJJXpxhRBW+thTCwyM1txAvpCnrCMDAWHzuBPykt0Wa0GKnxbUt52
         idbDrAYBCJG8ZElNLM2J+PjOFOVc2rmhtq9P9u0Usifzm7Xcsh3zDfBZ9ka6octns78a
         HI4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfjahFTQFZmmiN2cBBzRAXXGvUd4DXsFi/pPEkW0AoyygTVqLQX192cLclQXvrZ/UV+rwfISlr+6jasez2w6mu@lists.infradead.org, AJvYcCWk27Q4dFwljThRsP+REzQSshbq49RXlLFRZxolFQS7W73igcAMacYQXCQQIPRocun4xKIBfhwRWyF9mY18JpQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu+e9NlUj/BoO2sXsFagCpjx1lBSZqBPfmBTe6pfjxk+qC9xFN
	UxpuEfdWzvMYhOYfHJJT5jQub6Cma7PFPs7q9quMaSHiFvP/KMhB
X-Google-Smtp-Source: AGHT+IG6Z7wprymZITZX9ht6+gTXW4oYosIHVkICug2xUmTPYybbwDluebNPlHjwGju13EkHTSJBCw==
X-Received: by 2002:a17:903:41c4:b0:20c:6b11:deef with SMTP id d9443c01a7336-210c6c3692dmr101371385ad.48.1730100640505;
        Mon, 28 Oct 2024 00:30:40 -0700 (PDT)
Received: from localhost ([2402:7500:488:6621:2441:dc7a:ff1b:984a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc08883esm45645735ad.301.2024.10.28.00.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 00:30:40 -0700 (PDT)
From: wojackbb@gmail.com
To: netdev@vger.kernel.org
Cc: chandrashekar.devegowda@intel.com,
	chiranjeevi.rapolu@linux.intel.com,
	haijun.liu@mediatek.com,
	m.chetan.kumar@linux.intel.com,
	ricardo.martinez@linux.intel.com,
	loic.poulain@linaro.org,
	ryazanov.s.a@gmail.com,
	johannes@sipsolutions.net,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	angelogioacchino.delregno@collabora.com,
	linux-mediatek@lists.infradead.org,
	matthias.bgg@gmail.com,
	Jack Wu <wojackbb@gmail.com>
Subject: [PATCH] [net] net: wwan: t7xx: Change PM_AUTOSUSPEND_MS to 5000
Date: Mon, 28 Oct 2024 15:30:15 +0800
Message-Id: <20241028073015.692794-1-wojackbb@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_003042_100911_D2FAA5CA 
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

From: Jack Wu <wojackbb@gmail.com>

Because optimizing the power consumption of t7XX,
change auto suspend time to 5000.

The Tests uses a script to loop through the power_state
of t7XX.
(for example: /sys/bus/pci/devices/0000\:72\:00.0/power_state)

* If Auto suspend is 20 seconds,
  test script show power_state have 0~5% of the time was in D3 state
  when host don't have data packet transmission.

* Changed auto suspend time to 5 seconds,
  test script show power_state have 50%~80% of the time was in D3 state
  when host don't have data packet transmission.

Signed-off-by: Jack Wu <wojackbb@gmail.com>
---
 drivers/net/wwan/t7xx/t7xx_pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wwan/t7xx/t7xx_pci.c b/drivers/net/wwan/t7xx/t7xx_pci.c
index e556e5bd49ab..dcadd615a025 100644
--- a/drivers/net/wwan/t7xx/t7xx_pci.c
+++ b/drivers/net/wwan/t7xx/t7xx_pci.c
@@ -48,7 +48,7 @@
 #define T7XX_INIT_TIMEOUT		20
 #define PM_SLEEP_DIS_TIMEOUT_MS		20
 #define PM_ACK_TIMEOUT_MS		1500
-#define PM_AUTOSUSPEND_MS		20000
+#define PM_AUTOSUSPEND_MS		5000
 #define PM_RESOURCE_POLL_TIMEOUT_US	10000
 #define PM_RESOURCE_POLL_STEP_US	100
 
-- 
2.34.1



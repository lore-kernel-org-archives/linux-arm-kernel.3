Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 994A5C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 06:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=; b=KJvge3ID8qXyL2efTVsvUjhWYo
	s+KJAVgGLiF4Jm7Z9iap7xpV9Q2wRvYltny1dlN2GBxvtJ5RWVr5/vJvPr5zCBwu2U6V7JbC5HdDq
	xJiqj2OEo/lp0+PyvFgWB1b0Agfjbg7WMZ0lYGP0qq3USNrhIZ6lqcM5RvYb7fRRLlMG1mu8ZHiLS
	X4mqCB6PKH6L/Z9pdbUixSV+PjZcs2zpcFZwwYKO9XLnrpasLqxA7DGIYNP84fbrlovFEMib4RFzt
	AhvTnpqX2abdEh9b5Ee/fDVCjWE5yHb+pSakIw9ZovTSWeWaF2GlZulW+BOYaVHh4jIFbREze8RkA
	kZu0mDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7q2A-0000000CzMO-2qKf;
	Thu, 24 Apr 2025 06:26:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pyE-0000000CyS8-0n5C
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 06:22:03 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so3704765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 23:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475720; x=1746080520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=IhKBUyFAIVF8/jW0ERT8QeroyGIr8ty7pIge4++dFIRTaIPlIGt9jF2aAQIZoSIoMV
         4FpW61mAG7J3ZpvmTTXm9bAZOw9QQeF8NAgWBK8ekNlVLGFMrorVFItpFxWI/KCrlbBM
         gqqUy1rCHKkHVIyymdGdEo+xlNdGUaHRdiuVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475720; x=1746080520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0D3K2ln9Lb+MNQxN4twGUjq+Zn0uEKE9IsRwsBI/jVw=;
        b=BzoXpK8roc3Hf9Odkq9+NUtA6+NJfWtxB3w1V9t4oypWodUmBwB9ArYf4Yf8BfsZa9
         GJrSV6d/DsPu+VAn82XbmYBSbMWg/PxWeQepgqs55+du2HDZbatI1JkCJmGR9VRRTfJb
         Zp5fQ9SFQqNpjJY2V9JhOhp2vDrhmqLId52WL733x/ws2YJuZNMzW5P00iT01Ohf9SIs
         Dli0OjaPzHhF6MRWcFLPpHAvqCXhSw23VBHi7Tw3hf/j8f0Xr0OMSSweKsYA6S49tKyC
         TJ1mwNI7aTPv+LS+9fZbvsjzSN5pZ+Ox+flDAfXur6QwrmFpe8WQh+3jgekEdXj9kcsl
         VfWA==
X-Forwarded-Encrypted: i=1; AJvYcCX+xGjXKh5u0xcfaoBDPbLLBO+TR7usB94mCsgLkpVDhOe+ceR8TfyYoJdTVLBpAbpnJc9MGiIw7NG9Yr9fPjGs@lists.infradead.org
X-Gm-Message-State: AOJu0YzJNelzPQZTiZI9Y397DqVoceHhAWKtZl62o9+MeEtql5CCwXuO
	n50/bINoqmBZ922irbs5ZSqpJZDKmvNUEI1ahpo3/DKY3+cep0d95kX1zB4th+g=
X-Gm-Gg: ASbGnctnPqxofXQCKu0pPiBn986/IqR112pdLz57Hk2m+TjMNxJjeZe2pXFUN5r3BmB
	0D282vSXjYv0r4pcZnrOStXXIJGvCQgwVbKBups6wGoaU/a4QvFA1fncFvG19L0Ybo8VQ2yTXOe
	HhjYAfr4KOTJTJB4iLwM77n1qUVxYAn2JtMlFegSnfuDKbDsfvJ3PG1XxBWQznn6FM3yX6mbNdC
	WbpmRRvMMhJWRR5KucmxLhC6aUYjJXzgNya7Mvd42tmVl93vhyvFpW1f+CIML3UsizAr64JfkN9
	84kKKjNC1qnT097i8dE7mHZoIEEhH+vv2w4Yf38XihgkeNlyJtznXmGI+AOgfFdssCyjiwmqN5x
	LFGPg
X-Google-Smtp-Source: AGHT+IHymxJmFKpLmwrZam+TMOOI/0cy/ciCsXy9MSaKz4V/Z0qmORSIolFTEtnoiInGOXnttK5eTQ==
X-Received: by 2002:a05:600c:c092:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-4409c399b9amr7368115e9.0.1745475720552;
        Wed, 23 Apr 2025 23:22:00 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:22:00 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 01/19] dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
Date: Thu, 24 Apr 2025 08:21:31 +0200
Message-ID: <20250424062154.2999219-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
References: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232202_222151_044F7738 
X-CRM114-Status: GOOD (  11.21  )
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

Unlike audio_pll1 and audio_pll2, there is no video_pll2. Further, the
name used in the RM is video_pll. So, let's add the IMX8MM_VIDEO_PLL[_*]
definitions to be consistent with the RM and avoid misunderstandings.

The IMX8MM_VIDEO_PLL1* constants have not been removed to ensure
backward compatibility of the patch.

No functional changes intended.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

(no changes since v6)

Changes in v6:
- Add 'Acked-by' tag of Krzysztof Kozlowski

Changes in v5:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 1f768b2eeb1a..102d8a6cdb55 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -16,7 +16,8 @@
 #define IMX8MM_CLK_EXT4				7
 #define IMX8MM_AUDIO_PLL1_REF_SEL		8
 #define IMX8MM_AUDIO_PLL2_REF_SEL		9
-#define IMX8MM_VIDEO_PLL1_REF_SEL		10
+#define IMX8MM_VIDEO_PLL_REF_SEL		10
+#define IMX8MM_VIDEO_PLL1_REF_SEL		IMX8MM_VIDEO_PLL_REF_SEL
 #define IMX8MM_DRAM_PLL_REF_SEL			11
 #define IMX8MM_GPU_PLL_REF_SEL			12
 #define IMX8MM_VPU_PLL_REF_SEL			13
@@ -26,7 +27,8 @@
 #define IMX8MM_SYS_PLL3_REF_SEL			17
 #define IMX8MM_AUDIO_PLL1			18
 #define IMX8MM_AUDIO_PLL2			19
-#define IMX8MM_VIDEO_PLL1			20
+#define IMX8MM_VIDEO_PLL			20
+#define IMX8MM_VIDEO_PLL1			IMX8MM_VIDEO_PLL
 #define IMX8MM_DRAM_PLL				21
 #define IMX8MM_GPU_PLL				22
 #define IMX8MM_VPU_PLL				23
@@ -36,7 +38,8 @@
 #define IMX8MM_SYS_PLL3				27
 #define IMX8MM_AUDIO_PLL1_BYPASS		28
 #define IMX8MM_AUDIO_PLL2_BYPASS		29
-#define IMX8MM_VIDEO_PLL1_BYPASS		30
+#define IMX8MM_VIDEO_PLL_BYPASS			30
+#define IMX8MM_VIDEO_PLL1_BYPASS		IMX8MM_VIDEO_PLL_BYPASS
 #define IMX8MM_DRAM_PLL_BYPASS			31
 #define IMX8MM_GPU_PLL_BYPASS			32
 #define IMX8MM_VPU_PLL_BYPASS			33
@@ -46,7 +49,8 @@
 #define IMX8MM_SYS_PLL3_BYPASS			37
 #define IMX8MM_AUDIO_PLL1_OUT			38
 #define IMX8MM_AUDIO_PLL2_OUT			39
-#define IMX8MM_VIDEO_PLL1_OUT			40
+#define IMX8MM_VIDEO_PLL_OUT			40
+#define IMX8MM_VIDEO_PLL1_OUT			IMX8MM_VIDEO_PLL_OUT
 #define IMX8MM_DRAM_PLL_OUT			41
 #define IMX8MM_GPU_PLL_OUT			42
 #define IMX8MM_VPU_PLL_OUT			43
-- 
2.43.0



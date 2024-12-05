Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18F6E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 11:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixt9c4K83xzkiOz3qhQdg47ej3Uw5HCoJxrsxE8RGiA=; b=pxT5BTuzf7/wqQ4Uo7Oc04BKRv
	hW+SI+Wf37X9GAzwZ7+GtCCM8IG58zMA8KygM6Zwgtjn6p8UyhpX3bEMmeCMH/FYbCgRj8hFbOIW3
	ELbttlmKlUzHhn8P+YSzNbKyDRV0l1moLHyzYX1ZvXN5nMTGDuQrJhQkndK8Jf1BfUSsFETvEGkqP
	rqwj7ydYTCNGm9vN/ByLqCGrr2bPWbPZXBxbvKnDYPhTn/0TR6XB2DZV/fJjkwWmIZFFEdp32hSje
	HhOMKG+3PXreuE39aR+XYCDZ3Nf7ALB7gBuNBbQSeKyK70lo0c7MxaQrAvlUJuRIT1t2RONKVH9Sh
	MQs5hOTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJA4U-0000000FjNQ-0QFJ;
	Thu, 05 Dec 2024 11:31:02 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ9tn-0000000Fgf5-0Lr5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:20:00 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso127752766b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 03:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733397597; x=1734002397; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ixt9c4K83xzkiOz3qhQdg47ej3Uw5HCoJxrsxE8RGiA=;
        b=SFsZ5guYmfZ+hrL3T7kcWNCfhTC/fgeTvSW3VVNAL+5mbxn03hkhVBN70MU4WcPLQp
         IP9v9qXXmy8hMri/OZLbXJd0KuGkln4WFHoCrnrPAKNK6+SCfWXfOCupLGC9p9/pH2IL
         B5dhAeBSSnhZpUcq6Wm77o5/+bGkuS9OVJR54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733397597; x=1734002397;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ixt9c4K83xzkiOz3qhQdg47ej3Uw5HCoJxrsxE8RGiA=;
        b=I+bl0VN0E2ONNg3Ubh/C+3Eh5phHxM77eB8bO+cX4kvjVwJKm75ZhQx0IEEXc/dTS4
         Q2qehmHQjGSo+jImk3Lwoo1nmspGlskEQtfvf/2NXbgi3KUKS37zpS2qCOknhTvk2H6U
         3l9LI6A/ytUzWta5BaPhvKSfpHP58yLNa9L4IT7MYTBNnVXkKMcbmIgfLnW3JWxmsLeg
         NQM9P5pZFT6QWeoTMR4eMOYHSu/mo4CJdzIvOx2GUFXh0lMnQ1K4YqanpIODbCtyrFWd
         Dbn6dv/Tq1xmRsOR2eVr5rXnIh+yPOdjrFuTus7HAwTs7jiaGKprqw9gKBZgpXngj6xW
         aBYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvI2A1ua5AHToOObObRgJY2nQiOMo2krRZ/0eQmZI8uobtFGj+zv3weEa9Yd2H9GFMa95mtm8Cj6RrZ8PqI1fQ@lists.infradead.org
X-Gm-Message-State: AOJu0YwUDIWgr4eEWtjn4f1CEZ5+7tOosFDZ/SkCAYsg0kQmDi+W0dwI
	aP3AQAQDW+QxpVmqmoESuS8mD/BdNchTglhcT7f2beVUzMcY/xNJwqvJfW0Bcw8=
X-Gm-Gg: ASbGncuZMxqvIm34FeQlZbGD3XAfOoLiVB0WuLBr5Lddo6VOjN61sC6YOyONTwiCzro
	T4lmHFOz4SOIeewIvyZG3kWqX0uJGrjGZZ+vHxS7OCfdJEdvojXBzUbvUd86UA8Zys/oLupa/Ot
	YejQNleCRPccl5eCmj19hE9Q+gt4Ddu8Z6Shr+25feKzD+jCm0EbYTrYnlSRxkaDFee8zgmPaN+
	Hss5I5ekiGY457QSzcWbqgEKAJc7i0Avx8Dk+LAAndlYa9O1if2iK3N7aKbnWz/ljw9gO6hEyOb
	dnAMQJTaeiGLA+Q16Avho1k61U6SXEb8zw2kQ3+361tMGA==
X-Google-Smtp-Source: AGHT+IFUxRjQiwJBKQ510OqJX8yYu/0B+UpRJw9P4DoKOWklChPPw3p6pUsTHU0wT1h5Pt6jtQCb4g==
X-Received: by 2002:a17:906:3103:b0:aa6:18b6:310e with SMTP id a640c23a62f3a-aa618b63362mr373184366b.38.1733397597383;
        Thu, 05 Dec 2024 03:19:57 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2001:b07:6474:ebbf:61a1:9bc8:52c6:3c2d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625eedcd0sm77505266b.87.2024.12.05.03.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 03:19:57 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v5 10/20] dt-bindings: clock: imx8mm: add binding definitions for anatop
Date: Thu,  5 Dec 2024 12:17:45 +0100
Message-ID: <20241205111939.1796244-11-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_031959_121367_0E601A16 
X-CRM114-Status: UNSURE (   9.07  )
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

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 include/dt-bindings/clock/imx8mm-clock.h | 66 ++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/include/dt-bindings/clock/imx8mm-clock.h b/include/dt-bindings/clock/imx8mm-clock.h
index 102d8a6cdb55..1962b0a1e732 100644
--- a/include/dt-bindings/clock/imx8mm-clock.h
+++ b/include/dt-bindings/clock/imx8mm-clock.h
@@ -287,4 +287,70 @@
 
 #define IMX8MM_CLK_END				258
 
+#define IMX8MM_ANATOP_CLK_DUMMY			0
+#define IMX8MM_ANATOP_CLK_32K			1
+#define IMX8MM_ANATOP_CLK_24M			2
+#define IMX8MM_ANATOP_AUDIO_PLL1_REF_SEL	3
+#define IMX8MM_ANATOP_AUDIO_PLL2_REF_SEL	4
+#define IMX8MM_ANATOP_VIDEO_PLL_REF_SEL		5
+#define IMX8MM_ANATOP_DRAM_PLL_REF_SEL		6
+#define IMX8MM_ANATOP_GPU_PLL_REF_SEL		7
+#define IMX8MM_ANATOP_VPU_PLL_REF_SEL		8
+#define IMX8MM_ANATOP_ARM_PLL_REF_SEL		9
+#define IMX8MM_ANATOP_SYS_PLL3_REF_SEL		10
+#define IMX8MM_ANATOP_AUDIO_PLL1		11
+#define IMX8MM_ANATOP_AUDIO_PLL2		12
+#define IMX8MM_ANATOP_VIDEO_PLL			13
+#define IMX8MM_ANATOP_DRAM_PLL			14
+#define IMX8MM_ANATOP_GPU_PLL			15
+#define IMX8MM_ANATOP_VPU_PLL			16
+#define IMX8MM_ANATOP_ARM_PLL			17
+#define IMX8MM_ANATOP_SYS_PLL1			18
+#define IMX8MM_ANATOP_SYS_PLL2			19
+#define IMX8MM_ANATOP_SYS_PLL3			20
+#define IMX8MM_ANATOP_AUDIO_PLL1_BYPASS		21
+#define IMX8MM_ANATOP_AUDIO_PLL2_BYPASS		22
+#define IMX8MM_ANATOP_VIDEO_PLL_BYPASS		23
+#define IMX8MM_ANATOP_DRAM_PLL_BYPASS		24
+#define IMX8MM_ANATOP_GPU_PLL_BYPASS		25
+#define IMX8MM_ANATOP_VPU_PLL_BYPASS		26
+#define IMX8MM_ANATOP_ARM_PLL_BYPASS		27
+#define IMX8MM_ANATOP_SYS_PLL3_BYPASS		28
+#define IMX8MM_ANATOP_AUDIO_PLL1_OUT		29
+#define IMX8MM_ANATOP_AUDIO_PLL2_OUT		30
+#define IMX8MM_ANATOP_VIDEO_PLL_OUT		31
+#define IMX8MM_ANATOP_DRAM_PLL_OUT		32
+#define IMX8MM_ANATOP_GPU_PLL_OUT		33
+#define IMX8MM_ANATOP_VPU_PLL_OUT		34
+#define IMX8MM_ANATOP_ARM_PLL_OUT		35
+#define IMX8MM_ANATOP_SYS_PLL3_OUT		36
+#define IMX8MM_ANATOP_SYS_PLL1_OUT		37
+#define IMX8MM_ANATOP_SYS_PLL1_40M		38
+#define IMX8MM_ANATOP_SYS_PLL1_80M		39
+#define IMX8MM_ANATOP_SYS_PLL1_100M		40
+#define IMX8MM_ANATOP_SYS_PLL1_133M		41
+#define IMX8MM_ANATOP_SYS_PLL1_160M		42
+#define IMX8MM_ANATOP_SYS_PLL1_200M		43
+#define IMX8MM_ANATOP_SYS_PLL1_266M		44
+#define IMX8MM_ANATOP_SYS_PLL1_400M		45
+#define IMX8MM_ANATOP_SYS_PLL1_800M		46
+#define IMX8MM_ANATOP_SYS_PLL2_OUT		47
+#define IMX8MM_ANATOP_SYS_PLL2_50M		48
+#define IMX8MM_ANATOP_SYS_PLL2_100M		49
+#define IMX8MM_ANATOP_SYS_PLL2_125M		50
+#define IMX8MM_ANATOP_SYS_PLL2_166M		51
+#define IMX8MM_ANATOP_SYS_PLL2_200M		52
+#define IMX8MM_ANATOP_SYS_PLL2_250M		53
+#define IMX8MM_ANATOP_SYS_PLL2_333M		54
+#define IMX8MM_ANATOP_SYS_PLL2_500M		55
+#define IMX8MM_ANATOP_SYS_PLL2_1000M		56
+#define IMX8MM_ANATOP_CLK_CLKOUT1_SEL		57
+#define IMX8MM_ANATOP_CLK_CLKOUT1_DIV		58
+#define IMX8MM_ANATOP_CLK_CLKOUT1		59
+#define IMX8MM_ANATOP_CLK_CLKOUT2_SEL		60
+#define IMX8MM_ANATOP_CLK_CLKOUT2_DIV		61
+#define IMX8MM_ANATOP_CLK_CLKOUT2		62
+
+#define IMX8MM_ANATOP_CLK_END			63
+
 #endif
-- 
2.43.0



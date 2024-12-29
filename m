Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68AD0E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 14:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=; b=vc1gCbLue3h1ly1LV9KsTUPZI4
	xE+7YtU0OhsX/6eEouBbXG693wGMgbf1OMkWyPCJdDXh5MboNI2GVNGwumGjqAK+HalmW0FnKrHoh
	F0UKAysbj6uybMRMNEleC4+pDInBvLZDGTmAK5k8rDKDsNh7jPjbPA6WfSSm3/qP2aDCFmRtd9Jj0
	4bT/s+uJ2al1sljZpt/Zk+KatnCUMLwZqO8Weziqhw5wfoEfI/Binv3z9SpbrMGMilyWmAn1w2Wqa
	JiWhgG4M+sc2KcbfKPjTNtMFGKfic5xTWPFnAj7FdylsUzkhFWuqncTD01d8ip5uXzYGYaWPPEl8e
	EbH+CUtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRul1-00000003XU5-0wGl;
	Sun, 29 Dec 2024 14:59:07 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRuct-00000003Vwd-3m5x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Dec 2024 14:50:45 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-aa6a92f863cso1372935066b.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Dec 2024 06:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483842; x=1736088642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=G913RbRKdZ0fdaSHcZWwky/C4NQ3illZ2nhisC8TpzbWN+oRJoHlMlZKrUwzNifkxx
         z/81ZvjiGWbSJbgFpQDOHEpM4PeyDTZJsym0syKcX2PFr429oY8Hjvfrhjb9MkUk/6j1
         ZBtp4/6QS2CgLUxz9z7Pq1djix5b4cJSvy7Aw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483842; x=1736088642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hOYk7rkhvjRCnvuEcjwAqfr4aBzSa8a4sxHUvLuLnTs=;
        b=m8j/wuLfKHC28NNYXDBof16PrXVmDnQ1w0u2o5AzoYIuOtLJCyF//9ANNyrJeoCX3j
         g2BaYN9WCZ3TAakI3rWobJHoP6RbkNyea8tZOji6ovM1AVrjMUZ7ZEW4XzsqMDmt1ZzF
         MvRLyVMlbtxJb7kdSVl1RHFT6LaXBHsLR1YRjkEvKw+ykoM3VDsf96c3ywJoTmrLzt0+
         Sxtv943peLRyGSnRJCenMSFNOcnCQcZ3cGnHwwbRRc4o7WacWB8qD1pHJEz+wgM6XiIm
         GdBAvLVBOuUkDuj/PTve+BV5DlbLlS8bvf3q87W4ASLjNAg3LD5lJCNPR6WXBt1UDEfc
         +uWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTcANpaZavLDOaI+7i8Jq42gwvU5z1QR8mvUVAVC1JfD6wiDf4BupD0w2SqoUHmMmidpTiClB4kvNnQ7H2q0yX@lists.infradead.org
X-Gm-Message-State: AOJu0YwmOZms394m7d46D63Cv7NghJw1JjwtvFlSjUzGOIKN+SXFmH/j
	Gvc3mfbbIr95sXcEvpMze60CFO2UzaD0j7axeW348ZA0nCFx+IHTJEIW0zgbqqw=
X-Gm-Gg: ASbGncseNn1FtDlW8h00DQGuh98bI1jH+8jSMSoEKlnXHxjOWWYfonkBgAWVWZ/VCn+
	yi4G8Q3uAITbvYHxn2HLDb//zSMP0hmgy65ffgSoYjhTyWEUdTNj129vMrR/7av24oR2onLH07w
	WtnlRX/npy3LlcNtd1nvpsnd0Q9ZvZ5McJ7EJDgTUTe/J9PqnErGGWjYP5EKyv5gOwraE9thP83
	qQactVOdoPS66u6mtcZJqYQszInnpf24/r0R8iY8fvE1aqqA80kLui6ewJANYN6zELQA+KoCPon
	GQyN9xCwFLkYfsP9RmRf8Q==
X-Google-Smtp-Source: AGHT+IG8CGrpEMFqA78kdByEQ0DjHHHYHTWphQaqH/VG7Rp9eeX5oN0WentSYeXyG9/fSH2aOKu83Q==
X-Received: by 2002:a17:907:2d2c:b0:aa6:8b38:52a3 with SMTP id a640c23a62f3a-aac33787557mr2382830166b.50.1735483842145;
        Sun, 29 Dec 2024 06:50:42 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:41 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v8 06/18] arm64: dts: imx8mm: add anatop clocks
Date: Sun, 29 Dec 2024 15:49:30 +0100
Message-ID: <20241229145027.3984542-7-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_065043_932845_89C7BA8A 
X-CRM114-Status: UNSURE (   9.80  )
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

Add clocks to anatop node.

Add the bindings definitions for the anatop node. The patch is
preparatory for future developments.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index 4de3bf22902b..597041a05073 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -600,6 +600,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0



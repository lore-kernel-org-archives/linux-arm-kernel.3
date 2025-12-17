Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B159D65C7E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=; b=uGdruPg85b2FTjCs7HnukkHy1X
	jCpFVXI9eMVB1bw+E9rWGB22ZAqAc5oSP+jd5I620fVLtlkYmfwd4U1vTm0lpMAA9uQ9TfNYhyogf
	YZWDdU6KOHoe5H16mpyX5mDP+HWDEN6naQouzlOa5ylahpc7BhocvMuNV5KVwSgjPI6YS0oMmf6hf
	W9OhEv01CYy6xnWKSuhedrubA7aoJwWtgk3rJXsuFa9KEfHKWRoaHehRxAsPpmsFBbrBNrWDVIqnI
	gqczUJm8rxist/etcowc4rVirqMJXE5AZoqL7tja9V/uPTbG9TyaAR4gQKxerdO95KXVP8b2ZbNSa
	B0SSwRSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLg-000000075vD-1uFu;
	Wed, 17 Dec 2025 16:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuLX-000000075l5-136i
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 17 Dec 2025 16:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=; b=GcEcfTJLDNXQ8FSpHS0zjoSwVT
	GUjm5m/23LRARQP/zuuX6i3X+mWMKaXtRVmCQ1lPo/2QRRNeEWK8Gmea9cjwYSq9rJqaNwG9vR6UT
	Lg6j+ZiWto2USfS5osct8rG+v9wP+I1j3yNNMGUb9g0cxRDcKgkTQx6gLMaIT7IRe7u8/cTwJi6lP
	qB4u3VwwUMZiN+9hw295svGZN6YozOTtsQL5Jab56+BMGdXeRk7OoWKaWtM/SgFvPJAuI75dnOGNU
	QDeXxX/XfASIPOV8yWoQ5FlDBqbPhSi9adeWQKj5SQshxtFTq7Pzoss6CyNmd5fU1Qgv7jWmtAV5r
	RtpEL/Mg==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtU1-00000007C4a-2D6p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 15:30:35 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-29f0f875bc5so78961915ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988746; x=1766593546; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=;
        b=h9gJf7jbRAsaClXGThUPXXkXJnX13OSLJlOqAsJ98F347Wc1JuziuUO8341IE7r42j
         AmqneQVwlQiLEE3EeMf4EQqg+6HRKiqOrmXKzJ9EHpi9ZAEhpuCf7xKgGCLvpZswv8dB
         ufGYc6k/hAbZIeNRXIRFMjqFgMDcAgW6FCVQ7eRDf6UKwu1scA8BON4zsuJpK+eYGumz
         gjoN1twZ0zMomvkJxbric3492RLcQL96/rs0JyrAucVsWNi9uFnxvnA16nvlfJnQ1tdO
         +ZTeTBjN/S1jSBjrb920VnUCX82X2EsxlXV3dBYXT5kaoAiIc13h6oCJX7zFOVz9n/Zi
         WDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988746; x=1766593546;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3tdOFnD1zwwXEjmETrN68s5mUpHoY1S7934/U4qRcoA=;
        b=nB90Rmh1SQNVtXb2FH3JrNzxRWWO5tq5cfW5muCtE8Yoh6dIo7nZUEcVEq9g7sUfyT
         FBN3ylrLBLOqsSHiiS7YEDExl3zVVPeaPXIfiGz12NBDFuBtsM4YyyCFxGGcYBUb5o2R
         z2iAxvp6yu9VV9cagq4h6DB9Y01L8rkMmSgbxkWj0fPGRIfG5ug3ui/6rKy/24Wpvh8l
         KxbfOKubfcSrYcI+Zb8ewFXtlJi9VbTocewXpWGtM0FH7F2qYBYuTfEr6BEt8UeBkUR3
         2e43b5ubuh61wrwvR8kLI3icmGGBnYHMdsHUvBAUQmQDo6xxCvC1KFtVChwHPzojvApe
         Spkw==
X-Forwarded-Encrypted: i=1; AJvYcCUp7CjA82paz6ZhjpVScV8Gb98AciFLjzjmbbhIFTA/q+PGnH3sQtC6rdNBjRXxqzISEglBu617RHHtg4Xe5iRR@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4JfyTA589QzuAKTRotzyP7hAfjsTGlQbj+WRNyLcPKvKyG1+I
	N0i6YeonowO8xiWHPZ9IIz6F1QAtbClfqb4W2wAvhBzEDFQAI5rgzj2i
X-Gm-Gg: AY/fxX79rN4E44kkTnCU5huwSgnb88RAW1Ph/oPR5tmnMsPZw4Jxp+QiYXT4nByKFLu
	9aKh2GM4V8c5PebnTBEO1+BCM+4T41NMNVre+iocVh65oxPApuAx+uojZOKug11a+7RTp9a4B54
	n9KTWJ587UifLld0koSLxAy6kyKPcGALUIe/BqP9NCkW6BHniI6pI6sJFroAeShiX6Fg5aq5dY8
	4PIsWSP8K/fbZMlUC9r1q9xASGHW1KGrZgXNxfxh794QZv2JmiNRl39MzgOMR7loY/wg1PgNg02
	GsDA9bxAlaazWb5jO6Mlw3Ix61pyx4cC7NvymBlhd9PK3C1Wkv/mzHKH6G3Ye/JOA+Hs6ZvCO1T
	DD3+EXvadPVDaO2djZww7RIbtcfllmxpEiM8+YeusgqroXpC09tsVF0tdM0gbs/37veqdsZyIWI
	XDSIjHhsI69SZZ
X-Google-Smtp-Source: AGHT+IFBX13bhHK6lVyBJcGkQoq1Msyy8h0DAZFFCMfV5WBxQlT2ggVro0V5kiEjXJT6j3aN8My8FA==
X-Received: by 2002:a17:902:e548:b0:2a1:243:94a5 with SMTP id d9443c01a7336-2a1024396f5mr116797365ad.47.1765988746077;
        Wed, 17 Dec 2025 08:25:46 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:25:45 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Date: Thu, 18 Dec 2025 00:23:34 +0800
Subject: [PATCH v9 21/21] arm64: dts: apple: t8015: Add CPU PMU nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-apple-cpmu-v9-21-4deadbe65d03@gmail.com>
References: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
In-Reply-To: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1462; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=trWVfDATm/MwjZ2+dtjuGYhC7m5DG/4DEiwR1Jy0uIU=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtlDl3Gr08qJF2sX03JXifmuERFH4Oin2bn6V
 wXHH3PV7m+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZQwAKCRABygi3psUI
 JNloEACKdtSR87e3pm0WecNFLB74uVTymD0eUkSwWkpCvJcS2bmrw6+uuPU5wdZQPIG+9akuhu8
 CSJdjD8jVGg8Fjx8u0Q2t38B9sCeW2heVblCjUOE9+tzx67P5DEBDaJPZxslQKpHGKRQcK7lx/b
 ETG3jDDCvTM8KV1iOT800Uxa1rRgm0hR0sP4tXTH/2Bxm6Xz/VWrDL13LcClv+e3eFOaOMZo7gy
 3wUoc4T1OypNKPayCDGbNzIcq9yeS94JpKxttdQefstDpXfzg5BFIE1kxXH5MZBu+axOLGVMyxR
 sMI8t4WLX27fYULPcY0/D0BiBKEranqFuWPcJMwOjpPNKBOc30qC9wdCrOME+gBLvHHPSek4SLJ
 lSPFwkKl7DNXVh92w84z3ehNHnzkl8rnJE0R2pMefLtxD0kThbHsSXuv1vKZW1WLvQZMhixc9+K
 xE4yQjIqVRkSD9/w+qLHbwuBNPD7gofTW4tzprVc3PwCLTbNEhBvAPdj6zPNJ/8UfXLn/bNmMaU
 ntJUB4NrWZjhG07Dxa0dGV2DnZVQjJNwYOqreNF64kxBrQWYEWnWs2oUB51xhyE0mHnh7BIp3I2
 cB/NB0PYZo/Y4WRfOLfYzXTHxkSOq8q0bsk4vnHJaGNFOmgN/QxF4N+iGs7LqUu0VE6lqPMMuUn
 A72HON61PR2Kjzg==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_153033_673098_53A7971F 
X-CRM114-Status: UNSURE (   9.04  )
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

Add CPU PMU nodes for Apple A11 SoC.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 arch/arm64/boot/dts/apple/t8015.dtsi | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8015.dtsi b/arch/arm64/boot/dts/apple/t8015.dtsi
index 586d3cf1f3751d9ee23262e55fd692bfee86c13f..0c1ebab56d6b36ed5362a042ecb6cecef7c97f64 100644
--- a/arch/arm64/boot/dts/apple/t8015.dtsi
+++ b/arch/arm64/boot/dts/apple/t8015.dtsi
@@ -341,6 +341,18 @@ aic: interrupt-controller@232100000 {
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			power-domains = <&ps_aic>;
+
+			affinities {
+				e-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_E>;
+					cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
+				};
+
+				p-core-pmu-affinity {
+					apple,fiq-index = <AIC_CPU_PMU_P>;
+					cpus = <&cpu_p0 &cpu_p1>;
+				};
+			};
 		};
 
 		pmgr: power-management@232000000 {
@@ -530,6 +542,18 @@ timer {
 		interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
 			     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>;
 	};
+
+	pmu-e {
+		compatible = "apple,mistral-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	pmu-p {
+		compatible = "apple,monsoon-pmu";
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
+	};
 };
 
 #include "t8015-pmgr.dtsi"

-- 
2.52.0



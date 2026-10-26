Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F354606C21A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HcapEy0n;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CF37+iYi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=; b=HcapEy0nqBU/qy
	R/1uVba5dEWtnMLMEJ6VUpc36xfaPGXmLxSV13flrE9xMuLM9dlqiqPQl7IdN+WjgKgoDtEzQnibR
	59EshKWD1r/wCjHtqxx+bRPySWDrqdBUvowYyTdVJOM6TaJuyJagj2rKuX3rQggmndlqvTwb+xSTu
	JAmFpRqJBKEI9zbEmk5Nev8qI3fTx4hzVi1y+DaE2AnFrIG5Iyqx3iLwi8x3JVc4/ndeWU1F4UcSz
	peFFJDAZT/mC1HSaEk2NPkAMllJOsfzDkPqFiOJE/+uDDUYjNY9i2vKyUff0O1xWkBKq4/+Id39ZT
	D+BMrP5A8yCLxY/0CM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSi-000000029ZP-2qkJ;
	Mon, 26 Oct 2026 09:57:52 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSa-000000029Nl-1R8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:45 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso21096565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008663; x=1793613463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
        b=CF37+iYiyhe0mKwJqk7uQHTu0nHlEiDVZQpK5tKCcDsl3zjQBQRxnbXVLxIfYC0nTj
         CFYxRltfBYHr33iBjYQQnD4MrHc1aCRzMoZAtUou4UG5145lC5/xvU5IVbpiMgPQ2K3p
         5Ht+WdPMj9Wh8XrkrcAU3ZrR3aH8zhCRZyt+freBBefJwxFZC8HdD3A+G5RwEYcVgGTg
         3tsrbMvSnB8DQNgBkh2PtTW4a8EjxT4kNJmjVIbrWCGNv/EpfVvVhyzKlPE4G7gS3XHC
         pTMsI+edWfqCqySFyEwU5cbalImfKw0XO5780YlUA7MnuKzE4H8otKYlfswK5m2vFx44
         1dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008663; x=1793613463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4L8nH3HZlXfWwZy4DPfohBXHPuRgz3HmlatAZsSpZ98=;
        b=frHgLGuHImzptdlpmxi/+yCaOPU3TJh9rAQBcPH1QQR91GInXuzNPpily8q16jcINC
         BAkf5qC6kbi/JDN/wbaaX4+IsqHxhDaiwzDLafWgibhY2LyDOd8giWsJNtVTz0Y2lc4L
         uKIB3K4Xaioo6uTd+2S4C/t90CtZHyZno8i+S6n4LuecidRm/COFsj2/0KPVJdJwd+oJ
         9eFEz3kOM6xkW6RYD6+cMC42HSxLmq5VlowYBo0WwBW8i7JeqQ3W0ybX+LHJ6nuk5ZeO
         P4usLEc4ZYLqa1Z4eCIUQVffSeXKXq27xtMtG6diIbr/JYOe1tCuNSkHiMOSWgcoUIa+
         48kg==
X-Forwarded-Encrypted: i=1; AKwUvBxyyPtme2kmtwuVOcp6KrRs+AJcGtx7pZiWvQzn+7wqhSS8/5++bEj5q9HyhCDBq5xC+GY3tHJrl3eJkBTBGRub@lists.infradead.org
X-Gm-Message-State: AFq9FYLdIIwakH+fC5FI706QFeQMwDHVhK2fkK58zYtUEUIG1+/QOX/d
	Z+YaywwwwgVD/Y540DWGJqMfOpE9CSyCQil2BvSRINuD1wb15rVctEH2
X-Gm-Gg: AYBFou3L1h59ATGUuEZP49B13qNHdqCCVYsCabm8vr4VnMWt9NnuAj2ETBKUlpltIBR
	L7JPYGEfeW4fDOVxz49sETsqtQnLlce4hRURVjwbZOesdHNixwkCWhwtihciNyGCUYntiqVKwbJ
	gnzSCP4CQnkLiC2A03OngjRqlNaKf7FubQivvzfCXO5utklzxRGFxn9ChjwWUsy5XGSOCBO7wAF
	Fnd5qh8W7vY13Vo/LG2fiGN7giHKpKGpTzGA/Mcq4sUcANGLySBMhZVv8+vq8T/8lRkrVjDXSI2
	foCXjpkbXgLgdvURaPLpk1pmwdn29oFc4et9iUcJPmHXOLE9Vtn05o+O4U3vvci2fA1L9SHiBKQ
	FiZuxWClBP8XVwzWCgwnU0AR3nC2Nby2gxTPkg9qBLmIU4yM9UIKB1cnlmKaE5Q7K2j70TuPIeh
	983cIVV0JZTU0s9AOFDOac1c5c8Iq0q4fDLwu4JPm4RTPwouDTU9kCn+B24rOs8Gef4iB3HKrgJ
	XJisutflTlboLcboFn9jfX2p9HJYvLBGQx21ZpWSq7TGAfSwzLgnvzNTomoy3ioJFBJX/Mm+jFh
	+WIeGMZQEK2++nsm7obxRueCCf3bNQMLs2N8/n9wZNvNkmamTxtE5V/N4bVqjjnOrGWCEBGpgM3
	TuSvubg==
X-Received: by 2002:a05:600c:1391:b0:4a1:fc0a:8b75 with SMTP id 5b1f17b1804b1-4a35ac9f430mr115674445e9.24.1793008662683;
        Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] arm64: dts: airoha: en7581: add PWM node
Date: Mon, 26 Oct 2026 10:57:12 +0100
Message-ID: <20261026095727.31708-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025744_396488_59783C24 
X-CRM114-Status: GOOD (  10.86  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add PWM node to control all status leds generally attached to Vendor
boards.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index 3a4a4fb0eba9..760f0c3e6090 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -509,6 +509,12 @@ en7581_pinctrl: pinctrl {
 				interrupt-controller;
 				#interrupt-cells = <2>;
 			};
+
+			en7581_pwm: pwm {
+				compatible = "airoha,en7581-pwm";
+
+				#pwm-cells = <3>;
+			};
 		};
 
 		i2c0: i2c@1fbf8000 {
-- 
2.55.0



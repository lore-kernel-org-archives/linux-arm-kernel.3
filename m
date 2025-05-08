Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F4C4C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gmRYy7utmsWW1vMgIDdZwd509XrFMI8BxRvnzGNpfEc=; b=DC8tzvCQ7nK5dBOv09adI6SDe7
	lcqOrBsUBacF2oKekehzZBlu3cWrFzmqTcalOhF1+HCYfI7XxA/8N4nT4+2fEiIFEBWhBSL0xoI8H
	G51RnQeQ2ACqwHkjLj8Zgrf22B5QfGvoJqqtsqe+EvjZhQ4XAK+uQSoqJwPf/dcrl0Lv2bSTLMG9O
	mRedcV8Id+FDsEQRnYdAmgLbQob77Rml6LpxT8JC89A6Ol0NAo8X57vpgknEcnDsid8Oc239u4rBG
	olKHNkc3yGwzFz2Cl65BcrIAe0Vm1Qlsi6sA7CdrDVgu/WFJEyk+Qhhe81L8TkSPCzpYTRs4kY1y+
	68nob+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2gQ-0000000110J-2DSa;
	Thu, 08 May 2025 14:57:10 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1yF-00000000rvP-0Pqu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:11:32 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-5fbee929e56so1953622a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746713489; x=1747318289; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gmRYy7utmsWW1vMgIDdZwd509XrFMI8BxRvnzGNpfEc=;
        b=J6cy0xKolf5h53OOTBbQS42nkN9N0aPjmsuwwbMpGeSB8TXWsURAqBUFBv+Lmmwz/D
         XXI4Az0GFwPI5vSWD6xNiSJXLef7aAsEvwV1FqOP0FP7hLLsfRW5M024EG6fcYU/JX+k
         htQXzbjFjb7lcu8SsnStLhNOb59Z05SdbbijoEJTVJvMDCTrrP2PO4/1o6NzMQf2uce7
         49zrWWXIDhgNmpZi5MlxxxpSt7I0CvIMESqiqOYsedJI+1zv3xjsQHr2W2KnObSRcD9m
         V1xwkuHIA4XhiIgyInWE51Va+5J6KK7P47rncjsyZj96hPtSBAlUypyDwIeCMKLvw/2w
         l3cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713489; x=1747318289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gmRYy7utmsWW1vMgIDdZwd509XrFMI8BxRvnzGNpfEc=;
        b=ENlGjPi7GllyMR6docT+UctCjJdpOQFEi9ZISm8Q1BV0X5F2zcnV9+HaKZCeU0HrkY
         drcU0Vfrw6BJNjotdtwumubfdicCDFJvk79mgtldotmgxrLLDl50JznpK9IypIOC9E2A
         /oSK0OL45khz8vn9934EBsP0rAhxsSq27xbEyDYd0mBOMARQqnESnYiH4OsFM4lowJVm
         FFgVvrMZOtzWnRMw4+wCMNhnGrZx2/iJdiEi8n1suU336C8HV5Y6w5wkHzXQ5hPrZOCe
         wFCLZL6ssXCUaf5qtr4pgP3SIUe6e7BAJm/c19+A3qtUM8NMnrkLJzED40XP6aH6GD7m
         yJbg==
X-Forwarded-Encrypted: i=1; AJvYcCVWEyP5pOL/XPbivlnC+F9Y7djrBnf3HOiC3oQcln25BzYQs8MnVF2bnSkkc6xk4TkCa92U+7ggyajSR9DmvRYP@lists.infradead.org
X-Gm-Message-State: AOJu0YziPU9XN21pNv/MEBb1idDXRDg/vp4zKjQNXP/n1ywl1cr3vhYT
	pPsSAF92w9XX/hZEuk/z+pSMuTp+uKdtOfI88i2fGUQAK8yCp70bHIEKow==
X-Gm-Gg: ASbGnctsPOFycmsRGktfP2/cd0JK7AG19UQji4cGmMljI4xl/TPN82l0uXRBsjlyOfW
	iqFXCbYupTzXpa0eGsMvtJ9eabGC0Zz3y3RfxbcfCo1oBCbpHdFq57yLaEhKMjKB6HINWwhs+pA
	+kFoZdW2YX09BlDJO0bnNmO2ZJoUPhbOFBnbp97g9O6/ewH3l+9iCCQWlGn+k6jaGGCaCqGWAnp
	PeLHrKvJLPiUnkGHtTKK6MutcPZ1zD1Iu+5xYfeYcE7d8C+omy8+gFeCTLkqSffUDx/pp8uUEmw
	Yl/Hucj3XoUiwet7xEAzla+gKRSIZSNCJlcmQRkiSIurRU/EzMy8pqSyZrrwLCYQ4kOGYVv7V1h
	Y+RLM
X-Google-Smtp-Source: AGHT+IErzJ1+fWrLhzeWG64c9NB32inORG3yHx5AwdjQDc1+bM5bqjhqk5pcy4SquAyemCqlh/sSuw==
X-Received: by 2002:a17:906:730d:b0:ac7:391a:e157 with SMTP id a640c23a62f3a-ad1e8e30332mr717103466b.58.1746713489075;
        Thu, 08 May 2025 07:11:29 -0700 (PDT)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891a3bf9sm1097552766b.50.2025.05.08.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:11:28 -0700 (PDT)
Date: Thu, 8 May 2025 16:11:27 +0200
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] ARM: dts: qcom: msm8226-motorola-falcon: limit TPS65132
 to 5.4V
Message-ID: <b67ed6c7813fa52cf00b473dded9b5042102f593.1746711762.git.stano.jakubek@gmail.com>
References: <cover.1746711762.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746711762.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_071131_156544_B60B5659 
X-CRM114-Status: GOOD (  13.39  )
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

After some digging in downstream sources, it was found that the TPS65132
outputs are fixed to +5.4V and -5.4V respectively. This is further confirmed
on runtime through debugfs, the troubleshooting guide confirms this as well.
Specify these limits as such.

Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
index e2bf292159fa9..d6d5a86491aac 100644
--- a/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dts
@@ -147,8 +147,8 @@ regulator@3e {
 
 		reg_lcd_pos: outp {
 			regulator-name = "outp";
-			regulator-min-microvolt = <4000000>;
-			regulator-max-microvolt = <6000000>;
+			regulator-min-microvolt = <5400000>;
+			regulator-max-microvolt = <5400000>;
 			regulator-active-discharge = <1>;
 			regulator-boot-on;
 			enable-gpios = <&tlmm 31 GPIO_ACTIVE_HIGH>;
@@ -156,8 +156,8 @@ reg_lcd_pos: outp {
 
 		reg_lcd_neg: outn {
 			regulator-name = "outn";
-			regulator-min-microvolt = <4000000>;
-			regulator-max-microvolt = <6000000>;
+			regulator-min-microvolt = <5400000>;
+			regulator-max-microvolt = <5400000>;
 			regulator-active-discharge = <1>;
 			regulator-boot-on;
 			enable-gpios = <&tlmm 33 GPIO_ACTIVE_HIGH>;
-- 
2.43.0



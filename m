Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E40C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 06:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=; b=EBtFDSoVpuMlTqMoMtYXC3O3hc
	uZO9gsrs/BdRt6qlKW/u08sprGnB0L3g3UrxcAYwxTIuT6Jx9Cp0lNzTj5KzjHlnllXEXc8P6u7Hm
	QbCBI2/EY4RhUjDUdW9qER1sgQoyk6N1zJ9eowrWprJfU5eK2xhGCUufw4+EABXs0dziZ0/pHUlCH
	wLXt0Dylh+kocBnCJUyiON/onmyKREOy0yhMVUrdRr0VgVDd/ya4/mwLkDWCKzXLovnrRKaZzyf1o
	FRnK7ANmPgRQviILHUMySMZS0bqkl8YUFc9NquukAxYIl8PPPKhwKCb2aPo21t3J5DzFhgTBLxM2/
	9oHOe9Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkU-00000006Cok-0jQ9;
	Fri, 03 Jul 2026 06:51:42 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfXkR-00000006ClP-10nK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 06:51:40 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-c125ba77577so15994466b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 23:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1783061497; x=1783666297; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=ddCFuPqLMc76sCkiNHnrGitE5Q31J7CtEprQzxcHdmY79YJk9Hl5J8/dJaj3eMEzBL
         LP/hAYxr2I+LPOyk33yGNwSay1MktRW27M3KHwXcf2CV8vV2PG8QI0m8d3MXwudgHuWr
         F/QOJuppM1ktJMqc/bMwFO+4x6SYpdtksJ3PE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783061497; x=1783666297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kjf+9zwLvFnbMj2uY67jnA57NYs5qvgfofKcphxJQbw=;
        b=XwGD7tWpu7TmGfcPQ5kqXcRLxcklu+Adg5p1TI23o7HE0VCjAWF7xLoUID0vLjUeSe
         Y+hzkSmdFepSCk0EaXFsS0Cytrc+Nsq3cOZTkK1mJMbXM4gLaYezXBegWca1LdQaQdLj
         8/CrAt/kPrQP9irnj2uMP9LBg85Vpn51yhluFdX0NpreVVRYVC/ICHsXf9WVVBYXpsa2
         9tUwbtXTIOlRtB7pJSE2EnsOcVvGccR8ndWeXiUQ1boUfttGvstpgc5MpTV5H/lmS7fp
         94l5tCHjJyuwiHsoYn+1Cq7sr74XOgT2oF/I3O+OPczxWHGueNbG5k+oy1CklPLZ8pzX
         x0vw==
X-Forwarded-Encrypted: i=1; AHgh+RrMwBkvfLgjR7maWrk0AU4pACH8e2O+pV4ovWYf/SwLk2YXQKhsWCFC7SwF75JX5Kyh2UASB2ADPMtrzJeEkaB8@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9q3JfIypmQ7L41E+x+nQ9fW6iRHlIm9vIKkmI91nrswQKxQk7
	hFACFUNZk/iLM1LWJMahPpfRgaajJwhxyuJBq9y+HfCS0aXsGiMCzq180W3QDHZxmdg=
X-Gm-Gg: AfdE7cngT5QRDiqH7WgGeh7djCpn8Mx9TUml2teFX7h39eZJAF3aGxuqjJVOysQEIkT
	GBnzhU30JAIzA1YZ9S73Tquw7xKYPQC6UHyqJfP3vabUYKhJpwcSGe/atRHlm9mOKUYKYAYwS1F
	ix7zjpOnqpjZys/YxotIOuxQMyzQ8wzsaxvfr547H9OSxOAoJJyUvEe7HY1HORsNq2CF3NNDhrc
	lLI2zzT/11fEDCwGVNpUx+F324iq+sXKnZyETE+OnBrI3iB2GlPed10fxkQ98uaZ4pfBtX6HO0I
	Uk6vCVgKNMZ1avDaq1fUAguEpWe/WlJZIvFEkJQF8gvh9AJstG8t2yo0usGsvvBg3EgqfRx6z66
	gwTydNCVzzcsonrwmsAR1YgPTb51LeR9xgt4X1lVDaHaAcnulBtJtCnwf3ga9F3Jg403Yg+2Koq
	8LXYmBUzcwC8qTFssqCTC5f+UdLyHfYvWzeiiLdGrMhToqrWVT1ZdVor1FsBAmSEImupYc9dG5Z
	1pkWRjy0andY/TmGhV4Ew==
X-Received: by 2002:a17:906:2091:b0:c12:4c5b:f170 with SMTP id a640c23a62f3a-c12ae898b32mr296340666b.62.1783061497131;
        Thu, 02 Jul 2026 23:51:37 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.. ([2.196.43.95])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c4695sm235462866b.44.2026.07.02.23.51.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 23:51:36 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	francesco.utel@engicam.com,
	domenico.acri@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v7 03/16] arm64: dts: st: add power-domains to sdmmc1 on stm32mp251
Date: Fri,  3 Jul 2026 08:48:53 +0200
Message-ID: <20260703065110.1433283-4-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
References: <20260703065110.1433283-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_235139_292796_C41629A8 
X-CRM114-Status: UNSURE (   9.69  )
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

The sdmmc1 node was introduced early in the SoC bring-up before power
domains were systematically mapped. Add the missing power-domains
property to align it with the rest of the peripheral nodes.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Added in version 5. Suggested by Sashiko.

 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 9c63fdb5a885..ae36d703532c 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1664,6 +1664,7 @@ sdmmc1: mmc@48220000 {
 				cap-mmc-highspeed;
 				max-frequency = <120000000>;
 				access-controllers = <&rifsc 76>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 
-- 
2.43.0



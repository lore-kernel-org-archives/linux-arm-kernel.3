Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0C4C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 15:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NT846XJMJyRwOcvkyShrYdeH9LcPT4dyvZSiDKPIbs=; b=hKtdfsmRYfTXkNuzxhLpFz8bPa
	ZavMEjUxhNumxDHe+eJYJDNvbRf9n2YK0T0XZcxm9ISvELchXY/+bkS0QwQUtQfxrdWvw+IR6Rksl
	ZgV4Ef08aJZMqlSXv1T1wfFPlx4OoV5yn/3qmuCI+E7i4Km9edpRsXMFKe8BHPazpcGwYmjhPqDzy
	u8XnE6KzK7CDX3y2b36hpcpmQVOk2GlzVwuY5EpJMfG+dX1mdaYoRwbSqIl4Ub55J9vBsLYKZwiYo
	iIuaC4fZZuFvdm4P3nfuiF/TVQ3msdC0/qPnnG4uh8VWk9JLMTFy0aBDPYLOxcSUtNgUWLlNFRlfC
	/AyaZ2TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8L7M-000000004WF-20KS;
	Fri, 25 Apr 2025 15:37:32 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J6l-0000000HHNV-07kA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:28:48 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ff64550991so1856026a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587726; x=1746192526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6NT846XJMJyRwOcvkyShrYdeH9LcPT4dyvZSiDKPIbs=;
        b=IOSzazl98E1zkg+F0PKzhh716Jf+gYlCdur3FSFCKb4sKZ8e1WesqgzI5gABu3pqYl
         /Km6rLPpzPE8seUscjiyRMLy5h7Wg1YHRC4vp2RBByRfPp1LOQUvZLQzjevylK7+qsxB
         YRzFGdg16JpyCUNQwBR+9qFfrxcB5wrqArrTaGXM/kC+j3f12u0JfSon+ELfU2mH75XE
         V/jrHpYRQj3beqJ5RbdqdIrSSTDjbIAYvOb7gCm7XTQ1ZQvbTs1qY3FaeZ2fb343gJAh
         q0HWFPsuiBpwnqe7Y+lXiubkE4iJYOjXBPg2EJ99sYU04wYOMpHYwYv1Oa3BSGsWs9m0
         7WiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587726; x=1746192526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6NT846XJMJyRwOcvkyShrYdeH9LcPT4dyvZSiDKPIbs=;
        b=g/ciwM4Mh/BHeVjdJ9J1t42yYhBFmVAZo8y2ab7L4cWhw7LC/BKBpZF7+i8/1+LUD5
         e1E6uAw029fCivSOJLKprtfQqKqaEBp1CxPWSP0s43QWUqErHF6RFbaTiN0sL6vkS6rP
         cJOdZNEFmMyvDyKKKsLNVMldd4jNSzbAN/SaOFb0aFe0dQmIjAw6Jesuq5O8Q/DAtg3k
         L2y3Cje5oXkDI4FibEfYClVHQ1E7LzT6RDoaewqidYZZc6eJrC6rTYaQDRu8VYrJAqzG
         tTw/tippgtk7Q/5KxF/ZgB9fQJ6y5VzKh8LXR72lHKaYEKlaX1P1RlPUL7g0ulh7GDM3
         mGDA==
X-Forwarded-Encrypted: i=1; AJvYcCU24OyLZydDmpZzlutPjhIOmbFQz6fDt1CjMLT1CXwQLBgSPj2I5TdxwdQLI9I6I9qKYMFxM/ELcVLAoSBznz7B@lists.infradead.org
X-Gm-Message-State: AOJu0YzYYoL0chkek5mdA33sq+U3QrqQNB8zrwZCfKr4We8p2dbRyjtO
	kHZAPoDE/x46oE53Fw+JhCxPU2y+FxD/V2QQNgdJ3ZydPJkSZtp0
X-Gm-Gg: ASbGncswXloIo83L73Zy4EUIG6PSNEeKTjE9D0AA54uxP1O+tOcKwvEG0Dnn808F422
	SbFVg472dvN5DX/lLA22ppcv1yCiXeLT7RcUyajFBdl7ULHg68RB9FeDYnQrUAWjeRP0kQ0zAFD
	rfRn78tZRKw80l3G+4wnnOqxdISfrn2G3vExmFhgm95KmqxSQTp7ssBChTDoGFW7a+b80e8CQ5i
	Iu/Ol7tNxipEER8IOJO/57PHsO6Oaa208r/JJThqbWLiL165C92ypKRtxDuXtTDNGH/hqY14hN/
	ZXduiLH/hoFRQ3ygPftgwi6M0HrsVrBYosGAX1+FKodh0YiLwTGREhPXrkcDXrvv
X-Google-Smtp-Source: AGHT+IHttHJvBg7oJGJnjpRaAv/YqhM1f5TNlRh7Cgzv7Dvtu3uvjcx0fbmj+uAs8hxnqYl2XkBYeA==
X-Received: by 2002:a17:90b:2f10:b0:2fe:b937:2a51 with SMTP id 98e67ed59e1d1-309f7e8eefbmr4181494a91.33.1745587725988;
        Fri, 25 Apr 2025 06:28:45 -0700 (PDT)
Received: from localhost.localdomain ([110.44.101.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f7752a03sm1564313a91.18.2025.04.25.06.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:45 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Chanwoo Choi <cw00.choi@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-kernel@vger.kernel.org (open list:MAXIM PMIC AND MUIC DRIVERS FOR EXYNOS BASED BO...),
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES),
	linux-samsung-soc@vger.kernel.org (open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCH v1 07/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos5250 smdk5250
Date: Fri, 25 Apr 2025 18:56:27 +0530
Message-ID: <20250425132727.5160-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425132727.5160-1-linux.amoon@gmail.com>
References: <20250425132727.5160-1-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_062847_066982_9500E122 
X-CRM114-Status: GOOD (  14.90  )
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

The MAX77686A includes a crystal driver with an external load capacitance.
When enabled, the crystal driver starts in low power mode. The
LowJitterMode bit controls the crystal driver, allowing it to switch
between low power mode and low jitter mode (high power mode).
Setting the LowJitterMode bit to 1 activates low jitter mode on
three channels simultaneously. These three 32khz buffer outputs
(32KHAP, 32KHCP, P32KH) are independently enabled/disabled over I2C.

The 32khz_ap output is typically routed to the AP Processor, while the
32khz_cp and 32khz_pmic outputs are intended for BT, WLAN, BB,
or peripheral chipsets.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
index bb623726ef1e..d41409019671 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/samsung/exynos5250-smdk5250.dts
@@ -145,6 +145,13 @@ max77686: pmic@9 {
 		#clock-cells = <1>;
 		wakeup-source;
 
+		max77686_osc: clocks {
+			compatible = "max77686-rtc";
+			#clock-cells = <1>;
+			clock-output-names = "32khz_ap",
+				"32khz_cp", "32khz_pmic";
+		};
+
 		voltage-regulators {
 			ldo1_reg: LDO1 {
 				regulator-name = "P1.0V_LDO_OUT1";
-- 
2.49.0



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E788C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Mar 2025 19:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ileqFVBRvtJdVr8tErJr7A3nzPzqi0Kezboo4Q441CI=; b=3ZS/OEvgFLLmGRUiA3GbVvHNhB
	zUibeMHg5R45gVUE+Dupn3uz7HB6Ki+bEEc+N78Zl4HfI3ry0nWMLqJVGWT6H1XrxMiV+CpVAANZW
	ms/admxhbXKY8dUv/lLZRTJ/Q4DQRSJc4tLXcjrYMXoYSljRiNQXD1fdvv/y3hXKib1pAZeQ61V18
	0fhIt0ot4EULeikp6yxzyU6FyUolIwYzwQYtkvRpNvT5R2inMhP8J1dnguM/tdg434jvk4SvB6D09
	wht5/SUU3aEzGnHjqvAc89kRKSeAfxPFhzrqql2cY+acQ78laQ6cmk4Nsqi0KMKEQmo9RngaxFuj4
	c+4JLCvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tttLr-00000000WCo-18fM;
	Sun, 16 Mar 2025 19:08:47 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tttAJ-00000000UOu-1xal;
	Sun, 16 Mar 2025 18:56:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-39133f709f5so2195398f8f.0;
        Sun, 16 Mar 2025 11:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742151410; x=1742756210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ileqFVBRvtJdVr8tErJr7A3nzPzqi0Kezboo4Q441CI=;
        b=ZFJK05YFrI6XNndULK4g5v/lsgvP8ujX21yuZ2GMVKbJp2z5OFpwoDrkpnpoEOpZIC
         yFrXvZ+CO9Uyok+zxpwtYyDW74ajd85ha1KBCn7tHA2Wk/c5FKjnlSxZXHJCA8ZI5ddA
         BiSKmWfu1c4wHfKE0jwswfEGgsyK/sQsKfc9QW0YhKB+X1gtuZXa+OZ6BagKXiq30aXq
         PBIarAOJPfEhDF3l5uYd4+v/izqRp9+8zHWm2zZxj01nk408dGjbjT50fR3R7Uwl98JG
         ftq0SVzJ1hknF0IHvWg9bKy7kL5BnS9xyQ21K1N8CCofon6jmWdXDBPcMbTLUYJzT79Z
         UFPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742151410; x=1742756210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ileqFVBRvtJdVr8tErJr7A3nzPzqi0Kezboo4Q441CI=;
        b=HtExjOby7wXzf7xPTGMKyIhmg1RhAlYcw/Xiut1y4/k6Ewc4qM7/R5q54L3IX16QcZ
         fqdF+Ya5AM5eZE40/Lvci6bPEq8CUsgC9pQu3HuyUZDCpL2zZ6X9VTxbJmNvh7ENxNkq
         Jh+SEOTeiD58yU5hhdk2/xoRL0y+bjLqZGpNFivDsZuUs7PFTvqbUvN0zuc9bsgF+1pz
         YYEx33AtMXv5THKC+q9fDWFe7KrRubMG/4dNgB2xBmxGEPbHLH2mqxVQDbjV9rHHu8jd
         67HgO6XwKx9mf1kwVWduWAYxXbVY38Hdn9tEJA7wv3dPSC6gIVamGBlo1nmKJIZEzla/
         CFqg==
X-Forwarded-Encrypted: i=1; AJvYcCUVMJ4AfTq2iRSHP9YvxFPcKT6HPDnaWfkubjdxoyXqu5KG5mfctPVeHO2k4Se2gaEMDgo2igiK2PM6S4A=@lists.infradead.org, AJvYcCUweBFG5ApFJYE7terk/R++M+e/5P0/3gdRrqxeKewmWk5njob34h/SJjJYwDnuio+j7gwKobb7aZHo+Gvz92fY@lists.infradead.org
X-Gm-Message-State: AOJu0YwZRezFATkkpwB1N2LOObfSaqIc5I4NyravjvkDjS8L1sq+/oWn
	YdAFNuxCmHdRPih1mB3tTLxXzD5lF7d3U4A3Ddg+tc3ln0Cn30na
X-Gm-Gg: ASbGncugLHJ9KH0Hvv37LFZJZb2tBVMB/zzdz3V/AJqtkLs3IyifiNzZ7ep7nab67+3
	2mzj6NFMIvpFiaPABw3nrOwnoB6sJXiV/e4LhiZCTzkhTJseYM2YquFshtU8mbRoUtuuHbb3qbU
	J1KiTQoBLid1EnzoJduDZ1wicA8XdRkckz2X/rKPX7eyvTwmnFWNWDAOkB6Lf8bqkGL+arEZdHf
	8ZheCSpQPg4oj1xDw/oY+080xp/rf/MFpMo/hKxebtNw5Puz4pd1cbH8eOGlIBedU4ocSf/ViU6
	qI1ZWLxXshV9P//QUBYDQ5lwQT/umCs4Ng2ERnnkOm/2s3pFSuWQy7odRg==
X-Google-Smtp-Source: AGHT+IHJ26+oZrdKRblSpHUYREjiIopohAi7e4Zi8nHStB+4J8T3y+CCblGsR2BG4HwURzM96IZoaw==
X-Received: by 2002:a05:6000:18ac:b0:390:f9d0:5e4 with SMTP id ffacd0b85a97d-3971d9f0e26mr10803759f8f.21.1742151409707;
        Sun, 16 Mar 2025 11:56:49 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d1ffb6292sm84692335e9.1.2025.03.16.11.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 11:56:49 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 6/7] arm64: Add SOPHGO SOC family Kconfig support
Date: Sun, 16 Mar 2025 19:56:36 +0100
Message-ID: <20250316185640.3750873-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
References: <20250316185640.3750873-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_115651_523349_D6091176 
X-CRM114-Status: UNSURE (   9.28  )
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

First user will be Aarch64 core within SG2000 SoC.

Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v5:
v4:
v3:
v2:
- shortened the help message (mirrored from RiscV ARCH now);
- select ARCH_HAS_RESET_CONTROLLER instead of RESET_CONTROLLER;
- moved CLK_SOPHGO_CV1800 selection into defconfig;

 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..af74bcc3c861 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,12 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select ARCH_HAS_RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.48.1



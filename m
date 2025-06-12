Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89AAFC71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=; b=O+zK3e/k3umyES0ndfGtL+p0uI
	9o0CrxJ0ArUhpkHlUrKEQm8TICTAAD9gf/A2D36v8990RNybEUHB9T4DEHH+XloET8Cr/B52Ax2Le
	M38WUx1PZ6JKhQh9eoGCGKZ7f+cHoODy3X5WMTr69pK4tt9Q/kB78M4XMuVZL9KAjNrKaTLQWmJwS
	HX8kiDR5m61sW2IkxYyXsHwTTBNAp7D/8Hfdem/5vGUi4z/gKE7D70hT9LAboVgBZ/SKyCGDE09Ve
	MYIyL3VyUXESzNI8i36suwhzqMTddMbA10pCvBpr1QWSQdByHG6rsvP60Kyw4U8nn/uIX7kpD3/Ei
	EnysO9aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowL-0000000EXBm-0el8;
	Thu, 12 Jun 2025 20:54:25 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhyx-0000000DSV3-3YyX;
	Thu, 12 Jun 2025 13:28:40 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-451d6ade159so8144955e9.1;
        Thu, 12 Jun 2025 06:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749734918; x=1750339718; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=S+IUiKi7BdFMyz9DmoivJ+1Ln3OhfqsYexv7HMb5fkk2PUAN0na8h98GioGNOvygtl
         70AK9VPLy4w0AbLjhaVER1hzeSHHPIyI5kjgP8MUVF4w1jWrXTtmeg3l9HJvNwzFNXXb
         fBxsiy2gT5LHMdqRzREa6OvrTDN0YElV/CCQ5LPU9nLtiXIHCPsDPSjiAaBr7jjI6tlP
         QJq1x0C/dAbwc7TfERcyUiLr6vQ1BsDjh5ISMS/XpsPZboUz20hRyrsTGoGfRPKdxgWE
         t9FClg4hbSldKBCodeJBbCMLYT8af3mFs1mo0qUrPafqF/ebuWJBih3Ie1gt32GOkZB7
         2m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749734918; x=1750339718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSh+fsCj0Vt40lW0BMzspPkUOeAQ7bE0kflPk84hamw=;
        b=TgreQajhlAuWljh3HUtWwZS6HYvT2MaAk47raIsGzuyVSPVe+wacWiD5nfUfoVapj+
         7m0dXzo+X7r0IZ3yt6r8iCOUuFB/OKSElzT7E6GK+ovfPReAqZlXYuGnJQfm10GN4yGR
         1bWf6tF0xWB+XxXCC8ricGDs4PZ6BpXE/188bKDNFVveaf+At42ycAS3maIAs2h2lmMF
         qBXavJdggLfINBF4usLBqGN68DsvMutlUJKWPLcSb66RqfqzJvRdxnipagsH3k6Nqo18
         FwNCOsT4cK+uhEa8pQ1J1VNdHc3hDDgpXaq/XnjLT18gJBbrNMlaBkU/KykAXgvaDbGk
         D7ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUE9bYKJ4hZ4uIj0faNlwCIJIH1uJVh1dASJbIKFg7n6Nx/9P9BoS/RkcyR67aIRg9pDUMk2Ut0UWWp+8=@lists.infradead.org, AJvYcCXtRY2Q+jGaW8rUiZZkgYz9jlTb+W7GbB0sFQPIpwrOFyoUopXrS3Es5Fbg2DPHfkcUpvzdE8d8pb/K8i0/wf/r@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ8yMV1zxKx66g3p5u9CkUuVr8doE9xfcJws0tMqv/GNyT/5hf
	k5Ngiqje6Qlw9qLe1oQ5vo11BcTJkRS759+0pC7aw3nC1gbUEnPXZDEi
X-Gm-Gg: ASbGncsGP1WlqjM4Fjk7MmYYWpGYE+Nzlni+TegHkWCJcPUd/brV3fW1EzuMFNKdvXy
	zS4mIsON9NQ+z0D+Zm4m+Gdm0da1Bcd9ZoyHDTYq3alT354J9hAEQG1nh2PoFIMSwwmrb/0/J5j
	DR0XVBMEd29kWdMYKNxC3AM7FKgjzakCKM2Ylexm2sOZWL0khDUiXvxplgVb/4/5yV6xXgSrLyv
	pESFEU+c+R/vem6PopLWFCbllmDrOG13oM1V+JClwCPUOEe35Gs5Ui7w9R0mVoIQRhULXgyaF9h
	nd8mEOENV4mSr+/Mx9x5e+ZDGgYPSPCrItQpYfkbACve74pjpG3LIu1kNdSeEEH3xqpowLXDvsg
	=
X-Google-Smtp-Source: AGHT+IHV6e6anEHK29lgBtoS3Bqax2FI793ZjT7balAPQMK3rYPdrVYTPT9jvAqFViLEp5FxmMolpA==
X-Received: by 2002:a5d:584f:0:b0:3a4:fefb:c8d3 with SMTP id ffacd0b85a97d-3a5613749e0mr2289648f8f.40.1749734918324;
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561b653d5sm1982809f8f.86.2025.06.12.06.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 06:28:38 -0700 (PDT)
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
Subject: [PATCH v8 5/6] arm64: Add SOPHGO SOC family Kconfig support
Date: Thu, 12 Jun 2025 15:28:13 +0200
Message-ID: <20250612132844.767216-6-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
References: <20250612132844.767216-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_062839_890358_2AB9ACCC 
X-CRM114-Status: UNSURE (   9.26  )
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
Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index a541bb029aa4..8c23aa111e94 100644
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
2.49.0



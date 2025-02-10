Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85FCC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 22:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ID749a2RfFyJrhYgrJoQoMzS5iiIuNRZKRb6PE7JVA=; b=L0S6webRcHrElVDDxaPRx10mZ9
	+H2jUAiuWSYX0uZF4MpyjiR977mQWJzz+wXGiUH+PsB6QZUHPFHCMBC3NZmai9yVP+zCg1n7tVc7s
	9qkDeh2IXCa3XIsodSd7rb/hYzopCA2W2ohZQk+UP2iJXDfefxIHhZl18uML2USzn5vKYT8cZXz5g
	pfsqxGACHMXZbrABKcQc0Jskx37yVSsIidCBwbql88aorjIFjgIqhhJps54MULEeOxNSynrbdOYBA
	AsV2dqnMQUNU3ur/k6YyiKZiRn/2svRgivb/OSm/o48+HcIu5EFU05YWopNYb+0AHXtPPU7fR9ftK
	cJufER4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thc8N-00000001dKm-1djk;
	Mon, 10 Feb 2025 22:20:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thbyk-00000001bNG-1JNz;
	Mon, 10 Feb 2025 22:10:11 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4361e89b6daso33665785e9.3;
        Mon, 10 Feb 2025 14:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739225409; x=1739830209; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ID749a2RfFyJrhYgrJoQoMzS5iiIuNRZKRb6PE7JVA=;
        b=CSuG7x9orlp57stkZxQnapTYK4uqqoEPRB/dbAqEI1XGpBC7hP+klGcJKLuzYJyfsd
         Tk62IjSdqPEodUu8gxLdMwQ+75ck4kU9QwxIZxu2hHrEJ9Kp8ndDcGSqJ7pm10QUYu9H
         VSDqe22x6txfg0xlHma4PSe/JozIWLBmdcpAEWd3ksTdTjh8rfvGdEwGDWA+W8Bwkany
         vW8NezpYg9xtHXUzDPXwFDOqWmLOgSy28DFtfXNAdQ7NbsaIr0phNG9xm16jYjsu5DVW
         5xIvDedv8mMEnObe1q8VyaHnQ9q9oeMVtuYvWcGYgqxkMcHKEtqXBBNyK2aG2Mnv7GOq
         jM9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739225409; x=1739830209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1ID749a2RfFyJrhYgrJoQoMzS5iiIuNRZKRb6PE7JVA=;
        b=WmK4/j3SNLI8m4BuoFWZoQ1iOxy4ONVzTYJSt/yh57EzD8XabdHpRbnwrC5ztjkLb7
         d37NbDCLo9XJdkMwq12B3f1NxLeS6HW+J/033vZXeQfgLuOvHU2GTjs8pd/6miBYDUWl
         568HiAUDEzqMvmRaLXF2sZMLCl8bCcWNAmVmPnHAjkRivGffqaKtZcnWfcYnrAjF5swe
         Vurk6kV9E+MX3CDS71ZYf3ohGu3BTPyELLsHvh4QZ/zsogseLXbMT9492vXOYVNHHzLX
         FP7Ii0gU1mu4SFpM73VBNTf4a5N89Rdpq/n5pwprOrPYH2r2VDqk2WBEy+G+U7Yd4hoQ
         2vxw==
X-Forwarded-Encrypted: i=1; AJvYcCVhGQAaLlmHjvyG3B6RWoz5vKVxTu16irf0k/ueH7o8R0263cdc92YAb+YRSz56/0kJUk8RI97BTMolSZzeQEsc@lists.infradead.org, AJvYcCWT2ABPekE4Zrof6cIi2fTRYOb5FTy66pjX+7MYzdf14/G7iOw8HNJ/Ekyfrft7D7wg8PkYd3fqA5wusyo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBwiOYc1s4nPioxTjNUFd7CnxnzG4XXx1dwUYkWHEVM6vY5Kkl
	clwITsJu1BWqKueGogI1IbAHO8NbJ1M621Z5Qzph7YvEuF80DsUp
X-Gm-Gg: ASbGncukw+wUEWwH116KnNyrfMAN3fNLp0DiVLscBFgzIEjTEUmpBma9pD/VeJEGdkR
	ygCqX9Ipu9c2AHmDzN4As0BO+NoOpKkQJauEjLuQH1cq2eq07O1o+E6JG70e9qVkW65n27PO2t+
	S6c4hjWegrxVoSIxtwEtIu2sQcB86mpr7y0kCzT68EJEEiyNMyLDTfhjIcqe64P7OgXMxeMg7LA
	L5QtZwO4Ge4gozRoE/xUiEV7Ad8U9lvHk9EKylk0Gvnyon4NF6pLKpqC+yDIBskZ16OZCnxzUDX
	9MULVm0ipQxiKzW8C9SA4RdnrQ0G
X-Google-Smtp-Source: AGHT+IHu+GvSuWdsjZukE/oaPSgKedfyRuF2nNPz3gTsQwY2pdQTpQmVy4TokzU8j7/5Hvjhdxrx6A==
X-Received: by 2002:a05:600c:895:b0:439:331b:e34d with SMTP id 5b1f17b1804b1-439331be5aemr96052165e9.5.1739225408672;
        Mon, 10 Feb 2025 14:10:08 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde1dfaesm13443450f8f.90.2025.02.10.14.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:10:08 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lee Jones <lee@kernel.org>
Subject: [PATCH v2 6/7] arm64: Add SOPHGO SOC family Kconfig support
Date: Mon, 10 Feb 2025 23:09:46 +0100
Message-ID: <20250210220951.1248533-7-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_141010_348716_14A83F3C 
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

Cc: Chen Wang <unicorn_wang@outlook.com>
Cc: Inochi Amaoto <inochiama@outlook.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
Changelog:
v2:
- shortened the help message (mirrored from RiscV ARCH now);
- select ARCH_HAS_RESET_CONTROLLER instead of RESET_CONTROLLER;
- moved CLK_SOPHGO_CV1800 selection into defconfig;

 arch/arm64/Kconfig.platforms | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..21b6a2bfb45a 100644
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



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D839CC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Feb 2025 22:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/QujbX2jGtUstFw82z9T0XkizV05xsjZBVL0CmnqVE=; b=u8dACli8t5TrkaiBdAdWJHxED7
	S1ako4RAT2Ztusv7IyRoJksy1NuvayHmvehR32XjiXvTf96fYk22vihDLjPI3c1xPMwjWuEAZEPeK
	yUrPMjX3W+hC0o0uEOqDk0pxw3RloXBEvxCZJ3RPq5OV/HvSH+jw0j1udHkwaH8UpLfGW3FkODpOJ
	MN1bzio7kQBgmPH63PPwY/W4lOQZA8r3t0r17G2Sx70QwU8WnHrh1ySY94svKGLWSVo2885S1ljeg
	/36TZ9M7BtgkE1hTCRfSADvCyvccUfDzLxquzAqXulsBwzrN2rthi65aO00Cx5BfKpk1Gl8Khn9Xz
	JYeU5qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thFV0-0000000Ff5f-2X5h;
	Sun, 09 Feb 2025 22:09:58 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thFSF-0000000Feev-0ODb;
	Sun, 09 Feb 2025 22:07:08 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-38dd93ace00so396463f8f.1;
        Sun, 09 Feb 2025 14:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739138825; x=1739743625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s/QujbX2jGtUstFw82z9T0XkizV05xsjZBVL0CmnqVE=;
        b=ldXDFMVwgqa3DLB/nByayYgX+EPvyVZa5CvuQN48sojCiasZ1avm+o/lLrLXAo05n3
         n1ErcA0zK5O8RAbZB3GUH3XtR3ADm4ysELCNYrTQ1HXUhMB8qRb9mug6CCcrckXr1ypr
         cnpr5uP+C0JWZLzs/Tvmzuia9KHBSh9Bjt4eoRGh9IdqYOWahi+dNVbJE09XLbaYhrV9
         WAm4VqhMqrNvAJ29PvhpppnUU3+cza5uPWJ96BpstSNN3wWJ2yHuhUts9nxD1zT8OYA9
         KiWaD3QkdUohXfTiR0IL8iYpEaZW2+SVcjEIkVKNuEof89WeJygiFfW95NRTOZXNp+MX
         PVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739138825; x=1739743625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s/QujbX2jGtUstFw82z9T0XkizV05xsjZBVL0CmnqVE=;
        b=KbPNJJkQS6C8Gni7VLism/ZsSdDcYDDDEx4S9j3Y2u20rdT23ak7fJKzZzHboitBRE
         H1WNKacFKNj3SxgpiRHtoycSg2z+gL3sC7WMwmmiynOLdX8pos5nY59T23npt/hKM7Ej
         jlItFgUJn5vREVvXKxsAA2dYhjgSKAHVmSsLOLLISfTkoFRsNoVkBOFuxSsjnNoyF7JR
         RAfSK83wcphYKXzSYpDhMjM2Nnyx9LHNYaS5y/br5KlQpyLC/w99/AAj+Y9XDY5fqn+A
         Jf8dsK8JzFb2nnR0mn+qiQL1AJJNV3tmhz351LZlSEWq457psF1yGxEMAaHTS4uNmZ38
         eirg==
X-Forwarded-Encrypted: i=1; AJvYcCWVbgSQ8b7kCGULPC5cS9Do8rRzkqoXN1omSQWeqg+y1J85XlQ6dJ6OnHyzy5Mkrvqp4NRQXUhvBpGwI+WZo1Px@lists.infradead.org, AJvYcCXsReCOSFJXBcS/+4TYPav/AvKKTnUsZ6vnkImjASAMV6MuiskQ70WIb/vvkK7tFhCRfJriztw3Pw0wi+I=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIOKgt4P8/z8lWxTaI35q4koKYlmWrYMYx+mbhQYUjQ8j83Dpx
	m+rbO4Q1POA/HaI8+5420+pc/ON/uTXIHS6MmW81d33lhzfc9sXH
X-Gm-Gg: ASbGncvSj57QGSufgiOnmCfqn3+LZ3Une5KDPW0vZBnb4ApHKoFfn+ysyzg9SqJDKCh
	zfWpvK4Hf9ZLnJvV+nl4QKLtsV4r1umaUyUcv2jZxQOY7bqsLFP0PEDYwJCYcba9p2C75DJNlHz
	83zVUZxfcAdf2u/vo/gfbs0xciUWcAeAormILltDVHoQZsB6E2kwHUojgl8Kl3s1ExySffrZ2Y2
	uuxIvLAVEX+gNwxQUwdAp0SIMl8iskVA02JXYyZd1CU2NoSzmJgIIx4jfPx4X1KjmlQ5GMebcAn
	5EpUb47JOV2g07ts6pjl6PkqLT7F
X-Google-Smtp-Source: AGHT+IFq/PkLrPFgckQmHNT1SzVXy9xhnmDdJPNYh1bI941awzELI8KT7wJXkxRv+KpnhizJv71gQw==
X-Received: by 2002:a5d:47a5:0:b0:38d:b0fe:8c99 with SMTP id ffacd0b85a97d-38dc935f0aamr8727252f8f.48.1739138825228;
        Sun, 09 Feb 2025 14:07:05 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbf2ed900sm10386544f8f.53.2025.02.09.14.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 14:07:04 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
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
Subject: [PATCH 01/10] arm64: Add SOPHGO SOC family Kconfig support
Date: Sun,  9 Feb 2025 23:06:26 +0100
Message-ID: <20250209220646.1090868-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_140707_130177_99FF1974 
X-CRM114-Status: UNSURE (   9.58  )
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

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 arch/arm64/Kconfig.platforms | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02f9248f7c84..f45f3f05edf8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -307,6 +307,18 @@ config ARCH_INTEL_SOCFPGA
 	  Stratix 10 (ex. Altera), Stratix10 Software Virtual Platform,
 	  Agilex and eASIC N5X.
 
+config ARCH_SOPHGO
+	bool "Sophgo SoCs"
+	select CLK_SOPHGO_CV1800
+	select MFD_SYSCON
+	select RESET_CONTROLLER
+	help
+	  This enables support for Sophgo SoC platform hardware, such as
+	  SG2000.
+
+	  Enable this option if you are going to boot your dual-ARCH SoC in
+	  ARM64 mode.
+
 config ARCH_STM32
 	bool "STMicroelectronics STM32 SoC Family"
 	select GPIOLIB
-- 
2.48.1



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF98C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jjHfgQa85l7Wa50vwlXdc5jSslJUPSuGPzeL+tkQOM=; b=Bbyow9cqHmR7WsUNvFqKwlOZgA
	JY51ahvi2TqHRN4AYOOJbMncglHQoGdW0AlO4g0EqP0ulBFC0oNrMAAy2/kdFKLR+ZfN4cC/Vlv2W
	qx1oVgEOMnWsu1audmWvpsVq0XBR7zFDRWHIKnlJdlEtHHLyFveMSi2xpygSxzHL7qck2qYnRKwve
	YhleNNi9uIwQtjLWMYv9R3IwQn8murLAmFT8h/J3YwkByxPcCQAibrcR/45am9nRCJ6zUmuTBQ9L5
	2USwdSlRFcMKtDyW7KhXtNpDT3fdE5vdpVf9ESChpYXmgY7Mj55sOVRXceAU+7uO8WEya6IHW51EX
	5aWf71ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoW0-00000003013-2cjm;
	Mon, 07 Jul 2025 16:16:24 +0000
Received: from mail-qt1-f171.google.com ([209.85.160.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoHJ-00000002x83-3WYn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:01:14 +0000
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4a6f3f88613so31185441cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:01:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904073; x=1752508873;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+jjHfgQa85l7Wa50vwlXdc5jSslJUPSuGPzeL+tkQOM=;
        b=pH1V7v5LSgV/xvKBvSZFAwY98NMf4Axq/hUx8rZSxZb0JowtjPj/S6kYSSVDUvpyod
         ogPT7Thc+21HXZw5IRK83FyuOufPyOIpWgSmB38q92uS1OiQ3qO5Bv36ly3lp71p2elC
         3X8/CTBkxVlneF0gJCIh8xvDiTaACv1wfmC6z+b4nR19fUvcCOxdjv6uNF/Vx2Gxx4GV
         vW2yGcbDsgjLfVy0TWCBVtmSMaL5j2y1wYmT0b2oKnYba6ZsFFmpQvgIs0Bi264mO2s6
         0L/7sJzfRVYHScVvrZt8+IBaIZiNGTdoCNrMsu/KME3NbCqvf0MZeBsN4oBcQHtO/gML
         ZxqQ==
X-Gm-Message-State: AOJu0YzCmdBSLBg8vjFFRW1N/0S4plhz0dzk3ju9/jJ7S1Y9t7MA6UYj
	PLoZ5Pktn6mL2UvUhhw+y89UX/pPwfl9ZoX/pZ8XTOEw9kEVqNUA9BN2
X-Gm-Gg: ASbGncs4tXhchxynWW0xgp2uHElwYBoc5JIW8vu2LIokpbZ9laioROXitEoUsf3x75y
	HCzyA+FrptrnK0WW5rIOFb6h8OWRQdeJM4K7kdGFIwUB6iW8EFIBiK5qfOzzmnCBzSJXt6Twxhv
	D9N5rW4E5Cataz7aSC/3hr5tWXV+GVjcQemrEJfT3r/i2w0NR0PnfsfNkbxgWwRi9MYJ+ADXKUh
	WSeyBEknUuBEjrW1n1IJN/yuPkMnXmeJbpVkQFrkz0G+K7gixGA1RI0Ump3OufsOGd5/ka33OlU
	amjpqNxDMmkt0yMBHZ0dEOoeFI+W0hC+g3juK5jYGjaEXem5BkJIMkEFCzxxgjGL
X-Google-Smtp-Source: AGHT+IE5H4TbOWXiMtctRzGpVMXWMN9EKKkuzuG65fneNh4UquF4oGHK/oRc691OefT6XfNku9H7Ag==
X-Received: by 2002:a05:622a:1a85:b0:4a4:30e7:782 with SMTP id d75a77b69052e-4a99868ee60mr169101571cf.18.1751904072585;
        Mon, 07 Jul 2025 09:01:12 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:70::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a9949e4ca4sm64253881cf.6.2025.07.07.09.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:01:12 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Jul 2025 09:01:04 -0700
Subject: [PATCH 4/8] arm64: remove CONFIG_VMAP_STACK conditionals from irq
 stack setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm64_vmap-v1-4-8de98ca0f91c@debian.org>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 leo.yan@arm.com, kernel-team@meta.com, mark.rutland@arm.com
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1270; i=leitao@debian.org;
 h=from:subject:message-id; bh=x8QOGtWB+FaUXQmrwaETRfFBKmxNNBcJSQRVAv+MXUM=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoa+9DSBRMI8Y7WDeHlaRNjWDgkbdHTVhzsSsvE
 KRxvRSyGF+JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGvvQwAKCRA1o5Of/Hh3
 bVKED/9r+4+juSqRb8Mc4iBHI9xw8ErDqMCrI12SJuUy7IbUOWXvJslgGnAt1e10WTa6qR76JVx
 iSB9b/Yrz4mg83zDv/8Z0t+YZvKRbB+jhnIYMVE+MjYqTJo3EuJ+Zy6VW2jxtrrp/h650qCN+hj
 o1mxdHmMHP1zRooSOi0xkjJpSL+rBc5si5G6l7lwe4NWzo5enJg2qHhmw2WDpgPa0ZsRuqMz65O
 K1cJRDCPwsYUKioooZJZbSe9lp4sSAj0Qfz6iqE2Vx2SmiWTMKJdGWT30lM8U8aTka9YoVh1peX
 uqAWQUegb+45HGHW9zRqGBPZeaIBrWwcDI0cR4Qdv+f9fYqgbfTGC7UHimmG8RGbdC52rN5TY8b
 A/prszx8n/q0m01cL2elWUmWTTe5N1fHbTTuDWn1hpgwMx0kQhbwoQssJNG++g10yIsS6GiYbnZ
 6Xz2ADX+bL+8GsWsd/UDv/X4Nl1Gyaze6myHfKKVtbxnpdoESx5M/PVd/5WPgQVQ1apqRgbVE4d
 kAFjNZ1tIgr39Az5O1q12sXbf1IIRCCbz+rpTUQJv2m9JgNJ2Pkng3OW/lzYH0GATE/rmHT1YPf
 e59OeqXrDonSvnEp8Ubx9UEM3bgcUNt/YFIif/MsXq1xPCZ21vW+P7YK2DRgdJwLzppREiJAURr
 TXjI9Mg28CTMZCg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090113_881980_11CDA168 
X-CRM114-Status: GOOD (  10.58  )
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

With VMAP_STACK always enabled on arm64, drop the CONFIG_VMAP_STACK
checks and legacy irq stack allocation from arch/arm64/kernel/irq.c. The
code now unconditionally uses the VMAP_STACK path for irq stack
initialization, simplifying the logic.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/irq.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/arch/arm64/kernel/irq.c b/arch/arm64/kernel/irq.c
index 85087e2df564..c0065a1d77cf 100644
--- a/arch/arm64/kernel/irq.c
+++ b/arch/arm64/kernel/irq.c
@@ -51,7 +51,6 @@ static void init_irq_scs(void)
 			scs_alloc(early_cpu_to_node(cpu));
 }
 
-#ifdef CONFIG_VMAP_STACK
 static void __init init_irq_stacks(void)
 {
 	int cpu;
@@ -62,18 +61,6 @@ static void __init init_irq_stacks(void)
 		per_cpu(irq_stack_ptr, cpu) = p;
 	}
 }
-#else
-/* irq stack only needs to be 16 byte aligned - not IRQ_STACK_SIZE aligned. */
-DEFINE_PER_CPU_ALIGNED(unsigned long [IRQ_STACK_SIZE/sizeof(long)], irq_stack);
-
-static void init_irq_stacks(void)
-{
-	int cpu;
-
-	for_each_possible_cpu(cpu)
-		per_cpu(irq_stack_ptr, cpu) = per_cpu(irq_stack, cpu);
-}
-#endif
 
 #ifndef CONFIG_PREEMPT_RT
 static void ____do_softirq(struct pt_regs *regs)

-- 
2.47.1



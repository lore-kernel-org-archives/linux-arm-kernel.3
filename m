Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA443CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 08:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q88hKfU8Hy8EIQha6HXQ97z19Xx4zKmGDo4bPrKg7sY=; b=kH5dkWBGUh/mzBV3VrDrTxoaYZ
	pFaXN77JhKD0SmCTvVlvl146vMoMeOmifzzQOXUh3ctot3zR7iat5ls02nr+JcIzU9SDHdVDwR0o9
	kxUtO00br2xy87LzxU3+7ebZSjd6fzqdr8pP08qmjnMcviPOcoU9g1fA/fhk0YpeWtLY24cvQGPID
	+rysskzga2g5cbUiw4HVTcQQTAkMPd+lUEjoDBEc9KsHoRZ6Og0BY1INXPwgdZj6jGeL0ny0ovWuk
	3PT7YY8G7GMj4lOwXRqJFE3CEyShaBjKrDDL171TYf338tn2onFGD9fvfdqgdWkuCyC400EgnSX3l
	otiLwMaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu544-0000000A7BI-35Gh;
	Thu, 04 Sep 2025 08:11:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu4h7-00000009z83-1XmY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 07:47:46 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so815102b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 00:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756972064; x=1757576864; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q88hKfU8Hy8EIQha6HXQ97z19Xx4zKmGDo4bPrKg7sY=;
        b=JOXhGHCKQEkuXU+cNSH32+27e25C0rKa5yLZK/qAmwA019IKEW4ZXa1gHCQKH5Qb98
         rm/OherZp6x988jGWajtjQtJuF1qnd3taFgDqMdlpi+w9b/0U9W+JpSprfEvIi4Oqu97
         Qg+s/8nZZHdeA94SdVky/HMnj6YMn7usg1xhNL+D5bJ4bs6Zax6kis0iwPbVmgEoS4X5
         kXK9AzaMWkrWfrQ0KMH2UUvOuwbaAUeGt80H7q1wI/43AsxUWoXdB6ewkwxGO+Sqo/hA
         j8vLnmTbcketLCaON4UhR7zkSi/cXnZLRwtJHOxadcdoHlgi0YKHTkaUQwRiGZ/JMmsU
         cFbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756972064; x=1757576864;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q88hKfU8Hy8EIQha6HXQ97z19Xx4zKmGDo4bPrKg7sY=;
        b=JF83tLJ3n1CS04bzdfDY6yJy9yg8avn0XxyGRAjAnDPn0gbbwZlTOciFqGShy1UTUN
         E1MnZ04P5+vEgqnzdQ9Ku+L5gZG940YOpQDY1LXUn/tJUPHzzZfBU030L6jPt5DK6dx7
         4MKMU+mh1Ow3GGKAkxjUhy9Cz8Zb1EPBAhErEF4WM5QrXyMNjds5NKx1ynWQZWbEW63H
         9FT9bAOx06aQZKBC+pT+fG/dreS3lj7gPcJ42aXWb9Y3P9jHxP4497ElNtRTMxwY1vOA
         Ifpa3pFiacz0BXoGufJ3QwUCXejAg4PSlF95DvkAlrQJbZBX3YKZ53qo5qWTN0iE58xj
         mYMQ==
X-Gm-Message-State: AOJu0Yx3VCsTLzjwUd+0O4L2685ftB4fi390ZNJR7P/pnIXd8o2dQJ/X
	KmbZaurE/rhZFo845p9viEm6f7c4G+TiYCeXMdgqKoTj3W497Mf8kRPB
X-Gm-Gg: ASbGnctqPRjLCm/39IXmDu6XmCJv/aF8qMSfZjvLuJE8pUobqkfLdtIpsgaixJgV8aT
	5Dxu2JrogEW3RmX9VSnpzil8Q/WIWrWLHbmdraD6b10dFbUQlD4tu9hvVF0s0ut7dW/PGjbtHpD
	R1D+lrSC57bFfQ2k2mDOUho/V+B8w+3jH4Lux71AMKRYVPSUY9E0rVsWVB04eDYPubsQwHr95SG
	dnupfNOMPGqdHe2gg/8rmDFAOg+2DNbyjBM+7HfTJwZMnJD9G+p1WRhITITLskXt/GtYJU1DgwG
	keS86CgWSI35F4G7OS94yq3qE0s6uLHLg1mIq36TBRDsbzKaEFFb/Q9Fc7zDCfpzkzZrtWLkyiI
	DnfD1dzqIC1cQX8+zU9ECP0AklGPQZxWpV1soDenC52eVy4Bh2tE4
X-Google-Smtp-Source: AGHT+IFOMFzYlxH6hEamwoRKC2c4mONqfkPJG3ZH/sTJm3Oh4YrKkFfiMYAINhoGKkCZ2ACat3AIlw==
X-Received: by 2002:a05:6a20:9144:b0:243:a9b6:dea2 with SMTP id adf61e73a8af0-243d6f02e4emr27118768637.29.1756972064183;
        Thu, 04 Sep 2025 00:47:44 -0700 (PDT)
Received: from localhost ([106.118.103.156])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4cd073f476sm16119124a12.20.2025.09.04.00.47.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 00:47:43 -0700 (PDT)
From: Mengchen Li <mengchenli64@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mengchen Li <mengchenli64@gmail.com>
Subject: [PATCH] arm64: kgdb: Ensure atomic single-step execution
Date: Thu,  4 Sep 2025 15:47:23 +0800
Message-Id: <1756972043-12854-1-git-send-email-mengchenli64@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_004745_443929_73DB7CB3 
X-CRM114-Status: GOOD (  18.89  )
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

The existing KGDB single-step handling on ARM64 is susceptible to
interference from external interrupts. If an interrupt arrives in the
narrow time window between the execution of the instruction under test
and the generation of the step exception, the CPU will vector to the
interrupt handler (e.g., el1_interrupt -> __el1_irq) instead of
triggering the debug exception immediately.

When the step exception is finally taken, the context is no longer that
of the original instruction. This causes the debugger to appear "stuck",
as it repeatedly tries to single-step through the interrupt handler's
code (e.g., irq_enter_rcu()) instead of the target code.

The fix is to make the single-step operation atomic by masking interrupts
for its duration:
1. Upon receiving a step ('s') request from GDB, save the current
   PSTATE and then mask IRQs by setting the PSTATE.I bit.
2. After the single-step exception is taken, in kgdb_single_step_handler(),
   disable the kernel's single-step mechanism and meticulously restore
   the original interrupt mask state from the saved PSTATE.

This guarantees the instruction is executed without interruption and the
debug exception is taken in the correct context.

As a result of this new approach, the following cleanups are also made:
- The global `kgdb_single_step` flag is removed, as state is now precisely
  managed by `kgdb_cpu_doing_single_step` and the interrupt mask.
- The logic to disable single-step and manage the flag in the 'c'ontinue
  case is removed, as it is rendered redundant.
- The call to `kernel_rewind_single_step()` is unnecessary and is removed.

Tested on OrangePi 3B (RK3566) via serial console (kgdboc);
allows reliable single-stepping with GDB where it previously failed.

Signed-off-by: Mengchen Li <mengchenli64@gmail.com>
---
 arch/arm64/kernel/kgdb.c | 49 ++++++++++++++++++++----------------------------
 1 file changed, 20 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kernel/kgdb.c b/arch/arm64/kernel/kgdb.c
index 968324a..ee8a7e3 100644
--- a/arch/arm64/kernel/kgdb.c
+++ b/arch/arm64/kernel/kgdb.c
@@ -101,6 +101,8 @@ struct dbg_reg_def_t dbg_reg_def[DBG_MAX_REG_NUM] = {
 	{ "fpcr", 4, -1 },
 };
 
+static DEFINE_PER_CPU(unsigned int, kgdb_pstate);
+
 char *dbg_get_reg(int regno, void *mem, struct pt_regs *regs)
 {
 	if (regno >= DBG_MAX_REG_NUM || regno < 0)
@@ -128,25 +130,15 @@ int dbg_set_reg(int regno, void *mem, struct pt_regs *regs)
 void
 sleeping_thread_to_gdb_regs(unsigned long *gdb_regs, struct task_struct *task)
 {
-	struct cpu_context *cpu_context = &task->thread.cpu_context;
+	struct pt_regs *thread_regs;
 
 	/* Initialize to zero */
 	memset((char *)gdb_regs, 0, NUMREGBYTES);
 
-	gdb_regs[19] = cpu_context->x19;
-	gdb_regs[20] = cpu_context->x20;
-	gdb_regs[21] = cpu_context->x21;
-	gdb_regs[22] = cpu_context->x22;
-	gdb_regs[23] = cpu_context->x23;
-	gdb_regs[24] = cpu_context->x24;
-	gdb_regs[25] = cpu_context->x25;
-	gdb_regs[26] = cpu_context->x26;
-	gdb_regs[27] = cpu_context->x27;
-	gdb_regs[28] = cpu_context->x28;
-	gdb_regs[29] = cpu_context->fp;
-
-	gdb_regs[31] = cpu_context->sp;
-	gdb_regs[32] = cpu_context->pc;
+	thread_regs = task_pt_regs(task);
+	memcpy((void *)gdb_regs, (void *)thread_regs->regs, GP_REG_BYTES);
+	/* Special case for PSTATE */
+	dbg_get_reg(33, gdb_regs + GP_REG_BYTES, thread_regs);
 }
 
 void kgdb_arch_set_pc(struct pt_regs *regs, unsigned long pc)
@@ -195,18 +187,12 @@ int kgdb_arch_handle_exception(int exception_vector, int signo,
 		 * over and over again.
 		 */
 		kgdb_arch_update_addr(linux_regs, remcom_in_buffer);
-		atomic_set(&kgdb_cpu_doing_single_step, -1);
-		kgdb_single_step =  0;
-
-		/*
-		 * Received continue command, disable single step
-		 */
-		if (kernel_active_single_step())
-			kernel_disable_single_step();
-
 		err = 0;
 		break;
 	case 's':
+		/* mask interrupts while single stepping */
+		__this_cpu_write(kgdb_pstate, linux_regs->pstate);
+		linux_regs->pstate |= (1 << 7);
 		/*
 		 * Update step address value with address passed
 		 * with step packet.
@@ -217,15 +203,12 @@ int kgdb_arch_handle_exception(int exception_vector, int signo,
 		 */
 		kgdb_arch_update_addr(linux_regs, remcom_in_buffer);
 		atomic_set(&kgdb_cpu_doing_single_step, raw_smp_processor_id());
-		kgdb_single_step =  1;
 
 		/*
 		 * Enable single step handling
 		 */
 		if (!kernel_active_single_step())
 			kernel_enable_single_step(linux_regs);
-		else
-			kernel_rewind_single_step(linux_regs);
 		err = 0;
 		break;
 	default:
@@ -252,9 +235,17 @@ NOKPROBE_SYMBOL(kgdb_compiled_brk_handler);
 
 int kgdb_single_step_handler(struct pt_regs *regs, unsigned long esr)
 {
-	if (!kgdb_single_step)
-		return DBG_HOOK_ERROR;
+	unsigned int pstate;
+
+	kernel_disable_single_step();
+	atomic_set(&kgdb_cpu_doing_single_step, -1);
 
+	/* restore interrupt mask status */
+	pstate = __this_cpu_read(kgdb_pstate);
+	if (pstate & (1 << 7))
+		regs->pstate |= (1 << 7);
+	else
+		regs->pstate &= ~(1 << 7);
 	kgdb_handle_exception(0, SIGTRAP, 0, regs);
 	return DBG_HOOK_HANDLED;
 }
-- 
2.7.4



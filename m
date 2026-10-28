Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE1860A3813
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 15:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWFSLLVj;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y6jl/SPq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=LtVK1tZIhPZZzO5/CiK34fSmqjpUW0luLWU4OXZFlqA=; b=YWFSLLVj8GjFNq
	hmWyPsVFG8/KXshV5EhlVTBNIJEo+Pz8BLCmC2bezni/QNSu9fqxuqxnJwDCEnnR8vO85bvzWhWpQ
	v75BWwRxQA6BmWPSpigXKTJEK7Ayg3G7RH308Mc4hVsBiokpKmCiXjACjB/8Tr90PCvJ6vJ5Zh3A4
	mVuGiSn+4ogpJH2pMEkYU9P1z0QBCMDIvWY49VIsm3lOZ9jaxXgiYrSwt7uQlMedhxW3Bt/0U8JVt
	N17sGYG5IAjr7/xJL2TA1lRDUdNwIwD/z9cWwL7hnoROC6cSuyeqQzo5I6Rfczw5ZPmiycbuqrUcC
	0e744Xn04bS7ywxMMCDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5ov-00000007RDP-04IW;
	Wed, 28 Oct 2026 15:44:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM5or-00000007RAk-36Bz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 15:44:06 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so8510045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Oct 2026 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793202242; x=1793807042; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LtVK1tZIhPZZzO5/CiK34fSmqjpUW0luLWU4OXZFlqA=;
        b=y6jl/SPqlacPa8Pl+I2VVo0fS3skTiL4BTzO6Aic0eG4QGAvyq/2zHq0zco23EaWBR
         GVtW1OXK5HjL0alCphcWVLdsYFaUcGsOpfI6/n1TCOjPoOWaN8k3sf/Be/L6EhjuEflh
         akeDOYvk8FAYnmgPdCqweugZ43uCVb7K+25pbVB1WQVejiBabf4XYqE4VIUFb6ztyR/6
         PlBt2Fx2W68GTVvXyPMlNGZPutkzXtx92fEJUvm+MSN9Sbg5X5vEFRkosTY2bx1oF97N
         hOAvhoCv0IjP4echQ0GwaINIK86qfarqLMTFEXPBTgQXYO0hQ/0/kJNYo3T7ooLuutZl
         Jm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793202242; x=1793807042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LtVK1tZIhPZZzO5/CiK34fSmqjpUW0luLWU4OXZFlqA=;
        b=Ss8ylzGkD/XaBbPHyURVmUdaNq63rnFfJHzAEmhSAvBpbHsWoPW0Q0ZNq+8qpOdTRC
         8nBq2QqLJyQHTTfVFb+0jGBeXwMWuIkE3Y6Cn9nGriTon1GbFIOS0BDQ+m2SKKMFKs3p
         YpXcJ9VmP1vtIqaLqeNusKHr9r1WcP+UB/Sb2IbSYQVSR3KH5UXRYyxxJo7bOMYkDiVy
         /4Wxa5OwfoUuSXv6f71tfT3e6sv0lIJI/Pn+gUwnqgh8DdMzvTXE9voqdcMNjb/rlCNh
         7r+fGUe2vw/Y5BBXcIfRQ6cvX3mHBcSjohafqas0/11b2hGWGe5HXvmWrc+7ZArorIy2
         apQw==
X-Forwarded-Encrypted: i=1; AKwUvBwpbK2tXV1lvzaUN1uCrOI3xUVnnjQw4ELY5kHK3wmqyS2dcm2DciPmA2U4SRDknYImZB3R2CP/YSWtIC1Sk+CB@lists.infradead.org
X-Gm-Message-State: AFq9FYJO0G/bN0Uv1hUYgNM+CKQXRHbDgN3zYKivlatok2dKUSri6Q/P
	FYEg/WEKka+hcJmZkcgK3WNHY/cP9cHFVunJ0uIxpCdM8qSu/8npr9jb
X-Gm-Gg: AYBFou3a9F+Hd3O5u38xAEb8d85KTj8neNeqDFtFjLMz0nLxDJ81qxmsSBuBnt8IbMv
	XKVH02rDBXYr28Q1tBKYmHeDkBy97OBqEs+82BPty851CsxTnajwENq5+3sBC8NQkow10sh6jyy
	3PA1nFmQbg4L8qNs8FlYMCpYvrPF3aD3v2aJQKGLw6axEJCWkrdzKf2F+EcP/EGVPZQTAyB2oF8
	dr87nebGfaa7qKPnsnuAAwb6jMTkkokjCeX1wI2GiQq7Bu2oO9yL4Oy3HSPYQdi7xMTIdrjbi5h
	1XlLCqvLDAzCCm75kxfyM5qFKVXvoMZrWVlDGljiV976QqOb8m4vcAJut7D5sNo8GyIf1MtlSDU
	xVdG//cewbppo1Xw2cRpv1tK7w31nsKrW5oxvkFsIdrZVjQHYUCDMhwH82flkM+sKSN4lp/UM6y
	bG96iZm+6MY6x8J+tfGcH/tlmN9fStqyRLPRHEB69l6qPxv/VQroudKRI+tsOuJaPRa9ycAQAIu
	BNsnBwNzMUjcsBhV8lE9/WE19BEwaLCG6FeXs1rNAiDM/nZTPyUDPGlsN2cxMfI+WeHpIBkBBa/
	Y5fNBiYdkQftAC48LnKrE1MHdxWfQgYaqbvIZlynJOptgTKCRsnVVUUYJ4XPxSyEAA==
X-Received: by 2002:a05:600c:a48:b0:4a6:42cc:bf66 with SMTP id 5b1f17b1804b1-4a9661ab4e9mr59192805e9.11.1793202242297;
        Wed, 28 Oct 2026 08:44:02 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm37044493f8f.49.2026.10.28.08.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:44:00 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	James Morse <james.morse@arm.com>,
	Yury Khrustalev <yury.khrustalev@arm.com>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Zong Li <zong.li@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Zishun Yi <vulab@iscas.ac.cn>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	stable@vger.kernel.org
Subject: [PATCH v3 1/4] arm64/gcs: release GCS on failed fork
Date: Wed, 28 Oct 2026 12:43:12 -0300
Message-ID: <20261028154315.1272705-2-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
References: <20261028154315.1272705-1-ivanrwcm25@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_084405_799341_9CF20A9C 
X-CRM114-Status: GOOD (  13.61  )
X-Spam-Score: 0.1 (/)
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
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

copy_thread() can map a CLONE_VM GCS and still return 0. A later
copy_process() failure calls exit_thread(), but arm64 did not
implement it, so the VMA stayed in the parent's mm. Wire
HAVE_EXIT_THREAD to gcs_free().

x86 already does this via exit_thread() -> shstk_free(). The separate
x86 TLS leak is different: copy_thread() itself fails after the
alloc, so copy_process() skips exit_thread().

args->fn tasks inherit GCS tracking without allocating; clear it so
a failed CLONE_VM copy_process() cannot gcs_free() the caller's
stack. Keep that helper in process.c with the other fork helpers.

Fixes: 506496bcbb42 ("arm64/gcs: Ensure that new threads have a GCS")
Cc: stable@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>
Assisted-by: LLM
Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 arch/arm64/Kconfig          |  1 +
 arch/arm64/kernel/process.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cfef22aee709..3010ced4b4f2 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -177,6 +177,7 @@ config ARM64
 	select HAVE_ARM_SMCCC
 	select HAVE_ASM_MODVERSIONS
 	select HAVE_EBPF_JIT
+	select HAVE_EXIT_THREAD
 	select HAVE_C_RECORDMCOUNT
 	select HAVE_CMPXCHG_DOUBLE
 	select HAVE_CMPXCHG_LOCAL
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 581f80e9b9b7..d17172e60acb 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -320,6 +320,13 @@ static int copy_thread_gcs(struct task_struct *p,
 	return 0;
 }
 
+static void gcs_reset_thread(struct task_struct *task)
+{
+	task->thread.gcs_base = 0;
+	task->thread.gcs_size = 0;
+	task->thread.gcspr_el0 = 0;
+}
+
 #else
 
 static void flush_gcs(void) { }
@@ -328,6 +335,7 @@ static int copy_thread_gcs(struct task_struct *p,
 {
 	return 0;
 }
+static void gcs_reset_thread(struct task_struct *task) { }
 
 #endif
 
@@ -341,6 +349,12 @@ void flush_thread(void)
 	flush_gcs();
 }
 
+void exit_thread(struct task_struct *tsk)
+{
+	/* Failed fork after copy_thread(); deactivate_mm() does not run. */
+	gcs_free(tsk);
+}
+
 void arch_release_task_struct(struct task_struct *tsk)
 {
 	fpsimd_release_task(tsk);
@@ -503,6 +517,8 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 
 		p->thread.cpu_context.x19 = (unsigned long)args->fn;
 		p->thread.cpu_context.x20 = (unsigned long)args->fn_arg;
+		/* No user GCS alloc here; drop inherited tracking for CLONE_VM. */
+		gcs_reset_thread(p);
 
 		if (system_supports_poe())
 			p->thread.por_el0 = POR_EL0_INIT;
-- 
2.43.0



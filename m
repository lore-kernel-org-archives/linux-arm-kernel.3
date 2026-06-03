Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1ACCD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GwAEiTDoneBKKGG6+i1CZ1jnT9vhjztfO8o57rjAp4s=; b=PE8zMY13cfSqklip/o9FoH4Hza
	jRE/P8eufd6MycPTdhOi/gDar9LlDivEeDRMlBBIvOwRs/0jBR12b7lKtNZTp5AMrwaf3aS0OiYZf
	plAoroe93jukWCtfqAtHKzfhayrW3GWnrxc/M+7DkBuKz8F4khxgfOJITRNyCBaeuzD9GzUPf2Kci
	6SdnSR3LCHcuCofunkDVlwPF4WHTgs7ENuqiXnyGNL0hhhGslzLNhIPzHNyOg0TkSWqmjFHM831dd
	EmY1djTndig33qd1H3tUOMXdNag0WJluXOF9yFI9ovKdLU0x9w7A0ucwKG5CUG8/DkNpZZojPAacx
	xyTn99NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRS-0000000Etcl-2Se7;
	Wed, 03 Jun 2026 11:07:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUjRR-0000000EtZA-2OJ1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 11:07:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GwAEiTDoneBKKGG6+i1CZ1jnT9vhjztfO8o57rjAp4s=; b=Nw1MQe6MpxyogvpgFtzePR1N21
	dHVlO9XS0PRGZnb1MMiKVntJMESPyx3H59WMYiDl9mPDRHILjxmV0l12i9GPdSTJQxc2PYtPotRAx
	IfmIHkx1+XuY+4zkKtHtu4m1c6Q0EDI4bux7lxyxOH+HlYgwfjE0TU1cmAu0SBUL0nn30vwNXJl9o
	Ckb/m9spsDSHZc0K+3Borr2DHbxA1JOtLQq0RF9a6IQcXddcLRoI9B7xhwmw5LgAUpynlwyNN4sPD
	Ows375ybHliioYNi8AtBMXM/S5xzchuyuh1L6YT8ZXHLlfRqExhMdAd+fF/7zgR8mZ9C33dTlEc/G
	4saOzETQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUjRN-0000000BwFg-3yKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:07:20 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B968249FB;
	Wed,  3 Jun 2026 04:07:10 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E120A3F86F;
	Wed,  3 Jun 2026 04:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780484835; bh=R0PR3gYxX4+jZK8thl4AlhbDo07ovqY0fnB5qqNN45c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K82VXobe0HnDFieGUR8pO4JjnD5S6qR3qd4BYsglV4SaqRFw433ECtvFXhZ3HJ4Bi
	 AHK0ABNxy7Z53sfBmZHs/3Yhwsyv8mNB+hNfYXcR22iV4EDnl0mvzerBYb29LyOGXm
	 nJLEXTqOHFJv6JyJW8KQbjqHSwuULt+3UuGY6ySY=
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	james.morse@arm.com,
	mark.rutland@arm.com,
	maz@kernel.org,
	oupton@kernel.org,
	stable@vger.kernel.org,
	tabba@google.com,
	vladimir.murzin@arm.com,
	will@kernel.org
Subject: [PATCH v4 16/20] arm64: fpsimd: Use opaque type for SME state
Date: Wed,  3 Jun 2026 12:06:26 +0100
Message-Id: <20260603110630.1027435-17-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20260603110630.1027435-1-mark.rutland@arm.com>
References: <20260603110630.1027435-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_120718_852439_BED00E6F 
X-CRM114-Status: GOOD (  17.82  )
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

As the SME state size can vary at runtime, we don't have a concrete type
for the in-memory SME state, and pass this around using a pointer to
void.

Using pointer to void means that it's very easy to introduce errors that
cannot be caught by the compiler (e.g. as 'void **' can be assigned to
'void *').

Improve this by adding an opaque 'struct arm64_sme_state', and
consistently passing a pointer to this.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: James Morse <james.morse@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h    | 8 ++++----
 arch/arm64/include/asm/processor.h | 3 ++-
 arch/arm64/kernel/fpsimd.c         | 4 ++--
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 581661a759a3f..fff6d54afd9fe 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -163,7 +163,7 @@ extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);
 struct cpu_fp_state {
 	struct user_fpsimd_state *st;
 	struct arm64_sve_state *sve_state;
-	void *sme_state;
+	struct arm64_sme_state *sme_state;
 	u64 *svcr;
 	u64 *fpmr;
 	unsigned int sve_vl;
@@ -199,7 +199,7 @@ static inline void *thread_zt_state(struct thread_struct *thread)
 {
 	/* The ZT register state is stored immediately after the ZA state */
 	unsigned int sme_vq = sve_vq_from_vl(thread_get_sme_vl(thread));
-	return thread->sme_state + ZA_SIG_REGS_SIZE(sme_vq);
+	return (void *)thread->sme_state + ZA_SIG_REGS_SIZE(sme_vq);
 }
 
 static inline unsigned int sve_get_vl(void)
@@ -218,8 +218,8 @@ static inline unsigned int sve_get_vl(void)
 extern void sve_save_state(struct arm64_sve_state *state, int save_ffr);
 extern void sve_load_state(const struct arm64_sve_state *state, int restore_ffr);
 extern void sve_flush_live(bool flush_ffr, unsigned long vq_minus_1);
-extern void sme_save_state(void *state, int zt);
-extern void sme_load_state(void const *state, int zt);
+extern void sme_save_state(struct arm64_sme_state *state, int zt);
+extern void sme_load_state(const struct arm64_sme_state *state, int zt);
 
 struct arm64_cpu_capabilities;
 extern void cpu_enable_fpsimd(const struct arm64_cpu_capabilities *__unused);
diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 96c0c30eac50f..c2a627f393144 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -131,6 +131,7 @@ enum fp_type {
 };
 
 struct arm64_sve_state;		/* Opaque type */
+struct arm64_sme_state;		/* Opaque type */
 
 struct cpu_context {
 	unsigned long x19;
@@ -167,7 +168,7 @@ struct thread_struct {
 	enum fp_type		fp_type;	/* registers FPSIMD or SVE? */
 	unsigned int		fpsimd_cpu;
 	struct arm64_sve_state	*sve_state;	/* SVE registers, if any */
-	void			*sme_state;	/* ZA and ZT state, if any */
+	struct arm64_sme_state	*sme_state;	/* ZA and ZT state, if any */
 	unsigned int		vl[ARM64_VEC_MAX];	/* vector length */
 	unsigned int		vl_onexec[ARM64_VEC_MAX]; /* vl after next exec */
 	unsigned long		fault_address;	/* fault info */
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 0da2f75de5dde..b9506422d29c6 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -808,7 +808,7 @@ static int change_live_vector_length(struct task_struct *task,
 	unsigned int sve_vl = task_get_sve_vl(task);
 	unsigned int sme_vl = task_get_sme_vl(task);
 	struct arm64_sve_state *sve_state = NULL;
-	void *sme_state = NULL;
+	struct arm64_sme_state *sme_state = NULL;
 
 	if (type == ARM64_VEC_SME)
 		sme_vl = vl;
@@ -1645,7 +1645,7 @@ static void fpsimd_flush_thread_vl(enum vec_type type)
 void fpsimd_flush_thread(void)
 {
 	struct arm64_sve_state *sve_state = NULL;
-	void *sme_state = NULL;
+	struct arm64_sme_state *sme_state = NULL;
 
 	if (!system_supports_fpsimd())
 		return;
-- 
2.30.2



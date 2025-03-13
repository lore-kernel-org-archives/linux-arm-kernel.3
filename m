Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470BFC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 18:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y1DOnX2JqDlvXo0v4abKlFrNsrTuBn8d3h80W5GVeMU=; b=Fr07m8k0p2mYjqa6Wci54kEq1V
	noBEl+dgitgwIE3HQ8cPEQRrcONDU2LRryHfoXLE6p+7N606lQcQkuXXG5pNkLekzP64mIHnoS3Ac
	tp+QojRu6gEusvJ7nkWyy++yUcYTnBTXNgV35CYRcSw8k3KCSfBDsL6DDOrzNFsrCay5WTAP/0Sax
	MdOUDWZJh+qBEDqG2uOWcDV5wd5j5lrKa/e9ZB2XGBg+KQ8TR/TI8EA5ODgyYO4AcH/oyAIbEUPzN
	QObhg0Qapy6AbjLeBpMnSllDoanPeui5PFqhdSkpF3nlVXOvSOoebIcfNSQl0cH2W9Wa5G/aU18U2
	O+Taw5lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmu9-0000000C6ay-148s;
	Thu, 13 Mar 2025 18:03:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmRM-0000000C3Mf-2SH2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Mar 2025 17:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Y1DOnX2JqDlvXo0v4abKlFrNsrTuBn8d3h80W5GVeMU=; b=Xy4f/xdQIW2GTCYqhnrWpP5URD
	qa1h2znLIUPNIreeFKucz9xF8UnJquOpatQ0RawoP7rlR4cFj/EeZtMPv4TcykUyhIrdIJM2QBAIK
	Bs1bSWi0yHXy2pQbaQ7bfHIYpth6SApkPsb/Jjpq9BOx0K6GNjK0cEJk3BMnK93jX6z7u8Q9m+WW5
	3Z2Mm2dRnZ1JQm2ejeD4+IzYUtaaYkShTySN8DsyBEpvmm1YIchVsLLs+1+5nqeSaYLR6hHpRJX5Z
	kFnN1OPJ7sTZZYa0l+b/Ciak5vwnsuaX+rgA7rVmYt+6XxDAkeplo+iX7yJpToACGCzS1gabQ7Lo/
	yp6JHlhQ==;
Received: from mx-rz-2.rrze.uni-erlangen.de ([131.188.11.21])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsmRJ-00000002lyP-3ReC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 17:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1741887218; bh=Y1DOnX2JqDlvXo0v4abKlFrNsrTuBn8d3h80W5GVeMU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From:To:CC:
	 Subject;
	b=KDraUYEZj08wYyGge2yYQeZ08Io6+NhgHBGqTQx2ngYoKH8jyIFaHHHGik/5wAEYd
	 Tbvu+DW3X41M9iLKxr+opECPLEUmDQFuiNEO4+4KXIE2KSMLCLDfO8VSzGTcCSGPLD
	 ouJsaeixrgyp3yLBfbAVXQT1nNqLaXOOHF9nlrNM30VFyKwpfZpTIwCisvnm3Q4U87
	 olRR3K2Q40ADXPUi3t28pYwx4EpnpNCEs7qWiF/0xqZfrhCAMhCgBwzQcQ1MGX9K0X
	 M56j9ejKEmRPybwJBP2hXsYBrIVR9FvuUAtwfPeVHWs16OhYjqLJWR+26DVfBmSSB3
	 QryxQ08M3+Y+g==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-2.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZDF356DzbzPkPP;
	Thu, 13 Mar 2025 18:33:37 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3614:2b00:7ee6:68e5:4447:ba92
Received: from luis-tp.fritz.box (unknown [IPv6:2001:9e8:3614:2b00:7ee6:68e5:4447:ba92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1+CRvjFnd3baUo54DHPURixEK/pOHcbyc0=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZDF320p7kzPjt6;
	Thu, 13 Mar 2025 18:33:34 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Puranjay Mohan <puranjay@kernel.org>,
	Xu Kuohai <xukuohai@huaweicloud.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>,
	Shuah Khan <shuah@kernel.org>,
	Luis Gerhorst <luis.gerhorst@fau.de>,
	Henriette Herzog <henriette.herzog@rub.de>,
	Cupertino Miranda <cupertino.miranda@oracle.com>,
	Matan Shachnai <m.shachnai@gmail.com>,
	Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>,
	Daniel Xu <dxu@dxuuu.xyz>,
	bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kselftest@vger.kernel.org,
	George Guo <guodongtai@kylinos.cn>,
	WANG Xuerui <git@xen0n.name>,
	Tiezhu Yang <yangtiezhu@loongson.cn>
Cc: Maximilian Ott <ott@cs.fau.de>,
	Milan Stephan <milan.stephan@fau.de>
Subject: [PATCH bpf-next 04/11] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
Date: Thu, 13 Mar 2025 18:33:26 +0100
Message-ID: <20250313173326.1106442-1-luis.gerhorst@fau.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313172127.1098195-1-luis.gerhorst@fau.de>
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_173350_027601_891D557A 
X-CRM114-Status: GOOD (  23.08  )
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

JITs can set bpf_jit_bypass_spec_v1/v4() if they want the verifier to
skip analysis/patching for the respective vulnerability. For v4, this
will reduce the number of barriers the verifier inserts. For v1, it
allows more programs to be accepted.

The primary motivation for this is to not regress unpriv BPF's
performance on ARM64 in a future commit where BPF_NOSPEC is also used
against Spectre v1.

This has the user-visible change that v1-induced rejections on
non-vulnerable PowerPC CPUs are avoided.

For now, this does not change the semantics of BPF_NOSPEC. It is still a
v4-only barrier and must not be implemented if bypass_spec_v4 is always
true for the arch. Changing it to a v1 AND v4-barrier is done in a
future commit.

As an alternative to bypass_spec_v1/v4, one could introduce NOSPEC_V1
AND NOSPEC_V4 instructions and allow backends to skip their lowering as
suggested by commit f5e81d111750 ("bpf: Introduce BPF nospec instruction
for mitigating Spectre v4"). Adding bpf_jit_bypass_spec_v1/v4() was
found to be preferrable for the following reason:

* bypass_spec_v1/v4 benefits non-vulnerable CPUs: Always performing the
  same analysis (not taking into account whether the current CPU is
  vulnerable), needlessly restricts users of CPUs that are not
  vulnerable. The only usecase for this would be portability-testing,
  but this can later be added easily when needed by allowing users to
  force bypass_spec_v1/v4 to false.

* Portability is still acceptable: Directly disabling the analysis
  instead of skipping the lowering of BPF_NOSPEC(_V1/V4) might allow
  programs on non-vulnerable CPUs to be accepted while the program will
  be rejected on vulnerable CPUs. With the fallback to speculation
  barriers for Spectre v1 implemented in a future commit, this will only
  affect programs that do variable stack-accesses or are very complex.

For PowerPC, the SEC_FTR checking in bpf_jit_bypass_spec_v4() is based
on the check that was previously located in the BPF_NOSPEC case.

For LoongArch, it would likely be safe to set both
bpf_jit_bypass_spec_v1() and _v4() according to
commit a6f6a95f2580 ("LoongArch, bpf: Fix jit to skip speculation
barrier opcode"). This is omitted here as I am unable to do any testing
for LoongArch.

Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Henriette Herzog <henriette.herzog@rub.de>
Cc: Maximilian Ott <ott@cs.fau.de>
Cc: Milan Stephan <milan.stephan@fau.de>
---
 arch/arm64/net/bpf_jit_comp.c     | 21 ++++++++++++---------
 arch/powerpc/net/bpf_jit_comp64.c | 21 +++++++++++++++++----
 include/linux/bpf.h               | 11 +++++++++--
 kernel/bpf/core.c                 | 15 +++++++++++++++
 4 files changed, 53 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 70d7c89d3ac9..0f617b55866e 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -1583,15 +1583,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 
 	/* speculation barrier */
 	case BPF_ST | BPF_NOSPEC:
-		/*
-		 * Nothing required here.
-		 *
-		 * In case of arm64, we rely on the firmware mitigation of
-		 * Speculative Store Bypass as controlled via the ssbd kernel
-		 * parameter. Whenever the mitigation is enabled, it works
-		 * for all of the kernel code with no need to provide any
-		 * additional instructions.
-		 */
+		/* See bpf_jit_bypass_spec_v4() */
 		break;
 
 	/* ST: *(size *)(dst + off) = imm */
@@ -2762,6 +2754,17 @@ bool bpf_jit_supports_percpu_insn(void)
 	return true;
 }
 
+bool bpf_jit_bypass_spec_v4(void)
+{
+	/* In case of arm64, we rely on the firmware mitigation of Speculative
+	 * Store Bypass as controlled via the ssbd kernel parameter. Whenever
+	 * the mitigation is enabled, it works for all of the kernel code with
+	 * no need to provide any additional instructions. Therefore, skip
+	 * inserting nospec insns against Spectre v4.
+	 */
+	return true;
+}
+
 bool bpf_jit_inlines_helper_call(s32 imm)
 {
 	switch (imm) {
diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
index 233703b06d7c..b5339c541283 100644
--- a/arch/powerpc/net/bpf_jit_comp64.c
+++ b/arch/powerpc/net/bpf_jit_comp64.c
@@ -363,6 +363,23 @@ static int bpf_jit_emit_tail_call(u32 *image, struct codegen_context *ctx, u32 o
 	return 0;
 }
 
+bool bpf_jit_bypass_spec_v1(void)
+{
+#if defined(CONFIG_PPC_E500) || defined(CONFIG_PPC_BOOK3S_64)
+	return !(security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
+		 security_ftr_enabled(SEC_FTR_BNDS_CHK_SPEC_BAR));
+#else
+	return true;
+#endif
+}
+
+bool bpf_jit_bypass_spec_v4(void)
+{
+	return !(security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) &&
+		 security_ftr_enabled(SEC_FTR_STF_BARRIER) &&
+		 stf_barrier_type_get() != STF_BARRIER_NONE);
+}
+
 /*
  * We spill into the redzone always, even if the bpf program has its own stackframe.
  * Offsets hardcoded based on BPF_PPC_STACK_SAVE -- see bpf_jit_stack_local()
@@ -785,10 +802,6 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
 		 * BPF_ST NOSPEC (speculation barrier)
 		 */
 		case BPF_ST | BPF_NOSPEC:
-			if (!security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) ||
-					!security_ftr_enabled(SEC_FTR_STF_BARRIER))
-				break;
-
 			switch (stf_barrier) {
 			case STF_BARRIER_EIEIO:
 				EMIT(PPC_RAW_EIEIO() | 0x02000000);
diff --git a/include/linux/bpf.h b/include/linux/bpf.h
index 7d55553de3fc..9a21e356e04e 100644
--- a/include/linux/bpf.h
+++ b/include/linux/bpf.h
@@ -2439,14 +2439,21 @@ static inline bool bpf_allow_uninit_stack(const struct bpf_token *token)
 	return bpf_token_capable(token, CAP_PERFMON);
 }
 
+bool bpf_jit_bypass_spec_v1(void);
+bool bpf_jit_bypass_spec_v4(void);
+
 static inline bool bpf_bypass_spec_v1(const struct bpf_token *token)
 {
-	return cpu_mitigations_off() || bpf_token_capable(token, CAP_PERFMON);
+	return bpf_jit_bypass_spec_v1() ||
+		cpu_mitigations_off() ||
+		bpf_token_capable(token, CAP_PERFMON);
 }
 
 static inline bool bpf_bypass_spec_v4(const struct bpf_token *token)
 {
-	return cpu_mitigations_off() || bpf_token_capable(token, CAP_PERFMON);
+	return bpf_jit_bypass_spec_v4() ||
+		cpu_mitigations_off() ||
+		bpf_token_capable(token, CAP_PERFMON);
 }
 
 int bpf_map_new_fd(struct bpf_map *map, int flags);
diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
index 62cb9557ad3b..a3e434851614 100644
--- a/kernel/bpf/core.c
+++ b/kernel/bpf/core.c
@@ -3024,6 +3024,21 @@ bool __weak bpf_jit_needs_zext(void)
 	return false;
 }
 
+/* By default, enable the verifier's mitigations against Spectre v1 and v4 for
+ * all archs. The value returned must not change at runtime as there is
+ * currently no support for reloading programs that were loaded without
+ * mitigations.
+ */
+bool __weak bpf_jit_bypass_spec_v1(void)
+{
+	return false;
+}
+
+bool __weak bpf_jit_bypass_spec_v4(void)
+{
+	return false;
+}
+
 /* Return true if the JIT inlines the call to the helper corresponding to
  * the imm.
  *
-- 
2.48.1



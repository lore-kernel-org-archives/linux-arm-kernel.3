Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2A2CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoNLybuMUSeU440nlltv1/CuGYWJcpqCWHdxGW4hf3M=; b=THVkTBUPyTmN6o5kXXgcYw4zS2
	uZWh6uspVT3sA9aOeYrQLL7kWuqxJWv4gYnsVi4/onzIUY8L+ssqkErXaFk62APf1q/STCxbiO3hd
	8ElO9hesN07F4bUacJ2Gq4uzLIyX83JXPTa2Za8d0f6E/X03bv04CM7w9eO4+HuV1r5/nBNhwNYWD
	YaBsTGpegYgE02QXMhXJqqQ0R/XMOlwVchOgloNZwuti5utyoetNU+KRu/o9+2+0MYjLtaU+S2H89
	nQz4B4NmW26w7tBwj88kGrS6U0t1+iS9RWo4122/CIJKf3+gD8Ry0Wp9fLi0EnEaPo7tZlGdQie7G
	nj5ca5Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtgE-0000000EslI-27WQ;
	Mon, 18 May 2026 08:50:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtgB-0000000EsiA-1SeM
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 08:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=UoNLybuMUSeU440nlltv1/CuGYWJcpqCWHdxGW4hf3M=; b=GIzyctsR3mPDALwr1NdAzrDShx
	qiWSOCPHUGd9lHXXNwd2MP7pNu8ysoNYRvAK0H0d0Cb8tVYF+XDOapHSYnTe+YNcsw0HuxAN51SLL
	PXARLkSK8CKYKeiMtCw+xdA2BktE+oQUKYerzkMczdPmH5HGalV1K8ZObOddEcIaeASo0Nft0ORko
	IaHEXPMGVjCmjMDc4/O6m9fSxCiHzf9ITnW0DG3YxFNqtjufmlgkVt06ATqruP1N6a/UmXZdWR3rn
	IDJmXCeCDiVSFx18AwAlyz1En0m0IQHMEgXYs88Sbxk8pJDXAhLzT4//RbsgPb7aa/vzk2KNQz1uW
	4K+QpwHw==;
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOtg5-0000000ASDo-3ztZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1779094209; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=UoNLybuMUSeU440nlltv1/CuGYWJcpqCWHdxGW4hf3M=;
	b=xP2rOROcyWq0VP5vlF3d2TJfJw3hiU6kyOhWlrObbNhQfZ5gSfreVI35SsZKD1e4ywilrwW13ACTXIx2fCQwnHXYWq4iYwIy5hdNbeVznf/Bya3lGPLM52zn77mqbRK1FPL3Sj9J4d/891dHxFIKwPviovj57dABGFKR+xx6P9U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=tianruidong@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X36F6m8_1779094205;
Received: from localhost(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0X36F6m8_1779094205 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 18 May 2026 16:50:07 +0800
From: Ruidong Tian <tianruidong@linux.alibaba.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	rafael@kernel.org,
	tony.luck@intel.com,
	guohanjun@huawei.com,
	mchehab@kernel.org,
	xueshuai@linux.alibaba.com,
	tongtiangen@huawei.com,
	james.morse@arm.com,
	robin.murphy@arm.com,
	andreyknvl@gmail.com,
	dvyukov@google.com,
	vincenzo.frascino@arm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	christophe.leroy@csgroup.eu,
	aneesh.kumar@kernel.org,
	naveen.n.rao@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com,
	tianruidong@linux.alibaba.com
Subject: [PATCH v14 2/8] ACPI: APEI: GHES: use exception context to gate SIGBUS on poison consumption
Date: Mon, 18 May 2026 16:49:46 +0800
Message-ID: <20260518084956.2538442-3-tianruidong@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
References: <20260518084956.2538442-1-tianruidong@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_095023_702237_FA35E478 
X-CRM114-Status: GOOD (  22.80  )
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

When a GHES SEA (Synchronous External Abort) fires while the CPU
was executing in kernel mode, it typically means that kernel code
itself consumed a poisoned memory location -- e.g. copy_from_user()
/ copy_to_user() invoked from a ioctl() or write() syscall touched
a poisoned user page or page-cache page on behalf of the task.

The expected behaviour in that case is that the faulting kernel
helper returns via its extable fixup and the syscall returns an
error (e.g. -EFAULT) to user space. It is NOT appropriate to deliver
SIGBUS to the current task: the task did not directly dereference
the poisoned address, the kernel did on its behalf, and the kernel
is able to recover.

Up to now ghes_handle_memory_failure() unconditionally promoted any
synchronous recoverable memory error to MF_ACTION_REQUIRED, which
ends up SIGBUS on current -- regardless of whether the poison was
consumed from user space or from inside the kernel on the task's
behalf. That kills tasks that should instead have seen a plain
syscall error.

To fix this, the execution mode in which the exception was taken
must be captured at the arch-level entry point, where pt_regs (and
hence user_mode(regs)) are still available. The estatus node that
later drains the error in IRQ / process context no longer has
access to the original regs.

Introduce:

    enum context { NO_USE = -1, IN_KERNEL = 0, IN_USER = 1 };

and plumb the value all the way down to the queued estatus node:

 * Add an 'enum context context' field to struct ghes_estatus_node
   and record it in ghes_in_nmi_queue_one_entry().
 * Extend ghes_notify_sea() and the internal
   ghes_in_nmi_spool_from_list() with an enum context parameter.

Then consume the recorded context in ghes_handle_memory_failure()
for the GHES_SEV_RECOVERABLE / sync path:

    flags = sync && context == IN_USER ? MF_ACTION_REQUIRED : 0;

i.e. MF_ACTION_REQUIRED (and thus SIGBUS via the task_work path) is
only raised for user-mode poison consumption. Synchronous errors
taken in kernel mode fall back to memory_failure_queue() with
flags=0, asynchronously isolating the poisoned page while letting
the faulting kernel helper's extable fixup return -EFAULT
to user space.

Paths that pass NO_USE are unaffected:
sync is false for them, so flags stays 0 as before.

Signed-off-by: Ruidong Tian  <tianruidong@linux.alibaba.com>
---
 arch/arm64/kernel/acpi.c |  2 +-
 drivers/acpi/apei/ghes.c | 36 ++++++++++++++++++++----------------
 include/acpi/ghes.h      |  6 ++++--
 3 files changed, 25 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/kernel/acpi.c b/arch/arm64/kernel/acpi.c
index 5891f92c2035..40d4a2913d51 100644
--- a/arch/arm64/kernel/acpi.c
+++ b/arch/arm64/kernel/acpi.c
@@ -409,7 +409,7 @@ int apei_claim_sea(struct pt_regs *regs)
 	 */
 	local_daif_restore(DAIF_ERRCTX);
 	nmi_enter();
-	err = ghes_notify_sea();
+	err = ghes_notify_sea(user_mode(regs));
 	nmi_exit();
 
 	/*
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 3236a3ce79d6..6f265893cddf 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -529,7 +529,7 @@ static bool ghes_do_memory_failure(u64 physical_addr, int flags)
 }
 
 static bool ghes_handle_memory_failure(struct acpi_hest_generic_data *gdata,
-				       int sev, bool sync)
+				       int sev, bool sync, enum context context)
 {
 	int flags = -1;
 	int sec_sev = ghes_severity(gdata->error_severity);
@@ -543,7 +543,7 @@ static bool ghes_handle_memory_failure(struct acpi_hest_generic_data *gdata,
 	    (gdata->flags & CPER_SEC_ERROR_THRESHOLD_EXCEEDED))
 		flags = MF_SOFT_OFFLINE;
 	if (sev == GHES_SEV_RECOVERABLE && sec_sev == GHES_SEV_RECOVERABLE)
-		flags = sync ? MF_ACTION_REQUIRED : 0;
+		flags = sync && context == IN_USER ? MF_ACTION_REQUIRED : 0;
 
 	if (flags != -1)
 		return ghes_do_memory_failure(mem_err->physical_addr, flags);
@@ -552,10 +552,10 @@ static bool ghes_handle_memory_failure(struct acpi_hest_generic_data *gdata,
 }
 
 static bool ghes_handle_arm_hw_error(struct acpi_hest_generic_data *gdata,
-				     int sev, bool sync)
+				     int sev, bool sync, enum context context)
 {
 	struct cper_sec_proc_arm *err = acpi_hest_get_payload(gdata);
-	int flags = sync ? MF_ACTION_REQUIRED : 0;
+	int flags = sync && context == IN_USER ? MF_ACTION_REQUIRED : 0;
 	int length = gdata->error_data_length;
 	char error_type[120];
 	bool queued = false;
@@ -910,7 +910,8 @@ static void ghes_log_hwerr(int sev, guid_t *sec_type)
 }
 
 static void ghes_do_proc(struct ghes *ghes,
-			 const struct acpi_hest_generic_status *estatus)
+			 const struct acpi_hest_generic_status *estatus,
+			 enum context context)
 {
 	int sev, sec_sev;
 	struct acpi_hest_generic_data *gdata;
@@ -937,11 +938,11 @@ static void ghes_do_proc(struct ghes *ghes,
 			atomic_notifier_call_chain(&ghes_report_chain, sev, mem_err);
 
 			arch_apei_report_mem_error(sev, mem_err);
-			queued = ghes_handle_memory_failure(gdata, sev, sync);
+			queued = ghes_handle_memory_failure(gdata, sev, sync, context);
 		} else if (guid_equal(sec_type, &CPER_SEC_PCIE)) {
 			ghes_handle_aer(gdata);
 		} else if (guid_equal(sec_type, &CPER_SEC_PROC_ARM)) {
-			queued = ghes_handle_arm_hw_error(gdata, sev, sync);
+			queued = ghes_handle_arm_hw_error(gdata, sev, sync, context);
 		} else if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR)) {
 			struct cxl_cper_sec_prot_err *prot_err = acpi_hest_get_payload(gdata);
 
@@ -1190,7 +1191,7 @@ static int ghes_proc(struct ghes *ghes)
 		if (ghes_print_estatus(NULL, ghes->generic, estatus))
 			ghes_estatus_cache_add(ghes->generic, estatus);
 	}
-	ghes_do_proc(ghes, estatus);
+	ghes_do_proc(ghes, estatus, NO_USE);
 
 out:
 	ghes_clear_estatus(ghes, estatus, buf_paddr, FIX_APEI_GHES_IRQ);
@@ -1297,7 +1298,7 @@ static void ghes_proc_in_irq(struct irq_work *irq_work)
 		len = cper_estatus_len(estatus);
 		node_len = GHES_ESTATUS_NODE_LEN(len);
 
-		ghes_do_proc(estatus_node->ghes, estatus);
+		ghes_do_proc(estatus_node->ghes, estatus, estatus_node->context);
 
 		if (!ghes_estatus_cached(estatus)) {
 			generic = estatus_node->generic;
@@ -1335,7 +1336,8 @@ static void ghes_print_queued_estatus(void)
 }
 
 static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
-				       enum fixed_addresses fixmap_idx)
+				       enum fixed_addresses fixmap_idx,
+				       enum context context)
 {
 	struct acpi_hest_generic_status *estatus, tmp_header;
 	struct ghes_estatus_node *estatus_node;
@@ -1364,6 +1366,7 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
 	if (!estatus_node)
 		return -ENOMEM;
 
+	estatus_node->context = context;
 	estatus_node->ghes = ghes;
 	estatus_node->generic = ghes->generic;
 	estatus = GHES_ESTATUS_FROM_NODE(estatus_node);
@@ -1398,14 +1401,15 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
 }
 
 static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
-				       enum fixed_addresses fixmap_idx)
+				       enum fixed_addresses fixmap_idx,
+				       enum context context)
 {
 	int ret = -ENOENT;
 	struct ghes *ghes;
 
 	rcu_read_lock();
 	list_for_each_entry_rcu(ghes, rcu_list, list) {
-		if (!ghes_in_nmi_queue_one_entry(ghes, fixmap_idx))
+		if (!ghes_in_nmi_queue_one_entry(ghes, fixmap_idx, context))
 			ret = 0;
 	}
 	rcu_read_unlock();
@@ -1488,7 +1492,7 @@ static LIST_HEAD(ghes_sea);
  * Return 0 only if one of the SEA error sources successfully reported an error
  * record sent from the firmware.
  */
-int ghes_notify_sea(void)
+int ghes_notify_sea(enum context context)
 {
 	static DEFINE_RAW_SPINLOCK(ghes_notify_lock_sea);
 	int rv;
@@ -1497,7 +1501,7 @@ int ghes_notify_sea(void)
 		return -ENOENT;
 
 	raw_spin_lock(&ghes_notify_lock_sea);
-	rv = ghes_in_nmi_spool_from_list(&ghes_sea, FIX_APEI_GHES_SEA);
+	rv = ghes_in_nmi_spool_from_list(&ghes_sea, FIX_APEI_GHES_SEA, context);
 	raw_spin_unlock(&ghes_notify_lock_sea);
 
 	return rv;
@@ -1552,7 +1556,7 @@ static int ghes_notify_nmi(unsigned int cmd, struct pt_regs *regs)
 		return ret;
 
 	raw_spin_lock(&ghes_notify_lock_nmi);
-	if (!ghes_in_nmi_spool_from_list(&ghes_nmi, FIX_APEI_GHES_NMI))
+	if (!ghes_in_nmi_spool_from_list(&ghes_nmi, FIX_APEI_GHES_NMI, NO_USE))
 		ret = NMI_HANDLED;
 	raw_spin_unlock(&ghes_notify_lock_nmi);
 
@@ -1606,7 +1610,7 @@ static void ghes_nmi_init_cxt(void)
 static int __ghes_sdei_callback(struct ghes *ghes,
 				enum fixed_addresses fixmap_idx)
 {
-	if (!ghes_in_nmi_queue_one_entry(ghes, fixmap_idx)) {
+	if (!ghes_in_nmi_queue_one_entry(ghes, fixmap_idx, NO_USE)) {
 		irq_work_queue(&ghes_proc_irq_work);
 
 		return 0;
diff --git a/include/acpi/ghes.h b/include/acpi/ghes.h
index 8d7e5caef3f1..646cd5c3c0ca 100644
--- a/include/acpi/ghes.h
+++ b/include/acpi/ghes.h
@@ -33,10 +33,12 @@ struct ghes {
 	void __iomem *error_status_vaddr;
 };
 
+enum context {NO_USE = -1, IN_KERNEL = 0, IN_USER = 1};
 struct ghes_estatus_node {
 	struct llist_node llnode;
 	struct acpi_hest_generic *generic;
 	struct ghes *ghes;
+	enum context context;
 };
 
 struct ghes_estatus_cache {
@@ -135,9 +137,9 @@ static inline void *acpi_hest_get_next(struct acpi_hest_generic_data *gdata)
 	     section = acpi_hest_get_next(section))
 
 #ifdef CONFIG_ACPI_APEI_SEA
-int ghes_notify_sea(void);
+int ghes_notify_sea(enum context context);
 #else
-static inline int ghes_notify_sea(void) { return -ENOENT; }
+static inline int ghes_notify_sea(enum context context) { return -ENOENT; }
 #endif
 
 struct notifier_block;
-- 
2.39.3



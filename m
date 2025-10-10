Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74D54CCD18A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BS3ds8Up0Gh0Vcw12QbhifbfMtExSe/6UKJ7yZRlT/s=; b=Au2X3Delbj33QVyuHL+7k0+l/B
	mmuA8Gw9+uBTwiCcgjpNcM3dk566awhVUfUEV+O+PqA4NRmAbq/27MmEOMCltO+BwzsZcnBgOHPBz
	PJAYBn5O9dwler3w4z7vQMMTqginN3xbzBt5bZymy/0/HISH44higRlMKJgpfsp1PSRpORHbMq3t2
	vVFWExeKHBHr/rkXKyMwHFSxh7duoGjbyJ3dti6OZxv9239PxaLMcAFrMID2z0XfAmyRLD8tho7bx
	6wF99RwZ7eoImQtiQuCaNMMvfwXQy0knkFHrgNJ/EotRx0kGukC+whgT39Negeb8hrM0BJPsi8Sd6
	xLTg7nNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FM7-00000008uzN-1msL;
	Fri, 10 Oct 2025 15:48:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FM6-00000008uxq-0eH5
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=BS3ds8Up0Gh0Vcw12QbhifbfMtExSe/6UKJ7yZRlT/s=; b=eVntCaKDhqAh3U5f9SCeLYgQ/X
	oby9vMoDOHGa1WFFIgUxe51HBA1wy5eW8pFZHfkVikpJSf7MY87vyJtLYmUs9RwXApdQrBdYgBiT+
	egjmEK65XUTslIwcZjrg2VDrx/Rsnk4sZaOI9tqGYwCbgU1ztY3yUWPgteCEbi6NL2wg7gqredmSh
	XFI1ScKZNFmK4hcJz3cgY/2GxGaX6IuPF+WGz8Ptx4CoTL3Rve2tFB8en8W1/er5lDC776Am+nv60
	/xXscMVgU1mUgtCbUbfoqSP+Jeorm6XNzuc02csttHXP52VvJmaVhqywDeuUHY59RjEaHoCWx3xXL
	A4uinKFA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FM2-00000002G1g-3E3C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS3ds8Up0Gh0Vcw12QbhifbfMtExSe/6UKJ7yZRlT/s=;
	b=FX7FTCoTceZo3jtDT8QA5XBmtCNDsrhDGRNCXX0UosPtRRk8aqs6Pdpozie7J0nPG4EC2B
	L/reYqhY+yd5e63CooyJg/ZWPeAc9wjCZ/7TFuoM8x6DUyGnwQoXUouT3Z3PDtT6pp7xS9
	Mgr/UGivrrf4vUOjPWaegbswM4EwtOE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111305;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BS3ds8Up0Gh0Vcw12QbhifbfMtExSe/6UKJ7yZRlT/s=;
	b=FX7FTCoTceZo3jtDT8QA5XBmtCNDsrhDGRNCXX0UosPtRRk8aqs6Pdpozie7J0nPG4EC2B
	L/reYqhY+yd5e63CooyJg/ZWPeAc9wjCZ/7TFuoM8x6DUyGnwQoXUouT3Z3PDtT6pp7xS9
	Mgr/UGivrrf4vUOjPWaegbswM4EwtOE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-227-mm0n-4RTPUCAn9uW9vCAGg-1; Fri,
 10 Oct 2025 11:48:23 -0400
X-MC-Unique: mm0n-4RTPUCAn9uW9vCAGg-1
X-Mimecast-MFC-AGG-ID: mm0n-4RTPUCAn9uW9vCAGg_1760111296
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 566A519560B0;
	Fri, 10 Oct 2025 15:48:16 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id F0D471800578;
	Fri, 10 Oct 2025 15:48:01 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rcu@vger.kernel.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Jason Baron <jbaron@akamai.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mel Gorman <mgorman@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Han Shen <shenhan@google.com>,
	Rik van Riel <riel@surriel.com>,
	Jann Horn <jannh@google.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Clark Williams <williams@redhat.com>,
	Yair Podemsky <ypodemsk@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Daniel Wagner <dwagner@suse.de>,
	Petr Tesarik <ptesarik@suse.com>
Subject: [RFC PATCH v6 29/29] x86/entry: Add an option to coalesce TLB flushes
Date: Fri, 10 Oct 2025 17:38:39 +0200
Message-ID: <20251010153839.151763-30-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164826_960409_EADE673D 
X-CRM114-Status: GOOD (  18.37  )
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

Previous patches have introduced a mechanism to prevent kernel text updates
from inducing interference on isolated CPUs. A similar action is required
for kernel-range TLB flushes in order to silence the biggest remaining
cause of isolated CPU IPI interference.

These flushes are mostly caused by vmalloc manipulations - e.g. on x86 with
CONFIG_VMAP_STACK, spawning enough processes will easily trigger
flushes. Unfortunately, the newly added context_tracking IPI deferral
mechanism cannot be leveraged for TLB flushes, as the deferred work would
be executed too late. Consider the following execution flow:

  <userspace>

  !interrupt!

  SWITCH_TO_KERNEL_CR3 // vmalloc range becomes accessible

  idtentry_func_foo()
    irqentry_enter()
      irqentry_enter_from_user_mode()
	enter_from_user_mode()
	  [...]
	    ct_kernel_enter_state()
	      ct_work_flush() // deferred flush would be done here

Since there is no sane way to assert no stale entry is accessed during
kernel entry, any code executed between SWITCH_TO_KERNEL_CR3 and
ct_work_flush() is at risk of accessing a stale entry. Dave had suggested
hacking up something within SWITCH_TO_KERNEL_CR3 itself, which is what has
been implemented in the previous patches.

Make kernel-range TLB flush deferral available via CONFIG_COALESCE_TLBI.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/Kconfig | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3f1557b7acd8f..390e1dbe5d4de 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2188,6 +2188,23 @@ config ADDRESS_MASKING
	  The capability can be used for efficient address sanitizers (ASAN)
	  implementation and for optimizations in JITs.

+config COALESCE_TLBI
+       def_bool n
+       prompt "Coalesce kernel TLB flushes for NOHZ-full CPUs"
+       depends on X86_64 && MITIGATION_PAGE_TABLE_ISOLATION && NO_HZ_FULL
+       help
+	 TLB flushes for kernel addresses can lead to IPIs being sent to
+	 NOHZ-full CPUs, thus kicking them out of userspace.
+
+	 This option coalesces kernel-range TLB flushes for NOHZ-full CPUs into
+	 a single flush executed at kernel entry, right after switching to the
+	 kernel page table. Note that this flush is unconditionnal, even if no
+	 remote flush was issued during the previous userspace execution window.
+
+	 This obviously makes the user->kernel transition overhead even worse.
+
+	 If unsure, say N.
+
 config HOTPLUG_CPU
	def_bool y
	depends on SMP
--
2.51.0



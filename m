Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAC6CCCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Au5DdAV6tUN4ivYmpx7gvL4Yw9R7cu+pTuIQIzQAh6Y=; b=sI56fYMbjX0LAsbcazusV2z9Ya
	U7fTBzRP16vmIRCO7htEDIc/LPXT+FZ8q0ozBlo0mvGjLQSxjHUt23WGwfIVLJmTBilStTpsigJ2+
	wmHLAanTnzyFw1nx94i4rUbQ/m32JY36qpeldY68OlfVaASOe+WlHcduPpMNnppDGSDk8i1HRG+0A
	kj58LrgaUqYSxEUP2dvdeVOyzgPGA0Xqo8tyT2KUTisoivv8El62K0R1JLq61vFxNL5wc0fslifPh
	909f3+qIS27d6R2V/Kidhuh10IwgTBvxZ5Z32NkPbJBV7gCWudVqCiWFjR2UjnEUhP9tMWvDA2W7u
	RijHidMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJ8-00000008slh-3QeY;
	Fri, 10 Oct 2025 15:45:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJ7-00000008sjx-0ia7
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:45:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Au5DdAV6tUN4ivYmpx7gvL4Yw9R7cu+pTuIQIzQAh6Y=; b=D8kbPlIO7R6w5osSQXAnY1q58e
	8mvymVbH0wXZFK2xI1cEixuwgi5ztswRmlwa4QDJTeznjDqyvtSK5/IR9SBDxdOQDM7BSsGnhn0DA
	LUnl4yARmD+u+q9B6jI/pdwtpbWyBxj2Q/5ZxkEe2oCmfjLMxkNncBFydigUygcA6koxd2xveUS10
	Tw9hvF/sfPFW8Uvt3pWpYrDGzYEAQv2RA7N8XNwYhb3JLznreXe+OrQBlMHUMeS7KO5pB9sPohOTB
	K3kV+QjMke4p6BNbjM4HH0GlsIbifYWqK8ABr1CY6HzKSr9s5eishBkf8e1qdpmyfNwyF8GMrncuW
	2ox76Y/g==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJ3-00000002FAQ-3WTH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Au5DdAV6tUN4ivYmpx7gvL4Yw9R7cu+pTuIQIzQAh6Y=;
	b=db1BVpx3kGngRsVbV5UeRSowo81+ieOVT6k8dKHW3Lm815sv/lxQ+hlcBhPb3TMVMO61d8
	N73tz5f5KuaHLrhOYvBXo9KHAdKp5z9DNV0B5B8zjzA4u6h/x4SO+FC56T/JA7izkO0Ngj
	Ui0ReMAijTfVCcwFKCs4yKolEaeGWWU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Au5DdAV6tUN4ivYmpx7gvL4Yw9R7cu+pTuIQIzQAh6Y=;
	b=db1BVpx3kGngRsVbV5UeRSowo81+ieOVT6k8dKHW3Lm815sv/lxQ+hlcBhPb3TMVMO61d8
	N73tz5f5KuaHLrhOYvBXo9KHAdKp5z9DNV0B5B8zjzA4u6h/x4SO+FC56T/JA7izkO0Ngj
	Ui0ReMAijTfVCcwFKCs4yKolEaeGWWU=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-301-55_B1TgXOS293WUuB8x3mw-1; Fri,
 10 Oct 2025 11:45:16 -0400
X-MC-Unique: 55_B1TgXOS293WUuB8x3mw-1
X-Mimecast-MFC-AGG-ID: 55_B1TgXOS293WUuB8x3mw_1760111110
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 88B5819560BF;
	Fri, 10 Oct 2025 15:45:10 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C86011800576;
	Fri, 10 Oct 2025 15:44:55 +0000 (UTC)
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
Subject: [PATCH v6 17/29] x86/speculation/mds: Mark cpu_buf_idle_clear key as allowed in .noinstr
Date: Fri, 10 Oct 2025 17:38:27 +0200
Message-ID: <20251010153839.151763-18-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164522_279509_68FD02D2 
X-CRM114-Status: GOOD (  14.63  )
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

Later commits will cause objtool to warn about static keys being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

cpu_buf_idle_clear is used in .noinstr code, and can be modified at
runtime (SMT hotplug). Suppressing the text_poke_sync() IPI has little
benefits for this key, as hotplug implies eventually going through
takedown_cpu() -> stop_machine_cpuslocked() which is going to cause
interference on all online CPUs anyway.

Mark it to let objtool know not to warn about it.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kernel/cpu/bugs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cpu/bugs.c b/arch/x86/kernel/cpu/bugs.c
index 36dcfc5105be9..3aca329a853b5 100644
--- a/arch/x86/kernel/cpu/bugs.c
+++ b/arch/x86/kernel/cpu/bugs.c
@@ -182,7 +182,7 @@ DEFINE_STATIC_KEY_FALSE(switch_vcpu_ibpb);
 EXPORT_SYMBOL_GPL(switch_vcpu_ibpb);
 
 /* Control CPU buffer clear before idling (halt, mwait) */
-DEFINE_STATIC_KEY_FALSE(cpu_buf_idle_clear);
+DEFINE_STATIC_KEY_FALSE_NOINSTR(cpu_buf_idle_clear);
 EXPORT_SYMBOL_GPL(cpu_buf_idle_clear);
 
 /*
-- 
2.51.0



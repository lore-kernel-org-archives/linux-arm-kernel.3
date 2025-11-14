Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCABCE7B1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c85HG9M5FnMNKHSoA3zkMZkmQw264GRYsrTXaruk+rY=; b=HOlphHZBy4Phe3T7PU1PybAUPS
	bi5NX7PES73NSdbinBgykzsQxL8ZOAohQkl69GHXoeLhrKglv4NKV5iowceVogM0trRx5wsJH8vrG
	cvxzhhkfulJDbuTPrEYLLI6tj+W+6sI6U3hC8PbinC4uSI5WBw9VEAI05muKFjgBzm9hLqFZ3MuIc
	trAvhVN94mFD5lrC6ds/LuNOWiRLN7IU4w8D6czFW5WC89JyFgncX1xYA92rvjWQfPelheu8WNLh+
	LURIl80DlZF9Gse8GcOESl4YTJhLFUwVoaPln7Zgt/mY8a8X/79B119XV0XuciUdPzliazVayjWm7
	pcnz0wQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvLb-0000000CQg2-07Bq;
	Fri, 14 Nov 2025 15:04:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvLZ-0000000CQdx-14I3
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 15:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c85HG9M5FnMNKHSoA3zkMZkmQw264GRYsrTXaruk+rY=; b=INX3jODsg0rr4vuQBq4uT5v6nZ
	2u3ZIM5BvezQ+uhns8sHKckF5kEoo+mB4mglCkcbrbhgiDFw23CeX71SNH48+S/jyxzKeA9V+eFqw
	viq95NxS9+IwVIRklZbkHd+kEnL6wwD20CdKTfQ62ra+h5VFdgLVwPAVGP6loRRp4xUeVyBcFqvOV
	Jk0OJHmX16VmCoZnztJDjnN7YXh445PhS2Zofl0ioOn39tew1/DQAT0TvzLSu5tk85A7jvzICNu/H
	8Au1OtyWMKMPE2iZJdDKHWG5pONhekAarC9EmDQEw57t3XJGIr5/7RzYPBI6rAAz4c1V2eHnR2ZUA
	oQwJzjFA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJuTr-00000002l12-2xKG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c85HG9M5FnMNKHSoA3zkMZkmQw264GRYsrTXaruk+rY=;
	b=eZzuW9GNPSCX+G+UmtaYVhJHm24xanuwyf0/BYj5pla06Mt6BHUd+oT2Sy9bvPaaMkeJhw
	MUY497GvpY3IkHmci11t4XkK1xu0QagKGwnmUTS8M/m/o2v9lZFSvzol3F2oTXyois/PB0
	2m9DZm3K6vQVnKrWnXa3ttrzDbXF+nA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1763132657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c85HG9M5FnMNKHSoA3zkMZkmQw264GRYsrTXaruk+rY=;
	b=eZzuW9GNPSCX+G+UmtaYVhJHm24xanuwyf0/BYj5pla06Mt6BHUd+oT2Sy9bvPaaMkeJhw
	MUY497GvpY3IkHmci11t4XkK1xu0QagKGwnmUTS8M/m/o2v9lZFSvzol3F2oTXyois/PB0
	2m9DZm3K6vQVnKrWnXa3ttrzDbXF+nA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-IKnaOyZsP-KgTt9Crsfdyw-1; Fri,
 14 Nov 2025 10:04:11 -0500
X-MC-Unique: IKnaOyZsP-KgTt9Crsfdyw-1
X-Mimecast-MFC-AGG-ID: IKnaOyZsP-KgTt9Crsfdyw_1763132645
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA6451800370;
	Fri, 14 Nov 2025 15:04:04 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.226.10])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9839F19560B9;
	Fri, 14 Nov 2025 15:03:50 +0000 (UTC)
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
Cc: Josh Poimboeuf <jpoimboe@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
	Petr Tesarik <ptesarik@suse.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v7 07/31] x86/paravirt: Mark pv_sched_clock static call as __ro_after_init
Date: Fri, 14 Nov 2025 16:01:09 +0100
Message-ID: <20251114150133.1056710-8-vschneid@redhat.com>
In-Reply-To: <20251114150133.1056710-1-vschneid@redhat.com>
References: <20251114150133.1056710-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_140851_933695_F748D72C 
X-CRM114-Status: GOOD (  13.74  )
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

Later commits will cause objtool to warn about static calls being used in
.noinstr sections in order to safely defer instruction patching IPIs
targeted at NOHZ_FULL CPUs.

pv_sched_clock is updated in:
o __init vmware_paravirt_ops_setup()
o __init xen_init_time_common()
o kvm_sched_clock_init() <- __init kvmclock_init()
o hv_setup_sched_clock() <- __init hv_init_tsc_clocksource()

IOW purely init context, and can thus be marked as __ro_after_init.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index ab3e172dcc693..34b6fa3fcc045 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -69,7 +69,7 @@ static u64 native_steal_clock(int cpu)
 }
 
 DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
-DEFINE_STATIC_CALL(pv_sched_clock, native_sched_clock);
+DEFINE_STATIC_CALL_RO(pv_sched_clock, native_sched_clock);
 
 void paravirt_set_sched_clock(u64 (*func)(void))
 {
-- 
2.51.0



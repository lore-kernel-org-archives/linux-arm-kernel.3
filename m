Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005F8CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uA/joIxupKiXJwORpnKdW+bHmjp4JFkmsKHil6Ud81E=; b=xVWabrCXayYu6/yXuk4NsrR3pE
	badtrb6mMrCA3JBifaD2ji+IvEVms57fpVoSqaTd3apfxYP/7KBOZsKrtyW5AvB0jgY2h+04uFKxh
	fWrhxYKwNJIpzcI2GYxyAvlWGmVHvbm+q2esG/f4adsRDhq9pOtZURnC9/0F7zgo2flU4AzKkDuP6
	IrPsFx3u5f6p2OZpD+6EgvC/q5EKy+vN8rOY4hsD7OHOciuPGQj1Wbnm7GUe8FKdo12DsK9SUzucV
	j3V4YrWK1SoQ+PIUI1XbOe5jPbBEC5mb9pPnT/1sIY/ZDOpDBeHzNTBt1iIEP9sMQmnTu3rfHUR4z
	0iuvxrdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJi-00000008tAk-40fo;
	Fri, 10 Oct 2025 15:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJh-00000008t8l-0P9O
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uA/joIxupKiXJwORpnKdW+bHmjp4JFkmsKHil6Ud81E=; b=fiNfD4vQhmxPyQUoZ49xTILs5D
	+VXhL6rcQD7iXMeaxi3ZDXzT1NB8Wf5JooSsLSxI5GbDMSLSvOh9cqxjrk6g11uK7U3BoFIbNrOmJ
	CyBxqlX14sbF1MwielzrNAm/GFOdeN+sPvjujroxCJEb0ZHR/sdt1HGysQY2pBPDyxRX4lbLQaPiY
	BP9uRSvfbnsD/iJxYwIXd9nvZlgotCoPE/gAafPuePM4+9c02DufNBdow8ICV4IP9Ntw12pi7+aeN
	4jTguoAJ+5/MjtITDLs7rvXIbw/QEG/JU6FX3IzPMGoZbrbaTwj1ftkz+skINMwQCkJnW5kiMf4n5
	HJdRKLMA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FJb-00000002FMe-3dke
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:45:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uA/joIxupKiXJwORpnKdW+bHmjp4JFkmsKHil6Ud81E=;
	b=Pg2zUujyM+jqHLS4ku+ps6l0nDheucz6+SBf8mqPeu7wUgSEYCNxsyYXgZSX5e/15si3ZZ
	MPvHFxgx6WkOSKXlTxnvFUllVaoTCWb137sPS7AFlequtgwFFh1sh8EKrEBldIYoaRrZv3
	7XzeSXv6F2nc7IxGF8iNx1jFTElOPGk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uA/joIxupKiXJwORpnKdW+bHmjp4JFkmsKHil6Ud81E=;
	b=Pg2zUujyM+jqHLS4ku+ps6l0nDheucz6+SBf8mqPeu7wUgSEYCNxsyYXgZSX5e/15si3ZZ
	MPvHFxgx6WkOSKXlTxnvFUllVaoTCWb137sPS7AFlequtgwFFh1sh8EKrEBldIYoaRrZv3
	7XzeSXv6F2nc7IxGF8iNx1jFTElOPGk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-275-b-Sr8LpaOGShfFTrtDDmzw-1; Fri,
 10 Oct 2025 11:45:51 -0400
X-MC-Unique: b-Sr8LpaOGShfFTrtDDmzw-1
X-Mimecast-MFC-AGG-ID: b-Sr8LpaOGShfFTrtDDmzw_1760111141
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4EA4319560BB;
	Fri, 10 Oct 2025 15:45:41 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84AAE180035E;
	Fri, 10 Oct 2025 15:45:26 +0000 (UTC)
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
	Petr Tesarik <ptesarik@suse.com>
Subject: [PATCH v6 19/29] KVM: VMX: Mark vmx_l1d_should flush and vmx_l1d_flush_cond keys as allowed in .noinstr
Date: Fri, 10 Oct 2025 17:38:29 +0200
Message-ID: <20251010153839.151763-20-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164558_359163_8FA6542E 
X-CRM114-Status: GOOD (  14.08  )
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

These keys are used in .noinstr code, and can be modified at runtime
(/proc/kernel/vmx* write). However it is not expected that they will be
flipped during latency-sensitive operations, and thus shouldn't be a source
of interference wrt the text patching IPI.

Mark it to let objtool know not to warn about it.

Reported-by: Josh Poimboeuf <jpoimboe@kernel.org>
Signed-off-by: Valentin Schneider <vschneid@redhat.com>
---
 arch/x86/kvm/vmx/vmx.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index aa157fe5b7b31..dce2bd7375ec8 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -204,8 +204,15 @@ module_param(pt_mode, int, S_IRUGO);
 
 struct x86_pmu_lbr __ro_after_init vmx_lbr_caps;
 
-static DEFINE_STATIC_KEY_FALSE(vmx_l1d_should_flush);
-static DEFINE_STATIC_KEY_FALSE(vmx_l1d_flush_cond);
+/*
+ * Both of these static keys end up being used in .noinstr sections, however
+ * they are only modified:
+ * - at init
+ * - from a /proc/kernel/vmx* write
+ * thus during latency-sensitive operations they should remain stable.
+ */
+static DEFINE_STATIC_KEY_FALSE_NOINSTR(vmx_l1d_should_flush);
+static DEFINE_STATIC_KEY_FALSE_NOINSTR(vmx_l1d_flush_cond);
 static DEFINE_MUTEX(vmx_l1d_flush_mutex);
 
 /* Storage for pre module init parameter parsing */
-- 
2.51.0



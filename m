Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FEB9CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 15:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IMfkEjR7bo9/GPZWUZrcsZpIJiAh+KjKI2oJCMzgHeQ=; b=kCIiuzwyyF1ZKPDUQYaze6Nf1y
	7ikKdF6vAQV9xjfAx8hD4NhQptgn5X3xC54rvA4jRUC/KfUR4Z+Lbu7Yp4CKGBX1RsT3zCQPKbxYr
	1Su+ISnPmybKH6o6r147XHQzSC+J9u8L/d9fLwq2HkiJDr4UMpaur9XOcL00jhRmPIK8xidN8ZEDI
	g9kBaMNPRFoAWDCYUhVYSY0n9VdoeAvHZcZUY+nIYquvGL/T5xl9Vq0zGlBgtP59Bb/1rh2fpSZmS
	ehPmNdR7nzLFEwJDLRIiu6KXxNwSRK1L2LlfVmH63y3wUlyz35RbYEHjgHNyV0onZ+oscTCUCyWJs
	F3XmxFjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FHQ-00000008rHp-0rzr;
	Fri, 10 Oct 2025 15:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FHO-00000008rGt-42sz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Oct 2025 15:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=IMfkEjR7bo9/GPZWUZrcsZpIJiAh+KjKI2oJCMzgHeQ=; b=UI/8YypUrF0TFzbnNyLX88p1dd
	rNwtzcv3TWl8a6iZyzEQJcSnTKFm26ZV2ypIFdhHszB/ZgJUy/Kn56VOK0pKsZW1U7iioh5s1qkNS
	VtS9NI9pieEEQPMqwVJjhjI37A5TaB+7IbGni2Zc82Hv/egstMaBXcgB9splT6pue2wmYrMYUMjr3
	LoyW8UZoUzX22Z0vzJ5lIGj/OrzZyVVAqK3zGVQ+L1EvwZqKbK5+hwFamXR81i2DZZ7P78JCbtFTE
	Dyeue/6rGToKXyaa4WQb0i4LtgEQ9+kx6be6fL/N4DamuEcogLQPaXyEfdOu5TyUwyt/g695T3arV
	0Rx9xsbQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7FHL-00000002Eat-43OH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 15:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMfkEjR7bo9/GPZWUZrcsZpIJiAh+KjKI2oJCMzgHeQ=;
	b=MfTK2FVTn6S2wBQ6tw6fU0VGivopE2NIhauHWVec6VpgxqrfQB5mgC05rPmeWZAhWlOh0f
	X/+vLRg9dtgbsllb1inv+a78GyHJ8ZEBTBhV/TCWS3yZ5uuFFJfMoM5vBNXBCVByXbC5ze
	e3k3YadJCnwMEJgfIn4liXwcBZ1g79k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1760111015;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IMfkEjR7bo9/GPZWUZrcsZpIJiAh+KjKI2oJCMzgHeQ=;
	b=UcAATEI7WRbtMPXMMUPGwsDW4w2MU0cIu70A+HteJlL72vGnIRFp7AKiCzLdYxYAuOvfal
	J2IaDhPH5PoHoBsvwCjYFJY8EnDUc9oSQGdLwCiEJMiynqS8+qAg7F3HP6Ena/EWY0+daW
	BlOGqSlHoUOeqcExlVxh6yZmsHJrsMY=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-152-vxoZ-j2iObiDj7gk3pSmjA-1; Fri,
 10 Oct 2025 11:43:29 -0400
X-MC-Unique: vxoZ-j2iObiDj7gk3pSmjA-1
X-Mimecast-MFC-AGG-ID: vxoZ-j2iObiDj7gk3pSmjA_1760111002
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0C62319560AF;
	Fri, 10 Oct 2025 15:43:22 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.45.224.29])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DB64E1800578;
	Fri, 10 Oct 2025 15:43:06 +0000 (UTC)
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
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Thomas Gleixner <tglx@linutronix.de>,
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
Subject: [PATCH v6 10/29] riscv/paravirt: Mark pv_steal_clock static call as __ro_after_init
Date: Fri, 10 Oct 2025 17:38:20 +0200
Message-ID: <20251010153839.151763-11-vschneid@redhat.com>
In-Reply-To: <20251010153839.151763-1-vschneid@redhat.com>
References: <20251010153839.151763-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_164336_202639_FB9E1D1C 
X-CRM114-Status: GOOD (  14.26  )
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

The static call is only ever updated in:

  __init pv_time_init()
  __init xen_time_setup_guest()

so mark it appropriately as __ro_after_init.

Signed-off-by: Valentin Schneider <vschneid@redhat.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index fa6b0339a65de..dfe8808016fd8 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -30,7 +30,7 @@ static u64 native_steal_clock(int cpu)
 	return 0;
 }
 
-DEFINE_STATIC_CALL(pv_steal_clock, native_steal_clock);
+DEFINE_STATIC_CALL_RO(pv_steal_clock, native_steal_clock);
 
 static bool steal_acc = true;
 static int __init parse_no_stealacc(char *arg)
-- 
2.51.0



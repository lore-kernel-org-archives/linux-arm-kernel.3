Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89078606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 16:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=wNXQ5O5c;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=GN816BbQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OXDmnK4c79f+FW2pDf6xtmzKTKKXsR1KPBjgvsrCMSU=; b=wNXQ5O5cuiE0vtMlTXgZz+nxeq
	xUEk1QI9Z2O7nRnMomses3TlRUvHLazdIiAWPBcm6VlQOZ0QEWkF0HHwIPI5d2PCaiOx8l/QPslZr
	zaZPCOCavcgxdY6MM0pbwiBHLFVQORChrqRe5u5me7CHiOsK91fHQzlHNoJIPBGftqfDnXqIFOzOq
	h6oKbvVUjBcrYwyENfq9pS7hi6gSBJlVAtJqdfdetU6IFPyqxXT0IETYhfuQax0bIiWnScVEtmcrn
	SWXk0l9a6m7ecGkKFY6sVzN4TtkiGahukXgO6Af6UqxX4euwQJ8r5Mr2rvtfuR5lFc3xE2sD5kjCQ
	vrjQo3vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNjs-00000002uDm-3DZ0;
	Mon, 26 Oct 2026 16:40:01 +0000
Received: from mail-wr1-x447.google.com ([2a00:1450:4864:20::447])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLNjm-00000002uAJ-0enJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 16:39:55 +0000
Received: by mail-wr1-x447.google.com with SMTP id ffacd0b85a97d-48e1291432aso2203598f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 09:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1793032792; x=1793637592; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OXDmnK4c79f+FW2pDf6xtmzKTKKXsR1KPBjgvsrCMSU=;
        b=GN816BbQyd1xpjDy6IDWvMrACsARSVGoG5QpA8MC4Y2ZSKxq6QTkYYFlhknHTpmhVF
         uEiyoEzGKzV+lLENr1t+PUwutLIR5sIDPHMvwwbc5R/sfvqjdomACewr2gC3/mOG8/s9
         4444PyU+rxeuAS7CaKHf5aR6Dbc9I91K56Lbfv/OSl+xcDqpiqEwOkOV6zcMVoJoEzH1
         Oyh2HORlpq0EAbsSDjKW++E2XTawI9m0bpGKwJeOj22/Qfpo4chwR7XJvVbbZobge6Kg
         EES0gx7tP+3LUFWkDt75N+AnXSTc0D1DkyrtCQj2Xs5NcKGl+IAX7f5Cb01H9coNNP9d
         Lp8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032792; x=1793637592;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OXDmnK4c79f+FW2pDf6xtmzKTKKXsR1KPBjgvsrCMSU=;
        b=AuWySmRzRugO0MdT26YAVuGjrrKzWwfTGUtXwvMqAh9QHQD32Rjh5GE5e5orSo1Zxj
         SVwq01GYMi29ylucmx+TkAUHhpDDEgpL4o2aY48ao9sVarjtJXN+D9jA4CZgfqhjg6Fd
         6QrLjfxvjxxgJgoN4bf3fPGItImvPlA3PzKhn5Oph71N/7mJ4v/EdGW6JLQg1Hl84d4f
         +G+KDI+1beT/7EYmvUnSG0qd0bNyYeZbLvGBdnOH2v939cSa8BK+nC4msX5QHghizegP
         BNB9WZO4LgqbxUkD07DQoKgLL5UHtJu+qczCQSxS7hwKX/ObqyhgKmq1lu6q/QQX+LrD
         ZxFw==
X-Forwarded-Encrypted: i=1; AKwUvBzT32MMKqojVD7lm8Kw/yb4DO/7OozxhOvG3S3dhMDhJ7HJQrDG4w7TgpZShibdOftB2g7NONF62GIv5JSZz58K@lists.infradead.org
X-Gm-Message-State: AFq9FYIx27HfAtZ80rEadUeWC7VH2O5t5u9kMpOeqiy0HHy5AfQZKkks
	kPtxK0DD5IonUPuKUUkru1uZHSXMumsOx+DBnDqvsulPHX6o2CWQyaN+2GOHhv/CHUg6H6QIPOg
	6sLQo9Ksf0icnjmDPjYFWlw==
X-Received: from wmsm36.prod.google.com ([2002:a05:600c:3b24:b0:4a1:ae53:2fe9])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:314f:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4a776fa87f9mr20820985e9.21.1793032791927;
 Mon, 26 Oct 2026 09:39:51 -0700 (PDT)
Date: Mon, 26 Oct 2026 16:39:37 +0000
In-Reply-To: <20261026163937.963087-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261026163937.963087-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026163937.963087-4-vdonnefort@google.com>
Subject: [PATCH v3 3/3] KVM: arm64: pkvm: Reset GICv3 LRs in the hypervisor
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_093954_211787_38F54FAA 
X-CRM114-Status: GOOD (  11.39  )
X-Spam-Score: -9.5 (---------)
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
X-Spam-Status: No, score=-26.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After the host is deprivileged, pKVM can't trust the host for resetting
the vGIC LRs whose value is architecturally UNKNOWN when the CPU boots
or resumes. Add a blanket cover in the CPU_ON/CPU_SUSPEND path.

Fixes: 1025c8c0c6ac ("KVM: arm64: Wrap the host with a stage 2")
Tested-by: Fuad Tabba <fuad.tabba@linux.dev>
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/hyp/nvhe/psci-relay.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/psci-relay.c b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
index e20db999e328..2863b4b90ea8 100644
--- a/arch/arm64/kvm/hyp/nvhe/psci-relay.c
+++ b/arch/arm64/kvm/hyp/nvhe/psci-relay.c
@@ -213,6 +213,10 @@ static void __noreturn __kvm_host_psci_cpu_entry(unsigned long pc, unsigned long
 	write_sysreg_el1(INIT_SCTLR_EL1_MMU_OFF, SYS_SCTLR);
 	write_sysreg(INIT_PSTATE_EL1, SPSR_EL2);
 
+	/* We can't trust the host to reset the LRs */
+	if (hyp_gicv3_nr_lr)
+		__vgic_v3_init_lrs();
+
 	trace_hyp_exit(host_ctxt, HYP_REASON_PSCI);
 	__host_enter(host_ctxt);
 }
-- 
2.56.0.257.gf7497c7d27-goog



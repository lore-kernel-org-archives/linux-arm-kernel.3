Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25C606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z+1NewBw;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=J05l4sXA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Hp9JeT3gf9bLn3Zliqx08JQ0NLgTD4FcuPPlzeVHa14=; b=z+1NewBwotkJ89scyZTZIsPK/s
	gDVzN3nRo1MjWl9ux1AxCH1y9Bu6HPQmvPiQKDq2xVhUru2WBVfIizO18PDZsnciq9A9tGYOaJO8v
	V2bOy8WU0coASRUhvX+jZcc+Xsf+2/atWOOAlwkjqhZACjtDQAm+nxdy8bVhkADJ3oH/Pp9Fa7BU1
	fk4iFDi2TWV5HdggZw9e6rjwj2iVnW3Oq3CzLshHEjJAqdKQOHqrjbI4xbAcoPM5NP7kWLrZ991Hk
	u4Cz2o9hmJPw2y8uLou10ticybAuNlGEYm5GwpJ3NDz+p8FO2gJX1+ZB1s4MTtDpHSBtv9k6/zN+F
	RkhrjpHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN6-0000000EFna-1yZO;
	Thu, 22 Oct 2026 14:02:20 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJtN3-0000000EFkf-1zfR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:02:18 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-4a20e41008cso979955e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792677735; x=1793282535; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hp9JeT3gf9bLn3Zliqx08JQ0NLgTD4FcuPPlzeVHa14=;
        b=J05l4sXAJyChXjhcFDty1GnS4628ND0sZj8bLoe4wD9q1Dxms3g2prUo10Rso6JWyY
         BqVR9VQxsYpCIs76iuF9dON8q56WMcfWWURwOA9lReKbrIAJrf9kMNGwaumSZSVDDHP2
         YMl2l29fEocX9KQzz7DJvw0jpwKhldl6IDVAJZAbmv3pFk9+XiC0tn9wkuv1oqz3gDAf
         6ezV+bT9mkt3rR/agnSWm51HaL7KERFTfKKAH0YaxYtWPE6XceT/zc64sxiru4Rcta6t
         q0qVuqb/eDFaIMgsRuZ3e2Eqt8BTBBnnnlQgvNgBWdScsK0JC6lI23adOmHv4o/iLfja
         WvtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792677735; x=1793282535;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hp9JeT3gf9bLn3Zliqx08JQ0NLgTD4FcuPPlzeVHa14=;
        b=oEUgJhskOCBUcJafC2A1ZNdEWrfUNhQG5bBlSM652Ksnm8OxKVuITlOmty1noMhM/W
         0+bCGQCc19vU9q3Kg2FnB5ClxrNKdVX7S1lRQnud5eIwNkp0U0XQ6cFVTYVFNsNlwy/T
         HOOWiriPc84hZ14lJEyZYjE46KC4Ik9Yg7OYSWcHYuJHPXtE+ZI2yrE6j/Qt4ocoZAx9
         57mzr4LwzJXQehlDZp9F4vTsZ7faSBqF0UH0VJw8thYlHma7FJLW/2V1oMiCxy76NgML
         CnNAUOEyJyQp/DXnts485XBVjqnjxX1MIpPv30L61feehfaJTL9DvWWyOZGVI7zzmhax
         Z9nA==
X-Forwarded-Encrypted: i=1; AKwUvByVzLblj/SQkR6bpGTmiLB4umlYizq1RgmZpW6FigCGKvqRdGzzUPKBjsnB8xGk48AORaDPHnmV/OMFJlrXDHza@lists.infradead.org
X-Gm-Message-State: AFq9FYK0XFjclazz5sf9uCg8uKLEpclsipr+m7qpNBLBM1iNIaiaWl15
	BZ3BUGAhqj2TpZ5+bAQgSPMt9DlXyJmCFy5EbreG21WjTySRiukWl2db+vQpEsk+4hn6zy9Bk5a
	xR29AtI6qvpAARN1ITfD2wg==
X-Received: from wmbe11.prod.google.com ([2002:a05:600c:590b:b0:4a1:91fb:4150])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d3:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4a1fdd6bec7mr114091885e9.35.1792677734835;
 Thu, 22 Oct 2026 07:02:14 -0700 (PDT)
Date: Thu, 22 Oct 2026 15:00:48 +0100
In-Reply-To: <20261022140048.2522787-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261022140048.2522787-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022140048.2522787-5-vdonnefort@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: pkvm: Avoid trapping on HVC_RESET_VECTORS
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_070217_519073_AA959806 
X-CRM114-Status: GOOD (  13.14  )
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
X-Spam-Status: No, score=-26.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pKVM prevents the reset of the hypervisor vector and as a consequence,
kvm_hyp_initialized can never be reset. Add a fast-path for this case to
skip unnecessary HVCs on the CPU hotplug and PM path.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/kvm/arm.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 4c4e2fb7b660..3d7199a87ca9 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -2248,8 +2248,13 @@ static void cpu_init_hyp_mode(void)
 
 static int cpu_hyp_reset(void)
 {
-	if (!is_kernel_in_hyp_mode())
+	if (!is_kernel_in_hyp_mode()) {
+		/* pKVM fast-path */
+		if (is_protected_kvm_enabled() && __this_cpu_read(kvm_hyp_initialized))
+			return -EPERM;
+
 		return __hyp_reset_vectors() ? -EPERM : 0;
+	}
 
 	return 0;
 }
-- 
2.56.0.257.gf7497c7d27-goog



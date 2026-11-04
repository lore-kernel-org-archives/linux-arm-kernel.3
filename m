Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B8606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GPKK0/hl;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=S2p04aUu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0ZdKyKH+Ww5i9BiLpu8awrPqNj31X9LX5Wb4WFhtBGU=; b=GPKK0/hlhS4xPKt3r6uMdc46mv
	MPIloBxtXg3yr6FTZrnGwQI/2WXJ4Vc/ChMcu2trTEwedtZ2kH/mcYpxO/mBF76YiYAE7S4tWrPix
	3DbwpqDkkEuhjt169VDUvsm+wrOCXVCiBC8yW2vHWsm9cbb/YbW7rxgemEGOpm3/6RgQw+3Vy6+Rp
	hlo5GHWpNFd7SkRUMa5j/JOgJ/PLOP6N1f+XvsbnBIYZhJt0AqDltT3dBSCK2QnkZ4QKOHXps6BoO
	W+Tnhdvu+yUWWcfl4bN8nTDqZRAM4jUYV1Yf3nosIbvxuIvQSb4uVNgISFc9UGUNHvUoRBWcA7nUV
	MJuuw6eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdG-00000005Yja-3RuZ;
	Wed, 04 Nov 2026 14:06:30 +0000
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObdD-00000005Yi0-3ejZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:06:29 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6b3dc91781fso860227a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Nov 2026 06:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793801186; x=1794405986; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZdKyKH+Ww5i9BiLpu8awrPqNj31X9LX5Wb4WFhtBGU=;
        b=S2p04aUubwMi9dwTAMUdyfye6TsD6KEIh/vPHpBpqM9AgeroxVwfAHitVUTsJXKcHd
         Zcme5kpKeGwDDFt+CLAK52C6XgskbknaeztnjPzW9F2T0SeezlgR+z7HdSRvzcyYM3te
         FE9FeFZB27FSBbiFfjxioRUGl/v1oU+iKu8QzBr4PAGF7EES92jTJgjRzDvNFAd+Hy0m
         xDH3bIsAkAlgwl51b7LMCjzv2Uu/bAOjVSVsaltIP5/B9FGTHWU02kkbeX785fN8o+G8
         eWEbndsjRoP4QmPDx8peE82RwWiniol6Zx7yB+3hfcDmA37UBz3e3DMuhvCym8XXaaIf
         YgTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801186; x=1794405986;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ZdKyKH+Ww5i9BiLpu8awrPqNj31X9LX5Wb4WFhtBGU=;
        b=UdsNpC4wysFMv1tqLfs3sib8FSpvd+S6eN8+DJJvTjnCanwwR+8+7IDJj4r0GyhMx1
         KOSsuxGb2JoFHVmbiN5YsGzpJFASlo2+1j7I4B8i2iQTM12sTIYIzb6mIWiduwq3UdUe
         0twjiG593VlhNyq434jnKMM6JaojckLKdTzvzQchbGaXk6/DuIAJh+APQYghXL/87smR
         dt7W3vXC7tav0vlsoEq1xgcEQ7GTBPyYUTLL7FcsSfQxeMIk59xX0FxVoVnxf/x6/YgY
         7ot3y7synILSdxRK5HhuMx1UZIdUTUN7nCg/jJDhozEU06ITS9MNO0vIZ2MngPDy/+ss
         /Ewg==
X-Forwarded-Encrypted: i=1; AKwUvBxrG7i9CKLs9f7SU73KEUh5HvJIMzbiOVGlZaA1YIsDepTDWootxUuI3roE5N8l93Ao3LZLUjaXVGTa07pqgvKl@lists.infradead.org
X-Gm-Message-State: APuU4Z+hsKovGFH2Cl10yDGm9Zlh4pGHIWyt1BetmV3iIboFZUHDtgZS
	1mM5o9fzkCauQ6YupINnYZ7Am2VFz+woDvKToIjTi+8vsyjO4mNELvtpifAStyE62KKOMZTPUDS
	WoCG/fBp5FhQkdL+03RkOOA==
X-Received: from edsk22.prod.google.com ([2002:aa7:d8d6:0:b0:6b5:677a:3c36])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:a303:b0:6b4:329:109c with SMTP id 4fb4d7f45d1cf-6b4d3392457mr8652022a12.4.1793801185529;
 Wed, 04 Nov 2026 06:06:25 -0800 (PST)
Date: Wed,  4 Nov 2026 14:06:08 +0000
In-Reply-To: <20261104140612.137869-1-vdonnefort@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261104140612.137869-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.56.0.455.g6c5a503b38-goog
Message-ID: <20261104140612.137869-2-vdonnefort@google.com>
Subject: [PATCH v2 1/5] KVM: arm64: Add missing exception classes to kvm_arm_exception_class
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: joey.gouly@arm.com, seiden@linux.ibm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org, 
	kernel-team@android.com, fuad.tabba@linux.dev, qperret@google.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_060627_916061_748B9AA0 
X-CRM114-Status: GOOD (  11.31  )
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

kvm_arm_exception_class is missing several exception classes defined in
esr.h, causing the event kvm_exit and hyp event hyp_enter to log an
unknown ESR. Add the missing entries and while at it, order them by
their value.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 arch/arm64/include/asm/kvm_arm.h | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index ba0062849be9..91ef5d27b491 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -244,14 +244,15 @@
 
 #define kvm_arm_exception_class \
 	ECN(UNKNOWN), ECN(WFx), ECN(CP15_32), ECN(CP15_64), ECN(CP14_MR), \
-	ECN(CP14_LS), ECN(FP_ASIMD), ECN(CP10_ID), ECN(PAC), ECN(CP14_64), \
-	ECN(SVC64), ECN(HVC64), ECN(SMC64), ECN(SYS64), ECN(SVE), \
-	ECN(IMP_DEF), ECN(IABT_LOW), ECN(IABT_CUR), \
-	ECN(PC_ALIGN), ECN(DABT_LOW), ECN(DABT_CUR), \
-	ECN(SP_ALIGN), ECN(FP_EXC32), ECN(FP_EXC64), ECN(SERROR), \
+	ECN(CP14_LS), ECN(FP_ASIMD), ECN(CP10_ID), ECN(PAC), ECN(OTHER), \
+	ECN(CP14_64), ECN(BTI), ECN(ILL), ECN(SVC32), ECN(HVC32), ECN(SMC32), \
+	ECN(SVC64), ECN(HVC64), ECN(SMC64), ECN(SYS64), ECN(SVE), ECN(ERET), \
+	ECN(FPAC), ECN(SME), ECN(IMP_DEF), ECN(IABT_LOW), ECN(IABT_CUR), \
+	ECN(PC_ALIGN), ECN(DABT_LOW), ECN(DABT_CUR), ECN(SP_ALIGN), ECN(MOPS), \
+	ECN(FP_EXC32), ECN(FP_EXC64), ECN(GCS), ECN(SERROR), \
 	ECN(BREAKPT_LOW), ECN(BREAKPT_CUR), ECN(SOFTSTP_LOW), \
 	ECN(SOFTSTP_CUR), ECN(WATCHPT_LOW), ECN(WATCHPT_CUR), \
-	ECN(BKPT32), ECN(VECTOR32), ECN(BRK64), ECN(ERET)
+	ECN(BKPT32), ECN(VECTOR32), ECN(BRK64)
 
 #define kvm_mode_names				\
 	{ PSR_MODE_EL0t,	"EL0t" },	\
-- 
2.56.0.455.g6c5a503b38-goog



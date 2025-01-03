Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A51E8E77197
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 02:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRJO5sUVsBrx9NfUdY8awEzhAYM8yo71RmYXdt5ov18=; b=boL3Zk1tQmDFeSaEJujhBsPloC
	uE1/oq9dhOkFEiBiqH480xKzFw7QE02YpEZVTyKkL4IoSNh18AYYzvjXewLuFqUsR/o8O7HygczoX
	Fm603szPkQ9Q1F+oEpXZpDUn/41+5quJAz04WIFMnR/TU9OxozycvApRWdsex/P1EePpzpChkkgDY
	bkKI3ydnkaREnDvy74wRp/ZQyP2OGuHpOsc37ik/fjwsR4j53j1bnGefS/XLrdjnVuDYPD1nNPvcd
	XwuFTE/IXuQgHFrT31PyZFlt4IqqvrdeJpubXWLZ30Fa10qAAMNJMbZkONyX3E/ox51vyqpx/8acy
	vYxNtCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTX4S-0000000Bt2u-0ubL;
	Fri, 03 Jan 2025 02:05:52 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTX2t-0000000Bskn-1bus
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 02:04:16 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ef909597d9so24544865a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jan 2025 18:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735869854; x=1736474654; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CRJO5sUVsBrx9NfUdY8awEzhAYM8yo71RmYXdt5ov18=;
        b=YCCZyKcnifMGsIM1WDTmpMSz+oaWz52hSl5M5iSDc6DOpfOL3gpKoqhTV12P/qPruu
         PkJScagFFY8Pf3/UQ2tbBDZniDYJaCR1ZhqBZvgkmvaJn0XokAuKaE8ZTyRirH4264bw
         lEwX9FQSsQNwLDeFBiBLYwF00p1cdxAqVJYhJVdt4iFY/ftpIWXKLbAz0kJtUpM3Dv95
         y9qZG/4fkIRyuw5MXHsbXdj7gbHI5LJ42XI/5/qc2j9LQ+9duow4ZTEQRIgApVcLmbs/
         wgUh59bewtDgKTfZ326g93uo71UmLFaQQ95TVhu9bvEkRIQl7yZ2WcNKC0/kh1uXBXhi
         pONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735869854; x=1736474654;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CRJO5sUVsBrx9NfUdY8awEzhAYM8yo71RmYXdt5ov18=;
        b=d/nG2neYXaiFtYM/Z7M67TaT8wIordzEgGvXxOnnGj0v0d0qYyiP4zBSi9fm+4hdHr
         pTI4k3bzwI45bzWy7WLtDd7Su1aAVMOsbQ2rlDA7HdGhQDzf19+RvEHtnZhG2ocNIrr+
         quFYTrx9U+kCYPNu+K0eWS6gqSygttf51ZHNfshhpURvMkoSKiFE2P1rOHpSW4hP3iyc
         vA7ShvA0nRhyYxvLaQQ7XRkH8BH59JqwpRtkMtdkpuBp7SegjOmedgL5fzLlgUaWVnyG
         xB9GI41dhz6yzd1ouXTfjlQcwzGNuSHGxZj9hNSsGOfMOBTjZBpLbi43pHz7aiYobTT3
         GCYg==
X-Forwarded-Encrypted: i=1; AJvYcCVeVIf+oLve+KzO/OIFnD2sfI4y8IMYL7dUE9CRHWBH1BUpLsx/j25w/7olU3IQGECAIYUTzFea6E8iD8JiPzea@lists.infradead.org
X-Gm-Message-State: AOJu0YwGWkUt51rQjACvFAQgcz+h9wmKjITL8aDc0MA9jHj4DQfhnYdY
	3MJpSVliks5OC6NSjkRGcJytKBmkcFxZRDQa74dUYE/9WtPXblAK8pTCwpj14E+9XBNnoxp3nw6
	IylxelNFqZg==
X-Google-Smtp-Source: AGHT+IHZadCFsRAvM/8s8XCvSBmeC0l850mBUK5zckCFiZPbJN2N7ovFIIHdSAEoiRRH/qyjjHZNBrMLvPsyVA==
X-Received: from pjbsm15.prod.google.com ([2002:a17:90b:2e4f:b0:2ea:9d23:79a0])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:50c7:b0:2ee:d96a:5831 with SMTP id 98e67ed59e1d1-2f452ec713fmr73098024a91.30.1735869854278;
 Thu, 02 Jan 2025 18:04:14 -0800 (PST)
Date: Fri,  3 Jan 2025 02:03:42 +0000
In-Reply-To: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
Mime-Version: 1.0
References: <e8520e5503a489e2dea8526077976ae5a0ab1849.1735868489.git.yepeilin@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <fedbaca80e6d8bd5bcba1ac5320dfbbdab14472e.1735868489.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 2/3] bpf, arm64: Factor out emit_a64_add_i()
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org
Cc: Peilin Ye <yepeilin@google.com>, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Josh Don <joshdon@google.com>, 
	Barret Rhoden <brho@google.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_180415_420222_632FB4AF 
X-CRM114-Status: GOOD (  12.11  )
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

As suggested by Xu, factor out emit_a64_add_i() for later use.  No
functional change.

Suggested-by: Xu Kuohai <xukuohai@huaweicloud.com>
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/net/bpf_jit_comp.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 9040033eb1ea..8ee9528d8795 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -267,6 +267,19 @@ static bool is_addsub_imm(u32 imm)
 	return !(imm & ~0xfff) || !(imm & ~0xfff000);
 }
 
+static inline void emit_a64_add_i(const bool is64, const int dst, const int src,
+				  const int tmp, const s32 imm, struct jit_ctx *ctx)
+{
+	if (is_addsub_imm(imm)) {
+		emit(A64_ADD_I(is64, dst, src, imm), ctx);
+	} else if (is_addsub_imm(-imm)) {
+		emit(A64_SUB_I(is64, dst, src, -imm), ctx);
+	} else {
+		emit_a64_mov_i(is64, tmp, imm, ctx);
+		emit(A64_ADD(is64, dst, src, tmp), ctx);
+	}
+}
+
 /*
  * There are 3 types of AArch64 LDR/STR (immediate) instruction:
  * Post-index, Pre-index, Unsigned offset.
@@ -1144,14 +1157,7 @@ static int build_insn(const struct bpf_insn *insn, struct jit_ctx *ctx,
 	/* dst = dst OP imm */
 	case BPF_ALU | BPF_ADD | BPF_K:
 	case BPF_ALU64 | BPF_ADD | BPF_K:
-		if (is_addsub_imm(imm)) {
-			emit(A64_ADD_I(is64, dst, dst, imm), ctx);
-		} else if (is_addsub_imm(-imm)) {
-			emit(A64_SUB_I(is64, dst, dst, -imm), ctx);
-		} else {
-			emit_a64_mov_i(is64, tmp, imm, ctx);
-			emit(A64_ADD(is64, dst, dst, tmp), ctx);
-		}
+		emit_a64_add_i(is64, dst, dst, tmp, imm, ctx);
 		break;
 	case BPF_ALU | BPF_SUB | BPF_K:
 	case BPF_ALU64 | BPF_SUB | BPF_K:
-- 
2.47.1.613.gc27f4b7a9f-goog



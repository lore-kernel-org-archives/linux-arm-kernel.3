Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAF2E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 23:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U1cvaO69byw0nGHFeA9yilXkgu6gKVdyllDmswCVIx8=; b=pZpAWt12B94lcGKcLeqhIAWAhl
	sW0+DXgLwHYa/J1SgzyLJd72mTpJZSwbqF3sZMC8IHgjJqulHf1DbTYiKW3/d9KEOZBSdrPxLIMyn
	u5icpLYfHceLabHkBxNWS5gXRPwQTmC34HjgK/g9shnOY04z5/GxFZDOAPYRD5unOG9eue0A2PT4v
	jmuTzFw8DgfetPOSJoXF1/3B7Z7Yz9eKO0WWSEnCDPWlYiSfShJtsaDXZVtbScsAVVQtuCzqE0+5N
	bw/W+bUFLQUlAtq9rl1W4OEI8LL0L0QrvcLrA2bUZsWr24253Vb9nTS8lOw0Ws1k+n4rwV7BNbzgI
	cQGV2mIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRJtV-000000016XE-0jRg;
	Fri, 27 Dec 2024 23:37:25 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRJsI-000000016Pp-0LvQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 23:36:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2ef9e38b0cfso9739234a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Dec 2024 15:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735342569; x=1735947369; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U1cvaO69byw0nGHFeA9yilXkgu6gKVdyllDmswCVIx8=;
        b=MHyUrYh2E2gv6ygeqAabpNFUUrSpOakDpkxGvTwTK2qP7lEnO58pI0X952RNb72VZQ
         hGRsR86ZdumBeeUkeBHmpXwBFlOI4VFKSpfg4yH8jpNSmUODAvvT72v93hEIfydmUofd
         RtzSSqR05UProb01dmk+KMIkVtyJMwoKTwQ7OPwqEsCJv4aiwF40tdkwJTXJR/nUAJrO
         vnr/mUGhIMvzadMOFnaj6A6yLbZ5LoTuUs08WTyJx189WP+dnsVSwNClHB5CzVElOepc
         TayQ5CSx0BAl3ltDwpU03xREHUjcb5Oolq4cY2fOG8O+hT9Uk228G6YZ5SkiNMzjAYau
         jR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735342569; x=1735947369;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=U1cvaO69byw0nGHFeA9yilXkgu6gKVdyllDmswCVIx8=;
        b=GwZCnL0E2FXiIxTHMbWjzZAomiiXAfvpYsJBWuZg1h05k8VuMWDb+f0Fy/LEt/lU1O
         rhIov29XbMTqNthksC+g2Ds333u2uuNIHW/HX6lmjDeSbpP51FIfcTV42GEyOVcGbg0+
         6ZkG1e0GJdcplLlOVdheRsTyFryiQLByaqNwdrBj9UmF0sN3/2FrZUvwvw1ufYu7rk9c
         pMN97UrelBrU8VVXOrt6PkzbvayXsaAcO7Tyht7WpwXVAzPEn1enjRra85tchFE1zu6s
         k88dJkC+4D3SFnZyaxxuHZ9DHK1b5NTuq38Ei4gBZbw9d9akEn+65788oAQlZ36Zr4Kl
         2Zhg==
X-Forwarded-Encrypted: i=1; AJvYcCWA+MAUib/MOmgzgwKCu0vCBAdwgK69cSRdeKUVr1v/pMCYf/t55sD6wLjuBl82VvE6Qx+tF12RbWqIKbbY6ZR5@lists.infradead.org
X-Gm-Message-State: AOJu0YzIOjvE1Hnj0MYtkDdPRf06vOyEb79r0ToSHQN+bzVLHN2D+0dr
	+NmTXj89gbK3xcH1YXJ6qhySE7Q/WDaB3qAspzRwnnOoYijIm9n5VrkOtTfNjYR1IG9MKjeqTzM
	3a6sNp8zsUQ==
X-Google-Smtp-Source: AGHT+IFuJUZ9jsTKQSDCXDTwgQyNyL9rJWt4gk6hZ4XtzDy2D3InD9OFNgdY2aj5V6x5Yf9TAhT2yfJZ4RY9nQ==
X-Received: from pjbsw12.prod.google.com ([2002:a17:90b:2c8c:b0:2ef:82c0:cb8d])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:270d:b0:2ee:dd9b:e3e8 with SMTP id 98e67ed59e1d1-2f452dfd3b6mr46753319a91.8.1735342568743;
 Fri, 27 Dec 2024 15:36:08 -0800 (PST)
Date: Fri, 27 Dec 2024 23:35:46 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <3b84fa17ab72f3f69e09e0032452d17eb13b80db.1735342016.git.yepeilin@google.com>
Subject: [PATCH bpf-next 1/2] bpf, arm64: Simplify if logic in emit_lse_atomic()
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
X-CRM114-CacheID: sfid-20241227_153610_146620_F4A85FC9 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

Delete that unnecessary outer if clause.  No functional changes.

Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 arch/arm64/net/bpf_jit_comp.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 66708b95493a..9040033eb1ea 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -648,16 +648,14 @@ static int emit_lse_atomic(const struct bpf_insn *insn, struct jit_ctx *ctx)
 	const s16 off = insn->off;
 	u8 reg = dst;
 
-	if (off || arena) {
-		if (off) {
-			emit_a64_mov_i(1, tmp, off, ctx);
-			emit(A64_ADD(1, tmp, tmp, dst), ctx);
-			reg = tmp;
-		}
-		if (arena) {
-			emit(A64_ADD(1, tmp, reg, arena_vm_base), ctx);
-			reg = tmp;
-		}
+	if (off) {
+		emit_a64_mov_i(1, tmp, off, ctx);
+		emit(A64_ADD(1, tmp, tmp, dst), ctx);
+		reg = tmp;
+	}
+	if (arena) {
+		emit(A64_ADD(1, tmp, reg, arena_vm_base), ctx);
+		reg = tmp;
 	}
 
 	switch (insn->imm) {
-- 
2.47.1.613.gc27f4b7a9f-goog



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CCCBC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bEAtfk9sZ7vuzt+HmDZCm4BnfnO/7nvi4Al6O9lbnV0=; b=hvE0h/HOvhqdEiMa7YeYQkBBtw
	t40aNNohvrSQL3qVAjHIaBSE78AFcfEy40gzXXTw/nmbIqAkcmP9NXAmExWSyzW3DJ2Bh/FI7zz+c
	qzBlRYGW4DwHClVpF87OoCKcfe3+4wy2p+HxoFkDHElKnkg3st0VGy2uGggfUh5KMXoki6PB/zQK3
	jZeq5mSh2AOGxxphILHNUNkT2IDibXlIaflj7cWQ9cIp8dh8ymFYO8dpYBlYnM3YwKz2oJD3rA+SF
	WCS7RqleT1bJ85mEosjnmlY/BLk0kPItBELh2lfdCaw3BM8H9havSlKGDunnE1IEB7Gtrmz0gyAkC
	shxPw6QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg07A-000000068yu-10ER;
	Thu, 06 Feb 2025 11:32:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXP-000000061k6-3Xmy
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Feb 2025 10:55:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bEAtfk9sZ7vuzt+HmDZCm4BnfnO/7nvi4Al6O9lbnV0=; b=hDndw1XKALXqPzA71iDZCd2pDs
	A4rn+z3bMsQVaa52PJ/dh8q1RWVhMaeck+OQrtXrEbgm3hCh9nk99L3+Z4e/F4FunYNWdszcuKebC
	2V50eMs9usg6o7sftDVuKIVrn7ZLTTe47xEgrIOeNpwTWJPbcONc1vIa2uTvLggUCi3yGI6iq0rEL
	ELVAbqK9gtvnwbIQCZ4gnj6lK+92z4V+kMVHuyoLaEzaEnTxhqYnfMNlQfTNwobeT50H29HsOg6jH
	iQ8vDfBMxMqdDqX7lxtc/LhCZGUbB3rJ+wXOmatyrPaa0niMy3XWjjKZ0ku4X4G9vwJyCmhDqmezG
	V3iSrGMA==;
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzXM-0000000GuyQ-3B1y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 10:55:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso4702105e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 02:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738839311; x=1739444111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bEAtfk9sZ7vuzt+HmDZCm4BnfnO/7nvi4Al6O9lbnV0=;
        b=fTvDt4fpFjuv7VfSj7Zz6tr8hG98jK2lxt2JEfO0z2HgmSrDjm820MANHtGSFR7a7w
         efKHDyXi/c6VFq576E8/D8Jju5mAvCkaWHDPKZWkT/9eMLrYP7WhNGJJ3LEj3k3CErKF
         Zs8cCei36gkGU4SCN8xAX6n5YKkz/k8YGVUk+8I9VqL/QyPIbb0ToZ11E0bkDkSVbKXl
         25+3o4/gFng7ZXBAsnaYm/lqTrAGFFwRO7DC86pVwkxAk2+kKPQ9w/GAvLUI96NoJ4Ef
         apq05fIDVMYE69AOfdqrV9691bSDmerCjrAVSskQPhKmnv+C/OQSbpAonOsS5jvlsOWk
         98kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738839311; x=1739444111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bEAtfk9sZ7vuzt+HmDZCm4BnfnO/7nvi4Al6O9lbnV0=;
        b=mqpH3JQ0Off+Ceu7oGKGgXtwzTn6d0tegU0TqZE6Y418IcYOB8w88XtuUpG/f6zkga
         OrmcguWql10LNGuHlcggtgVMJbSgKXY2DMThJ9Aw7ep530//3CYDproOHz4iP5EtuhyR
         aDiC+dKcdcwGAlI6zLpjQZS/LzBfXTFff6zfjoT89cWQIPGY8+OnFA7TzfkF4yJBBUSK
         +Hws7yDUPm5EEjuKD4lbMECqpR6G0Vve9mxyClMToPyYPbUbMjIkyPhRGlVUfs8r92+L
         4vaTMkavgtBQXSLK+wXZmjuXyCWH/88NnhRFupCaQ2Fsi9++nLu/Xw6PgYT8R06WE0WB
         ZDFg==
X-Forwarded-Encrypted: i=1; AJvYcCWWZ3bNDstKsWO1NOzMEB4JUDHkIbgTiWJjKfZhmvn1g2LXwe3+MPJVIZMebUeqKsXm8LOEE6qNUfnY1x68kVMy@lists.infradead.org
X-Gm-Message-State: AOJu0YwSjmKkygRHVru143JoykKpka2b3QXQDRupR8w7PAyobCKQ4SNr
	LapXWCdkMo4go+9hYVn5a4T4DR101r3oj/HGrGvF/yo9z4lah45D
X-Gm-Gg: ASbGncss/2W8cRSEFs58NHAWHfDEOs8oMfXWOp7bugOIEADXr+gG2Ux20ICcjQd/lm9
	MvcCa3UBNnlEc9wcdERnYpt/zsC289iPn0XnbYL0dTmvx4VBvsVN7thISp6JLiOYB+wj7Md+mPq
	HCVzZw7fOQgjLSeICM0L/4dHNgt5o2MFqY6zYOuzPskU48RLjNO4AOdT4fe8JiWUAr7DwWnE+of
	mk3f7Dk3yMzrHIo3SkALn2Bz/YpGCK2ADr2D2g0KuMpDTwRDGzusqrYxoOrLePXXy8f76x6Tc+l
	/KV8Sw==
X-Google-Smtp-Source: AGHT+IFqbAZGecNZkCkV4EyCt9uLl+Me6VZBFwE4Ef4f+7NoRNBRql5C5/fdSnEXvukiZ8DRRQsg4A==
X-Received: by 2002:a05:600c:3502:b0:434:a468:4a57 with SMTP id 5b1f17b1804b1-4390d56d740mr41168565e9.26.1738839311535;
        Thu, 06 Feb 2025 02:55:11 -0800 (PST)
Received: from localhost ([2a03:2880:31ff:18::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d966faasm51736715e9.23.2025.02.06.02.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 02:55:10 -0800 (PST)
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
To: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>,
	Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel@lists.infradead.org,
	kernel-team@meta.com
Subject: [PATCH bpf-next v2 25/26] bpf: Maintain FIFO property for rqspinlock unlock
Date: Thu,  6 Feb 2025 02:54:33 -0800
Message-ID: <20250206105435.2159977-26-memxor@gmail.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250206105435.2159977-1-memxor@gmail.com>
References: <20250206105435.2159977-1-memxor@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4773; h=from:subject; bh=CpkXgirFn/osRo9yRzXQj0S5SI5kmNKbptLkawFmaSc=; b=owEBbQKS/ZANAwAIAUzgyIZIvxHKAcsmYgBnpJRn9kSW/6/ffD2Y5sJ0f0LySFJbetcpzORHAy69 oJgq0WmJAjMEAAEIAB0WIQRLvip+Buz51YI8YRFM4MiGSL8RygUCZ6SUZwAKCRBM4MiGSL8RysTTEA Cs/dM0FPIuRegO0Ni1ae0PS45twSts6Al635nhtr0pJrXE19WwWgKiImtGQFXqq3EPB5/8SvfuaE8G J1P1qGxlxHodgTsNGv+svmEY0/JEu+q38yAWvB4eRw3JLHg9CbMW51ggxE1p3ZpyZYdbpTgg6oxbQE tBXlQcMrV6jKRRSW1tnaKkmrC9wWPdweMrStWBRYVKxQBsyiRvRP58LTSpAeAwLr8stkpLRqzpdlUM WixOEfnvLFoJZoPEOHf1EBfFZyIThmEomcF7O0RKWuNsk5bXmo/QkqIcglaJT064UNbt+Xcpn2Bdgv Q+c7mIOHcVf31dJK9WBMiOB2YeIOcQuybv5/L73vuSoYFc4o2Hj5Rl0C+sRvUP8mIlwf25+jxQvYBP 4tTP5udWN/wvGI3i3o1VSO5asN9D7U6bGMJ1ZAfO4SBI7Jy7BbBDsa143gR8A2A30Kw9d5HSmip4a0 DmlaU7qWHdV2XFecXaKQvl/1VrvRH9XWp3ofuOWKzZkjOYKHnOjpcqd9d0JVn9LNE+45UH8SAgmHyl VGJ9BQJpdJmgnhnBI4c3ltCVvXs7IkhGfKc0k5MJwxPnQTv+uV0xjj9cFG4MJ77JOXjgkV1tpM1Nka 70APhaWwVIcUoIfaNj8H3ninXADBCDCYIA8glTB00cVm16MtNyCn/PsFhxVQ==
X-Developer-Key: i=memxor@gmail.com; a=openpgp; fpr=4BBE2A7E06ECF9D5823C61114CE0C88648BF11CA
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_105512_986934_390BE66B 
X-CRM114-Status: GOOD (  20.79  )
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

Since out-of-order unlocks are unsupported for rqspinlock, and irqsave
variants enforce strict FIFO ordering anyway, make the same change for
normal non-irqsave variants, such that FIFO ordering is enforced.

Two new verifier state fields (active_lock_id, active_lock_ptr) are used
to denote the top of the stack, and prev_id and prev_ptr are ascertained
whenever popping the topmost entry through an unlock.

Take special care to make these fields part of the state comparison in
refsafe.

Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
---
 include/linux/bpf_verifier.h |  3 +++
 kernel/bpf/verifier.c        | 33 ++++++++++++++++++++++++++++-----
 2 files changed, 31 insertions(+), 5 deletions(-)

diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
index ed444e44f524..92cd2289b743 100644
--- a/include/linux/bpf_verifier.h
+++ b/include/linux/bpf_verifier.h
@@ -269,6 +269,7 @@ struct bpf_reference_state {
 		REF_TYPE_LOCK		= (1 << 3),
 		REF_TYPE_RES_LOCK 	= (1 << 4),
 		REF_TYPE_RES_LOCK_IRQ	= (1 << 5),
+		REF_TYPE_LOCK_MASK	= REF_TYPE_LOCK | REF_TYPE_RES_LOCK | REF_TYPE_RES_LOCK_IRQ,
 	} type;
 	/* Track each reference created with a unique id, even if the same
 	 * instruction creates the reference multiple times (eg, via CALL).
@@ -435,6 +436,8 @@ struct bpf_verifier_state {
 	u32 active_locks;
 	u32 active_preempt_locks;
 	u32 active_irq_id;
+	u32 active_lock_id;
+	void *active_lock_ptr;
 	bool active_rcu_lock;
 
 	bool speculative;
diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
index 294761dd0072..9cac6ea4f844 100644
--- a/kernel/bpf/verifier.c
+++ b/kernel/bpf/verifier.c
@@ -1421,6 +1421,8 @@ static int copy_reference_state(struct bpf_verifier_state *dst, const struct bpf
 	dst->active_preempt_locks = src->active_preempt_locks;
 	dst->active_rcu_lock = src->active_rcu_lock;
 	dst->active_irq_id = src->active_irq_id;
+	dst->active_lock_id = src->active_lock_id;
+	dst->active_lock_ptr = src->active_lock_ptr;
 	return 0;
 }
 
@@ -1520,6 +1522,8 @@ static int acquire_lock_state(struct bpf_verifier_env *env, int insn_idx, enum r
 	s->ptr = ptr;
 
 	state->active_locks++;
+	state->active_lock_id = id;
+	state->active_lock_ptr = ptr;
 	return 0;
 }
 
@@ -1559,16 +1563,24 @@ static void release_reference_state(struct bpf_verifier_state *state, int idx)
 
 static int release_lock_state(struct bpf_verifier_state *state, int type, int id, void *ptr)
 {
+	void *prev_ptr = NULL;
+	u32 prev_id = 0;
 	int i;
 
 	for (i = 0; i < state->acquired_refs; i++) {
-		if (state->refs[i].type != type)
-			continue;
-		if (state->refs[i].id == id && state->refs[i].ptr == ptr) {
+		if (state->refs[i].type == type && state->refs[i].id == id &&
+		    state->refs[i].ptr == ptr) {
 			release_reference_state(state, i);
 			state->active_locks--;
+			/* Reassign active lock (id, ptr). */
+			state->active_lock_id = prev_id;
+			state->active_lock_ptr = prev_ptr;
 			return 0;
 		}
+		if (state->refs[i].type & REF_TYPE_LOCK_MASK) {
+			prev_id = state->refs[i].id;
+			prev_ptr = state->refs[i].ptr;
+		}
 	}
 	return -EINVAL;
 }
@@ -8123,6 +8135,14 @@ static int process_spin_lock(struct bpf_verifier_env *env, int regno, int flags)
 			type = REF_TYPE_RES_LOCK;
 		else
 			type = REF_TYPE_LOCK;
+		if (!find_lock_state(cur, type, reg->id, ptr)) {
+			verbose(env, "%s_unlock of different lock\n", lock_str);
+			return -EINVAL;
+		}
+		if (reg->id != cur->active_lock_id || ptr != cur->active_lock_ptr) {
+			verbose(env, "%s_unlock cannot be out of order\n", lock_str);
+			return -EINVAL;
+		}
 		if (release_lock_state(cur, type, reg->id, ptr)) {
 			verbose(env, "%s_unlock of different lock\n", lock_str);
 			return -EINVAL;
@@ -12284,8 +12304,7 @@ static int check_reg_allocation_locked(struct bpf_verifier_env *env, struct bpf_
 
 	if (!env->cur_state->active_locks)
 		return -EINVAL;
-	s = find_lock_state(env->cur_state, REF_TYPE_LOCK | REF_TYPE_RES_LOCK | REF_TYPE_RES_LOCK_IRQ,
-			    id, ptr);
+	s = find_lock_state(env->cur_state, REF_TYPE_LOCK_MASK, id, ptr);
 	if (!s) {
 		verbose(env, "held lock and object are not in the same allocation\n");
 		return -EINVAL;
@@ -18288,6 +18307,10 @@ static bool refsafe(struct bpf_verifier_state *old, struct bpf_verifier_state *c
 	if (!check_ids(old->active_irq_id, cur->active_irq_id, idmap))
 		return false;
 
+	if (!check_ids(old->active_lock_id, cur->active_lock_id, idmap) ||
+	    old->active_lock_ptr != cur->active_lock_ptr)
+		return false;
+
 	for (i = 0; i < old->acquired_refs; i++) {
 		if (!check_ids(old->refs[i].id, cur->refs[i].id, idmap) ||
 		    old->refs[i].type != cur->refs[i].type)
-- 
2.43.5



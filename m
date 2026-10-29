Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64BE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B/vDCkMO;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HMUj28/3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=lD4NnHsGQ2Vqml/5riD8yTS62RWO3XbEmugu6s7tsuk=; b=B/vDCkMO4mg0Hl
	DuoRB3r2sw2nN/wu+HF5u2RjXhkbv7wuHDoVpG/OrbcxH/LqYKZuW6YgSh7pIUlxu5c+93wy71lmQ
	08vW6Qh9OZaVQpDm8hKSCvnwwQNknop74EI2kvqvAhx6hXl9JctQWgBi3m9vHoq5sBm6bYJgQS8Up
	URXSxuXSPSyHGvbQH3GUlaT+ADrIw5GWS79ag3roHv7EGtqMuEeMV55C/18CTpoM7Ros2+Jr3oQnz
	DfLNhsdWRU8diw/0gO9KZs2okoyMDE/pRdM+WG7mKctAhhZgJsXfAFXE6PYdoTU76OKD2x2HzXSsY
	50i0BfGpikgtnTnWUccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMY9V-0000000AS4Q-0U8F;
	Thu, 29 Oct 2026 21:59:17 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMY9R-0000000AS41-0O8L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:59:15 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a54bba0442so7675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:59:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793311150; cv=none;
        d=google.com; s=arc-20260327;
        b=ptZLayP98lj1aHdPegq6IB8auP+RN+EL51Sn5mF8vjDsdgqT/HiumDUPZPIP7hfjO3
         FFZJEC0S9ZLCq8rOHel3P09xtdAVzQnMMFbXZpF6Nhs1HLmL2ey+LbRzBE/EY48ctITR
         ONhfnQcYqwj2fJWQr53nPZG3cRhlgtkSp813N2d4cSC7FJyeLSc1oAhQD2mJwdLK9sAG
         b79tVr/+ixi9D/9dMWz/L3pIK6JRgrLtD4UWKE8EVHRm+noqlzjSlgvTy7CSAa5gVlHG
         qRVPCwcRQErvtMtN1VsmfrrtVJCPXmixe7g2lNv1AOfdtThmfigtjLrciEh8Qe2QySSF
         TZng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lD4NnHsGQ2Vqml/5riD8yTS62RWO3XbEmugu6s7tsuk=;
        fh=gNGL9l0ni0siXO1sjUa6Zn2Uhgi4YnFLRJQiI8rwcls=;
        b=juqlCLiVR6OY3CpZViRdB8bl8ZLvbo+YYsy317woQeftj3r38wCMQGT/ncns4lj+Yy
         f5t0iFy8TFDTuRYM7Zf+N598EJA1zSM7U6vrLCRWqLoX7edcECeesrUX+HQB2/feM0QC
         VUZne4dshsp/jjazM/Cpq1JWKGgBK2MQgCWHGklwCLr2nqA28FJf/7D6PqwIG8BjQXVh
         mgDxY+k+r4oMo21gSO/lLhCLgRWGAGrKZy8nN3BxdzbzOu3VfKTHAsnVBjzMmxLoaJJp
         Q+rR9yhIWGrQssi14G0HCFhlNsOfdCJbKRjc8PvZ/5Vu5tFRfyVJu/SHLECkcy1ENycO
         7EAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793311150; x=1793915950; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lD4NnHsGQ2Vqml/5riD8yTS62RWO3XbEmugu6s7tsuk=;
        b=HMUj28/33ocnXZ+4uyQMr3CT7FtrTzNY2qkX1vuQNJFlX4s+g4yOnAv+tNpsoJZZxQ
         tGyW4mf+xlscqUTHDtKjFnjYi5LsXrX1EqYzmBzNyYUfW/dx4WsmmRFWiC1/zT+xkPGg
         ZacSTm4aTPdES51F3UxUqYOn7eT3Tmg10iwECOuKemnl/C80Nt5hEqNvTSYYWxpnG84Y
         +8yP2N60RYGxR+7D94d4/HItYqMp5CB1bEV6+NhEb0KlSiuvBqxnsOAipJTEpsO9/aar
         CxwDbtEB9/+8Cyy+iE1v1vjswjkL5sH/GjvPuVOtxv77iU7gXELPuPOLLdORYebvEQvw
         tB2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793311150; x=1793915950;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lD4NnHsGQ2Vqml/5riD8yTS62RWO3XbEmugu6s7tsuk=;
        b=VQGeDppfA899W4pgvoEaoEPy3PGrweFErz2mApo91QqfQq6SpmtOhGf4Y6R1KITiNG
         3ud9/cZISdys/JT1JaQK1hNJcTlU9jlyAgMvo190u+Adcs6PfPB367qxf4Pirz+dqfJp
         RaL/k6v/SljvLcMTYK66ZH9bg2uCVbxmB0iBleO1C7920TrCdUJuwXPyuVQgl+TxN/Ys
         rNG8uVqN0LSSeJFJUaLwkVxGuK2TdC5zB25ThPFq7xDmtR1UkicLlM9cGdxD2iXTGDaF
         1l+OWrKfAQnIz9fKDi4Nf5GkLSwj3NsLqhEkuJvdANJgxjLh28FOEhZuJTIt9d8I3SWP
         TCrw==
X-Forwarded-Encrypted: i=1; AKwUvByRFr38I2ePCmvLEnjkV6nCN0Sxy6ajAiGoNziGC5cK76WZ/CjyXwmX0k3sllRY3ZsggPqKMy4LuMCWna2P32Pn@lists.infradead.org
X-Gm-Message-State: AFq9FYKvnUY7iPCzFKR7CDZZVdAdhKTg9JIdB1Tg7YiQ39gS9t30Yg7Y
	h4xXBFHW3MMN4GVGHewP2jdThgRJkiBMmxF/U8SFDtP0JhFFPhaIRpMcDtvZ3h4lGmn4mvECwPH
	L6jWDAxnpqGLcYMGLnLq77zSF79WiwxKc0tD5hT+U
X-Gm-Gg: AYBFou3+7An214wsMSRToLDirJq3mpuVZjJ3GVtbHFjOb12BQk764RkrZLk9m791yWa
	4NkipxT5DDGHu7Ut9NGmGSfvpfoloSQ6En/XvQ9aoGebK8gPf2gBuQx8tGcNj9iBC7eZGyc5dem
	lbQng4ych/kbcsIOxXOQxOIARsjqBwLfjVAtqR3W3v7nwtssbOUvFYcO92uo7C/QQ6sdahII12r
	+D7lpLy6k5JYkr+qRY73sL/aa3t+5un2ClDu9o/UuIsSN5FMr/g9KVxupODQnMqeh/lxdw8MnV2
	J/tEHZCwKevGbkuXJuatfeCMk3CuF4bfwvpdy5Kl/+nenP1GeNsyE/YgAm6DIgxsos071J7D754
	5MMGtNhuYsKaJbfEY1TRaLTFfX1g92IjT6w==
X-Received: by 2002:a05:600c:6098:b0:4a1:e7d5:5132 with SMTP id
 5b1f17b1804b1-4abf6e63ee7mr351585e9.3.1793311149227; Thu, 29 Oct 2026
 14:59:09 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
In-Reply-To: <20261029-b4-arm64-callops-kcfi-v3-0-1b011ad5ddec@linux.dev>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 29 Oct 2026 14:58:31 -0700
X-Gm-Features: AclHuK8ASG46JARQbXb1REUMHY0OEjL5EAbmE_577-jrD-4XvLvRMqXYq4UuuIM
Message-ID: <CABCJKufu04HxOurNGyg2uHAeDVyTNQZwBeb4Nw95LL8L1AUFKg@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] arm64: ftrace: support CALL_OPS on kernels built
 with kCFI
To: "Jose Fernandez (Anthropic)" <jose.fernandez@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Kees Cook <kees@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Puranjay Mohan <puranjay@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Ben Cressey <ben@cressey.dev>, 
	Florent Revest <florent.revest@linux.dev>, Bill Wendling <morbo@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_145913_268683_E5EF7F4F 
X-CRM114-Status: GOOD (  13.24  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jose,

On Thu, Oct 29, 2026 at 9:53=E2=80=AFAM Jose Fernandez (Anthropic)
<jose.fernandez@linux.dev> wrote:
>
> CALL_OPS and kCFI have been mutually exclusive on arm64 since commit
> baaf553d3bc3 ("arm64: Implement HAVE_DYNAMIC_FTRACE_WITH_CALL_OPS").
> kCFI checks the type hash at a fixed offset before the entry point, so
> every function needs the same number of prefix NOPs. Before clang 21 the
> compiler could not emit prefix NOPs without also adding the function to
> ftrace's table. Since commit 9315e22b0c0a ("arm64: ftrace: allow
> DIRECT_CALLS without CALL_OPS") a kCFI kernel can attach BPF
> trampolines. A trampoline out of BL range is reached through
> ftrace_caller. That path costs ~10 ns more per call than on a CALL_OPS
> kernel, plus ~4 ns for every extra ftrace_ops registered. Clang 21 takes
> a section name as a third argument of -fpatchable-function-entry [1].
> This series uses it to give every function three prefix NOPs while
> keeping untraced functions out of ftrace's table, and enables CALL_OPS
> under kCFI. The per-call cost drops by ~10 ns and stops growing with the
> number of ftrace_ops registered.

Thanks for implementing this! For the series:

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami


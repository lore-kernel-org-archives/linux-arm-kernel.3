Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DACC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ep8DalcKj7dauwNLlP5ARZOtPwUTNVJ49jqJ539nuE=; b=pcdJYP0nQJH1jeHp/r8G0KGAiM
	dkYMG+ORQAWMQ4UdEX/8dd1jXQHL0QejEOPzYQbOfOGCUN86tfEZhKaZ1dgDXOxrCQymoqwDbz2iY
	ZUvhjMHjF4y4+NlspnhUQNbCYzpXLEAqNrDVLjqA8AidoHfkpDOjIxP+e1x/Sh0Upshp+Z7qS6p+q
	WqOnvw2/FSws2hgMWEc8gCPiZIid9US85+9iv5lbPMXWx5iztQGsfbDwD/3AP0AYnqcJOpSlpKK7S
	i3D+K4NAVJz80J/8oRHWsu1mKuxqpNnrGrQEntvtFdaX4mdEE7XNyNJ0Rn2nzsdQXGpCzcfT8iYd5
	woVM0d/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDxM-000000083Na-0i0z;
	Fri, 07 Feb 2025 02:19:00 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDlR-000000081in-3Y8h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:06:42 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-21f40f40788so25193085ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738894001; x=1739498801; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ep8DalcKj7dauwNLlP5ARZOtPwUTNVJ49jqJ539nuE=;
        b=kSdNkGdA1aLy0rad2rhzWW6rlQYlGDptpBQUqEwpnbBQ7PS3NK21CgQCGLM77hBDmZ
         Aom0NSF0FZqadFDisATMtzV1trtuWD1q6PXPgQEbLElwCLHIJcFyAe/1hBrgJCU3ZG3E
         YhPDDLFwsG27kG4aBmE8C2Lv7hIybCXLoaG236mQsLAmCR5UN5djQ3v9HMtT+7lvS6IX
         Dny02NZfo21SN6LaUz4tUUXCZ9RQFCXv16RIYQD3p1e33QQ2CweEeBzFvpjQ4ujiDl7u
         F9+c/aslpN5jFwTWWb5iTwWthcqkPCXDBPXAsHcUjLcOr+rjf1XLG3ijGvVwiz0ad75Z
         0uLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894001; x=1739498801;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2ep8DalcKj7dauwNLlP5ARZOtPwUTNVJ49jqJ539nuE=;
        b=J9e3adUBUvXFd4Xlad41GHK5QPRtcSTwrdmQmVy0Cf/noHPwxRmcqz4QYqyeN1Le74
         1AZ2VrLapkkhlQGUI7jCYYUV381LIycWLH88m2yC8nonnhwoKA03g569E5ePjSkrCJbF
         1GM2KrMJSJks43rJr1/NxE/ufGTnWiekwR0aV0XFb+PT5iUAYnyAwlnromklpN9JDLzh
         bkZnNcikePJiCLsXU4fsBU+P+t44dJ6qPI7V/5dC9CgTXUNtpkiIARp5KDpfMo76BFOP
         0yAtx+7qZAM1uzl+zvF0Qx1xUC6/mzfNV+a64yUJFl9cVbm8s6teogM3xxqkIn6aTxlc
         4pGw==
X-Forwarded-Encrypted: i=1; AJvYcCWFQKChpL6nA4tj4a+17z8HSmAyX+5qPCkU9RI8PeTfhWTaC0N5kSdlHfEEXNJw8CqsShXfQy3x+21D1HsGBAGO@lists.infradead.org
X-Gm-Message-State: AOJu0YyrHJwSzB/x7mDSVp9M7+d45BLqAWnJmtAu1WVuoTC6VV+ams7P
	WmVTp2InezE95zRMNvIOcArI8txUtyGQgOEaTi+rhbVM69D6jAkI1RxdxpbhdV7JghQOn0ivr5c
	M43mSB4FPHQ==
X-Google-Smtp-Source: AGHT+IHO+QQmGU+1/m5wHtsMoItJdlgCTFiDvf89nZcXM296VZbNzIAooIz/Ko6Udd05tpk4RbaW4EcMXoxUsg==
X-Received: from pfnv19.prod.google.com ([2002:aa7:8513:0:b0:730:5488:ee30])
 (user=yepeilin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:1394:b0:1e0:c77c:450d with SMTP id adf61e73a8af0-1ee03a242cemr2973087637.1.1738894000789;
 Thu, 06 Feb 2025 18:06:40 -0800 (PST)
Date: Fri,  7 Feb 2025 02:06:36 +0000
In-Reply-To: <cover.1738888641.git.yepeilin@google.com>
Mime-Version: 1.0
References: <cover.1738888641.git.yepeilin@google.com>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
Message-ID: <d5ef5b58910bb83ecd7375220eade06fdf16a10e.1738888641.git.yepeilin@google.com>
Subject: [PATCH bpf-next v2 9/9] bpf, docs: Update instruction-set.rst for
 load-acquire and store-release instructions
From: Peilin Ye <yepeilin@google.com>
To: bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Peilin Ye <yepeilin@google.com>, bpf@ietf.org, Xu Kuohai <xukuohai@huaweicloud.com>, 
	Eduard Zingerman <eddyz87@gmail.com>, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Quentin Monnet <qmo@kernel.org>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Yingchi Long <longyingchi24s@ict.ac.cn>, 
	Josh Don <joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu <neelnatu@google.com>, 
	Benjamin Segall <bsegall@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_180641_893016_32B35619 
X-CRM114-Status: GOOD (  14.72  )
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

Update documentation for the new load-acquire and store-release
instructions.  Rename existing atomic operations as "atomic
read-modify-write (RMW) operations".

Following RFC 9669, section 7.3. "Adding Instructions", create new
conformance groups "atomic32v2" and "atomic64v2", where:

  * atomic32v2: includes all instructions in "atomic32", plus the new
                8-bit, 16-bit and 32-bit atomic load-acquire and
                store-release instructions

  * atomic64v2: includes all instructions in "atomic64" and
                "atomic32v2", plus the new 64-bit atomic load-acquire
                and store-release instructions

Cc: bpf@ietf.org
Signed-off-by: Peilin Ye <yepeilin@google.com>
---
 .../bpf/standardization/instruction-set.rst   | 114 +++++++++++++++---
 1 file changed, 98 insertions(+), 16 deletions(-)

diff --git a/Documentation/bpf/standardization/instruction-set.rst b/Documentation/bpf/standardization/instruction-set.rst
index ab820d565052..86917932e9ef 100644
--- a/Documentation/bpf/standardization/instruction-set.rst
+++ b/Documentation/bpf/standardization/instruction-set.rst
@@ -139,8 +139,14 @@ This document defines the following conformance groups:
   specification unless otherwise noted.
 * base64: includes base32, plus instructions explicitly noted
   as being in the base64 conformance group.
-* atomic32: includes 32-bit atomic operation instructions (see `Atomic operations`_).
-* atomic64: includes atomic32, plus 64-bit atomic operation instructions.
+* atomic32: includes 32-bit atomic read-modify-write instructions (see
+  `Atomic operations`_).
+* atomic32v2: includes atomic32, plus 8-bit, 16-bit and 32-bit atomic
+  load-acquire and store-release instructions.
+* atomic64: includes atomic32, plus 64-bit atomic read-modify-write
+  instructions.
+* atomic64v2: unifies atomic32v2 and atomic64, plus 64-bit atomic load-acquire
+  and store-release instructions.
 * divmul32: includes 32-bit division, multiplication, and modulo instructions.
 * divmul64: includes divmul32, plus 64-bit division, multiplication,
   and modulo instructions.
@@ -653,20 +659,31 @@ Atomic operations are operations that operate on memory and can not be
 interrupted or corrupted by other access to the same memory region
 by other BPF programs or means outside of this specification.
 
-All atomic operations supported by BPF are encoded as store operations
-that use the ``ATOMIC`` mode modifier as follows:
+All atomic operations supported by BPF are encoded as ``STX`` instructions
+that use the ``ATOMIC`` mode modifier, with the 'imm' field encoding the
+actual atomic operation.  These operations are categorized based on the second
+lowest nibble (bits 4-7) of the 'imm' field:
 
-* ``{ATOMIC, W, STX}`` for 32-bit operations, which are
+* ``ATOMIC_LOAD`` and ``ATOMIC_STORE`` indicate atomic load and store
+  operations, respectively (see `Atomic load and store operations`_).
+* All other defined values indicate an atomic read-modify-write operation, as
+  described in the following section.
+
+Atomic read-modify-write operations
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The atomic read-modify-write (RMW) operations are encoded as follows:
+
+* ``{ATOMIC, W, STX}`` for 32-bit RMW operations, which are
   part of the "atomic32" conformance group.
-* ``{ATOMIC, DW, STX}`` for 64-bit operations, which are
+* ``{ATOMIC, DW, STX}`` for 64-bit RMW operations, which are
   part of the "atomic64" conformance group.
-* 8-bit and 16-bit wide atomic operations are not supported.
+* 8-bit and 16-bit wide atomic RMW operations are not supported.
 
-The 'imm' field is used to encode the actual atomic operation.
-Simple atomic operation use a subset of the values defined to encode
-arithmetic operations in the 'imm' field to encode the atomic operation:
+Simple atomic RMW operation use a subset of the values defined to encode
+arithmetic operations in the 'imm' field to encode the atomic RMW operation:
 
-.. table:: Simple atomic operations
+.. table:: Simple atomic read-modify-write operations
 
   ========  =====  ===========
   imm       value  description
@@ -686,10 +703,10 @@ arithmetic operations in the 'imm' field to encode the atomic operation:
 
   *(u64 *)(dst + offset) += src
 
-In addition to the simple atomic operations, there also is a modifier and
-two complex atomic operations:
+In addition to the simple atomic RMW operations, there also is a modifier and
+two complex atomic RMW operations:
 
-.. table:: Complex atomic operations
+.. table:: Complex atomic read-modify-write operations
 
   ===========  ================  ===========================
   imm          value             description
@@ -699,8 +716,8 @@ two complex atomic operations:
   CMPXCHG      0xf0 | FETCH      atomic compare and exchange
   ===========  ================  ===========================
 
-The ``FETCH`` modifier is optional for simple atomic operations, and
-always set for the complex atomic operations.  If the ``FETCH`` flag
+The ``FETCH`` modifier is optional for simple atomic RMW operations, and
+always set for the complex atomic RMW operations.  If the ``FETCH`` flag
 is set, then the operation also overwrites ``src`` with the value that
 was in memory before it was modified.
 
@@ -713,6 +730,71 @@ The ``CMPXCHG`` operation atomically compares the value addressed by
 value that was at ``dst + offset`` before the operation is zero-extended
 and loaded back to ``R0``.
 
+Atomic load and store operations
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+To encode an atomic load or store operation, the lowest 8 bits of the 'imm'
+field are divided as follows::
+
+  +-+-+-+-+-+-+-+-+
+  | type  | order |
+  +-+-+-+-+-+-+-+-+
+
+**type**
+  The operation type is one of:
+
+.. table:: Atomic load and store operation types
+
+  ============  =====  ============
+  type          value  description
+  ============  =====  ============
+  ATOMIC_LOAD   0x1    atomic load
+  ATOMIC_STORE  0x2    atomic store
+  ============  =====  ============
+
+**order**
+  The memory order is one of:
+
+.. table:: Memory orders
+
+  =======  =====  =======================
+  order    value  description
+  =======  =====  =======================
+  RELAXED  0x0    relaxed
+  ACQUIRE  0x1    acquire
+  RELEASE  0x2    release
+  ACQ_REL  0x3    acquire and release
+  SEQ_CST  0x4    sequentially consistent
+  =======  =====  =======================
+
+Currently the following combinations of ``type`` and ``order`` are allowed:
+
+.. table:: Atomic load and store operations
+
+  ========= =====  ====================
+  imm       value  description
+  ========= =====  ====================
+  LOAD_ACQ  0x11   atomic load-acquire
+  STORE_REL 0x22   atomic store-release
+  ========= =====  ====================
+
+``{ATOMIC, <size>, STX}`` with 'imm' = LOAD_ACQ means::
+
+  dst = load_acquire((unsigned size *)(src + offset))
+
+``{ATOMIC, <size>, STX}`` with 'imm' = STORE_REL means::
+
+  store_release((unsigned size *)(dst + offset), src)
+
+Where '<size>' is one of: ``B``, ``H``, ``W``, or ``DW``, and 'unsigned size'
+is one of: u8, u16, u32, or u64.
+
+8-bit, 16-bit and 32-bit atomic load-acquire and store-release instructions
+are part of the "atomic32v2" conformance group.
+
+64-bit atomic load-acquire and store-release instructions are part of the
+"atomic64v2" conformance group.
+
 64-bit immediate instructions
 -----------------------------
 
-- 
2.48.1.502.g6dc24dfdaf-goog



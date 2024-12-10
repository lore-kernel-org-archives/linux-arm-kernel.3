Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24C3EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 00:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yyn8QNTH7wqJjjw/QfPOjCU2TP5ahhHLckRiqYVzfDY=; b=SqTwoozpbIRYzXZAr+XKoSixO/
	s4v96fWwSrbUTDxuRuPzOiIL1MVVzad+ZZVcPLIOPWhbVwsP1z1aqZUZMLTamH2ARPWo+NTNpSsX5
	xLQiIhTshq24yHqmjxbRoD811V5MhjE11ElxOJC2Wv72jazm29TaxbgNlXNoiv4xVhtlXRzD+GGCV
	SxuqjH0fA6WaIMAM1g8kU+epSldEm47nOt0OQ8ouP9XocYKFoMe4O+ZJy/2sTU5TQz4TRtja+re1N
	MqgEh+9DCNSacbyXwLcbzobHeAVtTiKmlJmyRTdfPw50FaOnVOyQLAjJB7NaTB3xKT7jkuO9EN2Le
	p2c5HZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKo3i-00000009hOS-0FGY;
	Tue, 10 Dec 2024 00:25:02 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKny4-00000009gMB-1Pah;
	Tue, 10 Dec 2024 00:19:13 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-725c86bbae7so2736854b3a.3;
        Mon, 09 Dec 2024 16:19:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733789951; x=1734394751; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yyn8QNTH7wqJjjw/QfPOjCU2TP5ahhHLckRiqYVzfDY=;
        b=Qp0tRJ4IZo51By8SqU2b9WBB139NspRC+T+iF2qVacOnoBIQbxW2RoLFtr4iLlzz0/
         w4AFAr3K+9ZWoHTYan7Z8wsDmms7GNqt5klZbTtJqqllkakzXQM5w0l/noDKstWv0EV1
         zHV0UR8BGaBh8UsNJn12v8JtO0D8PP9Ed/YZcayFB2odi+g2b/9c/yTbim3PJJOyCeSz
         g/LqErF/eHzNzkn+fYjV1xskfrUZC9kxUuwrurDZf7lkhun+ix4nvhTw4tjUUfcUzPu4
         WfkciGHzjN0uigpUc6JMYPELnfJGi/FPbKgTQfEGxG86k+gHaUQer+tqECpbsYsp6qNr
         nO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733789951; x=1734394751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yyn8QNTH7wqJjjw/QfPOjCU2TP5ahhHLckRiqYVzfDY=;
        b=TOr4n+ty+s8BC1JGqBkcmQnaY8DqnivVTpo2QTmVf64fubhRO7zjvMp/QsKo2Ecd5X
         vMwb13nDW994HYXfQyVncbOUw7gOB/Rz5QMmMvwSf/VvUvlkRmv31bt8lw5mVTAgGj4w
         r2ew22F+z5qzS6OJJ+Q61KUHqnba517yG0ImvPPUFsPn64Pm9gqW3VHQ5gfHR3v7U/dd
         oD59yRRYzGQwbdDPlY2r7MZKescuDOtNiztt3tSlo6f5poBsfRC2cdjbBg+huBz0uvZi
         EjrBKUL6+2W/FOfHtgJKinvLjkRHaPXFh2EJIof5GkGbn1eojykjyKHIhiqyoiK88YqK
         ZILQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSJ/ZW5PjdWnxj3U9rfIil3NlDOsU4kPQfPq7aFHBQFBbdlJaJFrKdPX7XoxHBtHa7bt3KYq3WgL7Ybjs=@lists.infradead.org, AJvYcCWj4uWcyxsu5tESHXBSdnyTUafPeLHJIDdLPDAyKQuFuLkZXNM5DbRr3/v8+4ntYpZrYhoYV9J5oUkdY9alFMUb@lists.infradead.org
X-Gm-Message-State: AOJu0YzjoqYYUJFt8EeGsEfzl422EOG+FSX2f2jG1k6FYop6i/4z3ry6
	nJ5cuQS39In+X5rydQqIZlaCXBYtbXE2IV0gzuvYrY34Vg22WElQ
X-Gm-Gg: ASbGnct7XAWRAwu4GvUFqBPnKBoHXpbSS09893qbZERjoHwICfCN5fGKD7UErG+zBhk
	RDgcEBxs4ahG5fiNFBdO67FnCehRnUOtUyT+YxXea9F5nFnwHi/g6JBnlgz/AN1PtwSh/mJ81x0
	tLFwsXyIg41OIzoEIWkF8shGhvpBSsPbx605fe/8n0ifTDX9sokzsZWDPSmHyWWVJC7Vn7C03ec
	kq1CIc8rAynZ+acq3FXw/1JZW/eyrgfDQdwjX/voG4wgJFo0phCUp0UQ3r/OoxfLBGiMRR1WIfs
	WvtFLQOMlsmt9PQIGLwC9vfbQ/H6
X-Google-Smtp-Source: AGHT+IEdFPEBCVbMfoJezZOTVqCwhcFvYK07D7Yq/Bkx4KQFK9L3M9HsZHOxAW7D+XoXG/7mHHQLwg==
X-Received: by 2002:a05:6a00:928b:b0:725:9f02:489a with SMTP id d2e1a72fcca58-7273cb72984mr3417048b3a.17.1733789950934;
        Mon, 09 Dec 2024 16:19:10 -0800 (PST)
Received: from mew.. (p4007189-ipxg22601hodogaya.kanagawa.ocn.ne.jp. [180.53.81.189])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-725f1fba027sm2005005b3a.3.2024.12.09.16.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2024 16:19:10 -0800 (PST)
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
To: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Cc: x86@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	peterz@infradead.org,
	hpa@zytor.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	tangyouling@loongson.cn,
	hejinyang@loongson.cn,
	yangtiezhu@loongson.cn,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Subject: [PATCH v1 0/5] rust: Add bug/warn abstractions
Date: Tue, 10 Dec 2024 09:17:56 +0900
Message-ID: <20241210001802.228725-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_161912_376788_8A2FD5D2 
X-CRM114-Status: GOOD (  15.03  )
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

This patchset adds warn_on and warn_on_once macros with the bug/warn
abstraction.

Wrapping C's BUG/WARN macros does not work the same way on
architectures that support Rust (x86, RISC-V, ARM64, LoongArch). Rust
code needs to directly execute the same assembly code used on the C
side. To avoid duplicating the assembly code, this approach mirrors
what the static branch code does: it dynamically generates the
assembly code for Rust using the C preprocessor.

The 1st to 4th patches export the BUG/WARN assembly code for Rust on
each architecture, with no functional changes on the C side. The
changes for x86 and RISC-V are straightforward. However, the ARM64 and
LoongArch assembly code are designed differently; they are used by
both C inline assembly and assembly code. As a result, sharing this
code with Rust is complicated.

The last patch adds the bug abstraction. Seems that an unused named
argument in Rust inline assembly can't be allowed so we need multiple
#[cfg].

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch.

The assembly code can be used for both BUG and WARN, but currently
only supports warn_on and warn_on_once. I will work on the remaining
functionality after this abstraction is merged.


FUJITA Tomonori (5):
  x86/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  riscv/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing with
    Rust
  loongarch/bug: Add ARCH_WARN_ASM macro for BUG/WARN asm code sharing
    with Rust
  rust: Add warn_on and warn_on_once

 arch/arm64/include/asm/asm-bug.h              |  31 ++++-
 arch/loongarch/include/asm/bug.h              |  31 ++++-
 arch/riscv/include/asm/bug.h                  |  35 +++--
 arch/x86/include/asm/bug.h                    |  51 ++++---
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 131 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 +
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 +
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 255 insertions(+), 49 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 7503345ac5f5e82fd9a36d6e6b447c016376403a
-- 
2.43.0



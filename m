Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B458E77183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 06:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dhrkLGBzNTzhgVYpUwql4ynkgLbrZYqWR43r4b7YXZc=; b=4QOkz+H4gsY0Oar9sYaTk7lM5c
	oorwwxIT05FBU4vgIa/qKJWpKf/ofVpBXHdVKS20zeo9/JfmIhm6TxoIbXe7TO0F37cpEDljoqsqs
	BXuDxaIgKYLFjMxU79JeCbnkPj/15aAnCpAX1gWp9GQios2mp2azPtQgu1XLokJTM0SRFDNNJsTgq
	NVEDwwkHrbvnXfKGXJQQvquM+8OYlz63UPImvyw59aDls1PAHmqzscvnFpscs25FnxcPczV/R5KF5
	yMaFjbGGwf8nSmbMTraJRJNoJzRa1Ww139A7jg6yIFauJz1q3LQonWssdkGhJzTpEhZy0KmpznQl+
	tSk9I7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnRl-0000000FhPT-0jGk;
	Wed, 18 Dec 2024 06:22:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNnQd-0000000Fh8J-45CX;
	Wed, 18 Dec 2024 06:21:05 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-728f337a921so6352087b3a.3;
        Tue, 17 Dec 2024 22:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734502863; x=1735107663; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dhrkLGBzNTzhgVYpUwql4ynkgLbrZYqWR43r4b7YXZc=;
        b=APG5c10VbFXn0LDvTBDWAxuSFxDi3q4Oyf3wna5TuBBUu7zYrQoe+n6XyNaHnvoqxS
         METZiUqK+NUZRd6pm9WcRX4e8oGn6NVQQlkIh5ggOEE3TPxW6zJ7bWFDc+whXlPMUquC
         xlHtKr/qLOW+jMvM3/a6n8nra1T0TxgACEH48oEtik43DpTRbikV++yQ19KgeVOfpzkp
         sykS/olk+ngo2r6FaDNRGABJSh+zRwirI+S8Ds+2wDS2jJLULjr0wZtqKvUlbc2rQklP
         DlwHs/l9Nryqxqh2CPufVSlnBefuu+P5S2PVO+fUzs/SMORW6wcieRdQhXlMznBqN/F5
         ybgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734502863; x=1735107663;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhrkLGBzNTzhgVYpUwql4ynkgLbrZYqWR43r4b7YXZc=;
        b=Bw2lyOujO3ZQM8+TsBIcLp71NcBv7EQxcDiHm2L2Oi2gROm/7zmUonRwc0TmlcbbdP
         ATSt3VOw8m9aX8FhPgebt8ao+C5zCyLyGXbUvKrBTLQMLknb2j1m+VrJI0MPuT2E+Mrc
         tgAlCpj3f5w0r6ltD9MhDnOwywSzf6JQP4Iiq6k7HIgKPE+dkDC0RW4OiUmDDgavvxUM
         v8MuFfwB61Re3gPzBzBPTt40cwpbyz7sJKjXRheJ6ELPnNUx53m4Fa4XSEtxrbA5j64T
         eea0jfhiyo2Ehp8MshOLH79jUHKic3BtEcWglNmPm7pJixrKpkUQ0u4GjloGefyfHtlA
         PPZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKAmivPLggZdvML6MTlCKyBhoTts6IBvkV1bXIp/8p9aiGv4/3R3Pp9tDRG77CfkYKnEc5Fo+62HBSfyAZip2W@lists.infradead.org, AJvYcCUomF+aMCozpfl0K7mdJEoB+ToMQg4JMSYax4mwrampd1pD4zsIZTJh3PPBLqHe53CdHUxPoyBDWMu3rE4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1wUwuuv0A2pkH44IHxODtJY3iIQyKebdV714mBgEYmNM8VYiv
	4dvnflaLfL6K6lNMJj+8s8KIvxga/HaGrvbFhx3krwdEgOSgcRxt
X-Gm-Gg: ASbGncuGvQOQVpbnKCo+nyKE+XrtXZ/5qDYXrKN7CSet4+oG4YQ7LsggWaKzg5xOUXX
	abswlXaPIXYgGIzjNKB+HjYhW+C5ZdXxnxPCs12tGPL35X1XmQrjblhvQVXn1leBQ7wtCTLUSU/
	AibQChEg1ry37RtnWiGLnTlfce3t5/qVedOLWMOzCutCMJwhNmFCOJjkbKcDsWGB2vFJn2CTgSD
	XIwJdG4DAGc2PMO1aqChj3x4+94QLM6wQsjtSfSWfl8FptnIFKN7KOqr32mLdo+nIrNX0UJDVR1
	pQpNEIvGnBbLpxwszg==
X-Google-Smtp-Source: AGHT+IHh5VfbLc1bzyNkDoQn4Y2IW8LvraCE8/Q1ywB1dqB6a07VG5XuZlyp8536+909iPa3S+qOgg==
X-Received: by 2002:a05:6a21:6f87:b0:1e0:b5ae:8fc1 with SMTP id adf61e73a8af0-1e5b47f9601mr3440480637.13.1734502862615;
        Tue, 17 Dec 2024 22:21:02 -0800 (PST)
Received: from snail23.. (p7659208-ipoefx.ipoe.ocn.ne.jp. [221.188.16.207])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad5bc5sm7987806b3a.69.2024.12.17.22.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 22:21:02 -0800 (PST)
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
Subject: [PATCH v2 0/5] rust: Add bug/warn abstractions
Date: Wed, 18 Dec 2024 15:20:04 +0900
Message-ID: <20241218062009.2402650-1-fujita.tomonori@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_222104_010058_4A361179 
X-CRM114-Status: GOOD (  15.53  )
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

The last patch adds the bug abstraction with warn_on and warn_on_once
implementations.

This has been tested on x86, ARM64, and RISC-V (QEMU), with only a
compile test performed for LoongArch.

The assembly code can be used for both BUG and WARN, but currently
only supports warn_on and warn_on_once. I will work on the remaining
functionality after this abstraction is merged.

v2:
- remove target_arch cfg by using asm comment
- clean up the changes to loongarch asm
v1: https://lore.kernel.org/linux-arm-kernel/20241210001802.228725-1-fujita.tomonori@gmail.com/


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

 arch/arm64/include/asm/asm-bug.h              |  31 +++++-
 arch/loongarch/include/asm/bug.h              |  31 +++++-
 arch/riscv/include/asm/bug.h                  |  35 +++---
 arch/x86/include/asm/bug.h                    |  51 +++++----
 rust/Makefile                                 |   8 ++
 rust/kernel/.gitignore                        |   2 +
 rust/kernel/bug.rs                            | 100 ++++++++++++++++++
 rust/kernel/generated_arch_reachable_asm.rs.S |   7 ++
 rust/kernel/generated_arch_warn_asm.rs.S      |   7 ++
 rust/kernel/lib.rs                            |   1 +
 10 files changed, 224 insertions(+), 49 deletions(-)
 create mode 100644 rust/kernel/bug.rs
 create mode 100644 rust/kernel/generated_arch_reachable_asm.rs.S
 create mode 100644 rust/kernel/generated_arch_warn_asm.rs.S


base-commit: 517743c4e303252cd8c1a1fb1bed28e7d94d4678
-- 
2.43.0



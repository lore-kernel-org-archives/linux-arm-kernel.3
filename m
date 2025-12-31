Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56D85EE642E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 12:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UQVrUosci++sweVUg2oDGu1yrtQHcLYzZp5maq37Uks=; b=AfhI3oHUJy3iZzxV82j10W08Hv
	55AdkuAJFT6W8SyUQMPFBRDf45upoagKQaEYSOil/v8KMnBRvoDcAIAs4PwK//jHWTryDXCz38VjP
	87MnxS7kuWtIC94dhYuDpaRZPSpQvISXVzJMdR0vJtNh989hjCjpA5rMJ1Fhsmcx0d7NouC1bfN4u
	KhRRJ1zwibWbvil3evi38/MaZbYgbpefTeB8YJjoz1W7ls4OMEUalFpgvJisxTDn+hqqE33FVMwvI
	LtGSdIHzDKholjvUHd9UqHqQVbEmHgh1Jd38C/NFfkzu0b3jw5hzqqffyw5GPiuSmuHZGi5vdT2di
	oESD7tiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDu-00000005xzH-0JL0;
	Wed, 31 Dec 2025 12:22:42 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vavDr-00000005xyD-1kGv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 12:22:40 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-431054c09e3so6804849f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 31 Dec 2025 04:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767183757; x=1767788557; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UQVrUosci++sweVUg2oDGu1yrtQHcLYzZp5maq37Uks=;
        b=E0n2hemb4u0S+pQGWMZkJuNgIry8e+y6Wodx9sR0xt+vuxubMzdEdi//X49r5erUkE
         RYHg/+OagjEIiSbMT1rjLDL6/fVQkwOm0gNdYIELH57kl0M6tAkd1WRS/EISMLZcjtgC
         mESAF2kPg5hrZOACzolsb4mLZnqt7/DGPRnmtmGDQ+DVSoR3LaFh4rQtIcoT+0Ywo79p
         vza430Olwux0NrV7oQ9iIssRkJk4hz7Ox1PioyRiFY+IdZcNBH9uxHXN4HpwSIvAGvGi
         cNQsUkIY9XWfqZyKboxIj2Kw7ZssSwrASa057MU4NJ4iihYstDQMkbTRijSnlJKAkeJ5
         TD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767183757; x=1767788557;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UQVrUosci++sweVUg2oDGu1yrtQHcLYzZp5maq37Uks=;
        b=P95RA+e/+C0Bl0AzHGD/Ioj4R8+gvukLZFCXOUHqxi4eGBFVlAAFRV4PdByQvkIkuL
         jdgkcFtSJOQRlMDwdCiTv38s+va59gUM5SrqLjsaSDiDU4yNBoTvsDIt+5k8rD/B00gh
         jMU8HhottUOjFw3+50dlGY3Apbl4tqBdoi4rLwePlIV2oQrb5d8dBMEdO0p+i9px5FdA
         9s60K5UEJKwawnWp3+9Ahsd1uphmHXErlfR7OX9M2xq3mjhuCXGUAK3iM3D4A4gQq88X
         Y3rQMJa81KJJAjzs1zkSf00N5w8m+5RXXtsbvn1GJmZ4R8AipgkUJRU6k0TP8aMqyn+r
         ElQg==
X-Forwarded-Encrypted: i=1; AJvYcCXp19kMfmbaHn24fpz/31FLVpfsuZNjnsyGzilQ5xpiyATLku89quSEbv/7JRsQS1zHCdMuiQgDBxG87CZS0o8u@lists.infradead.org
X-Gm-Message-State: AOJu0YyBtF0ikX68uN5rynfY3Kv2Je3rbn97vHjLVHx22RpugcN490Xc
	4g2FqrcT5NlzC2qOwndfwD3Q/FJAPg0yojG/UyL413TUNyMKV1PAPh7xtmgLjIkC3aq8WS3ufjr
	MU5IqbP2F6xm7AYLpJg==
X-Google-Smtp-Source: AGHT+IFGevL4RjPve8xtRgOLaqwe1KRUGekHJd+lI5/ywPU8CYGMrfT3q1rcsX5yZhQNUWvXrJwartEV+7L+OGI=
X-Received: from wro20.prod.google.com ([2002:a05:6000:41d4:b0:430:c782:27f3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:609:b0:431:342:ad41 with SMTP id ffacd0b85a97d-4324e6fa1a7mr47643775f8f.61.1767183756634;
 Wed, 31 Dec 2025 04:22:36 -0800 (PST)
Date: Wed, 31 Dec 2025 12:22:24 +0000
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIAVVWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDI2MD3aLy/LzkVF3DVIsUo9RUg6TkNEsloOKCotS0zAqwQdGxtbUAFXT clFgAAAA=
X-Change-Id: 20251230-rwonce-1e8d2ee0bcf9
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1686; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=DgkCDNZwcq8gq47PvBSES/tVZ/480I2oLP6adymLeb4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpVRWGF5bAiUtejlxi6BOwMVDKnGMRxV0brpJMZ
 4N76blF6DqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaVUVhgAKCRAEWL7uWMY5
 Rq6PEACahBDOuqhWNRdS7KKKt5/h9IB0Ae0tEIYhZCaGdynMz9p5ZroHJGY3427iEbwD1Xf1sd3
 krvr6Thhw3P3Xe/n9H8Zv/X9u1c5luZ3Xf4eCUMRH4chFWH9JwzEvBz7jXADexXhLdQpug7K2mb
 wcyPQj1ud8v+7Di8+fu4PtJLHimoywoMf6ZFhCGnAxPySJWvVweGV7hUrW8LxDszplrE2HZ8tD9
 RPAbn1uqanDGL40aeAib7oCMvMY0u3Qwpf7JB+7YpeulCoPXBOoLck6sczMbHd7yzidbpiP+RnS
 37uYnZopCUQmCd47pDgFlfMgZD27v6IYXqZ8zIryrOl3Sod72AtB9UoCLEW11pV2LQ1AlYpBJL3
 rU7Ya3QisvjzdEQ6OOLsnzwTh0b25pX6GjpAOkQxz6xI3oeH9Epbm5H/pviAgf3R1wjJrOvIOxj
 0GmRhz2x4wq8lHjcbjoljHHRYDgHFXMm0qSjahun8/DqZkoYlfBxzuxT46T2n5gdefNJ8ejq+Dv
 Sm69I+Q/czN4RKBQIQDvayvG7VhtPNqrAKgOupQ9wDPuDSMURnwra3sFVkMWxmkk6wr8VB86lin
 9RO+10zQWOISHeiZ3OkAmQ5U361UXsQx2g45A72GjESpW/kXTosPejSa7Qj5uclYBBvCaLrP0Uj f+YHVZGzb5+fZ7Q==
X-Mailer: b4 0.14.2
Message-ID: <20251231-rwonce-v1-0-702a10b85278@google.com>
Subject: [PATCH 0/5] Add READ_ONCE and WRITE_ONCE to Rust
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Magnus Lindholm <linmag7@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_042239_497226_B88E1F96 
X-CRM114-Status: GOOD (  11.91  )
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

There are currently a few places in the kernel where we use volatile
reads when we really should be using `READ_ONCE`. To make it possible to
replace these with proper `READ_ONCE` calls, introduce a Rust version of
`READ_ONCE`.

A new config option CONFIG_ARCH_USE_CUSTOM_READ_ONCE is introduced so
that Rust is able to use conditional compilation to implement READ_ONCE
in terms of either a volatile read, or by calling into a C helper
function, depending on the architecture.

This series is intended to be merged through ATOMIC INFRASTRUCTURE.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
Alice Ryhl (5):
      arch: add CONFIG_ARCH_USE_CUSTOM_READ_ONCE for arm64/alpha
      rust: sync: add READ_ONCE and WRITE_ONCE
      rust: sync: support using bool with READ_ONCE
      rust: hrtimer: use READ_ONCE instead of read_volatile
      rust: fs: use READ_ONCE instead of read_volatile

 MAINTAINERS                     |   2 +
 arch/Kconfig                    |  11 +++
 arch/alpha/Kconfig              |   1 +
 arch/alpha/include/asm/rwonce.h |   4 +-
 arch/arm64/Kconfig              |   1 +
 arch/arm64/include/asm/rwonce.h |   4 +-
 rust/helpers/helpers.c          |   1 +
 rust/helpers/rwonce.c           |  34 +++++++
 rust/kernel/fs/file.rs          |   8 +-
 rust/kernel/sync.rs             |   2 +
 rust/kernel/sync/rwonce.rs      | 207 ++++++++++++++++++++++++++++++++++++++++
 rust/kernel/time/hrtimer.rs     |   8 +-
 12 files changed, 268 insertions(+), 15 deletions(-)
---
base-commit: f8f9c1f4d0c7a64600e2ca312dec824a0bc2f1da
change-id: 20251230-rwonce-1e8d2ee0bcf9

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>



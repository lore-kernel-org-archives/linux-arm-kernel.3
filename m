Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80381E63C9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 00:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SLUD9kqtzHxYW5dCA5OGESTleTXqSLmFV9783ZIDQu0=; b=x+rKDdpNuDnsc+g3/ttcMqGCyp
	6tmChh8DrMmWzKr3VC1vTQYQQS+DT2v9cO3M0oaL71EVoA6rLwoF4thGR5QIG1Ipw7FrMEb3BaUDk
	3NTCR8zqsjwfnN3znqR4baGOtNgfo3tz6ZQjPUfrtXr/2bmTTTUlgDNlVF67Kbgy4pPmbTg1+e/nX
	iQyo7rasBiYV6dlADyM3KujtQo0BkX6CuMx9sial/FBojxCbqiLQWOnxhb1fhFS3WwHJy92hN901S
	wKrJCmrddnAf6SrRXylm/9rnUfugC/Dr4H/wyrWyq+zl2Vrtz7Jz3Hl0uQpoVELtIdXoiH9YhxE6C
	xzDNdo9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAXS-0000000BiMg-0q0Q;
	Mon, 26 Jan 2026 00:33:06 +0000
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkAXQ-0000000BiMK-0Szk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 00:33:05 +0000
Received: by mail-ej1-x64a.google.com with SMTP id a640c23a62f3a-b870f354682so312427366b.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 16:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769387581; x=1769992381; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SLUD9kqtzHxYW5dCA5OGESTleTXqSLmFV9783ZIDQu0=;
        b=3ajYnIDgNooYkyoPSy/kGOtFo2W6noC7p/yEptQ0PeBMlQYLRqH3MO4iduyDGhsmd+
         R0pHDekpM2ZIeqx9lUI4B87Oeqa8uSwSA5wNWBWwoC+MgVXF1ZdFaeMAqNJkbzLBZTgO
         E971iv2eARHJdSHVaXn76wdV7MZ6Sna5fdaE0DBY4OvgSiFDLNgQ2rHnK+6a+U8xQNys
         LEeBGuZZXilMIfHZhQC814jJrr9eCUa4VZXDhaToNR8+kLenqGmc1vETMj47uNCr1BE5
         kHtyg9xL0lwgm1U+lhR8osKgpwsbT65Ro4JtclgPzDeQRYaHLzL+wLYfkGca8e9EqKtq
         3flA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769387581; x=1769992381;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLUD9kqtzHxYW5dCA5OGESTleTXqSLmFV9783ZIDQu0=;
        b=msFD8aiEgiM2c8OS+N6nHIiygNYJxic0/r7WvV3ewxtRaoD+il1/X9akDZtlrCWoUz
         ibolK63w1eDSzwD205WmlOBVelGWpfAg2/+bYlB2BE9CE+R09GoQ2hImu82L5wYUqedz
         TDkXfSPo56saGdPxcr6iLiHDuA6JoAEyQ3yp3qMR4xLsy8vda9Be/vfTUwigKcNMqi+1
         nZMDcv67NY9Du5nQlFeojrhUKzCtJI++dO4eLOITtIdMDQdjL+dzKoDXvNRFIh3gR7IZ
         J1P5wn8gG8UgOMY24sgQPxWmPZfcbut4P5WEOZJ3nBRT7Eh1Mx9dJsqOJa0YsA/2Nv7H
         6swQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLmYOZWqPoI0opKdTkwtfGgLYpNNmnZ3ELSpvYAq7scaJrvT52JoSFfaz43bRcW30FIDd0JoT66C5TUGTthadh@lists.infradead.org
X-Gm-Message-State: AOJu0YwecK6IhDsAcj+wMxUGT2nnpRtkuw7JJc1mrO0YB9qscTRqZ7pz
	3EY5xx/ncHy0/BfHKRvoi5gomc6PrlNDF7lG+UPQASVC7t747j58p3bYEEefiym8djjmTfGu+YD
	jjg==
X-Received: from edon6.prod.google.com ([2002:aa7:d046:0:b0:658:38d0:b315])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:97d5:b0:b73:8639:cd96
 with SMTP id a640c23a62f3a-b8d20dec1d3mr172240066b.24.1769387580903; Sun, 25
 Jan 2026 16:33:00 -0800 (PST)
Date: Mon, 26 Jan 2026 01:25:09 +0100
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260126002936.2676435-1-elver@google.com>
Subject: [PATCH 0/3] arm64: Fixes for __READ_ONCE() with CONFIG_LTO=y
From: Marco Elver <elver@google.com>
To: elver@google.com, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
Cc: Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_163304_203468_51E6C6A2 
X-CRM114-Status: GOOD (  12.98  )
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

While investigating a Clang Context Analysis [1] false positive [2], I started
to dig deeper into arm64's __READ_ONCE() implementation with LTO. That rabbit
hole led me to find one critical bug with the current implementation (patch 1),
and subtle improvements that then enabled me to fix the original false positive.

Patch 1 fixes a bug where READ_ONCE() on types larger than 8 bytes (non-atomic
fallback) incorrectly qualified the pointer rather than the pointee as volatile.
This resulted in a lack of "once" semantics for large struct loads.

Patch 2 refactors the macro to use TYPEOF_UNQUAL and eliminates the ternary
conditional.

Building on the refactor, patch 3 fixes the context analysis false positive, by
helping its alias analysis "see through" the __READ_ONCE despite the inline asm.

## Note on Alternative for Patch 3

An alternative considered for the Context Analysis fix was introducing a helper
function to redirect the pointer alias; specifically passing a pointer to
const-pointer does not invalidate an alias either (casting away the const is a
deliberate escape hatch, albeit somewhat unusual looking). This approach was
slightly more verbose, so the simpler approach was chosen for now. It is
preserved here for future reference in case we need it for something else:

	static __always_inline void __set_pointer_opaque(void *const *dst, const void *val)
	{
	    *(void **)dst = (void *)val;
	}

	...
	__set_pointer_opaque((void *const *)&__ret, &__u.__val);
	...

[1] https://docs.kernel.org/next/dev-tools/context-analysis.html
[2] https://lore.kernel.org/all/202601221040.TeM0ihff-lkp@intel.com/

Marco Elver (3):
  arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y
  arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
  arm64, compiler-context-analysis: Permit alias analysis through
    __READ_ONCE() with CONFIG_LTO=y

 arch/arm64/include/asm/rwonce.h | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

-- 
2.52.0.457.g6b5491de43-goog


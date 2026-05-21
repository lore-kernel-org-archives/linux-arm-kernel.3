Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B00CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 12:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n0j1uWN8BZS95igofi0P3e6YMyYCAFIv8OXyIcUdmd8=; b=GpVdqlqRDA522St+OzJ5aOpbVl
	JJCh+dswUThGmOJsXb6rkB4AL+iSmgQjJBQsv77r0TifUDT0UF3eU2QdbZSvkOwDaVIKOFJMK/71O
	bdonJtVdsKYI4KfsZKBSo4i5TV7wQchjuKa3sjMdrSZeDN+AnNOHJgrhC1CEGrCJg2MqCfm6+BG5K
	jW0jC64B7eVk67MgYnbp/OcU4wLxkSVYyzys8bgUV++kYYvdajqk+iItH7o8kffQs0G3OBwoG+7Fl
	v/MdyJlQb2fNpXR9PYcEylnekUEiC8khbuZ7j60D5BLghf6ztuYfGaoGdxuZ6ylsP4eqXLlZhTW/o
	A9djauFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Wz-00000007jPM-04pB;
	Thu, 21 May 2026 12:29:41 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ2Ww-00000007jOQ-3mj9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 12:29:40 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-48eb0da933fso43651705e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 05:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779366576; x=1779971376; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=n0j1uWN8BZS95igofi0P3e6YMyYCAFIv8OXyIcUdmd8=;
        b=azngQfnyvKNgtA+l6yYNnuLrHl/JGW5+gNfvC6tOR+reZ8LHifX8MN62q0w28Er+xx
         /zlYJsUO9wPGXdjZ/8/vFwSOGe+ae3GiDVmESt7E7cnECiujnZiwBtlzJtrwoDlTuf1u
         kc0R6z8iohUJVSzU599Fs+ZOpxvBRE7IztSEdgk/O76ym24roo9FKVusOfST79+UCm/h
         JOndX3ddsiLr5QRNukoDElw69HZi4E7pH4sHoxhogZ/Q6zjIa7MQ5OHdfVp5xwBZ4wZk
         1Wi6I6vs6PxcPdHL0hbarD2523wg13Y/ux1X86tt6S3y7AplknYjEO99d1mv1RXMA8A8
         pHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779366576; x=1779971376;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n0j1uWN8BZS95igofi0P3e6YMyYCAFIv8OXyIcUdmd8=;
        b=Dz3MeeFd6IyO8BY30vMsWwiCLsLkz8pd8SCPr5Y1HyDvNDQMk4Hq2hM2Xc8TpploRr
         kSlWt44KDhcTLTigcyvMesa8HcGwRBilyC/4NmVpkBORQNF0z05IY5sV4gK9nnT4nQjt
         WyAiPBigAiGGYHi6PIO3OUD6rPANVW+WjxR7QP0X2oHGg3BG0E6xnLKj/s8KuVT5o5du
         6jzZv0vuYx1DvepNdi2lt0quOzcYCo7JWiD7MhtOoWSolL/J0BevvpMNGOVP4is6JGz9
         Jdos/uon35srcB4WnaNQGGB0mwO6kjNgOxJxZs8O8yCYgxreNpP258M55iB2gh3m3Jv6
         cV6w==
X-Gm-Message-State: AOJu0YzbS4vcGM9kChJDs7pn7D/GqcV7A8fkOG+3ytKDfEnpa7LYgR8v
	syjAqexxuGz2zMPPrTMyphDvOjITYy4pzg7tMndzwEFzhc0PeAFV206rIMb+TVY5Gi5Wu511E5k
	0qg==
X-Received: from wmbjd23.prod.google.com ([2002:a05:600c:68d7:b0:48a:6a1b:6c3b])
 (user=elver job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8591:b0:48e:706b:53e3
 with SMTP id 5b1f17b1804b1-49036048603mr28389255e9.1.1779366576213; Thu, 21
 May 2026 05:29:36 -0700 (PDT)
Date: Thu, 21 May 2026 14:29:16 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521122918.144163-2-elver@google.com>
Subject: [PATCH] arm: Implement _THIS_IP_ using inline asm
From: Marco Elver <elver@google.com>
To: elver@google.com, Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_052938_949027_34B7FDE2 
X-CRM114-Status: GOOD (  10.13  )
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

Both GCC [1] and Clang [2] consider the generic version of _THIS_IP_ to
be broken:

        #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })

In particular, the address of a label is only expected to be used with a
computed goto.

While the generic version more or less works today, it is known to be
brittle and may break with current and future optimizations. For
example, Clang -O2 always returns 1 when this function is inlined:

        static inline unsigned long get_ip(void)
        { return ({ __label__ __here; __here: (unsigned long)&&__here; }); }

Fix it by overriding _THIS_IP_ in <asm/linkage.h> (which is included by
<linux/instruction_pointer.h>) using an architecture-specific inline asm
version. Additionally, avoiding taking the address of a label prevents
compilers from emitting spurious indirect branch targets (e.g. ENDBR or
BTI) under control-flow integrity schemes.

Link: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=120071 [1]
Link: https://github.com/llvm/llvm-project/issues/138272 [2]
Signed-off-by: Marco Elver <elver@google.com>
---
 arch/arm/include/asm/linkage.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/linkage.h b/arch/arm/include/asm/linkage.h
index c4670694ada7..416e6a242dc4 100644
--- a/arch/arm/include/asm/linkage.h
+++ b/arch/arm/include/asm/linkage.h
@@ -9,4 +9,6 @@
   .type name, %function; \
   END(name)
 
+#define _THIS_IP_ ({ unsigned long __ip; asm volatile("1: adr %0, 1b" : "=r" (__ip)); __ip; })
+
 #endif
-- 
2.54.0.746.g67dd491aae-goog



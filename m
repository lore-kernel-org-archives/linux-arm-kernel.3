Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A06C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IrgNAnLwRn2xWXBcU7LK5V8pYA0AtM/f/iL+F5YZ9sg=; b=AbCkpZlkQwFQsSoxyqlrLRW44f
	jTxYmPaP/UfyyTbrBjISn3USzHWKK+2oqt1BGrywgjVGoseQCEo1yJfyn+iqkC3TTqTN3YMF0XfRM
	ecZwsixTIms26Bsa+udiyjfQkv5CQVKiR1MbzC48H02X9XpU1R8jPD1yiV+ViJftWqmTU9vhxGsgV
	tuxDHPzOVkqqNKWoN8WZkyuii+Wg5sYu+QMEdK8EZJfZARUjjme/NH4rw+sadf4jhQmMKIl8WZ3o6
	wWeg8OItqZLGS6DtHGT0Puw8sBrE0TddMs0kj6SCh70zjfDYqPEBIcKgdbKRrPrfJWWrBkWZ4L7CZ
	+2g8oDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoYI-000000030GJ-1Otq;
	Mon, 07 Jul 2025 16:18:46 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoHK-00000002x8O-3Ixf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:01:15 +0000
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7d09f11657cso257732785a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:01:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904074; x=1752508874;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IrgNAnLwRn2xWXBcU7LK5V8pYA0AtM/f/iL+F5YZ9sg=;
        b=Ws4M5uuAiAa46IVeyRMnhbViqLW9P+Pmdov90b2YHQXL2hlqcfq0fiItnygkK+2hd9
         CNsm6wsLjJoHKDCPpHVS21Bc0jLGqPMBnGkRNYwaRHyusWxCggqEJ3s3MwKEXZcN+at3
         TgshKJckXP8RjROwG0FHuU5otZycx0NwEHzbknTsC3E7KzW8EppDea4ip6gyN4vZe5u2
         KeYWz4XVnQvpbQRwOPFYPRlKGfjB/tu5Jj2MKDpYLyDoialepyiKNwrRsDUYlcD7sqTX
         fY5fW5PI5CnzSUGo4SaKwnjE3kifT81ZmGcdT5aVHksWvHd50/g6+vJQm8yeUFwkwA9E
         xFjQ==
X-Gm-Message-State: AOJu0YyHpBpP7w5dujti8Z98SOibB4DeQxlTPJROwCji2IFQj2856BF3
	PU4Xg+o/KRg5Mbk94DtMgXGYwxK+6h0bJZHu46LaLLJ1lcZQxZgj8mIs
X-Gm-Gg: ASbGnctDAq9sPh/d4xiGR+sgYtWmgZOt9zjNMyVKEgixLLJtyaLOMorJEixhcqDQ8YV
	+6JVuXf4HaFMg8e9CtOPgteI8v65uvGcwO07P6sb8UFyyd1gOu7c7sUbeYMo+rIpL7t5raI9wGM
	bymLjr1/QXZ7kUtOCvej1OPci79ncwROqxiPk4an+kAbVxoX3hxlZ1O7ihfhaAaXHaIH+2WpAUL
	nK6nYfObE7wZlXcn0rcqjJo+yH4F+2F7IkQgXukt2r7zqyZvINiyKVWC/S+Q+gihJ0mFNc+zhqg
	zrbsfRLm7YXWDcmnKJFoVf/QCzC6Dg71mWrJ/WwshU7uAaODingR
X-Google-Smtp-Source: AGHT+IE9e54ymrDdjPY1o/eSOv9JmjvznkAlYOITwvMx+iy/OGxMy6N1ow+Ppm+kB1r46MxejqOcEA==
X-Received: by 2002:ad4:5cc2:0:b0:6fa:bbb7:602c with SMTP id 6a1803df08f44-702d16fd78emr129400066d6.29.1751904073666;
        Mon, 07 Jul 2025 09:01:13 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:5::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d51057sm60731306d6.62.2025.07.07.09.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:01:13 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 07 Jul 2025 09:01:05 -0700
Subject: [PATCH 5/8] arm64: remove CONFIG_VMAP_STACK conditionals from
 traps overflow stack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-arm64_vmap-v1-5-8de98ca0f91c@debian.org>
References: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
In-Reply-To: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 leo.yan@arm.com, kernel-team@meta.com, mark.rutland@arm.com
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=leitao@debian.org;
 h=from:subject:message-id; bh=5drWDc5oXd3AK883ttFmO7WXoIPb6sPR/jXGD0pgwBE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoa+9Dd1c+Eu7Q8qZ9IT1yzMt5+I30MUlacVUtQ
 d62wO7WMwyJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGvvQwAKCRA1o5Of/Hh3
 bQ+jD/4qLHnbTKM2jtnVQQ/KCVDophWXDMw07kz6aF8q32Ugjy/o1fTsiKrH8qTii0iPPAyt7uJ
 MzIXUWZ9Lo+Q799/9XXQrOzJStfroaB9HhHt0cHVA0Lt5Zu63BTbDnT07VKR/JKjrpvKlwBdOfu
 Q50vPIIuGA5NNsvh1VD7/YGNufcreGbl3wboRuY4FA53GK/xJZ4S6yh+YZPP3gW1m1i80kXs3BK
 wfAlihysAA7hKRPmUaSF8NHpJg2XpwVNMs+9T/wLjqd2TPtBnnI39M3rvFRYuz0DXeTON7zHhn4
 76rSbx+uxB2onp1khrvS67w5sS8MUdmpaSmfYI115nMfgTvQ6sl1wWxtVewtPp1p5JBqAC+OsDJ
 t64nsXdYZbw3+QN4e4BQKe1H3/1780Mik0GFcH8tsdnF6FPFuRKRMcu/E2W8C+AKjDD5W1Zh9XB
 8MRfcfM/UuvyikCohm0qQ2GS73+gv1jqKMpA+74bvzc0puANYS2GK4WAL7QgOYNsyVWr4OfVY0a
 51FuJmAYuNxq9e3J5iEC6EVTr/AHX17Ecg2MCo+uUMYhmzqgBOcDS/dMXmYPW7BwbgwO6q5Nacn
 hr8xzIZ+/1kYdwHII1BW2mAeIVZnwnUCo4hKHmX58OQ11z5WWE5VtqrjLFzU8t9VXjllHKMDec7
 X5romVmBxbAi4MA==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090114_829438_20693DE8 
X-CRM114-Status: UNSURE (   9.68  )
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

With VMAP_STACK now always enabled on arm64, remove the
CONFIG_VMAP_STACK checks from overflow stack definitions and related
code in arch/arm64/kernel/traps.c. The overflow_stack and
panic_bad_stack() logic are now unconditionally included, simplifying
the source and matching the mandatory stack model.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
 arch/arm64/kernel/traps.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 9bfa5c944379..6acbcffca650 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -894,8 +894,6 @@ void bad_el0_sync(struct pt_regs *regs, int reason, unsigned long esr)
 			      "Bad EL0 synchronous exception");
 }
 
-#ifdef CONFIG_VMAP_STACK
-
 DEFINE_PER_CPU(unsigned long [OVERFLOW_STACK_SIZE/sizeof(long)], overflow_stack)
 	__aligned(16);
 
@@ -927,7 +925,6 @@ void __noreturn panic_bad_stack(struct pt_regs *regs, unsigned long esr, unsigne
 	nmi_panic(NULL, "kernel stack overflow");
 	cpu_park_loop();
 }
-#endif
 
 void __noreturn arm64_serror_panic(struct pt_regs *regs, unsigned long esr)
 {

-- 
2.47.1



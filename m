Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DA3C47BDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uNNcUB7lgyIwf3R57Px+ObUOuuqMHsgwS/LskqhZlIo=; b=ji2LG9IeDxaQN0mDW8rWD4Lgui
	T5OtAa6KSzC5OmXsMJgXQmyZjBiveIeFFwuIY9CJBB3L6UQ7XyxIBHy8Q4p2hVxwODfTzNWQUllxD
	YFWFfKb+Wq3bHB1TItuZyi2lOscp4WRRtHgaIqLsEZcPdL9Fa4EcR817sQVrKbw9KG1rq9GjlguLj
	1h0HabUVVVaJz2BJFgAqhLxlC4SPnlDd9RIFvTEjRN2jLEyE2kQFF3kPyc2KGvlJc4+gLWB82hljI
	elvS0LlSxowpEaqizjuhwFZrg6G9jeaDyIYa44PlusuADAqScSZBv4ISrP9i+MGkwSkSySMkWrnip
	6XWn9vIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd47P-0000000ClrZ-3rqv;
	Tue, 06 Jan 2026 10:16:51 +0000
Received: from mail-ot1-f68.google.com ([209.85.210.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd47N-0000000ClrE-03CV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:16:50 +0000
Received: by mail-ot1-f68.google.com with SMTP id 46e09a7af769-7c76d855ddbso265122a34.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 02:16:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767694608; x=1768299408;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uNNcUB7lgyIwf3R57Px+ObUOuuqMHsgwS/LskqhZlIo=;
        b=ff+/I/ah4F7H2mV9Z8dsnnFk1KHXkk2fCcfKUxmvvXBTJA7w07zPgco9rm2Q7LqELd
         ZquT82uZqbX9Lpi5eg1MVWv/OO1kOUazHQmTp8woVb5ZNeQShHmwNc9ZWUtDgzfwzyhl
         Zp+jrD24DCQRjRP1kaIHiNlFC1BKXfiQxsA1XVqiRd1upKmCEZ9GQDyEn6CQ9Ps4MXy3
         QUwS16Tvho0pG3NR9xgA4U2pNDkoXg2goTJuF+CqdkhYzIPVKCwuap8CeTr/YtFiPjXu
         nKwZSA5OnD2/fFrPeuQXDximXC54X7k4CeAWqlT4vQPa3ObYdfDYHZdmU22vA+QVzqVV
         25vA==
X-Gm-Message-State: AOJu0YxcoWXWD/6GTEiTs9ThH/bKTEiS0/euRSfMKNTph+xbxAFm7PGa
	gF3W5CzY1dUmlz8SRrS1b7PhYpJG+KCi1v0TNub5qt+NFwLzdEOP+gnj
X-Gm-Gg: AY/fxX4qpVq2MU48r407PdhytR8vFoSuvPrgRNXXOw1NF2ue7XbfGNIXHWY7Wc0uMJP
	HMaCBsbydWmq2OfZTqeNnLMWBUOmeAZBF2yw02v3InyJtPgsussWiMTuXTyWHX296PQR239Ikxf
	UPe32Glt/MihiWuDD6yUmGhxOPY81GO1qACKQUxzwShwYgDD2FOnuccBZHmbyMEsbhQxiOHFAJJ
	npsjp0mWzqTVgs2LtMdnhxL2U1XHxIDpEiY6C01Ec+W/vFdf7caWO4PK6czfTHIoeN7MzVUbnvd
	YliRrrnUiw/EYbM8/w0X6qL4YYKkZcDNVVfryhB6A/wq7YrhL4QjSDhZ4RcYhqOBpSkzt8VpsL+
	UYEUMKiA683a3IRMQsJN69OSncKHnTPArSTkVaXVZ+W7dkNSG8d9dSY21mDSDKHL6bSMpPcDd1P
	arI3/2cLcnLehhiA==
X-Google-Smtp-Source: AGHT+IHpik8hWyPXo+y5CoXoGZNP7a5BRxyJotM7yoa4j2oD5Z6LvXpzD97F1AyaKuGImA/76c6nUQ==
X-Received: by 2002:a05:6830:314e:b0:7c7:b28:227c with SMTP id 46e09a7af769-7ce4663ba8dmr1405642a34.4.1767694607636;
        Tue, 06 Jan 2026 02:16:47 -0800 (PST)
Received: from localhost ([2a03:2880:10ff:59::])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce47832780sm1149346a34.12.2026.01.06.02.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 02:16:47 -0800 (PST)
From: Breno Leitao <leitao@debian.org>
Date: Tue, 06 Jan 2026 02:16:35 -0800
Subject: [PATCH v2] arm64: Disable branch profiling for all arm64 code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-annotated-v2-1-fb7600ebd47f@debian.org>
X-B4-Tracking: v=1; b=H4sIAAPhXGkC/yXMwQqFIBAF0F8Z7jqhlAj8lWhhOtW0sFCLB9G/P
 6rl2ZwLmZNwhqULiU/JskVY0hXBLy7OrCTAEnSt20abRrkYt+IKB9W1gc1kjA/diIqwJ57k917
 98Dkf48q+PAHu+w/4tl4nbQAAAA==
X-Change-ID: 20251231-annotated-75de3f33cd7b
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Laura Abbott <labbott@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@meta.com, 
 puranjay@kernel.org, stable@vger.kernel.org, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=1627; i=leitao@debian.org;
 h=from:subject:message-id; bh=R0brKy11lWk9rG1Hszq3cr5excGuzAybyASfH2xcz9g=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBpXOEOE3XW9TBI5+gt0t62QrPhBcRn/qigH4pDn
 4gtfXOidi6JAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaVzhDgAKCRA1o5Of/Hh3
 bUDDD/9rIz9FUmTyftcZ2SiYxTdKVB+boYTZiBL/TZMurMwpO/5crdYad5bRGL5PnmNRnAeXZjf
 4bJExaoMmBMiuWAyvQvis+Kgdu+xYgXT0mYC9e+ofnCp05M+Yv5GS5f5vATolKFIjKTnu/Xl6cG
 DPkerSX2xPxChN78jd88Nf/ckcBu3vOkDA4cAtYIRrpN/m3yM6qoukboZHnxNKVOoLV1FQHepcu
 K5wMSl7Tl/DNZwbD/rvR1VKmO39xdu64RTE9kWrmZ9CQRY6OdsEsNhFeCrTTRO8ELUkVvKf1bVY
 ImufebVYkB7WsBLoG8pQ9Nvnw1QknNczA8BbYtGKz0EboKTFJauoROuLtb3QLUaycljbGbK8y/W
 tJUssGjN9WA24lPTVxmN3vmb9gv0/OqmVsrHwt0wF7UvJbUKTr0SqCSZrbXchU8kVyiGUw7K0Y4
 oLR1uNKGJYHlOxO0fAJZH3QEW3JLiJ3kuN/pbIw5aKZi+WLDgZ37YiRQS66jDV26TfYKdP40ply
 ERVMouE96PDsf9EjIYu4xRE1dyOhITnjRaPhNThdNXkgm54dBgEkQSx7LGlbeV7Us9pbVThNkV3
 /9sSDLDoLxAVm6uTFXtDXG/F6GHzX11cLaNJCkS9QIXeLC4NLaACGOLvz2bDIEohjUxyUGPc0jr
 Pp5K+kknoJuxX8Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_021649_061954_F1791A04 
X-CRM114-Status: GOOD (  14.57  )
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

The arm64 kernel doesn't boot with annotated branches
(PROFILE_ANNOTATED_BRANCHES) enabled and CONFIG_DEBUG_VIRTUAL together.

Bisecting it, I found that disabling branch profiling in arch/arm64/mm
solved the problem. Narrowing down a bit further, I found that
physaddr.c is the file that needs to have branch profiling disabled to
get the machine to boot.

I suspect that it might invoke some ftrace helper very early in the boot
process and ftrace is still not enabled(!?).

Rather than playing whack-a-mole with individual files, disable branch
profiling for the entire arch/arm64 tree, similar to what x86 already
does in arch/x86/Kbuild.

Cc: stable@vger.kernel.org
Fixes: ec6d06efb0bac ("arm64: Add support for CONFIG_DEBUG_VIRTUAL")
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Expand the scope to arch/arm64 instead of just physaddr.c
- Link to v1: https://lore.kernel.org/all/20251231-annotated-v1-1-9db1c0d03062@debian.org/
---
 arch/arm64/Kbuild | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/Kbuild b/arch/arm64/Kbuild
index 5bfbf7d79c99..d876bc0e5421 100644
--- a/arch/arm64/Kbuild
+++ b/arch/arm64/Kbuild
@@ -1,4 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+# Branch profiling isn't noinstr-safe
+subdir-ccflags-$(CONFIG_TRACE_BRANCH_PROFILING) += -DDISABLE_BRANCH_PROFILING
+
 obj-y			+= kernel/ mm/ net/
 obj-$(CONFIG_KVM)	+= kvm/
 obj-$(CONFIG_XEN)	+= xen/

---
base-commit: c8ebd433459bcbf068682b09544e830acd7ed222
change-id: 20251231-annotated-75de3f33cd7b

Best regards,
--  
Breno Leitao <leitao@debian.org>



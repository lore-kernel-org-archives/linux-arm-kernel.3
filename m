Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 725F7C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 16:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G7hosWBn35t4Uk2u8zfbBq4Gr7N31VV3afuofXRc6qA=; b=uEqRWLZam8T72w
	plcMnmOg8j0R3NWqB8V950agjeiPVrlZIrRu2r0HBMNEHWkvSVfG4dqqW7KMvdfNOJ3lKkScTK0VW
	bm/awdHCaz7bzEIkMEx/9YeWTnC6SK7EulcNoARhPUvrDBdG5pyVoblzxA5J/aWuMECenesCxxPpb
	eEjdUScGZ2UWxW7CFkZacPq9kuVj+gxSooEtlTPFNCs1PZXrFHcGTEnoLrL51KwDS8dUgQkI0jS09
	/3BU8vke5QWx+Ib3FCsc/K7+MXTN5hdqCUXkMBuLmutTBiYyryP2Glkbujc9jX4Pmgvteii/ZnasD
	rzh+13yvYC93B4PG4WiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoab-000000030bt-05F1;
	Mon, 07 Jul 2025 16:21:09 +0000
Received: from mail-qk1-f172.google.com ([209.85.222.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYoHL-00000002x8i-2Mq6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 16:01:16 +0000
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7d3dd14a7edso535929085a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 09:01:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751904074; x=1752508874;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G7hosWBn35t4Uk2u8zfbBq4Gr7N31VV3afuofXRc6qA=;
        b=UpS/xNC+sTimxAxYGhfiD3n2khiz9mR0mverp5s5E0wJBck+tee3Zk5zVGfJ1jgG5q
         etjWSnHDlK3p2JBYPstBLg0H9HWl/8NowZm4t8+w82rr7z0PcMXvhneUacEpnlEkYyim
         4NuXAAgefTr6+srs0LjeEvjLqt9t85W60G2pYGFhI64uZ2l6qqAFxuXyuip2AjIGAFu8
         KsYFK/wN3tvRedUsO+7/UYRSyKNAaEw1FaR7tOE9R8ef9eEshxrK+1SYKhRG/Stt7aWX
         VVX2f2qu33ksRIqMOn0GyR6NN6PjAHlRKJMY2UHe4d3qyh9prh3FjlA2K1K0tIuq/qvN
         iGEg==
X-Gm-Message-State: AOJu0Yz3CSo4iQ5IsPushkKnabtA53Hu2iYcXxuvV82pww/heA1iIsU1
	3z1UVNBHiWYf1JKKtQemaSZX/B6nOCjD2TC9mu1Xx2XTLyKi2TmolT3c6FHXwvq8O3U=
X-Gm-Gg: ASbGncvFrY6YOzEYuoOmVRl8grNiXV8WgDb/a52m67rm2X6DQ69CjUJTjRgMMjDmGGt
	dJA20QwFmdAqTXeM7dzFKhL2c2oek/4VulbJM2LLd8SRG/lqj4wNV6ZBJ3/W/JJeL6SRIdOJVZn
	fZ4cB7iddYECHOfxl0iJOxRLGZrN75J4TSj0vSkOIF6TEzenm3GU2LM3F3InKX50zb6sYgW1tOD
	OxuAeDOzhnrRATrSjuUZqJ/+PzITr7zX7qsYmOYXMHRpmLQPm5G+9eiOdf8u3Tb6C54JHI80dAl
	MBs2/TUda59Xt4YY8XWsOWsF4aPd0uZUl/MO6VLMKK8Cyq/Mrn8tdUU9QbGJhaM=
X-Google-Smtp-Source: AGHT+IE3CmPzV/fhqf7jC7u04UVH+5AgGt2F4Bb0kNv0jDOEuc/afA1koRlX0ZFh4r2J4ny2rBHCog==
X-Received: by 2002:a05:6214:301a:b0:6fb:5ac8:2b79 with SMTP id 6a1803df08f44-702c6d3338amr218150046d6.19.1751904068420;
        Mon, 07 Jul 2025 09:01:08 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:8::])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4cc765csm61512726d6.24.2025.07.07.09.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 09:01:07 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/8] arm64: set VMAP_STACK by default
Date: Mon, 07 Jul 2025 09:01:00 -0700
Message-Id: <20250707-arm64_vmap-v1-0-8de98ca0f91c@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADzva2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDcwNz3cSiXDOT+LLcxALdtERzg6RE42TL5LQkJaCGgqLUtMwKsGHRsbW
 1AI9YSptcAAAA
X-Change-ID: 20250707-arm64_vmap-fa70ba3c9cfb
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-efi@vger.kernel.org, Breno Leitao <leitao@debian.org>, 
 leo.yan@arm.com, kernel-team@meta.com, mark.rutland@arm.com
X-Mailer: b4 0.15-dev-42535
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=leitao@debian.org;
 h=from:subject:message-id; bh=Hp7HNGXV/MgXNjT6THHxJ7gOgkHDeA1sjiSWQuHH9+4=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBoa+9CFdUxQt/eVM2JgHj/tHQ/mYlGIUbwuXKE/
 IfZ7+aKK1aJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaGvvQgAKCRA1o5Of/Hh3
 beqZEACwK1m/IBiWsuZm/yCweFTl5CvloY8Omq7+onAp9NAmo3f3fq3dWNvd1fInjjIp6USlV4T
 3i9TffnzmSZLQgAiZsBYTnKA4N1tcOIFO5eCTXUYYFEewG2LnIaFs3IzDqIkd5wI4CQ/s4FDJmV
 tKcgvDAzFmqTEiBdK+re5/18pEZNyNkmXjel83K5NRnK5slBYOKGtJ61CkzUiZTye6oza/vQhYl
 hZzW6B56W26AxpieyGwQBGD+4YsevmxZeXCzPkwijUg3gD0ikrgPILnwzaQ4mpEFq5zQzFZnmSQ
 0JhAvJvCvQW07yFK9k9s7HbCNtGN3ZBehVZzZMAk7mu8E7f6B6/nG6c4w65BnOtKGH/41fLkNXG
 j2mV5p5B/rcE5v6iaPQ8lvdVz0DBVrMQnW7ko9NOCF9rqcCYfjyDngxaTluIEmIGiYCgHuTxQuB
 rHvQK/UOgaYRNF9it5XieDiejviBBTAjfku0UdbYAzxcjMXNiVN3at1OQabS/k8g6wpYnXSvPdP
 ArpsCqIZaz3tzbWrKOwcXHu7UQD5ud3f/1oISW3vkMdBYhPecgGmAytUr0rkbdz/EJrAUoad0wg
 hBkd8j2PMfbfNsFE5dULVs0QOsanR7JIumvN4BnXV8Qhjx9BT6nAv0oSC+z00JaCWPnFvdTPJPC
 K2FdLBzpLZuS4Qg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_090115_606166_2806AD3D 
X-CRM114-Status: UNSURE (   9.62  )
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

Hi all,

This patchset select VMAP_STACK on arm64 by default, and cleans up the
code by removing all associated CONFIG_VMAP_STACK conditionals.

This is a suggestion from Will Deacon from another discussion[1].

With VMAP_STACK now always enabled on arm64, the code can be
significantly simplified, reducing complexity and potential for
misconfiguration.

Overview of Changes

    * Remove all #ifdef CONFIG_VMAP_STACK and related runtime checks
      throughout the architecture codebase.
    * Replace runtime checks with build-time assertions where
      appropriate.

Link: https://lore.kernel.org/all/aGfYL8eXjTA9puQr@willie-the-truck/ [1]

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (8):
      arm64: Enable VMAP_STACK support
      arm64: efi: Remove CONFIG_VMAP_STACK check
      arm64: Remove CONFIG_VMAP_STACK conditionals from THREAD_SHIFT and THREAD_ALIGN
      arm64: remove CONFIG_VMAP_STACK conditionals from irq stack setup
      arm64: remove CONFIG_VMAP_STACK conditionals from traps overflow stack
      arm64: remove CONFIG_VMAP_STACK checks from stacktrace overflow logic
      arm64: remove CONFIG_VMAP_STACK checks from SDEI stack handling
      arm64: remove CONFIG_VMAP_STACK checks from entry code

 arch/arm64/Kconfig                  |  1 +
 arch/arm64/include/asm/memory.h     |  6 +-----
 arch/arm64/include/asm/stacktrace.h |  6 +-----
 arch/arm64/kernel/efi.c             |  5 -----
 arch/arm64/kernel/entry-common.c    |  2 --
 arch/arm64/kernel/entry.S           |  6 ------
 arch/arm64/kernel/irq.c             | 13 -------------
 arch/arm64/kernel/sdei.c            |  8 ++------
 arch/arm64/kernel/stacktrace.c      |  4 +---
 arch/arm64/kernel/traps.c           |  3 ---
 10 files changed, 6 insertions(+), 48 deletions(-)
---
base-commit: 9dd1757493416310a5e71146a08bc228869f8dae
change-id: 20250707-arm64_vmap-fa70ba3c9cfb

Best regards,
-- 
Breno Leitao <leitao@debian.org>



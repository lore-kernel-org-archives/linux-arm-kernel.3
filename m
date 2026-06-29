Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E78EEC43638
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=; b=u4Zeb8eNY8W1ms0V2C9QQV4imO
	2BOg9aA+aMw+/M5umRlkhAsHWnJ+2YYPNxLcoaxXgn/I5Sl/0N0W9VHkoLRbzeHFpazi2eb0b8WWI
	OLuJuqM4y3BhPetS6fL/9aw8SX1eorBCQQRULtXNiepPyIsPRUHq9SIenpzMARqWDFghB38/a2Xa4
	bKY+TwuaVOo/Jpn+198/amhzwpusar9I+HHePuKeLW28H8AlTX3s/9+o64yVHF4nWdezdaNS+NYjz
	aMEf0+RVYEL1OTZvv2MIv6osu7ZDmJ0lNuHw5Rv4sfnRYACq3i/k3OimCJl3iipQ430fbe36WPDgz
	Cy4vOIeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzz-0000000FEH4-49K1;
	Mon, 29 Jun 2026 16:38:19 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weEzx-0000000FEFM-1p5M
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 16:38:18 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2953480b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Jun 2026 09:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782751097; x=1783355897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=;
        b=Zv+x0bZ8Dy5IGFocIIPjqfB7lsFrr7JxRJ66rMO8Xolq+Br6zYMpoYa3Ci4lMwMkQT
         lcG+7d1WYZYaWJ/zRqNKfiBeOgFPZ/Txx9edQW3L8NtFcwTksXvQmDt0mNa+1u1XeKX4
         kjX9zGkIH0t3U/kzDSUnEw1PXJP6sn79/SQDgXdgqyURjjZdrAiABNlne1hYFp5XKZUE
         01n/bU6Ia+EMYG9eQL8Hyip91NVjS2JJixONuuZdh/o6vhnZOXk0mhcbMEJBcyxERrKG
         sop8sYe8AxqUisYDrgMYOhqE/5qfdlgxEj32Th7q4JC3kuQMvpLyeu9aRZ+YzLFdIVQX
         I+pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782751097; x=1783355897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RxV5fEpsJGHhE3L8vdcj3Th/5v0heJ6mrreI6jrRPh0=;
        b=BmueDj8bOKzknT3Jn0/MPPYgWBH1DRT8Nmf1SNtBQX2AD31BF5vk5ly3CbE+3NvzOY
         QrkLVMdtDrF6/wVrf6AhYKBPnRsWMdUKec0X0zn05/PVGDTZ5oCxxrrbvzhjCjOib+mZ
         /O5npBqa3H8S+s2QuRsFNu2QRRghzJN/WqbXe6+pu1COo5RhkHTONHo6mOFLJrFhx7iv
         /xr5pyXelzx3MN9TkSEEYyRmVpG6RXWLZ0b5Pg7FTqhXxS/F6OyyoNTnrqcAKAjzImQp
         jH5wO5xRx6uFYlhjtQNzWHkFU2JdUEibsSC6Q2iI/KaR9V+dQhiuay6JyoVtBfkpLkIE
         4NFg==
X-Forwarded-Encrypted: i=1; AHgh+Rrl7oVMkJ1zPxnPk7CUsHkZSsZBGh8VmgBg8k1xuUnP9tFH6CXdBs0eaoTqu6RCzm4JTcOoyXgTdgZiN+eZ7Rf+@lists.infradead.org
X-Gm-Message-State: AOJu0Yxvrg5QMQoSQHue1wzLpRWYph35F9MxEsmiLTS+25a6jo6Mhnf6
	xYNyHORv4Qxfmt/Jz8FE0rbh+lbRJYx1YTlVenYYx2WMfBMcwJP4XSfC
X-Gm-Gg: AfdE7cksXctq5h+mbkmyc8209bZhTasM6J6is7AWUepY+yeZ5RxQxOemCCVd6iAXLgt
	1kUvSD4qg5XX5E1ArIrxEqUraJJCecAlzprnwDFx7FfjVl0Bv5ItciSxRIKIqAYb+c9fArlLOH9
	jkb3o29KE2yAYfSq17vIXX63+uv6O412FmnXZJYWdJ83wbv0STbX05HTPe76ZokSPVW8eVa7XBb
	pJvPXxDsLvCeZoR9L3N/yChgZsDyyCFJxyMiP9teHpuzs7Ne6SrXS3Li/eske5pgUHbi9TfkIHi
	qUYFV7Lgsrh/n3dCiccNFL4KSm02/KquYQ9ktMgrS934R6rp20ywFg9OzxVFz+ZfwWBRfs2Zc4r
	PwR9vb/VIbuWjuyOqY9AFF6cM/cT/eu6X3WdJkzRVN9Q2vbljDhn0D4ndEKDv2A5giXnW/Axfjs
	bG7aFa1KM=
X-Received: by 2002:a05:6a00:2d8c:b0:847:8504:9946 with SMTP id d2e1a72fcca58-8479f152246mr185629b3a.25.1782751096795;
        Mon, 29 Jun 2026 09:38:16 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02d41c0sm18474b3a.33.2026.06.29.09.38.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 09:38:16 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Subject: [PATCH v2 5/8] ARM: remove unreachable invalid range check in kasan_init()
Date: Tue, 30 Jun 2026 01:37:33 +0900
Message-ID: <20260629163736.1606688-6-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629163736.1606688-1-ekffu200098@gmail.com>
References: <20260629163736.1606688-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_093817_473614_06E5DA88 
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

kasan_init() maps each memblock region with for_each_mem_range(), which
guarantees pa_start < pa_end. Then it skips any region with
pa_start >= arm_lowmem_limit, so pa_start < arm_lowmem_limit is guaranteed
as well.

When pa_end <= arm_lowmem_limit, pa_start < pa_end means start < end, so
the start >= end check is unreachable.

When pa_end > arm_lowmem_limit, end is clamped to __va(arm_lowmem_limit),
and pa_start < arm_lowmem_limit means start < end, so the check is
unreachable as well.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/arm/mm/kasan_init.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm/mm/kasan_init.c b/arch/arm/mm/kasan_init.c
index c6625e808bf8..1f7c74c5df9e 100644
--- a/arch/arm/mm/kasan_init.c
+++ b/arch/arm/mm/kasan_init.c
@@ -262,12 +262,6 @@ void __init kasan_init(void)
 				&pa_start, &pa_end, &arm_lowmem_limit);
 			end = __va(arm_lowmem_limit);
 		}
-		if (start >= end) {
-			pr_info("Skipping invalid memory block %pa-%pa (virtual %p-%p)\n",
-				&pa_start, &pa_end, start, end);
-			continue;
-		}
-
 		create_mapping(start, end);
 	}
 
-- 
2.43.0



Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3893606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 15:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z7ADqHiU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CMpRKCHp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1seIWp3ctG+7IR0lg6vkqmMZtzQMv2ZC559JhpGCBKo=; b=z7ADqHiUwkLeirJ6UZv5dyp2s/
	uU7b4OB7P0PFYuQrS7y2E/3YFC2GrgUWgkFQbI3rNErZO03dxjzzzbr6UZdZ8w0p70UhnMFrOMgzG
	EUge1qivvmP4800xzezW41NQJmqq2UN8qWszLK6sMufXAkjKvkX1YfCC26zU7a4xNxISoix0L9J10
	FThW+h91Y1YCAsZZUwmy9jyggYF/MZgaWdK6I+nnS7E5HaXoqhSJuLoz8D+uGJ3BTyo/y7nWf0OeF
	OOIoONc/r6Dzkf/lLdvStW4uxkSYyysHu7VZF8NmUp4Y2nkNyi1g67jwJRKNaLvoXsxIueix/bDC3
	9TYynpMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBf5-0000000A3Ai-0Go2;
	Tue, 20 Oct 2026 15:21:59 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBex-0000000A3A3-3OXe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:21:58 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1430eec0070so133624c88.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 08:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509710; x=1793114510; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1seIWp3ctG+7IR0lg6vkqmMZtzQMv2ZC559JhpGCBKo=;
        b=CMpRKCHpRM++BAPLb16m9JMqabeNsK3dk3AmSIY8yB9zkM/e0EheCaeasyPpYz1p3M
         zWEXP9fj3aevCjHfTtNBv/W1ePuFUx6J21rSk7WVZZPQzY2ElirPm5spNy6ke3cJKtC6
         9P59tdGFL6kIVLKqyr/CeAdQbdJEOJkEMU8R2yxksFZgS5CZfNi+66iebvu5T8OuUnmS
         Ttsw88vfzzWzyt1Yaq/scosQl1PfeVaSVMPsf/kL5dwtSfGR19D6UFhL7w47vObZ0Eii
         6bHYpDIZ6viNCqwEMBdkKph06tl9/WX0+HO8GTCUPgoqHJ0JTP7sARgQqTu0MwrEXbJs
         kCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509710; x=1793114510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1seIWp3ctG+7IR0lg6vkqmMZtzQMv2ZC559JhpGCBKo=;
        b=mjxVHNyBcunmYaEskCkGqNSWM6W0jirOd1iagh5VrVU14+Qfb6IPCzU1lGy5XsERK+
         EsY2aMkj6/yuo1XeFGVAYuo65K2hRMx6+OwR8jf8BDGJENW9n+KxNaWcMMJS9uflu3J1
         Q3zFZRjnCcvbYr6Gs9AvX7tCIpWxgqxNKEoV7xi9juucbDYVoUPtUckBrlRVvdxTEl2U
         HDNzpezov2fY4voU+XbM6FW2i07mVFKEZ76MpPtPz7UngN0j4Wo+ex6Fu5JcJbVCvwR1
         lv1kryIqv/LZKz7jxdlPpJogS1SUKcQF4hJj7HvZd93juWOyzjp/L6nZxE65rsMbtgMe
         9xJA==
X-Forwarded-Encrypted: i=1; AKwUvBzSH6qb61KCWynjIq9iggiGWRk+w1VyYDwUpByJ+vJoBc43VBujCW/TKFAHZKo6NNO0gjYC99CH90qLcsxdXdIK@lists.infradead.org
X-Gm-Message-State: AFq9FYLvichgwwDXqaMabuE6UxvrVSgZfoszi9la6fFFVto0CZg92Enh
	oPEbCyVNYI66wWGz2jgv77aWE30HonvD/IP7Xmbjm7orJasKrCuwBt2F
X-Gm-Gg: AYBFou0t+4xvcsXbB4tVG7wYSYUkJABbi9VfSB2LTBmEfUw2wI0MeiZLQizyEYFeuIE
	huX1EhY0P5/2YibB1UJhCwSKbLioAo6ZRs8zz6hT9TszY6E+nSwDkwEMvNWeliQX8nBMcTXPY8d
	N2KzecpCjbjMGcCg9+ujDYnwNI3VWODEJ/bzyxGUNC+A5GnALjdgvplGhKXE+vRAlOd4g6/gAf8
	rTHXTaSL3roISsnMksmk1vwu87Id7VG9W+SzQkcvGSXhgrLJBsKLsyIuhZvBHsCZzuJv1OFrCJh
	n3RzYpg3X96AxCyvaV0fI/Ha9TP5UJwtJ9NDeCyT9lETCROvPfQST8+ls2gncI4Z4GFkM+MXTaO
	nudAR6OeR7jyFKL3dwRh/Tor56QKReVLiQxkAi16ryHKEg5IqFWb5+v+GoEjJ3yIDm7xmmfgj/F
	o8DLw9yoxbIDfdDOK+/UTvLdsaxoDLlrj4s5IGMEf5JBFx83JpNxNX/l5PyAj6FfmdwQh198sBD
	3S+SMEMejGG25fzL3dqYfx2KLkCYjkh0OHkyJ84aZuk8yDjqGI2sFF7/linpuHjpi4M
X-Received: by 2002:a05:701b:4212:20b0:12d:c389:ae54 with SMTP id a92af1059eb24-18510d6790cmr25881356c88.2.1792509709877;
        Tue, 20 Oct 2026 08:21:49 -0700 (PDT)
Received: from subhobhai943.. ([2409:40e1:7:197e:d6f5:c443:63e9:fc37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm50682637c88.16.2026.10.20.08.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:21:47 -0700 (PDT)
From: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
To: catalin.marinas@arm.com
Cc: will@kernel.org,
	mark.rutland@arm.com,
	patrice.chotard@foss.st.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Subject: [PATCH v1] arm: Kconfig: Fix spelling mistakes in help text
Date: Tue, 20 Oct 2026 20:51:22 +0530
Message-ID: <20261020152123.16589-1-sarkarsubhadip604@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_082151_844704_84416426 
X-CRM114-Status: GOOD (  11.97  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fix two spelling mistakes in Kconfig help text:
 - arch/arm64/Kconfig: 'unexepected' -> 'unexpected'
 - arch/arm/mach-sti/Kconfig: 'targetted' -> 'targeted'

Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
---
 arch/arm/mach-sti/Kconfig | 2 +-
 arch/arm64/Kconfig        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index e58699e13..4dd5d0592 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -32,7 +32,7 @@ config SOC_STIH407
 	select STIH407_RESET
 	help
 	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH407 parts, targetted at set-top-box
+	  Electronics family StiH407 parts, targeted at set-top-box
 	  and other digital audio/video applications using Flattened Device
 	  Trees.
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a69..68f0a94f4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1164,7 +1164,7 @@ config ARM64_ERRATUM_3194386
 	  * ARM Neoverse-V3AE erratum 3312417
 
 	  On affected cores "MSR SSBS, #0" instructions may not affect
-	  subsequent speculative instructions, which may permit unexepected
+	  subsequent speculative instructions, which may permit unexpected
 	  speculative store bypassing.
 
 	  Work around this problem by placing a Speculation Barrier (SB) or
-- 
2.43.0



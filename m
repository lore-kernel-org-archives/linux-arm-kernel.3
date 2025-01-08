Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5491E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgqmOH6a98TkR8jot/1TlGkful6kxHKFlf+7ityvX30=; b=QWo7XzAgzQ5VX2sxloZWmpdAzS
	35/gI/wcy+P0ouQJiLK7LyPrjkm9LViMgZqG2j9c7Y3Peo2i4YWE6EZiAsebhM+DpqIs8oGbVRHCB
	FlLrTC9XJr9H/OqXJwJxuA3QddeWlav8/Q+78yK6uZ5MZC914FoBwNMmdZUAskVInZJ6VvRh20iug
	p7d/YW22GpLs0ISXYfiqH416eGcOLql3CadZK0tbF+tMINt4byX/vT/FLDn2q3fFOMc8W9CKkz3Z8
	nnr2iVUYUzEC2C+W7mOHKoAafAMPJWSl0gAQm7aWkfCWMyJpEDll2fGAKUy+INVOxeIPPiJu5dSX6
	WBuwN8aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVV46-00000008PIH-3lK7;
	Wed, 08 Jan 2025 12:21:38 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUVn-00000008H0f-2jXQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:46:12 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-3862be3bfc9so9329255f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736336769; x=1736941569; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HgqmOH6a98TkR8jot/1TlGkful6kxHKFlf+7ityvX30=;
        b=NjSgtliJAJMK3tsuYJeIWsfW3tgWpypExh1IkwscauZYKJvjterw1Cu7LChxA164pM
         zNeGFw47WNEyW5lY6QnT7YMscKZlP/kfw6OisRkML6I+rXRL0AxlYc+Wv6jqEtW+F3u7
         lIZsYFHL7Cdr1zfxLmS7oPsWXpKdsHqwZ4bUuuzaXtrAYsSHCWG98Ouea+mXX7Fw5KlB
         CSVUL7Ih91aZJ4CM99IJcXwkUC3ekCbOtdP2TAOpCK9+hTTk1wSPCi+cQ9y8h2C/2tsl
         uJb3jKXHRLJVAw8vSf5OrzaOsYvXvIGuifGzmlRKBwuCA3hXVg2X4iBmfCKNMUnqRJ2a
         d9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336769; x=1736941569;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgqmOH6a98TkR8jot/1TlGkful6kxHKFlf+7ityvX30=;
        b=Dl5kfjBnMPYEEGwFou315FOtIr3geYvfjoqFme/FQcgm/8sPjAG+llA074bLliereq
         YLXeYebXok6FNZiRet917r4xY4DFDx7l/p52TnJr8N4DLenpdZ8au2jOdnq3qxOSZRzg
         4CI1+4/SeuXPphKo1WoJTt0ZDRwFy9KFDAqhb4zbsS2vNz0Qt2p92ShHC07+QBluE/5K
         Zt8SjQVgR5xK7MRtlIKw06CDKsCs+3JteaoefttegrDn52P/xCRId8+YaqH7F7YdKkZU
         cZjfAIX51gyn+QW10k0ur2CmXwEoiz7vwCouxANSA1RLEyinONekJLkkX1WntBaBVbHK
         X7Nw==
X-Forwarded-Encrypted: i=1; AJvYcCXH2ygsrkWE25QORE6EtJufWAYWJ2DtzkYaBm0HvoVEGI8o0qdRgdRsSYwNZMlZ5v9nNcy/R6XtDCAJqlwN3Srv@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/rz9/aJuo8vwn9MFVa0mpEHrWbL1q5hGYp7yAY02utLQX6zw7
	uUi1gfrHqpZbVtkVZeLaMyBMr+4ub/wPgtqKAqs9MlobYZgDKriKYoBoXk4igIelmfz2D3qYeLE
	rDvmp9nvrHn8xtlRiXQ==
X-Google-Smtp-Source: AGHT+IHABYhHikttLpH7oYEhUoNKTD1qad9ksTQqIL4Ho8ntiowfjJExOtYJ50MZIueli5bhMxdFJKoQ2+rthSB6
X-Received: from wmbfl19.prod.google.com ([2002:a05:600c:b93:b0:436:16c6:831])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1a89:b0:385:fc8c:24b6 with SMTP id ffacd0b85a97d-38a8730b2femr1999023f8f.27.1736336769590;
 Wed, 08 Jan 2025 03:46:09 -0800 (PST)
Date: Wed,  8 Jan 2025 11:45:28 +0000
In-Reply-To: <20250108114536.627715-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250108114536.627715-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20250108114536.627715-5-vdonnefort@google.com>
Subject: [PATCH v2 04/12] KVM: arm64: Support unaligned fixmap in the nVHE hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_034611_685163_778D2AE0 
X-CRM114-Status: UNSURE (   7.61  )
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

Return the fixmap VA with the page offset, instead of the page base
address.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index 8850b591d775..c5a9d8874eb2 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -240,7 +240,7 @@ void *hyp_fixmap_map(phys_addr_t phys)
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
 
-	return (void *)slot->addr;
+	return (void *)slot->addr + offset_in_page(phys);
 }
 
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
-- 
2.47.1.613.gc27f4b7a9f-goog



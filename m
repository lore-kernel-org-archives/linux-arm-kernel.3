Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7CC3CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NJFUZ3g9aKS+Y4VWSkImzVqj/8GtScBQXmsXxxvJoCg=; b=bYbgsBXGAJG1b73AfycA+E7pBz
	KoSb+9ADYBLJqnHYovbraVSJVfmTcK8vV1T8YA8nA7qTcxBVyGyi7ff75zu6qzFCr3g/GgFULbvKn
	8WqMeovxGNoVrrvolgXQZnWvlpAcarkmktWNPjJ5/sEgizzpA0IDqBZBSrZ3lqPsJ0T38YVadlqjd
	spGeFGtxQy9VKwvlyqIR5aU2ao8M0/+N2jtiNkGb5U0fKR6XM+B1Jz2ZJmuT9rMvyWcE8jLgq9QmO
	D3gs+9Fe6LYU/yGXlZKJav8BTOACmEzmsvE7f1R80ULMYUo+jovJcYewa2UPtHSzce9u3ctUs6zER
	AjP0OGNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGa-000000047Kc-3Ug2;
	Mon, 08 Jun 2026 16:56:01 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWdGY-000000047J0-2Gur
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:55:59 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-bf44ff0961dso343715466b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780937756; x=1781542556; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NJFUZ3g9aKS+Y4VWSkImzVqj/8GtScBQXmsXxxvJoCg=;
        b=eCvu48R1AJuwyQSc3/9arIfIer+IT4307gXBkz7VlzPhjSq6fGlotk+2W9tx5DPbPX
         v08dIzTb56cQUAwWOgXKJfifcCgHKMBFzWvgKOHn6kUKJpnolrADd/Z/b+oQ/BqMIgnL
         FLezukpftSY5Le+p7ZlUCc7iqoXsuhv+jow4G5Ley28IJehbgeeDnGVzfmNKzy8/45FS
         U/3AGHDD/hYk4RpApKmI04ToukI2Mq4M7H35rSF24ZruKDid5mX8Ifbr0b49pdxxXnFN
         ftVx2IO28Br077Ql6euVyS1S4QRdFM912TwQhQ4Y9gJE3Ms+ja/Szvi0po5m1LDke6fH
         rRmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780937756; x=1781542556;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJFUZ3g9aKS+Y4VWSkImzVqj/8GtScBQXmsXxxvJoCg=;
        b=jFI+DGMku28w3NlxnB7FdB+dqeU+V16pawURD4/niphvmI3y/vaZktmghbhru226L7
         QpRt8XMzUkVSHufhzITVl0IAX94tEBz3xhj81aVwTNIx2tOkxNO1gJu2/2vp9AE2ey43
         bQVzNC4hlxFdVKxd4SMndoOMRJENpxAlHgD6sPcsK7AkY+QXQjd1nZOW5pEuC7l5dNUj
         jilmQyYcM6CPYVHuPQcq8hnt4dlb24JfmN6SDqO6Ho/h6Plft2b4BuEXSH2TDmymtc0a
         msfKuZK0Ycf0XoPZXUt4F3XBBiRbq0CAkmS0M+7TRyhNC1uFQjVSFZ7W6pgXoOQi39rQ
         RTzA==
X-Forwarded-Encrypted: i=1; AFNElJ/rG89U3skbwZ5jC+LQGr0ZH8CZFuXOrbaCbHNbh+IcOoUWDNDinwmfj6nEv51tbNzZGJfbEsOz8iFC/J/HrQn0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxb+5zLLYzEzGupxFnJkNkfsfOlj/FhLo3vYM2zcULSeIOX9MhT
	QzE6Nr2//SaXnc15J8WLgiaIgRADdKDtHbmLlz5fARH0SYL3GzAAe8vEzMwJHNn/O+2nBNJxmpu
	8Y4Bztin0ahh/586HXHG93UNOLn/37g==
X-Received: from ejmj9.prod.google.com ([2002:a17:906:4309:b0:beb:4344:f63b])
 (user=sebastianene job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:5a62:b0:bd5:405c:7964 with SMTP id a640c23a62f3a-bf3752e703amr582230166b.48.1780937755139;
 Mon, 08 Jun 2026 09:55:55 -0700 (PDT)
Date: Mon,  8 Jun 2026 16:55:42 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.1064.gd145956f57-goog
Message-ID: <20260608165549.1479409-1-sebastianene@google.com>
Subject: [PATCH v2 0/7] KVM: arm64: Forward FFA_NOTIFICATION* calls to TrustZone
From: Sebastian Ene <sebastianene@google.com>
To: catalin.marinas@arm.com, maz@kernel.org, oupton@kernel.org, 
	will@kernel.org
Cc: joey.gouly@arm.com, korneld@google.com, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	android-kvm@google.com, mrigendra.chaubey@gmail.com, perlarsen@google.com, 
	sebastianene@google.com, suzuki.poulose@arm.com, vdonnefort@google.com, 
	yuzenghui@huawei.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_095558_587400_99343AC2 
X-CRM114-Status: GOOD (  11.42  )
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

Remove the FFA_NOTIFICATION* calls from the blocklist used by the pKVM
FF-A proxy. This restriction was preventing the use of asynchronous
signaling mechanisms defined by the Arm FF-A specification to
communicate with the secure services.
While these calls are markes as optional, there is no reason why the
hypervisor proxy would block them because:

1. Host is the Sole Non-Secure Endpoint: The Host operates as the
   only Non-Secure VM ID (VM ID 0) recognized by the Secure World.
   Because all forwarded notifications are inherently attributed to
   the Host by the SPMC, there is no risk of VM ID spoofing
   originating from the Normal World.

2. No Memory Pointers or Addresses: The FFA_NOTIFICATION_* ABIs
   operate strictly via register-based parameters, passing only
   VM IDs, VCPU IDs, flags, and bitmaps. Because these calls do
   not contain memory addresses, offsets, or pointers, forwarding
   them doesn't pose a risk of memory-based confused deputy attack
   (e.g., tricking the SPMC into overwriting protected memory).

While the pKVM proxy behaves as a relayer, it doesn't currently have its
own FF-A ID(only the host has the ID 0). The behavior of the setup
flow is covered by the spec in the: '10.9 Notification support without
a Hypervisor'.

---
Changes in v2:
- enforce the MBZ/SBZ fields
- split the calls into separate patches
- rebase on 7.1-rc7

Link to v1:
https://lore.kernel.org/all/20260501114447.2389222-2-sebastianene@google.com/

Sebastian Ene (7):
  KVM: arm64: Support FFA_NOTIFICATION_BITMAP_CREATE in host handler
  KVM: arm64: Support FFA_NOTIFICATION_BITMAP_DESTROY in host handler
  KVM: arm64: Support FFA_NOTIFICATION_BIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_UNBIND in host handler
  KVM: arm64: Support FFA_NOTIFICATION_SET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_GET in host handler
  KVM: arm64: Support FFA_NOTIFICATION_INFO_GET in host handler

 arch/arm64/kvm/hyp/nvhe/ffa.c | 190 ++++++++++++++++++++++++++++++++--
 1 file changed, 182 insertions(+), 8 deletions(-)

-- 
2.54.0.1064.gd145956f57-goog



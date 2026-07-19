Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C96DC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 16:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=smZHGSZd+IO/AnN/uVg98gEhWkbFF04beTjXtjoJyL0=; b=s2QXrK/CwDugNyVFnaHj8bsrYr
	BxpzfhBxHgvolxO/A2vG+sFkbemr1ZSZ22veKNfmk1KkdiGI4OYk6Gifgw09KciI2g1j3FlP1zia6
	hJyBGDNFd9eatOUr4GNgZXzT3kb9Ws14tku+qOlOZ5xlDSPlKbB2pA2BWrW7C8DxCpbWgO+l2XyMa
	ewtQH7pQkxRM5UIu/02JQwvhJ7lHD6a+osYG3vXcEycCky9FJzR3x/xmGtAQvReVkIwLYXuCDV3Oa
	UWlL6A9KQ5WqircejpTvWMzpTRxRYWGR5GnencxVTI0kZfNXmjmVzed39TMsqrfeOVa/icNfrkyuI
	90YpcUrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlUSD-00000005Axy-3XtS;
	Sun, 19 Jul 2026 16:33:25 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlUSA-00000005AxB-23TA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 16:33:24 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784478796;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=smZHGSZd+IO/AnN/uVg98gEhWkbFF04beTjXtjoJyL0=;
	b=AO5lYXSZ0R465A+cTpfuESj7WV8mppFUwrTglz4gh1Qx83JeIw5v09WYTF5mBOVj3PqWZc
	UdDbkMSGBBtJw/885isZNMQQxoAGbAlT4TC7xCfHZNYh1dzrJ8uK2fbgzEALpRG3+15e4n
	cm7yk6tX6B1Rsl9IHmaqJLdnT0x1guc=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tabba@google.com
Subject: [PATCH] KVM: arm64: Update Fuad Tabba's email address
Date: Sun, 19 Jul 2026 17:32:57 +0100
Message-Id: <20260719163257.3156529-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_093323_102815_73E63FBB 
X-CRM114-Status: UNSURE (   9.67  )
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

Switch my KVM/arm64 reviewer entry to fuad.tabba@linux.dev, my canonical
address for kernel work, and add a .mailmap entry so the existing
tabba@google.com commits map onto it.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 .mailmap    | 1 +
 MAINTAINERS | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.mailmap b/.mailmap
index 735470e21075b..91003fb861367 100644
--- a/.mailmap
+++ b/.mailmap
@@ -291,6 +291,7 @@ Frank Rowand <frowand.list@gmail.com> <frank.rowand@sony.com>
 Frank Rowand <frowand.list@gmail.com> <frank.rowand@sonymobile.com>
 Frank Rowand <frowand.list@gmail.com> <frowand@mvista.com>
 Frank Zago <fzago@systemfabricworks.com>
+Fuad Tabba <fuad.tabba@linux.dev> <tabba@google.com>
 Gao Xiang <xiang@kernel.org> <gaoxiang25@huawei.com>
 Gao Xiang <xiang@kernel.org> <hsiangkao@aol.com>
 Gao Xiang <xiang@kernel.org> <hsiangkao@linux.alibaba.com>
diff --git a/MAINTAINERS b/MAINTAINERS
index a674e36529f75..5ab6fc1504267 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14192,7 +14192,7 @@ F:	virt/kvm/*
 KERNEL VIRTUAL MACHINE FOR ARM64 (KVM/arm64)
 M:	Marc Zyngier <maz@kernel.org>
 M:	Oliver Upton <oupton@kernel.org>
-R:	Fuad Tabba <tabba@google.com>
+R:	Fuad Tabba <fuad.tabba@linux.dev>
 R:	Joey Gouly <joey.gouly@arm.com>
 R:	Steffen Eiden <seiden@linux.ibm.com>
 R:	Suzuki K Poulose <suzuki.poulose@arm.com>
-- 
2.39.5



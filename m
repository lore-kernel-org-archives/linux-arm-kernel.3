Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070BDC88E73
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeWtAFuHuTRhNxh6eHa/xFC48zwGINetLVZ8ejz+55k=; b=LlntNQ+7+5bD2keNM5oNESOdXX
	bcydOrN/undQtEMqMP21INs3xVWC7lGaNWNaWUf/ILH4KnYLpAfD26MKEYVuBXyNPY4mumRofb5tH
	0uekl0/Nv4LRPUnU5b6/lC7T5fzh/kga9RKz9zPIjBbd6x+tx5pNobuBoic8j5HrNndv0M+Lzg07z
	Zr+WOOXVwVMpzSGxV/HDQee8pcd+FAXJxGlTtD5rLOVK2fwhiEqc6LgePZAPpupWsvIutP3E2onta
	MyiN/QVgEQIYpZ45sntmoFXrEGYk6ezMdZgZq8jMuCGYgGknumnTzxivbfyYnSii8e6JHNV7ESz8+
	LLgFVqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DsS-00000004euz-1NLt;
	Mon, 14 Sep 2026 21:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DsJ-00000004eso-3aeC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:06:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 398A91CC4;
	Mon, 14 Sep 2026 14:05:59 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E673A3F882;
	Mon, 14 Sep 2026 14:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789419962; bh=GPDglMrUvp1/a5hB1mzHog+aNgREgnTzuWpD07EduTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCHpIrmRrJTLFPVTDAmorET/6Uwk8U3gRP3sOr+MtePKQwJbMh1tRCeX/G5AIBHJT
	 6uwGalCbcpQWywvWmcLwONB4g8wf+x4wr75G/bntdgI9ZRrVGW+SBhMUaWhQGOdiY4
	 Ili0T03KVTOujjACPoFGLhHEKNAo8+r3M/VAGg8g=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 1/3] dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
Date: Mon, 14 Sep 2026 23:01:13 +0200
Message-ID: <20260914210115.28151-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260914210115.28151-1-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_140603_938357_8140D6BB 
X-CRM114-Status: UNSURE (   8.30  )
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

Teclast [1] is a Chinese company manufacturing tablets, laptops and mini
PCs, using chipsets from various vendors, covering both the x86 and Arm
world.

Link: https://www.teclast.com [1]
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba20029693734..6da733d465a31 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1722,6 +1722,8 @@ patternProperties:
     description: Thundercomm Technology Co., Ltd.
   "^thwc,.*":
     description: Shenzhen Tong Heng Wei Chuang Technology Co., Ltd.
+  "^teclast,.*":
+    description: Teclast
   "^ti,.*":
     description: Texas Instruments
   "^tianma,.*":
-- 
2.46.4



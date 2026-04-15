Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C4DFA0C40
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 07:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uP/i8T0UprW0/PQuYa++Mg7oA6SYT5JnRuU5zfxTcDg=; b=NPKLcatoGwKkbI9CBYM6WdTEjM
	zNovZLVyhVdFnclMQ1NSi4Rbtk5jHs31Csz1MEL0bejHOSxlI0TB1Haf6DKY00BGw9ioIparY+qQJ
	I5kAsgHOlIOqFkENFlieVDKLuWhcKhfqMIAbzwTQ79xYO3gvQXggiKETWGYt9tfnboe/k7ZC7CauG
	LQRuNguK9FzJvDnzElraeyPerHuIOJo3JNeEJgfj1UC08lPiDDmb+zKs/P+VMMIMWzF2TXKZKTRRM
	V2xY+jAfbB1bxrRrCiHDqfNG4OqwDhP7lFBwoGD8OzLsRsHWaoMzeHfrm/ntXz4jj1ZnMcpbVOtHS
	2aASVvCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCubT-00000000iZb-2G8j;
	Wed, 15 Apr 2026 07:24:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCubO-00000000iXA-374s;
	Wed, 15 Apr 2026 07:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776237835;
	bh=8xvsn+jlVFtEMiQtA9C/Ao3q3yPX51zlgfCHv14LOWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bdmay8HFjz5HNg6PH1QWH0WKOpCgnsegKR+Fo00JO3BRCG0yfuBX5GUxYs6oGOKF6
	 Fz8AP/wkbziKAjB1ngLhMKoz9KlhZXtwrspfc4winkC6JhrQ02oo6eDozUWr13oVKI
	 ULU9jD0EAPpaDB5+F/y8uornUbNa6inl3YsgxNaXOoFvcXFjukLgxmRtIXGn8E1p/t
	 fk9X9oPgk07faQLx9kqeekiY0qEJeTiJ6ziRSNKG3HloZN6VDHIE4Apg5glmmXDl2f
	 0/gCfv7IyxSVOnL16DuN892p9BzOqQMGhNH9qCA7kzlSvYJ5jbOf8BlvNpkj3YpsXX
	 BQfbXCfOCC48Q==
Received: from benjamin-XPS-13-9310.. (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 469BB17E1340;
	Wed, 15 Apr 2026 09:23:55 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v14 1/5] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Wed, 15 Apr 2026 09:23:37 +0200
Message-ID: <20260415072349.44237-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
References: <20260415072349.44237-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_002358_919544_07EDD64D 
X-CRM114-Status: UNSURE (   8.14  )
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

Verisilicon Microelectronics is a company based in Shanghai, China,
developping hardware blocks for SoC.

https://verisilicon.com/

Add their name to the list of vendors.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..ebd9072300a8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1761,6 +1761,8 @@ patternProperties:
     description: Variscite Ltd.
   "^vdl,.*":
     description: Van der Laan b.v.
+  "^verisilicon,.*":
+    description: VeriSilicon Microelectronics
   "^vertexcom,.*":
     description: Vertexcom Technologies, Inc.
   "^via,.*":
-- 
2.43.0



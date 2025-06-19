Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F01C3C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ZvLKaZQvB1bB8+jLwfM/k8OyTgAODk7UZZ59BnbL4I=; b=ROX2jicAxDHhhKwyNv96j5U1Tk
	dpdt6FxHNWF+kYpXXuJzwOZtV+EE5if3OmXhEMOuhmTuWwmifnkjKVtFnnQIXGxSHh0s4eUG0i0fx
	BJL58yx9kIIDquSUwuHMrTcf0RQkfW/otR7NfcPneJXREMCQCnJ9tqSmYAK+QvVOtIV2fEAW0+YLS
	OxnGbTe7xb33Nu04mkUnP6oismZ54ds39Lc0057nQbulLfNWgFKytotnicn1iRIy2qt4/L3KbuZR8
	9NO9kT64W7ziVdcAOYM3TWKNhFPdbc1HPZBQDr1g/fw45oYbRuuCyXqlywcFbZ+e7LwhorWDJRYJd
	VvaG1/qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHVf-0000000DXoD-3ndL;
	Thu, 19 Jun 2025 15:49:03 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSF4K-0000000D8AW-2i93;
	Thu, 19 Jun 2025 13:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750338758;
	bh=jWZNbtieMlukarfurzmaf+LlmGQDBBQxXt2OISoZBI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pdHjIPrn6GIJmUX9XuUufRCVVMosnE2E4P/D18SECKQfjBQ1RZGKMjbiVOPKiS+gk
	 jjwf1QA8fbdFaMwTpgQRckQxw/RFcTdRLfjeZzceJu2Z0N6KLmMranqio1ZhdeRUSv
	 1OtZlEE5lrULmJ2XOhyewPewWIu0gtA/S75qY0tqvJocq7JveBJuSCKtLC88Fi5HcG
	 AxqvIjQjcEsz8xTXXhM6LviESP3BfWko369YdWFfHj65/O420fQSRXOujKtvIKm+Xs
	 DtrZnuRSJJcHnYEwAYufH7HvSxWRtQ/OZqerNLldb+IKDb1bsZrkcJZJ+8LiZyfCV/
	 um+UB8b9Zzu3g==
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:ba4e:a6e2:6d63:7f02])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A011917E06BF;
	Thu, 19 Jun 2025 15:12:37 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	nicolas.dufresne@collabora.com,
	jgg@ziepe.ca
Cc: iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/5] dt-bindings: vendor-prefixes: Add Verisilicon
Date: Thu, 19 Jun 2025 15:12:22 +0200
Message-ID: <20250619131232.69208-2-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
References: <20250619131232.69208-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_061240_843896_7AF7CC01 
X-CRM114-Status: UNSURE (   8.38  )
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
index 5d2a7a8d3ac6..1baf8304c9ac 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1635,6 +1635,8 @@ patternProperties:
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



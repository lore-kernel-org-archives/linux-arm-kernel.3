Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59312CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 22:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ixw8Tn4SSAJGBrjXyuSJb8p28o5oWrElWJkI7VzZSGU=; b=OtoZ+ju3/gNFTFqH3N6RrkgSlc
	NEL9qvXCZgWx18GATyBuQIEfdquTgEWaZ1smQkFJNiSWj3Tp9nxPQOW0DoM7g+BOFwR+CCAaETMew
	uRyksgntgsHMdTIv0Xum3x5y6/XWy6kV1DDFCdQ5e0iq8SBr9gT4a3ZG54yPtO5nzMP3IkGbx5n7a
	HdXfRZ8iD56nUAaVUpGVtPYaJORd4r6K5ti1ikns5W6Lgcp18relfVxQoHqzRhVK2ZkZC3uKSeCuz
	6OGREOndu3bsbRRWsKCGhFNQptOgMJIjgLfn2jD9hN7+kBf0oN5GS2c2gcoz2UF1DUYg6JimlnE9q
	niFHRlCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBL5n-00000000pnP-0XLp;
	Tue, 21 Oct 2025 22:44:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBL5j-00000000ph8-37Xk;
	Tue, 21 Oct 2025 22:44:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=Ixw8Tn4SSAJGBrjXyuSJb8p28o5oWrElWJkI7VzZSGU=; b=DB8xmIlK9yrts9k7Vp7zIePx2U
	D8xZEER1XoamaJkNTPi/nWKcpuVf5Adid65lUbRAdyLLXZU+GANm5Vgq7HotEZq4isYxl6/EP0S/w
	Q7mYdS//j8SE+aHlYYf7qtoPxBLWjhOh6CZrMHFoeQXGQGIJGUkv31VF/rU8JKJ+QMplb0ptppQ4D
	oJbuV5iwGSLL4HmrG2akURKuNsaPUf9DDOQs/g+IrSnFFzJpTFHE1lAm9eVANCPenDsTV/CbS57uX
	JQlOSrS4WAlluTjXqe+KgK8TJt4+Hj5rRb/EBds8uL2RVjf7blLBKq0sw3ktBSqdTj5Upk9sLkX0q
	Y8NI6GMg==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBL5c-0006q7-Eh; Wed, 22 Oct 2025 00:44:24 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: net: snps,dwmac: Sync list of Rockchip compatibles
Date: Wed, 22 Oct 2025 00:43:55 +0200
Message-ID: <20251021224357.195015-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021224357.195015-1-heiko@sntech.de>
References: <20251021224357.195015-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_154431_779794_CB22B64C 
X-CRM114-Status: GOOD (  11.44  )
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

A number of dwmac variants from Rockchip SoCs have turned up in the
Rockchip-specific binding, but not in the main list in snps,dwmac.yaml
which as the comment indicates is needed for accurate matching.

So add the missing rk3528, rk3568 and rv1126 to the main list.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 28113ac5e11a..1a0d6789a59b 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -87,9 +87,12 @@ properties:
         - rockchip,rk3366-gmac
         - rockchip,rk3368-gmac
         - rockchip,rk3399-gmac
+        - rockchip,rk3528-gmac
+        - rockchip,rk3568-gmac
         - rockchip,rk3576-gmac
         - rockchip,rk3588-gmac
         - rockchip,rv1108-gmac
+        - rockchip,rv1126-gmac
         - snps,dwmac
         - snps,dwmac-3.40a
         - snps,dwmac-3.50a
-- 
2.47.2



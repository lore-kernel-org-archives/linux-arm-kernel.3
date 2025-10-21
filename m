Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0F1CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYh/0i24HCJ6lXNDk9gAdvGbxmlL+x4q7FpUyO+HQ7o=; b=P5iqZnzWuWS6ywLPX24RC99MSG
	BJgb8pFvZyceEwjA3wx4PEKfhYEfyIOivK+/QUgd93BBOZncr5emoI/vjcQeG23YqczpSdBVSFUzw
	HjE/p90UWmf6KQjhlx+ilxQE2ghyPS8BVFC32d0JxWaIMtQvPqHz1YlCZygahUEkLTj7SWYpRZAP5
	ag1RcKIvSQ8s3JK0y+utgmGYfPkVhmR4de32+NxOi2hC4AwtyhlGLBOrnQLjv76XOYiQjnvHZ63EB
	DgE5lSbA7DTWrPygTkxonQEikfzSdFeJudZ2gek1v359DTNwaNjwf4ns3/yjIXcL3r7RXv0lxCCat
	BpzLJ7lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBL5m-00000000pmI-1mvG;
	Tue, 21 Oct 2025 22:44:34 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBL5j-00000000pgp-10rr;
	Tue, 21 Oct 2025 22:44:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=UYh/0i24HCJ6lXNDk9gAdvGbxmlL+x4q7FpUyO+HQ7o=; b=ch6m+f/CI9mAs2E4+YUWDjmvIP
	orPNQti3zb81TRTs+Q56UsjTTfydyVOgWktw43FYnUfwJzLobhu8RYf0Hk8FkXyGkyHvVm+4a6T9H
	PHKomt/+no5eaFYXUpdSiBbguqIiytJUC5pUBEB80+J35xLEraQb+DDPDk747WE67BCkQLvF/v7io
	G17DIuO7z1tgiXdDYqXZqPB61jRciY3GEK75G3fTJER6wmw/5n5fullbauxBw3+UbosvTxu9KTmn6
	y7tg3n6Jlmp8sRSx8VdyjsqekuUyAM/zBJwU4+3of6TSwSeBZMCzL7VBAPUmLbUr+Ol7VM2RDKZa6
	WuLs079g==;
Received: from i53875b19.versanet.de ([83.135.91.25] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBL5b-0006q7-Lh; Wed, 22 Oct 2025 00:44:23 +0200
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
Subject: [PATCH 1/4] dt-bindings: net: snps,dwmac: move rk3399 line to its correct position
Date: Wed, 22 Oct 2025 00:43:54 +0200
Message-ID: <20251021224357.195015-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251021224357.195015-1-heiko@sntech.de>
References: <20251021224357.195015-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_154431_296195_5B512BDA 
X-CRM114-Status: GOOD (  12.08  )
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

Move the rk3399 compatible to its alphabetically correct position.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index 658c004e6a5c..28113ac5e11a 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -86,9 +86,9 @@ properties:
         - rockchip,rk3328-gmac
         - rockchip,rk3366-gmac
         - rockchip,rk3368-gmac
+        - rockchip,rk3399-gmac
         - rockchip,rk3576-gmac
         - rockchip,rk3588-gmac
-        - rockchip,rk3399-gmac
         - rockchip,rv1108-gmac
         - snps,dwmac
         - snps,dwmac-3.40a
-- 
2.47.2



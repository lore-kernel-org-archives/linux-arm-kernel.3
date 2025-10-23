Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2535CCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 11:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45TdvTvnxchfwZTtTdEPmnINUEynfZ8HbfQ3+TVTz5Q=; b=MofsdZArrP4YiMK9a2e7lEatBp
	XicyXGda9BTHHGxZ07t404/T9Bo9p9x74noGu5bEpXyzQV3kGsQpwVQgzezerBbdWxGpWAhVuuqmA
	/pLKyJQ3pcGbGWquHLM0PcJ/Owybc0Pc2qcE7bsbkDbfki6FuX7mDiziZZLZ1PH0P1ubLgNmZsTPN
	2LhzW1Qc6h7r+oxAifdKeXSPjFwjcanvVKlsZSw8sOsO3Hur+hpgLTcx02DDA3RMki0xhUBTSEZ2y
	Y/2H6NbuSBVHppnHX7VxRmPmR1IbXXbQWhaq0grC+dYOvRYHg7qWvEGNu9MzMsq6iBwIznVvj0Lw+
	5Affg3rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtFB-000000061v7-2hiK;
	Thu, 23 Oct 2025 11:12:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBtF3-000000061o0-0loz;
	Thu, 23 Oct 2025 11:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=45TdvTvnxchfwZTtTdEPmnINUEynfZ8HbfQ3+TVTz5Q=; b=wXM4vnBwwt+gLUjI0hZrt03Lfl
	WZR+fRQaxsv1BIPt01SUirBvOZg8oAHKn7n/FgN2GXFwLRIdXsouh6DQbjb7eMUSNHz6ZtWvz5Hzy
	xArYMkhTa1JXpuAYNJVcx75yKmpmzdKEUa+nuL3QuF4KJdRkDZxBTZsvLZ25f5LkfwhFcBmBI1Nv+
	gmXnd6WZF54VAq0TS1ADT8+zdPLXCyVur07QukxxVNd4nZjsVTgK8OnimLQDlcmKViF3U8U6pqLeD
	/g1+nAb7m2HKUEXZoIMEB7Wtr0EWz90yB/rtUIZT+1drmwIJmwkdfNSzGV/a+jbRdoj/HS5iV7D00
	AERiSoqg==;
Received: from i53875a07.versanet.de ([83.135.90.7] helo=phil.fritz.box)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vBtEv-0002w5-V2; Thu, 23 Oct 2025 13:12:18 +0200
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
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se,
	Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 2/5] dt-bindings: net: snps,dwmac: Sync list of Rockchip compatibles
Date: Thu, 23 Oct 2025 13:12:09 +0200
Message-ID: <20251023111213.298860-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251023111213.298860-1-heiko@sntech.de>
References: <20251023111213.298860-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_041225_255233_B5D93677 
X-CRM114-Status: GOOD (  10.43  )
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

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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



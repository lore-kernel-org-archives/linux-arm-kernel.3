Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 829A0C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKarB5hjq0RJ8HWtO78oYbdXogPNte1dgHDWMhXYW2s=; b=mYPOphGU0F4uBI1dXIte3lu/rx
	jp6hTAmWRpapN9D2Msjdo/7JxGfuLR1MnBR5cx+4fCGE/ZFwb+7hiugyg/YaD/vnnmhTLQ6TqfJ5p
	KZh5fRgBcm7kqytVncrHgj96OoJZhGdiRF1/DUIOl/O1RFzRzAhHRY2DYrGADQLBUvB+N/7nfoYGt
	voRES0c/xTqe4zjCl5RxqDJboZtOXwQC8gjqmdcga7PiM2J5F0vjbW9ef3eusedSO71YOLOZM7uZu
	7MVgBmnbZuL9DSYVFwQIZ3OFG0Q31p4k6lIA7xAoP+lEkV2gqGavBz8Rdh/xWU/CCfC6z0Q5Pz8h7
	BBzIq+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5M-0000000BINi-19uC;
	Wed, 23 Apr 2025 17:40:36 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7ai1-0000000AlK4-0dGQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 14:04:18 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4D5DC3430AC;
	Wed, 23 Apr 2025 14:04:10 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 23 Apr 2025 22:03:23 +0800
Subject: [PATCH 2/5] dt-bindings: arm: sunxi: Add A523 EMAC0 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-01-sun55i-emac0-v1-2-46ee4c855e0a@gentoo.org>
References: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
In-Reply-To: <20250423-01-sun55i-emac0-v1-0-46ee4c855e0a@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=954; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=lKyymF7Hpjd26M8XcjHpoVGsP92kwq3xGudaxC8q40M=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCPM/BF4N7i/TYB6b3RNTlrp4EIT9sg8KqYeMb
 gv6OH1IHvOJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAjzP18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277XUmEACZ800KPPzNvd5qzG
 dq77Xn4pkeobCVGqmHVzjTxaG8jl6AqbrT+hPCyYVIysejlUeys+viVgGx6RvEZaUJM2BdhsmoQ
 hQ4u7z2XMeqFaUntVWbRDUsQnZNCITcWMAm9BaG68IYCfRCKteFo6xJ2+VOymprkW4HvTDOKXnV
 wZcpRU1q3q8I/OtkgcIhbZLP9xbZA1drlyOJ+CLwQ/kjXJn6UZQhDzSx4I8d8iveb6/67WmCUlC
 g9lNCSDGfrDvs9lmW4yff8cFC0twTdBx2JyvJ61nu+fEwAUgrpc9y58QAPSZN6mglDsdye8E5wH
 diV08zakE9J/fL63Sq01dzetXf2EeAVj/5qvHCkMMriTKNAg2dyKRyfBHCLAoI/2Sszo+sFoR0I
 s70uY4X8Xw9w7jpQM6Z1EwZjni5NoUisdb6U1RW282qfvTnxbYmcKIAqns3paow0Qs1ZS11Qha0
 JgNR7VkgsH4DyxPRR0mO2/SjSfT69hLdqTjtBC5YyygX5TSU1s5zMc+zDVZdKakWInM7CCvqN+r
 Nbj/WmuG+cxzTJ9EZ3Y4qeomWqagv2v35dp6PsF2Qq1jaFMVjb2r03J9Xtg1s4OKN1d3KdBSdsC
 mceosQP+8eVz4Nd8jeSMC70lknR5kQUeVEq6udQ1dP0HeefUDlqxJhFa+2Pbt6fAEaQQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_070417_215775_1501E737 
X-CRM114-Status: UNSURE (   8.04  )
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

Allwinner A523 SoC variant (A527/T527) contains an "EMAC0" Ethernet
MAC compatible to the A64 version.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
index 7fe0352dff0f8d74a08f3f6aac5450ad685e6a08..7b6a2fde8175353621367c8d8f7a956e4aac7177 100644
--- a/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
+++ b/Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml
@@ -23,6 +23,7 @@ properties:
               - allwinner,sun20i-d1-emac
               - allwinner,sun50i-h6-emac
               - allwinner,sun50i-h616-emac0
+              - allwinner,sun55i-a523-emac0
           - const: allwinner,sun50i-a64-emac
 
   reg:

-- 
2.49.0



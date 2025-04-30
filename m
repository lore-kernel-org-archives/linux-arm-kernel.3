Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6572EC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 06:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e7RmSBdjRbbotr7bXpNonzw0kb0neUW4NIQRqC//KbM=; b=TkQPLMZtK64BVw4b2NMLzRNoRZ
	1XkjaQgN5W0eFngXjtyP4IATOyjlsfMtjLvzSCncKf0fdgMFCL21QUIGpizgmff9aC4IHXorTl+DI
	UzfJOaSefpbHHPmQYvdEf1CO5CM1RPAvWJjF5nN/IKrYbPraZtCrA3dByAC0OHnEYuCricWd6VvWM
	KQASAt6cvy+PYMX7n7JRa23QImsCnDXso9ulQN0Mr1UopwM3WOQfdTT3LnUwuedRQ2CFMeSI1mvaV
	3SYNz/vK3kKpFhyhKgCwXypucK8fwskglaFq37xlBOUbqqf2keiTWU7NIVpUiL4FYmNVJxNihF3+C
	vzIC3wIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1D4-0000000Bu7y-05yl;
	Wed, 30 Apr 2025 06:46:22 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA03u-0000000BlWr-3R9j
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:32:51 +0000
Received: from [127.0.0.1] (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 64F99343005;
	Wed, 30 Apr 2025 05:32:44 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 30 Apr 2025 13:32:03 +0800
Subject: [PATCH v3 1/5] dt-bindings: sram: sunxi-sram: Add A523 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-01-sun55i-emac0-v3-1-6fc000bbccbd@gentoo.org>
References: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
In-Reply-To: <20250430-01-sun55i-emac0-v3-0-6fc000bbccbd@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, 
 Corentin Labbe <clabbe.montjoie@gmail.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1110; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=SZdtmllnLkE/VhdsaTzS9ljZiaw8YmMflpw3nLGy6P4=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoEbXkNVD9Mp4LV1v+vJyJ0q+aQ4GhBTLn9lVzG
 gImIcDUU7CJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaBG15F8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TUfEACZdQ6t0PyPoIomla
 iy4STRZrgBxH6CIEWOD1tOaHnACKjfSNKJ8pZ2M2mnEe12MqJoCWYEG1YLEznRmMUHEuiV01fOK
 yYS9HZHz0U/WroD+dtRq04RA9jDJxU+Ke27U4rZW4l3R17Iq3UZXWQxk802/FC4WBGLiyDVDsMU
 Xu/et2iAS5Rf0CuQSayzDSfrI3oFr6FESaVa+/B2V+Tm8jWCi1Lx33DQ+5KDzm5pUSp/ShiS4T2
 HxGSN82LSrJPuEUsTTUzLE1HAoZN1DK5zd4ERXYMEPec3p4TQ6DTOc2BBzpRTqyOfee75bzrA2T
 cM9DCeXz35wWv0TmQcKLekhosz9hJVdMZiF+4bmTKkqc1W42OA9v9l/kSikoI3Pdnes1A0GDepr
 U/vsvRPKIozviDN1GXD6TtQAJaLc6/Ky7ou1eMcAH49nV7/qrZwWxAmFPlmpu6OoeJpSiCIdhEf
 cxEwB5iFXAhEp4JYHu5oqTUE6JNCwLFIcuxMld5DEmVju2eFZygKrbkGjO2l281AM00xbr+gHtR
 C5vjftpFMsFxl3GVcZUTT2Bnj3UGrlTxEbS7+g7HtxCrC2XM8i/Pn4IOmg7rgT7oWiEpzpBDSJn
 8MuOUQ5AFAg6D8OeJthDjvj/hsGFYxMNE+Wp65tTC/bKgcNIQPqETKmPL3vmp5NJP3dQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_223250_889415_B3F951B4 
X-CRM114-Status: UNSURE (   8.29  )
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

The Allwinner A523 family of SoCs have their "system control" registers
compatible to the A64 SoC, so add the new SoC specific compatible string.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
index a7236f7db4ec34d44c4e2268f76281ef8ed83189..e7f7cf72719ea884d48fff69620467ff2834913b 100644
--- a/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
+++ b/Documentation/devicetree/bindings/sram/allwinner,sun4i-a10-system-control.yaml
@@ -50,6 +50,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-system-control
               - allwinner,sun50i-h6-system-control
+              - allwinner,sun55i-a523-system-control
           - const: allwinner,sun50i-a64-system-control
 
   reg:

-- 
2.49.0



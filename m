Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62944C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 05:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2K1rfDc9bgzX9n2gC6eeZf21tT3gcy122dZQ8RdTTq8=; b=MAhRtDxVgj5YwxTsUkHOfxEAJx
	tIZYIOvYtvIjxzTpTUMd3/ZNjbWVy2Und5QBDHt+mCzbXbj+vACd6Z8SGw9JLF8ikDuFht3iDigbh
	SMSAFNxV3PYQuzzWwaEMkofdcq434+o2RC8oCAEyM9nYGUEdBMXsDVgjS8F1ItFeDS7M+wx5Gvmer
	4GrdtMnu8yl42GQCDOX+zjmC31HDj0d+BkA3xioXXBFt3rU/+ZxqaboPIlW7jD3VnG4jO/zZhNoGO
	DRCNandIiIMrH8EBzJR4g9UeuRzAUEhfqrnBCMSR7zht0Z0h+Ajz3YnThuo6VyhFgKp3bKkRwJXYS
	WiXcT+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA09Q-0000000BmEJ-37iQ;
	Wed, 30 Apr 2025 05:38:32 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA041-0000000BlYH-1isE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 05:32:58 +0000
Received: from [127.0.0.1] (unknown [116.232.147.253])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E9CED342FEF;
	Wed, 30 Apr 2025 05:32:50 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 30 Apr 2025 13:32:04 +0800
Subject: [PATCH v3 2/5] dt-bindings: net: sun8i-emac: Add A523 EMAC0
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-01-sun55i-emac0-v3-2-6fc000bbccbd@gentoo.org>
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
 Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=CPzf3L1maEHhRUPeCLRLGmqGZlZyME7KCDHk90hRYuc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoEbXnm8j17q1Yhro6i5iwTkR8e+i4yNgzH3agD
 hpv6s3fcFaJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaBG1518UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WxdD/0Z515FxE2Dy78AXT
 6LRWQ6gJdVM0xmzzUHcAgaqUxcdWQfdI/bMBQ5kn9brdEaU01JtyK3CQmH7QkdKoEXejfwDvd+e
 zTkBqmyNKMh4BHKXaejhgnQj+Tt77+JHqIK4+mvFXCfJb2YfW6BCkVgBL2D6Rwd5KqgwZA+TgRR
 Wn3FJ73G0hJOimgPIBchNlkK3PqwDqzLgL2ZfITkYtPjfp22Ea0eQIcVzQlXucs/9iH+YbgrAFd
 vOyGqCN89/0RL3vELFh1RarYDP1EUlLtjXv2qvcKMLlo6I3Z2PpOeTAK4a2Tv95MJV/QrmnfEZO
 pYV6wiSNGLKzLHnxbcQf1rteK3f4THkbBniV99tRpuppuJcRAGqQlBseBiSbnxuilYKDJOuE6Op
 Akk/CqFQUFlCdgXrnzCcOL9Z/ajhc6lFQXSqiSBJqmOsLgR/jgLeIlunV+wxWupvPmw6raO1GlO
 /GyhOLXt21v39iNNk6s5YWDHk13rShWiUT5aBBxpQXqpDvMPPYYX16crjl1Sty6ExX0qsVE/f3L
 j6QapTHXTXqlnm+srvHquZjU7VECU6y4ce71ppC+Fo4AwR6X5Izn92tAKM/ohSk3vgi6iR8xqM8
 da/ZzTAoLwPu7cFW4HrW9SON/onhLfqTWtqrkP3aOeQZ59ERAWqExASipyaCqlcgPVLQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_223257_473399_74AA8819 
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

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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



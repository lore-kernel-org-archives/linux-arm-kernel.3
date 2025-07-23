Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0E3C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 12:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TU8Jll/Gz9LNgDHoqWnxxdtmHuWsKcU+Qw3QQXvySMM=; b=5Fnpt1QHV1ZmcgVrteQHW3tfhv
	1AST984tteRt8iDTTDzjvGAjAeVPYd/macmtYOT7haTG3U0UpkpHnAZcMNnSSpwSvt+hp/uX+Xp8B
	+nd8xKh7DaQrO9FN2nZ5BpHvBUu3WNDQcBV6hFJk8BlMZ6YBQpocV8RojyE/n4kfQg6vLYKw6t9/4
	AKXlVzT/X8tB/6+tQyy8rsZNah/7btW2wrRJXH/2Us2P3UoMxCmGBOSOv/GwCAYJBunw05iZQ/552
	RqdyMzwz0a+ZeK1TwIZaZScBC/T3hrCbj6c03RlAPXapu4EkfKEg3R+FOPryN8MU6gZkhfEPHh16x
	j1pWreMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYmb-00000004vrC-1ReW;
	Wed, 23 Jul 2025 12:41:17 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueYVr-00000004tpl-0JFn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 12:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1753273438; bh=TU8Jll/Gz9LNgDHoqWnxxdtmHuWsKcU+Qw3QQXvySMM=;
 b=VduouMt6+96kci4tfaUDtkYlOhxb7z/n4PJXlGwyIUv3HdvsKARmhmrqBnb4JxNRwxZWQ5YiB
 598d5KBLFg9vJWpt8X5zURoft2EjiGeMl+UwWsaW44kVDmMwR2PutPAzBtJobZRJhWbT9TXGu1D
 1KNTGtjwMeUsua78eligLpkuAK+fUtChjpH21NqAspqTIYH7hDLnZVQEUnyb12qVzA9IFG1kM7I
 2HBA37H7iLntT2ZxfruY/TTfccYYXgTXMDNTmnEwrGOjha60F+N3//L+78nzCXMJYNDHqQb0aKa
 U5AyGIvIh+KiTSjp9AVGNSPkhxr+Zsl+zWZFUVM/UzSg==
X-Forward-Email-ID: 6880d45ccb0ee86f9731a0e0
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.6
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-usb@vger.kernel.org
Subject: [PATCH 06/11] dt-bindings: usb: dwc3: Add compatible for RK3528
Date: Wed, 23 Jul 2025 12:23:04 +0000
Message-ID: <20250723122323.2344916-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723122323.2344916-1-jonas@kwiboo.se>
References: <20250723122323.2344916-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_052359_205906_0ABD30ED 
X-CRM114-Status: UNSURE (   8.75  )
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

The USB dwc3 core on Rockchip RK3528 is the same as the one already
described by the generic snps,dwc3 schema.

Add the compatible for the Rockchip RK3528 variant.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
index fd1b13c0ed6b..0554dbc4b854 100644
--- a/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml
@@ -26,6 +26,7 @@ select:
       contains:
         enum:
           - rockchip,rk3328-dwc3
+          - rockchip,rk3528-dwc3
           - rockchip,rk3562-dwc3
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
@@ -38,6 +39,7 @@ properties:
     items:
       - enum:
           - rockchip,rk3328-dwc3
+          - rockchip,rk3528-dwc3
           - rockchip,rk3562-dwc3
           - rockchip,rk3568-dwc3
           - rockchip,rk3576-dwc3
@@ -135,6 +137,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3528-dwc3
               - rockchip,rk3568-dwc3
               - rockchip,rk3576-dwc3
     then:
-- 
2.50.1



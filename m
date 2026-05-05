Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D99DFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 16:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xuaZ+lu/0oOjq7MzxlekezwgJbuBqAkQmbRBgUbItoQ=; b=igg6+GvqBujI55ofdDJDqlgDOB
	Idj3T2L4m1338kVbw3VRy+nYgJDE8nqQc1dVFBYIK5RkfHfa6IyKLx/DhMHzZ9g5DiFrGOJtZRCGH
	FezAjz1GbtW4A9iQtlrwvbeL46hBzVvJyhNAaOOI6edyKzjwWvXz33fs7iT82XoJ3RDy0s/A1lFRY
	qxMU+111kjlX/eUkO9qDA7a/qopA1OS5Jlcm/O49P6y6Sr9I0SF9LxKbXC0CuOJZZtulw0yCEzu+j
	LMuFapAzlsbwHZIJOfqQZ58GCUwQo9OgnCp+MN9HlXMXbpMTaJTTfWxdEQN9TNVa7wpg+VL5p659Q
	JD632Dug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKIta-0000000GwPF-3ryv;
	Tue, 05 May 2026 16:45:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKItY-0000000GwOh-33E9;
	Tue, 05 May 2026 16:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
	bh=xuaZ+lu/0oOjq7MzxlekezwgJbuBqAkQmbRBgUbItoQ=; b=WHnmpUahTQD2zbx3pbPMlCuQiO
	W0Zxi4E+3fdR/BrPjI7J5Yywfj7P2KuNhSV5f4Wta+KSEPWpTcn49K/wIdra8z++l/p6e6DazCGBE
	i951cdIz7W5MLojlC8Br+NS+qVxzvlQjKQiqPj4R9XbwXgyV8IDgdVdPdHZO5Y1QzVTJ+b6qThaTq
	WojXAhJxDz71+F4M0dlssocoOc3lEVgQyJ22I4yYlY6zu7UpQeHw8g0TY7Eb0LNjlCXFRz3DDcAyw
	zCsGVs8UdPpPTs+rh5ADdy4dWQ8eqjwy8QBdd0YJtwOiK9/DK8TxPVe7EQU4YWsNhEmIDz2zpQutP
	wbWatNnQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: gregkh@linuxfoundation.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH] dt-bindings: usb: dwc3: Add compatible for RK3528
Date: Tue,  5 May 2026 18:45:09 +0200
Message-ID: <20260505164509.3254707-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_094516_826351_C34DC5C8 
X-CRM114-Status: UNSURE (   9.65  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The USB dwc3 core on Rockchip RK3528 is the same as the one already
described by the generic snps,dwc3 schema.

Add the compatible for the Rockchip RK3528 variant.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
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
2.47.3



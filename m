Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C0CFE9A74D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SGe9Ea0du/z3XFPAO984Z8weC3fJi6ZlDoBA0mOR4pI=; b=IyDP6A0q7oYo8AVyu0kmhWUnfw
	ucB+9ht99vTOjsaMNvSYO52txZ0fyyP4gLvvm1zLden+h64cgVVXb9p+wmnrbG9BDcWDX5l4/lRXR
	vLPso2VnZ3dkUNTt+ME41LsRBjmUHus0gWUAh/cdOhDcvYHCJ2cj/4FNDZLnNbx74eWfRzz9zN9nl
	0ctTcdUkVFOojJ84IU93YuD69GIAZoSUz7LDZHbWA9jnzBEaLp1NVP7xJspSfMZUp6S5s/v0k6n1E
	za6/EJnPwphnhyeSCOuiQy2MDavWO09CjLl3wkiy9TdvZ3ERP/BfbYqddEDO8L9MncbPcxF6LiCIn
	tbS1WWpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCO-000000016Vw-0dJU;
	Tue, 24 Mar 2026 09:37:20 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCL-000000016Ty-09xP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:37:18 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 7F82D275B7;
	Tue, 24 Mar 2026 10:37:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345030;
	bh=SGe9Ea0du/z3XFPAO984Z8weC3fJi6ZlDoBA0mOR4pI=; h=From:To:Subject;
	b=bCKlw4sXjxtW0t4gHkWFIH0ljtyh/DjUCBFhBUrsFQeBpLgATtRzcZoc9wg52AQFZ
	 vJUry9DSVIoq8rqWwXDg5RWsMsJfLbxBa51eTxl6GNe7kNacdEYnAwge0NyxgFPs6Y
	 K7PqHtcTqhgvNfprubeAD83dYRMManJxmTs+QBh7IFxguF3NLX0HULFrCFg7mj2lh1
	 52aA8KP+CfNFhLzbfTzMDM94iDfNA58/QxAp5k2u/eJK2E4iYMbTjygHlWuxj4Uc9p
	 ECRl2mkoQTxm9SNCbHnOM//ow5Z5q6vg5sgWTGA+diK+Ws89A7TNKD6bGQr3djj3Pm
	 gCm2U4C2M+O4A==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/7] dt-bindings: arm: ti: Add verdin am62/am62p zinnia board
Date: Tue, 24 Mar 2026 10:36:56 +0100
Message-ID: <20260324093705.26730-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023717_236133_BC224150 
X-CRM114-Status: UNSURE (   7.46  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Toradex Verdin Zinnia carrier board mated with Verdin AM62 and AM62P.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 Documentation/devicetree/bindings/arm/ti/k3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index adda61e06173..2a6a9441c23d 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -79,6 +79,7 @@ properties:
               - toradex,verdin-am62-nonwifi-ivy    # Verdin AM62 Module on Ivy
               - toradex,verdin-am62-nonwifi-mallow # Verdin AM62 Module on Mallow
               - toradex,verdin-am62-nonwifi-yavia  # Verdin AM62 Module on Yavia
+              - toradex,verdin-am62-nonwifi-zinnia # Verdin AM62 Module on Zinnia
           - const: toradex,verdin-am62-nonwifi     # Verdin AM62 Module without Wi-Fi / BT
           - const: toradex,verdin-am62             # Verdin AM62 Module
           - const: ti,am625
@@ -91,6 +92,7 @@ properties:
               - toradex,verdin-am62-wifi-ivy    # Verdin AM62 Wi-Fi / BT Module on Ivy
               - toradex,verdin-am62-wifi-mallow # Verdin AM62 Wi-Fi / BT Module on Mallow
               - toradex,verdin-am62-wifi-yavia  # Verdin AM62 Wi-Fi / BT Module on Yavia
+              - toradex,verdin-am62-wifi-zinnia # Verdin AM62 Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-am62-wifi     # Verdin AM62 Wi-Fi / BT Module
           - const: toradex,verdin-am62          # Verdin AM62 Module
           - const: ti,am625
@@ -103,6 +105,7 @@ properties:
               - toradex,verdin-am62p-nonwifi-ivy    # Verdin AM62P Module on Ivy
               - toradex,verdin-am62p-nonwifi-mallow # Verdin AM62P Module on Mallow
               - toradex,verdin-am62p-nonwifi-yavia  # Verdin AM62P Module on Yavia
+              - toradex,verdin-am62p-nonwifi-zinnia # Verdin AM62P Module on Zinnia
           - const: toradex,verdin-am62p-nonwifi     # Verdin AM62P Module without Wi-Fi / BT
           - const: toradex,verdin-am62p             # Verdin AM62P Module
           - const: ti,am62p5
@@ -115,6 +118,7 @@ properties:
               - toradex,verdin-am62p-wifi-ivy    # Verdin AM62P Wi-Fi / BT Module on Ivy
               - toradex,verdin-am62p-wifi-mallow # Verdin AM62P Wi-Fi / BT Module on Mallow
               - toradex,verdin-am62p-wifi-yavia  # Verdin AM62P Wi-Fi / BT Module on Yavia
+              - toradex,verdin-am62p-wifi-zinnia # Verdin AM62P Wi-Fi / BT Module on Zinnia
           - const: toradex,verdin-am62p-wifi     # Verdin AM62P Wi-Fi / BT Module
           - const: toradex,verdin-am62p          # Verdin AM62P Module
           - const: ti,am62p5
-- 
2.47.3



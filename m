Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32248CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 21:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSi8YfbwhgsUVou4+Jjm1NERA0H7Nq8lRc+95j32O3o=; b=yLEBRDrerB5t2dEZjC0iA/2Mnn
	m6/75nd3j2eeM6A16JDD6jZMho9BVFGsvpzuH/THYkrnLcN3GMKExD9OGm3/ykZNYggUD2QdNosp5
	bEsxI729mMBi4qTIkBQ+3C3VHy1kMIu1f1FI/x3TvXIHXoPVfAf5vq/ePdywxnV+16TZdx/YXBH1/
	AVbCnvsaGgraVEDwfx2jlXw38jUEgn5kximYOKM0kkU2fM7EjdUVb5b9RnwkzG2Lvk6hvKy4HvNUV
	3aSefROzpy7f9QJN4BlFia1qZBWL9+75hIzxr7GV5lSjUINnSKZU98KAutJWua8Bh/tooQ9q3kPC0
	rNrSkgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZb5-00000003XAJ-24G5;
	Fri, 22 Aug 2025 21:46:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upNwQ-000000021ke-1ptg;
	Fri, 22 Aug 2025 09:20:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 603E75C6DD9;
	Fri, 22 Aug 2025 09:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1C35BC113D0;
	Fri, 22 Aug 2025 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755854409;
	bh=lYXRPEF5xCv3IMvDjVWMR2FFCr2yw+pFku4jVaMdDP4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=otG/bHA4jnzSNnTzI7gaK7VxUVOmCTXiFN0jC6puFqoXmqQSZIaEkh1NH/upAuDv9
	 UM3blY6wVB/jAWT+VU51ViJJW509qNb0yaM4pls74pUjqCuMx0pJ1o+hyUGouWLbA9
	 RKtXuobt0M7bx2a3fuCwA/0gAyhdZMIL5FiGWbre1WLcoudtuFbBOJ4cypOMnXM6iD
	 IPtpTxFZxkzDpaHYUW9GHvTX+lwf2lKN5jxTgP0yZhL5blEmHmuz29Kv5n2T3ISRcu
	 GfFy3q+Cqetow8jkTicqvCI2UspG29T3Ke9JdRNOfiC+1Kg3hAGRSaF1sH/dALiBtV
	 akvzhyzwF03HA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B04DCA0EED;
	Fri, 22 Aug 2025 09:20:09 +0000 (UTC)
From: Maud Spierings via B4 Relay <devnull+maudspierings.gocontroll.com@kernel.org>
Date: Fri, 22 Aug 2025 11:20:05 +0200
Subject: [PATCH 1/2] dt-bindings: phy: ti,tcan104x-can: Document TI
 TCAN1051
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-can_phy3-v1-1-73b3ba1690ee@gocontroll.com>
References: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
In-Reply-To: <20250822-can_phy3-v1-0-73b3ba1690ee@gocontroll.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>, 
 Vincent Mailhol <mailhol.vincent@wanadoo.fr>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Maud Spierings <maudspierings@gocontroll.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755854408; l=925;
 i=maudspierings@gocontroll.com; s=20250214; h=from:subject:message-id;
 bh=h5ZKsrw8gOWNFZ+LrIS6NAt/AwRMIdyfhSIwneUGyVY=;
 b=yNhf/uwZ57jylj44lykbtsjIChzfx1egEmURElSzgQTHDMOtYe+40rbVS0HDW6jz5lQuk9Wrv
 aW/WV+pyMbFDLZRhO0NC1y+NAc6wlOQ1EioJZsPHTHhDBYxzbBDgxh/
X-Developer-Key: i=maudspierings@gocontroll.com; a=ed25519;
 pk=7chUb8XpaTQDvWhzTdHC0YPMkTDloELEC7q94tOUyPg=
X-Endpoint-Received: by B4 Relay for maudspierings@gocontroll.com/20250214
 with auth_id=341
X-Original-From: Maud Spierings <maudspierings@gocontroll.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_022010_531229_5B3F8D63 
X-CRM114-Status: UNSURE (   7.94  )
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
Reply-To: maudspierings@gocontroll.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Maud Spierings <maudspierings@gocontroll.com>

TCAN1051-Q1 Automotive Fault Protected CAN Transceiver with CAN FD

It is pretty much identical to the TCAN1042, add the compatible with
fallback on the TCAN1042.

Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
---
 Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
index 4a8c3829d85d3c4a4963750d03567c1c345beb91..138923ffedfeeb6a0b391cae863723ec70bf2c88 100644
--- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
+++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - microchip,ata6561
+              - ti,tcan1051
           - const: ti,tcan1042
       - enum:
           - ti,tcan1042

-- 
2.50.1




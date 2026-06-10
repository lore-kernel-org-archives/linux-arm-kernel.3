Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6D5CD98C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 14:21:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O4pONKxrUwGGpP5FKrvZrME2syuxBziNteMxDKQKVco=; b=18vE9NdcC9NLMlpWHSdLgq0mQn
	OfKao66n5Rrz+G9jGpOCM61RQqw477p+ezUzFeY2jR4fvUaBkMOLPVabChKPEkp/cCZiH5YCud7Q3
	PCPi3VjrQLOXgYz5Z5zXwtxTOJ1UauxqW0OghsmWzGy0AZXybPvOxEjVCMRQXFpvXgc8/x98cBOaV
	QDFCdWsGirxAmzttLBLtbaEGQqPt3P1EXuO7tVh5NU/yPHE6DxM4FEMqjf0LVZUCMrdehcS9RJD8J
	MsCmqTdvbrt1rEThl2egoOtycwHfDdKGa/WoAi6K8nOOP8WRSt8IVs0hZn1SqG3hP4Xw3sCOJLElf
	+RatA9Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJoT-00000007rVn-0aTD;
	Wed, 10 Jun 2026 14:21:49 +0000
Received: from fr5000-r.dnsiaas.com ([92.42.104.18])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXJoQ-00000007rU0-1xv5;
	Wed, 10 Jun 2026 14:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=O4pONKxrUwGGpP5FKrvZrME2syuxBziNteMxDKQKVco=; b=XcMbTFWEV+VlA9OtyQs45JyHWQ
	hGiCYuGK/3ZeVrmmFzYN6+DTZTVr2FjvwoHw1M/V9w/ZELI4hh7jVVrvBb8PmEq+haKzZ6o/XTB3W
	+/Lo6Ux4mFnvCM8ko48SEMNEDnWtOUDxiwMcbQs+X4fnm7bfofK7yBroTE0+w4+96dGQms2RQgthB
	XjdwgtXj8p0jhaEH3Wfd4XA15PoRpqm7pXlr5dgElBkwajyHbLdckUhUuY8RZK/zmpXY+Ksw6JDXc
	XtFsioZzIwMKfXuddM1QYobHec5GQXy8vPiTFZdeyc0pTrnwp7BlslnK34tvQeyiyoCM6ouKAYgAi
	sdo+I9yg==;
Received: from [81.57.40.39] (port=46646 helo=vscode.iliadbox.lan)
	by fr5000-r.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.4)
	(envelope-from <hello@superkali.me>)
	id 1wXJSP-0000000Clj9-27pi;
	Wed, 10 Jun 2026 15:59:01 +0200
From: Daniele Briguglio <hello@superkali.me>
Date: Wed, 10 Jun 2026 15:58:59 +0200
Subject: [PATCH 2/3] dt-bindings: arm: rockchip: Add Youyeetoo YY3588
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-yy3588-board-v1-2-4bb7176b6826@superkali.me>
References: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
In-Reply-To: <20260610-yy3588-board-v1-0-4bb7176b6826@superkali.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Daniele Briguglio <hello@superkali.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781099938; l=912;
 i=hello@superkali.me; h=from:subject:message-id;
 bh=ose0dKW198yieSp6oz0ALm77FZUIIKS7LfDBXIje42s=;
 b=j7mepm3xjI6o003pNzkU6hBrk2GtmSuwxVGCYsh4/I/8Q12AaqxQT1FLHKwfcKwZFwWFo7k3b
 PcCzqzXXxy7BJhPvNRxUMuGYhUhgEnQZ2ARIpn2z2mAWzGMa9u3wBau
X-Developer-Key: i=hello@superkali.me; a=ed25519;
 pk=5tynRWQdL93CDcapJ73FkcCRY2PeBOJOIAoIhRig53U=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr5000-r.dnsiaas.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr5000-r.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr5000-r.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_072146_688029_83409640 
X-CRM114-Status: UNSURE (   5.94  )
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

The YY3588 is a single board computer based on the Rockchip RK3588.
Add devicetree binding documentation for it.

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..e7894d2b8 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1347,6 +1347,11 @@ properties:
           - const: xunlong,orangepi-cm5
           - const: rockchip,rk3588s
 
+      - description: Youyeetoo YY3588
+        items:
+          - const: youyeetoo,yy3588
+          - const: rockchip,rk3588
+
       - description: Zkmagic A95X Z2
         items:
           - const: zkmagic,a95x-z2

-- 
2.47.3



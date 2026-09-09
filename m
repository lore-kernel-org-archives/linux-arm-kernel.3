Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7F4C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 19:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QpWyJTYIhbVracld8cQF0mcNxtfIdKPzFYWE/IbkTrI=; b=lvkefmK/C0hn/KGvnx6uQl/u4/
	rHY8OwFCNEzenU/NqzIxMnCwHTIjdybvLaL5NCS6V6EHkBq95yZxegQQKJzqz4GUHcCxQvyCtoNNO
	jF+ZLRGYEBfIqZ575BCXWbSiCmbusRC0WpJR0ndQZDlIlMTh94iu5WKSWmwn52XggPb7tVpyb85DP
	Jx8z7pYi5aXeqIhg3PwweoGK3Lvn24pLinM4g0XOibM8e0zEoRHppPm93Npj7qAmRiXx+2LqFGjLG
	M/W+9A34g9WQmLeurZ+MThTJGs9kaPWDkuIBF5gu6xO09ymxOxZhFchnDDmkGyAa0/K6ptp6g7UaE
	a2DcRQ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O7Y-0000000CjPJ-2bpQ;
	Wed, 09 Sep 2026 19:38:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4O7X-0000000CjOH-43QU;
	Wed, 09 Sep 2026 19:38:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 112F344792;
	Wed,  9 Sep 2026 19:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDCCDC2BCF4;
	Wed,  9 Sep 2026 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788982690;
	bh=P0qNZiLTQV7gn0UuncV6cdn6iEieMHPrHFYC39KFYEM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Wc799gg8FqMwlc1yZbvQ9bj+97QFPi+iXk803jluNlnO0qKkM0YGbsNBFpWZp01ZR
	 lkHUVW3BQT2PY8dtpB8hlW3/hATWVKZZuN+mZi/Z74g/O0Zn6hnlIbMzZA5HzyiQNc
	 5sOGazJhU9gh65elRXtY0DyqDbLEjsuCPPWhV6WSPP5GGgBbWHgkxyN1iVHn85ffWN
	 02qPCVxCxTsVYoLNzVlKe3vlscMe6aPwhX+yxWaX4hBKWWu0mMcwiqC0y7T/LTC/UI
	 /8SibVrVNaqgofS2pZ5Ht6iW7rbvnMNMrSnnlFrMpAWy1Yi2jt1G7G566KUI1MLe9G
	 mWaLxDodTrRpQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74F8C79FBD;
	Wed,  9 Sep 2026 19:38:10 +0000 (UTC)
From: Zakariya Hadrami via B4 Relay <devnull+zkh.mailbox.org@kernel.org>
Date: Wed, 09 Sep 2026 21:38:01 +0200
Subject: [PATCH v4 2/4] dt-bindings: arm: mediatek: Add MT8127 Amazon ford
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-mt8127-amazon-ford-basic-v4-2-e9af5c420ab1@mailbox.org>
References: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
In-Reply-To: <20260909-mt8127-amazon-ford-basic-v4-0-e9af5c420ab1@mailbox.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, zkh1@proton.me, 
 Zakariya Hadrami <zkh@mailbox.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788982689; l=801;
 i=zkh@mailbox.org; s=20260908; h=from:subject:message-id;
 bh=6yb/XWefb2wuZDPOBmfMPSdJsXYrkjPox9GtsLygo8Q=;
 b=5LffDZHmyNBAclDIcnlkhY1WJo3bKSUx98Ij5Kr3xlAwsWWLtksy5ZX/y2KUMOhsuNjLVaCPJ
 XyeIZo04YroDql575Ijfy+wvDgQN8yZLKhQoYzBtHaMhTPJ/WrBflL+
X-Developer-Key: i=zkh@mailbox.org; a=ed25519;
 pk=up24Xn4ScFKugfT4EJru/UQAS7JOIN+DSQqro+a05T4=
X-Endpoint-Received: by B4 Relay for zkh@mailbox.org/20260908 with
 auth_id=1015
X-Original-From: Zakariya Hadrami <zkh@mailbox.org>
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
Reply-To: zkh@mailbox.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Zakariya Hadrami <zkh@mailbox.org>

Add entry for the MT8127 based Amazon ford tablet.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zakariya Hadrami <zkh@mailbox.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index cd4040ad3437..180e6e4948e7 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -122,6 +122,7 @@ properties:
           - const: mediatek,mt7988a
       - items:
           - enum:
+              - amazon,ford
               - mediatek,mt8127-moose
           - const: mediatek,mt8127
       - items:

-- 
2.54.0




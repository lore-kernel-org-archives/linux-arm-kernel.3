Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DFF7C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 23:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mj9yElEDhSNDVRCljNKtW2rK3cuOmT54qoaeELZwr1I=; b=dRJPefmHEMZUhlusYR8oZeY0Qp
	fnhC7u+5wQ2K8DJO9qDPOXtIZkCXUwQ5Ar+4GQl3m/WLGXflwAh18/BZOR+MTB2dfhsYzTUyUVzr4
	PAEcUL4P7htirzPbV/UvsjKMKztAgVBSyXg1oZTf+2ujxS+1OWgg7LQIVkyp4yW21x1qX09y4LeU7
	0ine0sdb7n2h+8N2ffxdqBZFYSMkKLrvbtDGQf/i8+MiL0+Y6+SiaAgg9Is7b4iQZNlVM66VCqnMq
	s32Im2YZUcuAtbKxaUvTZGNsbjxE2sqeAWmM412wCKd5okSjXgqFM91AFPkfn+cMqnv1NmCtrCwDZ
	1EDD/veg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrnr-0000000CgpN-0R2q;
	Thu, 13 Mar 2025 23:17:27 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsrhe-0000000CgFm-3WKO;
	Thu, 13 Mar 2025 23:11:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1D6B4A4879C;
	Thu, 13 Mar 2025 23:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2E3B9C4CEEA;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741907461;
	bh=KS2yDSQRD5SU3vS+jOOmaz2xUBc5Ay1LiOZbJ7uVdFk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=a59F3BN171SoZoup7W9FWYHJcR8PQGpl6JPxtnoxyZPBNUjWX6rbyR5Zu8vUTs0dL
	 xDTyYTJVxLzo6fJsnxgq8j/xXYfawBkAVLJViLcpnrbQhf+aUieNVKa5WOP8GDtjQJ
	 LdkTVIl6BjSgVU2KZd4c9hx11KNuv232dgdYMm7aQuhT/ZveugX3t7hgO11CMQ2r3e
	 CO+nZkt+tjBBdn04FXZ6ICJHAv8PWgdSMnl5AoFGbCgd0umHu0eMU4hpYxDkAY+Ppc
	 9/7pjZlrHrw7WJkZ99quN7C7gqQLSjvy5OU/bzpzlnTcLFuPqnnte1tObQL+Aqieol
	 Ynoat3pThlyWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15474C35FF1;
	Thu, 13 Mar 2025 23:11:01 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Fri, 14 Mar 2025 00:10:59 +0100
Subject: [PATCH v2 1/2] dt-bindings: arm: amlogic: Add Ugoos AM3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250314-ugoos-am3-v2-1-422104b0cec5@posteo.net>
References: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
In-Reply-To: <20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741907460; l=1023;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=5cSMNKg21bi7irPRvrIi1guYYUp67v6kD7IHJg+8xbU=;
 b=S/2RElaFOIwhwBy1p6gnq2FHNtTl0Uwx3R6e3so2rZAQV8z0N2wsMMgJYBCTdflA9hpgYFjTm
 AQ6jHvEW98wCFgHgmzwBOhBDYAHDhGe0ZIp8jON8TyS/urBQ8mzmEyr
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_161102_944243_6B69AB7E 
X-CRM114-Status: UNSURE (   6.79  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The Ugoos AM3 is a small set-top box based on the Amlogic S912 SoC.

  https://ugoos.com/ugoos-am3-16g

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

V2:
- fix vendor name in patch subject
- add Krzysztof's ACK
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae1f55a27bfb148252532bcf15ca905bf..779568f158ce985e1d12fbee73418549cfc58705 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -127,6 +127,7 @@ properties:
               - minix,neo-u9h
               - nexbox,a1
               - tronsmart,vega-s96
+              - ugoos,am3
               - videostrong,gxm-kiii-pro
               - wetek,core2
           - const: amlogic,s912

-- 
2.48.0.rc1.219.gb6b6757d772




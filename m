Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68016C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iwDNZVV3jMIR4omd3+nt2pbLCy/hMqc6UP+Yyk4n7cc=; b=gNYuAvluMpoJOOukb1BqW+Gu0M
	rdATSXZRTyJqnMpkWHcO1+DJPNiGoR2sWiOWlZMGIFkbiXmhv0A+P0rfZwWuZlOmGjGTXn7DfP0Sa
	/p+dFntPCS9rLTnQ5BE+t14A07vjwuNLddzzulPlSM0eoAV44XpW06KBzAR+vtIFqISC3y3p6H6fs
	S1QONQvDsFS/vcfJgy6OGb/VhhKII4dXt/8B8IgPIG5ayLSa8hoEPa8vrmD12YEC6ZQ6Oy2CEVcrB
	Fea+yRRL/h8CVB+cfoJwzIuRwbHOU1ILKgjCsi3bbGTvDkPkQqrFuYYgXnx9nlO3g/+n+Oy4gne7i
	eEqiBHxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3iI-00000008WS0-1z7P;
	Thu, 24 Jul 2025 21:42:54 +0000
Received: from chumsalmon.baetis.net ([2001:19f0:5:5b58:5400:5ff:fe17:97e8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf3dm-00000008W4o-2rnS;
	Thu, 24 Jul 2025 21:38:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tahomasoft.com;
	s=default; t=1753393092;
	bh=WmdTK/AB2VM5/OZjks9WgJ5l/8tXDjMaW1u8BvINtFg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HvvIfrmYoYlH9yoieEQofHj7TsHjb8v4HtFBh30ZiegwSbYbnIBKvVYwopvjAnSiZ
	 dbpDkM6aFYhodRsaLFJT3BRaPlB3l/mKsFaECpNTa/s3FTd+jmQKohV0SNE2Jmzj01
	 AghKNwLQxA2HXfVX1aUzG2N+NdW8CIq8CTMOsRnfs1TQu+oeYzniGXrFluNOMVfAvC
	 b/hCfw95U/kpPuAY7DxRui00LzFVfIgRQIw6/8og7vZjus2TL81vGWHJOIuFZiPzXP
	 J47x0tNmllcJcLYrhivFxQ7vgsGG3eyiKzXGXaptMBCL4CR9hLmas6aVbn1eAWL5SB
	 P2RgvKy0212lQ==
Received: from localhost (unknown [IPv6:2600:4040:50b7:b604:ee41:bd43:23a9:712b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by chumsalmon.baetis.net (Postfix) with ESMTPSA id B61F927E484;
	Thu, 24 Jul 2025 21:38:12 +0000 (UTC)
From: Erik Beck <xunil@tahomasoft.com>
Date: Thu, 24 Jul 2025 17:37:58 -0400
Subject: [PATCH v3 1/2] dt-bindings: arm: rockchip: add
 LinkStar-H68k-1432v1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-linkstar-h68k-patchv3-v3-1-b9f87b7306e5@tahomasoft.com>
References: <20250724-linkstar-h68k-patchv3-v3-0-b9f87b7306e5@tahomasoft.com>
In-Reply-To: <20250724-linkstar-h68k-patchv3-v3-0-b9f87b7306e5@tahomasoft.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Erik Beck <xunil@tahomasoft.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753393091; l=1069;
 i=xunil@tahomasoft.com; s=20250724; h=from:subject:message-id;
 bh=WmdTK/AB2VM5/OZjks9WgJ5l/8tXDjMaW1u8BvINtFg=;
 b=2gEi+SQPPYMw9OaZLtSzmV5+H3ashzJ1sh/xmsOhkEz0UvWtQsyH2QFFrlvysBeZLVa4cJUxk
 W1afdC/2m+FBeb+psyC50MqviraxT/XgQITDIUWG2zppp5NV3Unilu3
X-Developer-Key: i=xunil@tahomasoft.com; a=ed25519;
 pk=FTZVGUexvkWb4j8v0wbtm7CtJLijIAaa5x0XV72WWC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_143814_810536_44751618 
X-CRM114-Status: UNSURE (   9.68  )
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

This patch adds a section for the LinkStar-H68K-1432v1 board to
dt-bindings.

The Seeed LinkStar-H68K-1432v1 is a travel router using an rk3568.

Signed-off-by: Erik Beck <xunil@tahomasoft.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 5772d905f390e53b44f9093d32b869a7e0655db6..7f3904b69293f31fdd4f6080fab5ce054c1abee2 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -1109,6 +1109,11 @@ properties:
           - const: rockchip,rk3588-toybrick-x0
           - const: rockchip,rk3588
 
+      - description: Seeed LinkStar H68K-1432v1 RK3568
+        items:
+          - const: seeed,rk3568-linkstar-h68k-1432v1
+          - const: rockchip,rk3568
+
       - description: Sinovoip RK3308 Banana Pi P2 Pro
         items:
           - const: sinovoip,rk3308-bpi-p2pro

-- 
2.43.0



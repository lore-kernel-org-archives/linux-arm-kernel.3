Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3792CEBF61
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 10:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mek+Cd+nMSRi3Fz7aCpPRgu8R7ZfoCVNHQDnn5kdoCw=; b=0z7UapHXck9Gv5kLJsK64nmw+N
	RUDPgb5m7uUtSwxK0yTbq5TLh2CYvP+j286GKcRMCCQ7MKE/Kbwf6QHLgU92DKbEX+hBTRgHAijAk
	t+BKBjilqhnbZNnM2c8ciBllV9P4x/slwkWHYn5AurclfACKLFxhTl15fIsygIsvI5/BEoqj/ABq8
	np+RFDgOPZbDfW92PVQ8pugW2yWaE9ooUd6kR3r5+QKF9y5mNdzhAHa2m4iUXNYe4K+oh9DsqVdkc
	14pCS3iKUdtOl79rDOnWptYtxExcoGTA2wTzCWUu1abcj/zBNPpUUQMOimiDTcyKQcLRIoNYS8XpA
	YEenm6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwIJ-0000000FrVy-2RXO;
	Mon, 17 Nov 2025 10:17:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKwIB-0000000FrOA-3R5n;
	Mon, 17 Nov 2025 10:17:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96AA241658;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E62CC2BCAF;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763374622;
	bh=qkadhoVgwtKGC7dxnnB7hY1uWxAE7LIEZwUFdYKyPa0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GZPPHFQ+xR40SmP331Ro02GoWSdTYVpYAcIFNGRJjzg/+m2jLQXbF7ngUtRDzsfqZ
	 UUHuGrcX0tdpDs0nVRLHBSWk/fwkL+gIJc2gYv+xVH8WQpmmm93aFYaYHQ0gbrdxFi
	 dJ+YrU7llHe8rwGpXM4H1BW14rImGDk5QQB7V5CUznYvE5HSOVS8xyVuJ6TrLE0oyG
	 Q2wclCx9LA8wSplisrxi6Q1WhTwyANbct1u2UsVOhsLWxwzR/57BNt+C/sOa2PirFi
	 n5rLJ20q3TMdvVwCLdXX4rVjtllww4PRJLLFXZ9b2B1eCD1XdAlG4GK1Oc4FJfQbBN
	 s1KDox/o134oA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54966CEBF93;
	Mon, 17 Nov 2025 10:17:02 +0000 (UTC)
From: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Date: Mon, 17 Nov 2025 18:17:03 +0800
Subject: [PATCH 4/5] arm64: dts: amlogic: s7: add ao secure node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-soc-info-s6-s7-s7d-v1-4-6ab8aab03dce@amlogic.com>
References: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
In-Reply-To: <20251117-soc-info-s6-s7-s7d-v1-0-6ab8aab03dce@amlogic.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763374620; l=856;
 i=xianwei.zhao@amlogic.com; s=20231208; h=from:subject:message-id;
 bh=jgUllk/cZ9b+GQwFjhTwGDyXMhwvUcYN6gknLaho5G4=;
 b=+fJSzmp2ZXbm+qBRsh+I5IVCxeqgPN3o5CKYrNy2wojHUTpgM7jn4PzqDo6BdqKWaluKsKzJQ
 i046InkweMEDxX+XOOLRfdrakT/h/d0GiTnQEWCVjuaCER3xdTBP8x9
X-Developer-Key: i=xianwei.zhao@amlogic.com; a=ed25519;
 pk=o4fDH8ZXL6xQg5h17eNzRljf6pwZHWWjqcOSsj3dW24=
X-Endpoint-Received: by B4 Relay for xianwei.zhao@amlogic.com/20231208 with
 auth_id=107
X-Original-From: Xianwei Zhao <xianwei.zhao@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_021703_893207_0A968558 
X-CRM114-Status: UNSURE (   8.39  )
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
Reply-To: xianwei.zhao@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Xianwei Zhao <xianwei.zhao@amlogic.com>

Add node for board info registers, which allows getting SoC family and
board revision.

Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
index d0b63d3fc953..dd7e3de2a53d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-s7.dtsi
@@ -221,6 +221,14 @@ gpiocc: gpio@300 {
 					gpio-ranges = <&periphs_pinctrl 0 (AMLOGIC_GPIO_CC<<8) 2>;
 				};
 			};
+
+			ao-secure@10220 {
+				compatible = "amlogic,s7-ao-secure",
+					     "amlogic,meson-gx-ao-secure",
+					     "syscon";
+				reg = <0x0 0x10220 0x0 0x140>;
+				amlogic,has-chip-id;
+			};
 		};
 	};
 };

-- 
2.37.1




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5509ACC6B2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QxD3BXUgROx/DxBHF5mVwQDAczDItWWb9ZAdyiuH0/k=; b=21IbgicqAtlpBO16TBiEfbTe67
	wiv1dh0qf423jKJgvXIHIy3T5aeUvOPj+hIrgiCjF1pVnNoWhZhZcdbtOtUoWxyGQCL4d4jGXYG9I
	L20WfRCsuZhTYXVX8zr6IZuB24hN9+aYhG6zOkoYMQimoUjBN63j8rcbRt7AEf+QNakomefItrVeQ
	YsYIPCpBeVzdQ2yHHBS62xlMbKgtF7Gv+dLlbSdkmJWdQTg/UWUcs3M9ljlCNUHJ1JAJNI71YrrfC
	mUv91n1RuEr4av7iN0PMaP4EpbORaTk3E41ihmeX/+HCTVOEVQoOYZ9UP3CeIDWJwfk4hit6FPZrd
	FdnpA2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Zz-0000000GKVh-3M2C;
	Wed, 14 Oct 2026 21:32:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6Zx-0000000GKUM-2gnl;
	Wed, 14 Oct 2026 21:32:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E33D8447AF;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 890F01F000C8;
	Wed, 14 Oct 2026 21:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792013524;
	bh=QxD3BXUgROx/DxBHF5mVwQDAczDItWWb9ZAdyiuH0/k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=E9AkLw6tAD0kA5ArjdRs0LblZckVSPSg/FPhl9yxq9UP5syH5ZpuOwVtiPprhKK8Y
	 sWvIRn8kf0YtGfDDcJ07iIPUwSHtOyKgzC2QFo8cUFxHT3jRXiqRpmqWC3Oedw85Wn
	 uVV8rGaNM08S/kQXGqtLB05U/M7rrtA+/7ZUufVUppQsOmrDMLevOEQNGFqb6E+HHt
	 PPwD77IRH49R9PPZvfDvwnrSHcbSlApAsywFpUhMVSrfm+LNr+mUsj9RlHlVa0CxCr
	 SkTO2/vM9Z3XbTTmndYILnSAyigIjRsU36235ZjyqJEW8TVplNA5wIvzEzryWrey3Y
	 /TBJNaEhicy9g==
Received: by venus (Postfix, from userid 1000)
	id 6C8F7180F63; Wed, 14 Oct 2026 23:32:02 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
Date: Wed, 14 Oct 2026 23:31:50 +0200
Subject: [PATCH 2/4] arm64: dts: rockchip: Use DP AltMode defines
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4708;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=hAKWppt69P3aSMCFACqtI8ev1qvUb4LfXXuZCSsxsJE=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBqz/TRDYL+ZY48L0pAQgXPJQ8MxkIoe1sy96tv1
 p25eTfs0LaJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCas/00QAKCRDY7tfzyDv6
 msY+D/9SXed8OsNRA3EGSwTIyxz6k7KL1l6mRG2IB0BaVnekybkikbn1x8oM+1i0qm21nlXppa9
 wHIrUgoZdG7u6hZhCQxe1+Ul0jYHRrAhn4K3Rn06g7UWBkLBM0Q6JdG13HKpJ5Zm2fLA8B0Tdw6
 WK+Gl2yl58jAq2et9YejxyQeVDRRjxlMJruOQ1BHz1bHBing4GxaRws2QJLvZwmRyGYcrt+7bft
 bKtILMmTaUM4hwD/mWGH5BEHNFHjz088pioTX1WNoibRXc7PQfJCo8Jvt4iPSCwUa4KeSQx3MaL
 LfFm/SIVCdXTOm+KPnFv7ef2FO0GCOt+sqv5MqlXB5kUQg5Z03jqhWlT3+dItN91Xk+M76beEnr
 Gm/7gX+CIXJghqO9GXw5RujuBwGwJcnu7wGccH/Yo6D47HVp3ytlfE5IwQVvFlSBc1A5N529+fn
 0Plcn+XsK1O1j3eiAx43WHTnB7Zz54OMZxOuuEp+4wyiS1zTQfqUINHBEkdIBqlnHbZDCW9RfdJ
 VheT3dBKaSkgwzKiqaAkBqX8n68jxJJwdBzEQ67KPrB7eIyjmqHTnduBJ2vJQfGOMFTLEoXrrFk
 xM9SZWeubtqJSxhVY5tWwP8k67K6FhKVQAoA+eC1M+w413hOKJ1+tED8YMn26KaCC+j0x50/i/H
 SXATn+d6lPam+Zw==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
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

From: Sebastian Reichel <sebastian.reichel@collabora.com>

Use the new USB-C DP AltMode defines for the SVID and the capabilities
VDO to make the DTs more readable. This also fixes up announcing
0xffffffff, which is simply wrong as that allows using the port in
upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
above HBR3 or pin configurations not handled by USBDP.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
 arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
 5 files changed, 30 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
index 358dea43f9b6..621f786147d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
@@ -911,8 +911,12 @@ connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index ebb231271e45..d154e9037ed0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -204,8 +204,12 @@ PDO_FIXED(9000, 3000, PDO_FIXED_USB_COMM)
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
index 4ac4465e39a5..e457fb37f3b3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
@@ -711,8 +711,12 @@ connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
index 13aaf63ad093..163ad7eef4fd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi
@@ -346,8 +346,12 @@ usb_con: connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
index ed36c27c2320..8f6f32ee2074 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts
@@ -392,8 +392,12 @@ usb_con: connector {
 
 			altmodes {
 				displayport {
-					svid = /bits/ 16 <0xff01>;
-					vdo = <0xffffffff>;
+					svid = /bits/ 16 <USB_SVID_DP_ALTMODE>;
+					vdo = <VDO_DP(DP_CAP_DPAM_V2_0, DP_CAP_CABLE_TYPE_PASSIVE,
+						      DP_CAP_UHBR_13_5_UNSUPPORTED,
+						      DP_PIN_UFP_NONE, DP_PIN_DFP_C_D_E,
+						      DP_CAP_USB2_USED, DP_CAP_RECEPTACLE,
+						      DP_CAP_SIGNALLING_HBR3, DP_CAP_DFP_D)>;
 				};
 			};
 

-- 
2.53.0



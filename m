Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67BFCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Nov 2025 17:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDs8kbwCuzv3Qb5BmYXwYP5JldsXD1hYrMKIH0qG1uI=; b=bJyFzTRXrK4yRojQvlHarzR/f/
	qniC39UT1OvKNgYIwsiEZHmo8H0Ukj6fMEdkEhYxtuLrpLaUXET4uztmvcEY6WPz78E9tIHxkso21
	QSY/lOoinFAtvdaZ5Yl60TLle9apWrGH5h7eDrkgWCBSOyXGjr2HifAm3+881dX7LK33Z+v6iwLBD
	p8oPUPlXgHpTsshkkSdeBZqZwW9Z6OmsOjEB19SMI92pRf6dTWXL2dYovKZLz2E7RVmHX1hxfRN3a
	Kh1Lts/3l16dGgl9BZVWx3xId1mprT+8kwtYac4oNseM3Nbtm8y0x8uSyvS1aJ0NQAT60JhcfY0/q
	6cW3KdSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI8rs-00000004BFl-37R8;
	Sun, 09 Nov 2025 17:06:20 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vI8rq-00000004B97-2fVG
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Nov 2025 17:06:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1762707964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aDs8kbwCuzv3Qb5BmYXwYP5JldsXD1hYrMKIH0qG1uI=;
	b=UcpRSje6/RzpyOYo4IZVlmL2TUgeeFWnCvceLyMfVeHIEb4eBlwaR4CcWlVCWGoU5zu5AP
	lWuWl/4+f8LkTxjsEXbKksxigl1NBB4uwVnjcrkbqn+RTZLiBdOxrk6lrzauFKc4UizPWV
	FjTkOq0ruslJRee4zAL2oZIqjFYKEN4IKoL0O9GtL6mUvilEMEorHZ7siId2w1rf54CRA2
	6zlFDjEDDuiNaqi9gaw5YaZRZis4jswAhpo7lK6PnLAw/RYNhPJ+KfkuiIvEMtACcPrGRE
	ajwH+X7r3SPagdcLBbucKChCCcUjslodsqliwqcqD07DCVAwVF1A3sf0p+wjEQ==
From: Diederik de Haas <diederik@cknow-tech.com>
Date: Sun, 09 Nov 2025 18:05:26 +0100
Subject: [PATCH 1/2] arm64: dts: rockchip: Simplify usb-c-connector port on
 rk3566-pinenote
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251109-rk3566-pinenote-dt-fixes-upstream-v1-1-ed38d200cc04@cknow-tech.com>
References: <20251109-rk3566-pinenote-dt-fixes-upstream-v1-0-ed38d200cc04@cknow-tech.com>
In-Reply-To: <20251109-rk3566-pinenote-dt-fixes-upstream-v1-0-ed38d200cc04@cknow-tech.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Samuel Holland <samuel@sholland.org>
Cc: hrdl <git@hrdl.eu>, phantomas <phantomas@phantomas.xyz>, 
 Dragan Simic <dsimic@manjaro.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_090618_831555_1256FF82 
X-CRM114-Status: GOOD (  10.67  )
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

The USB-C connector on the PineNote has only 1 port, so there's no need
for a 'ports' node with address-/size-cells properties as a single
'port' node suffices.

This fixes the following DT validation issue:

  Warning (graph_child_address): /i2c@fe5c0000/tcpc@60/connector/ports:
    graph node has single child node 'port@0',
    #address-cells/#size-cells are not necessary

Signed-off-by: Diederik de Haas <diederik@cknow-tech.com>
---
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
index 5c6f8cc401c9..7c65fe4900be 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi
@@ -485,16 +485,9 @@ connector {
 			typec-power-opmode = "default";
 			pd-disable;
 
-			ports {
-				#address-cells = <0x1>;
-				#size-cells = <0x0>;
-
-				port@0 {
-					reg = <0x0>;
-
-					typec_hs_usb2phy0: endpoint {
-						remote-endpoint = <&usb2phy0_typec_hs>;
-					};
+			port {
+				typec_hs_usb2phy0: endpoint {
+					remote-endpoint = <&usb2phy0_typec_hs>;
 				};
 			};
 		};

-- 
2.51.0



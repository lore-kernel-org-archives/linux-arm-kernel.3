Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13C8CD98E6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 05:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZQRrWBML9XrW0yaSxojfNILBLHfJnKTC/B2NAUw+MQ=; b=CeeqBcCYpdCEg05VjNUgTY5y87
	7W2zDoH9HwQCUxaJjGXyAhPupPTkse0tj63CrAXj7OfDLYLBsL3BFes6rARyKJeAtutqwcCrb59dB
	reknR07pvelzKhZ6YxmTaEA8N/v5QkB0ea6B+N3BAr8OnYk/SklbsUTcmqyV9S/FQvV1+kZId1nR+
	WwS3jUkuMrKRTLwpUx+IWyUvW4JP0/+aQ1U9toDfEwn9iZMnq1LnHaVUKAHVYx/Uu/PSVIud/CzH9
	4B/bzJ4kyI86l/k6yol9nUk0845IC9/7/hYSGZJ33BWFefLELCgAgdgXo7aNfWATffHDn2eqJ8O/5
	dhQ/uWxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRl3-000000020G8-13BW;
	Fri, 19 Jun 2026 05:27:13 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waRky-000000020CV-0tuq;
	Fri, 19 Jun 2026 05:27:09 +0000
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:327:f131:c148:b7f8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4F881E79;
	Fri, 19 Jun 2026 07:26:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781846791;
	bh=VmrlQL2ewOl0Oaj0OE/GsXfoUeFL3zFnMoITGcH5zcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uSLul4gEJ4GyrFBDapIUFwMMAiQLdQ9mbh7jW2hfjwD+Ad8uvT7S2jcaHdW1wadan
	 38cppBeEDl6VS5KaljCtKm4Pwp+EUO++7Ock4M29zsPlv16app8cpUo/Sxq8MXHURw
	 px9HmOJtv88s0FVf8V82YbfD8EqTo8SRzhtcqgYo=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	kieran.bingham@ideasonboard.com,
	dan.scally@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hverkuil+cisco@kernel.org,
	nicolas.dufresne@collabora.com,
	ribalda@chromium.org,
	sakari.ailus@linux.intel.com,
	Heiko Stuebner <heiko@sntech.de>
Subject: [RFC PATCH 2/6] arm64: dts: rockchip: rk3588s-base: Connect vicap and isps
Date: Fri, 19 Jun 2026 14:26:29 +0900
Message-ID: <20260619052637.1110672-3-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
References: <20260619052637.1110672-1-paul.elder@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_222708_435968_CD13505D 
X-CRM114-Status: UNSURE (   7.87  )
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

Add a connection between VICAP and the two ISPs.

Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
index 55c5c603c1e3..f36267720910 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
@@ -1493,10 +1493,16 @@ vicap_mipi5: port@6 {
 
 			vicap_toisp0: port@10 {
 				reg = <16>;
+				vicap_toisp0_ep: endpoint {
+					remote-endpoint = <&isp0_tovicap>;
+				};
 			};
 
 			vicap_toisp1: port@11 {
 				reg = <17>;
+				vicap_toisp1_ep: endpoint {
+					remote-endpoint = <&isp1_tovicap>;
+				};
 			};
 		};
 	};
@@ -3551,6 +3557,18 @@ isp0: isp@fdcb0000 {
 		power-domains = <&power RK3588_PD_VI>;
 		iommus = <&isp0_mmu>;
 		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				isp0_tovicap: endpoint {
+					remote-endpoint = <&vicap_toisp0_ep>;
+				};
+			};
+		};
 	};
 
 	isp0_mmu: iommu@fdcb7f00 {
@@ -3580,6 +3598,18 @@ isp1: isp@fdcc0000 {
 		power-domains = <&power RK3588_PD_ISP1>;
 		iommus = <&isp1_mmu>;
 		status = "disabled";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				isp1_tovicap: endpoint {
+					remote-endpoint = <&vicap_toisp1_ep>;
+				};
+			};
+		};
 	};
 
 	isp1_mmu: iommu@fdcc7f00 {
-- 
2.47.2



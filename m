Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76E4FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqG+hmbnpLQo8EKu+bSNJysSCdwKzPG3j8sEzdXti8U=; b=p/1ZsgrtD9ueXuSgNVVFsdg6p7
	HBaNKzdYREVbKTFtnVUFPY5ssuqReW2Onpmqp+49f7ZxjGq4crV4mFjs6ufMyEDarunBVIJWBqu8U
	fklOvpoqS7AZV8Nnf6I35zj+KQiUN8z0um6/SCbpZ+vlXHtta7jWTqO+ypJjCQriXozqb6Xqv2Q56
	FU7lx4TgTUd4UMDXBYgXBGJAeKMjPiKYkcoirhgv94xy3AmmecY6MyNt/slI+UpRYeouS85LgRFbp
	i0q21qiCt13W1vKMVxP73hzZYje4X7Q0VNTXVh04uiNGxBDMYhP5fadnKOqR3TiLjGEsZAz88U60Z
	Jv8NsHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxt-00000000DeQ-3wuG;
	Mon, 27 Apr 2026 21:58:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxh-00000000DJn-3AR9;
	Mon, 27 Apr 2026 21:57:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327071;
	bh=pqRtbplYE8IdJKdBWhM5OHW77gHMGDEF1m/tI0sVmVg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KQLXIHWJdZT0TECVDrV5VZQulabse1tqARayoCENAjGajdd5B5KWN683h6Y3vIu3U
	 5CVfEqlvA3dilYUNKiO+TrtyWoyUJnTtsJIduQICpxwoesLS2fABYxCowaeIwW3jYD
	 zsfok6b79zkMnZzdofnsKK0lRaCTrOmE77rQLOc2LWcs4zZcMK0ocsLOisn+MQu63P
	 pYS02iAetB/LAyB1aMrkpAqY+UlTBq7t6RNCuxQn5TvMCUg7hp3Bg0l5n/c6gFnPR/
	 Z+PAkRZILC9fLTjqMDKyTsK+H3/EVTL7qGCDdhuFrL++UeYsbFn3UevNYGhP9FEv/J
	 n4LzWoTtnCv9w==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D5A7E17E141F;
	Mon, 27 Apr 2026 23:57:50 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:28 +0300
Subject: [PATCH v2 10/13] arm64: dts: rockchip: Drop unnecessary
 #{address,size}-cells from rk3588-jaguar
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-10-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145753_996592_D3AC70E7 
X-CRM114-Status: UNSURE (   8.43  )
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

Remove the unnecessary #address-cells and #size-cells properties from
the usb_host0_xhci and usb_host1_xhci port nodes, as they each contain
a single endpoint child with no reg property.

This fixes the following dtc warnings:

rk3588-jaguar.dts: Warning (avoid_unnecessary_addr_size):
 /usb@fc000000/port: unnecessary #address-cells/#size-cells [...]
 /usb@fc400000/port: unnecessary #address-cells/#size-cells [...]

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
index 05b524f682cf..033db78aff67 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts
@@ -1142,9 +1142,6 @@ &usb_host0_xhci {
 	status = "okay";
 
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		usb_host0_xhci_drd_sw: endpoint {
 			remote-endpoint = <&usbc0_hs>;
 		};
@@ -1157,9 +1154,6 @@ &usb_host1_xhci {
 	status = "okay";
 
 	port {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		usb_host1_xhci_drd_sw: endpoint {
 			remote-endpoint = <&usbc1_hs>;
 		};

-- 
2.53.0



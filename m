Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DA8E7314E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EhVb5yGZ1zhDpefkAq3fj7Ju2t0Jg9DqfM5XxT3r0rw=; b=NFsIiKQxeOeHxLsLFVfsTBnQVB
	Ox/lWB8jAD8Pc63XNhlorGiEKaH1F9jcYMaxIOv7n/yPxqqZSehkdaQIWGJEQTI7ndo+OhOlVFoXS
	FoGZWeibrz/diRdX3MJUorgUWlYYuqMwgvnJ/1Oeuxjg6wbCb3Ap1bA+0/mhe5G28yT72wWrv5/tQ
	IWQKdvwdeqw5hW8R4XatmzNcO/A+PadxRewdjnTT053QBKQq6tiRpG4WZa6XDaIWnbX9SoQMBHTv8
	3D0ZfcuUv22yHLi/KUtkRMAFJFhixnlT05+Ooy4zM1HjxBd7/gyV4US10toLHIWLR58/zLKsusTV8
	tHiy5NPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr9r-00000004p1r-0i5g;
	Mon, 02 Feb 2026 10:27:51 +0000
Received: from smtp-42af.mail.infomaniak.ch ([2001:1600:7:10::42af])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr9m-00000004oxq-3JSf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:27:49 +0000
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f4N9B1XMVz9km;
	Mon,  2 Feb 2026 11:27:42 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f4N993hzRz8V;
	Mon,  2 Feb 2026 11:27:41 +0100 (CET)
From: Quentin Schulz <foss+kernel@0leil.net>
Date: Mon, 02 Feb 2026 11:27:26 +0100
Subject: [PATCH 2/2] arm64: dts: rockchip: fix Ethernet PHY not found on
 PX30 Ringneck
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260202-px30-eth-phy-v1-2-ef365be64922@cherry.de>
References: <20260202-px30-eth-phy-v1-0-ef365be64922@cherry.de>
In-Reply-To: <20260202-px30-eth-phy-v1-0-ef365be64922@cherry.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Heiko Stuebner <heiko.stuebner@cherry.de>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Quentin Schulz <quentin.schulz@cherry.de>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_022746_965318_3D4E1AD0 
X-CRM114-Status: GOOD (  16.35  )
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

From: Quentin Schulz <quentin.schulz@cherry.de>

When not passing the PHY ID with an ethernet-phy-idX.Y compatible
property, the MDIO bus will attempt to auto-detect the PHY by reading
its registers and then probing the appropriate driver. For this to work,
the PHY needs to be in a working state.

Unfortunately, the net subsystem doesn't control the PHY reset GPIO when
attempting to auto-detect the PHY. This means the PHY needs to be in a
working state when entering the Linux kernel. This historically has been
the case for this device, but only because the bootloader was taking
care of initializing the Ethernet controller even when not using it.
We're attempting to support the removal of the network stack in the
bootloader, which means the Linux kernel will be entered with the PHY
still in reset and now Ethernet doesn't work anymore.

The devices in the field only ever had a TI DP83825, so let's simply
bypass the auto-detection mechanism entirely by passing the appropriate
PHY IDs via the compatible.

Note that this is only an issue since commit e463625af7f9 ("arm64: dts:
rockchip: move reset to dedicated eth-phy node on ringneck") as before
that commit the reset was done by the MAC controller before starting the
MDIO auto-detection mechanism, via the snps,reset-* properties.

Cc: stable@vger.kernel.org
Fixes: e463625af7f9 ("arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck")
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
index 4203b335a2633..973b4c5880e24 100644
--- a/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi
@@ -344,7 +344,7 @@ &io_domains {
 
 &mdio {
 	dp83825: ethernet-phy@0 {
-		compatible = "ethernet-phy-ieee802.3-c22";
+		compatible = "ethernet-phy-id2000.a140";
 		reg = <0x0>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&phy_rst>;

-- 
2.52.0



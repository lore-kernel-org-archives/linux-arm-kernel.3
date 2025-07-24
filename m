Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54420C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 17:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=f46adWkIVh1sMgckXCvT1JWP1ZCJysis6LeCi1UMlGA=; b=TqcOHw0OwkLtSBEalnT7MExzgp
	7GJjpqMZmfpgvDjhB7IKoSDQBYfpCOi/aYoYMJ58mLcsOJTERM1mzoJ2C+RZ3ed9jHifdUNCqfFRH
	xsbVld2O1Gr+FraFJ7DX6N2Us3NVsgZfYSVQPzTNWHE4x4NnehhL/ebafYDoui74dDYN66p8UTkVx
	cnbkcXuPSXwiwaP+JUCeGHPWW9BXBhxc4CxzPjkQiOjEyU3IK7RHadLusYP+qRqkECMRZWxq3ZB1O
	4vVdAoRaeFT2R/7k4WBaCdvuVuEWaM72LMBfBTgtGDgTcf4DVWH5d1evbwBHLcF111ZKU2CvIge8n
	HaNM+duQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezNf-0000000836d-1xQq;
	Thu, 24 Jul 2025 17:05:19 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewyt-00000007l1F-1upd;
	Thu, 24 Jul 2025 14:31:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753367493;
	bh=u9PdAYuALXEVozae3RfJMx3RFx6T5Oe/vgBOyHiZLK8=;
	h=From:Date:Subject:To:Cc:From;
	b=lSMuodqp7YZ23b38WJ2oV1WBi/fZCKhs4ma5VVLSiqYHgwSS0IYRYWhNg8xEu9vKv
	 nT0U1beQPVNKE2vHcuzK7w63mbpITTrT9m7Isp1RE57o00oCk0yx9uslrBaYeStGYo
	 tmBQSgqbR6UuoQXt3xiQIbALojBr6qlGBmrWH1U1ixxfRqWuo+8tIjqmyPeXKuxUrr
	 ZlriQmuVFgYsImJ5jAA9v11QpPyZvsGDSg5hlaUeWCq5QZQNngzZZO9XFYAClYFVjA
	 RD0uW4jl68BclIwhFNNsRD09gw0p9yySbMl9ND/InXNzt28GWYtiuW/QcBQ7Api17G
	 OsQ7a+70z1xvw==
Received: from jupiter.universe (dyndsl-091-248-210-114.ewe-ip-backbone.de [91.248.210.114])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C15917E0B72;
	Thu, 24 Jul 2025 16:31:33 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 07205480039; Thu, 24 Jul 2025 16:31:33 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Thu, 24 Jul 2025 16:31:25 +0200
Subject: [PATCH] arm64: dts: rockchip: use MAC TX delay for ROCK 4D
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-rk3576-rock4d-phy-timings-v1-1-1cdce2b4aca4@kernel.org>
X-B4-Tracking: v=1; b=H4sIALxDgmgC/x3MTQ5AMBBA4avIrE1C1U9cRSzaGkxEyVSEiLtrL
 L/Few8EEqYAbfKA0MmBNx+Rpwm42fiJkIdoUJkqs1pplKUo6wplc4secJ9vPHhlPwWsrCarrWn
 U6CD2u9DI1//u+vf9AMmpQXtrAAAA
X-Change-ID: 20250724-rk3576-rock4d-phy-timings-6b4eb4ba82fc
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Andrew Lunn <andrew@lunn.ch>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874; i=sre@kernel.org;
 h=from:subject:message-id; bh=u9PdAYuALXEVozae3RfJMx3RFx6T5Oe/vgBOyHiZLK8=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGiCQ8ROUfuRfo4mNRUGEaWZbqk0Wkbt8RBEL
 w3/ULol4z1cW4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJogkPEAAoJENju1/PI
 O/qaMSUP/13LhvhKXd0+OszgpGriuOkZE/79bCvrU1METdH/ofIq1UZMuht+thZw7M2dZejhYhB
 LNgFfxK3ci+Ffmrt+Wl+m3ZG3fZ4itWPPRtmbS2Lpy3XZk9zsjw4TBZmwoELGT2A7RwQFC+iINr
 gJMEHVDY5UlsnyonFSt8qu5Cy0vymNH+FqIDypFTP6uA6EX6PbpF17QqGlfGCrp2TppxBBKL8X1
 sb9AFtoGFfrBUHwxVvCVPepWzOQdrS3CUHZ5oktAIS+eK6wO2fZoxHKPYwcFS+TxaN1RcJnM5kA
 +M4FbuhevnUybNLdvxvoFevajz5bXo9J9PajrIlGnwXI3sPnVUioeymlPI9q7LLOhXAKMMIyVN2
 kPMyjqTTW8Onfp4akskSaC0mNSNBPmvvvxvFjVdyPf7gJOGrEMuuA4ur9xUxObr4eQrtAuwoCBS
 z/GMx1hWtvPnRZxVpeJXU6ZUNSwQYLyxhnZ/42vKgJjD4NQKzNgsTmldR9w5eoJAJmtZmktunQz
 vfcT1zXSPNC3EuraiEKcS3p1RxUwnJlyCbgOiHhYyNBHmGwRCzeF+4toNmA+YfDRY5SWEcgfbel
 OyF07/JiK8f7u31M2BgdHFbqhXdiHMHMEzHBae8QepHDNONnUWn5P1QbyoQAyxNcykXPVBUmjrl
 GewoN3r2NJh5VXpayUnctgQ==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_073135_677905_FF9C2B3D 
X-CRM114-Status: GOOD (  20.82  )
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

According to the Ethernet controller device tree binding "rgmii-id"
means, that the PCB does not have extra long lines to add the required
delays. This is indeed the case for the ROCK 4D.

The problem is, that the Rockchip MAC Linux driver interprets the
interface type differently and abuses the information to configure
RX and TX delays in the MAC using (vendor) properties 'rx_delay' and
'tx_delay'.

When Detlev Casanova upstreamed the ROCK 4D device tree, he used the
correct description for the board ("rgmii-id"). This results in no delays
being configured in the MAC. At the same time the PHY will provide
some delays.

This works to some degree, but is not a stable configuration. All five
ROCK 4D production boards, which have recently been added to the Collabora
LAVA lab for CI purposes have trouble with data not getting through
after a connection has been established.

Using the same delay setup as the vendor device tree fixes the
functionality (at the cost of not properly following the DT binding).
As we cannot fix the driver behavior for RK3576 (some other boards
already depend on this), let's update the ROCK 4D DT instead.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
There is an additional problem, that the link does not come up in the
first place. This has been handled by the recently merged (and less
questionable) DT changes [0] combined with a PHY driver patch to trigger
a PHY reset after the clock has been enabled [1] (I will send a new
version of that patch after this one). Stable network support on the
ROCK 4D requires all patches.

[0] https://lore.kernel.org/linux-rockchip/20250704-rk3576-rock4d-phy-handling-fixes-v1-1-1d64130c4139@kernel.org/
[1] https://lore.kernel.org/netdev/20250704-phy-realtek-clock-fix-v1-1-63b33d204537@kernel.org/
---
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
index 0388d72076bf79ee4f20ac1d3bc04fe1859f857b..f105ed675d3671e93916c830a9a17dc240ca5fda 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts
@@ -237,7 +237,7 @@ &cpu_l3 {
 &gmac0 {
 	clock_in_out = "output";
 	phy-handle = <&rgmii_phy0>;
-	phy-mode = "rgmii-id";
+	phy-mode = "rgmii-rxid";
 	pinctrl-names = "default";
 	pinctrl-0 = <&eth0m0_miim
 		     &eth0m0_tx_bus2
@@ -246,6 +246,8 @@ &eth0m0_rgmii_clk
 		     &eth0m0_rgmii_bus
 		     &ethm0_clk0_25m_out>;
 	status = "okay";
+	tx_delay = <0x20>;
+	rx_delay = <0x00>;
 };
 
 &gpu {

---
base-commit: e05818ef75bee755fc56811cb54febf4174d7cf2
change-id: 20250724-rk3576-rock4d-phy-timings-6b4eb4ba82fc

Best regards,
-- 
Sebastian Reichel <sre@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA95C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IYikmDMba8G2LzQ01Ao1OTZqbg3k3ecnWxhXvCaq+PU=; b=0M8XmNOXzaKO06qSMxde6qAFZA
	Y5vVwbPubMvisS3jNX/A7XxW0cDZoAbp9AXQiXOBVV/r5c50gqZxWIz9kLigI4pzYo1jlF5NztuxP
	nBUHwCdyUOwY2EkPeJbkySV//J+Y0od8S1piTrmfsW289/gF46uBDaohdJpcjeNCveWK0lgR07pf0
	TAMOrI5IYRyImAnfB4oXwOveWdinSpR37UPu7hIG297lS8i/sxMZw7LpOO5NCBiZS0PSTBVNjuMVw
	qmY5y/R9m7EwANr/Jwc9lBD3ESZT56E1pBf8TqquSDh/a4H1eShhZKA9CJI9zdC4vjNoHTwx1AW9f
	RwZIhSsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjinZ-0000000D5IY-0d5E;
	Tue, 14 Jul 2026 19:28:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjimD-0000000D3PG-39Bk;
	Tue, 14 Jul 2026 19:26:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IYikmDMba8G2LzQ01Ao1OTZqbg3k3ecnWxhXvCaq+PU=; b=D2huuWyioaw2IBmR+oluchO2Sx
	IsM2VRnqcUH1AmB8MVCXtRMk3BAc3XUQpOUYjqMk+ZNGz6fKgNnULwj9jofYz1gPpGX4Aal1XVOHy
	rCoomsX21VkhUzf21ptnCWRZGSEUpMg4Km+eGJrgT+aziWNGKalBn+Xyvfl2LOwd3/75se8vJAMkZ
	3tGv4t9G1KAfv1FhjrG1P87XkSHiC/3pSWl0AIZNVoF9sDvMlBd0kf7fowcVpwg4IWH6ixHehmScv
	FpcB4r2m3bQtr18S6FF6hahtA/qvh5/47l9kCbl+60wfO3eputDMKpfqRxg7PvlcFS04qYWLIO7tb
	kwRlUGRA==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjim2-0000000Co8v-0onU;
	Tue, 14 Jul 2026 19:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784057174;
	bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Rk9Z/R42FF90Hf6BQKBh6UG09k8y4+0WjEMOKoxcv3Qmy3g7Q/oItkjBM/MVc3Y/U
	 LtgvS1qp2fSKETmGky59xN2Taz1TP1qSwrM41Kaw6A7BoaKBdACKMThJ5uB/Gl3lL1
	 nregYd8BcQeaur+WNAkhqWtABPKfChL+Q7V+vrh2wtoaeh3bOGHi6zYWhXlsZyC+9K
	 zteFaO5pdwL6hSV+eguxgRI0z96VOes4pEyVI58oE8Az7qgocs2q+bEDluuMMiPUej
	 LA4LwigCaO3KB5nYHK1kQ09TEDJMfroLUwuCvcBzi8wVa6sarYK/RnsVd+UOzWMmxU
	 Qp/UBsxpu1o4g==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D0F517E36BC;
	Tue, 14 Jul 2026 21:26:14 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id E0FEC48004E; Tue, 14 Jul 2026 21:26:08 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 14 Jul 2026 21:26:14 +0200
Subject: [PATCH v13 13/35] phy: rockchip: usbdp: Rename DP lane functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260714-rockchip-usbdp-cleanup-v13-13-6cb3e769d4c5@collabora.com>
References: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
In-Reply-To: <20260714-rockchip-usbdp-cleanup-v13-0-6cb3e769d4c5@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Heiko Stuebner <heiko@sntech.de>, Frank Wang <frank.wang@rock-chips.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andy Yan <andy.yan@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Yubing Zhang <yubing.zhang@rock-chips.com>, 
 Alexey Charkov <alchark@flipper.net>, linux-phy@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@collabora.com, 
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2007;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=Cq66EKeE2flHvN+UE+9Jd7VxqMbU2uK/j0/Drv52Xi4=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpWjU8PsBrTeDHuwd30ncJpcP7OaB7DFoutj
 QE6UqAabWAzW4kCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqVo1PAAoJENju1/PI
 O/qaJd8P/3sIBsWLap93/EdAi2yXwxyjzrE6xD3YK8WGN3OfdL7k7V6mHLJzMQV4mWkQspATGvC
 h9uie7H2bQfZAagedPCIQpUmn5DN7gDBqFltuVsz4k+U2uL8+YZDlvRDfQv550Zb3NPcLut8pO5
 tCKmMZ15+2b4cZwukSzN95C46aTaeWyedLVhUezkQRFSITMly03h8+EWt/fSIzfSfXJ0tS5+bZA
 KKqAUAzDoGj4uJVJNUoxCgF6ktVgUAnFPQ1BwmsZ81kRKn8JocE51vlYN6OaUVdygwQxNLOGNv+
 12TfpytmGAJWkQqzukfxszqahd47vBhafpxWMMp8TG3KyD6Utalh70XEfaSsWwjeAsTgj4byfzP
 /FaNBQqLJC1amyKbLXYVY2MYpyh10QDghOHhETCjzULTrmCQlt6U6o+wwgZzfuesbf36Pvk3VOP
 Wqe580QiauEbzTXg1u3w4afCDTOJF+aTPuq0AmyOwGukWVXQJSbPIyj3SfKDKZJe1sT+VGpRJoz
 OHHeG9Y8/xfJiC5EMxse6t+e/FJsMe0kWvjKJOUJNWaOxjniXdTX92a+EVJlDIit1FZnsXAMtax
 ghcbBdaMFSal+Q57BqW4h3Vx3rrCADUXafPf1Rf9l51YQF7GHQaxWr4yDru+ensmIkpe5NcSJK+
 C05TLAa2ejAcGK48tWOolEQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_202634_429629_6357829F 
X-CRM114-Status: GOOD (  11.43  )
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

The common prefix for DisplayPort related functions is rk_udphy_dp_
(with a final _), so update the two DP lane functions to follow that
scheme.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index b172ce6a722e..7fb864a1486c 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -545,7 +545,7 @@ static void rk_udphy_usb_bvalid_enable(struct rk_udphy *udphy, u8 enable)
  * ---------------------------------------------------------------------------
  */
 
-static void rk_udphy_dplane_select(struct rk_udphy *udphy)
+static void rk_udphy_dp_lane_select(struct rk_udphy *udphy)
 {
 	const struct rk_udphy_cfg *cfg = udphy->cfgs;
 	u32 value = 0;
@@ -574,7 +574,7 @@ static void rk_udphy_dplane_select(struct rk_udphy *udphy)
 		     FIELD_PREP(DP_AUX_DOUT_SEL, udphy->dp_aux_dout_sel) | value);
 }
 
-static void rk_udphy_dplane_enable(struct rk_udphy *udphy, int dp_lanes)
+static void rk_udphy_dp_lane_enable(struct rk_udphy *udphy, int dp_lanes)
 {
 	u32 val = 0;
 	int i;
@@ -1049,9 +1049,9 @@ static int rk_udphy_dp_phy_power_on(struct phy *phy)
 	if (ret)
 		goto unlock;
 
-	rk_udphy_dplane_enable(udphy, udphy->dp_lanes);
+	rk_udphy_dp_lane_enable(udphy, udphy->dp_lanes);
 
-	rk_udphy_dplane_select(udphy);
+	rk_udphy_dp_lane_select(udphy);
 
 unlock:
 	mutex_unlock(&udphy->mutex);
@@ -1069,7 +1069,7 @@ static int rk_udphy_dp_phy_power_off(struct phy *phy)
 	struct rk_udphy *udphy = phy_get_drvdata(phy);
 
 	mutex_lock(&udphy->mutex);
-	rk_udphy_dplane_enable(udphy, 0);
+	rk_udphy_dp_lane_enable(udphy, 0);
 	rk_udphy_power_off(udphy, UDPHY_MODE_DP);
 	mutex_unlock(&udphy->mutex);
 

-- 
2.53.0



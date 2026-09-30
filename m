Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAE1CA5FC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yIxks3DXTrqp82FQeTc6lc4nvaDYoVa1/B4+8wPGph0=; b=12LnudMqw8M5pO6Oihv9h8Lu5u
	FCr3Y5DrSMezxlDhozyzfQGdE+c5yOQdcCe4rjVZoIXzj4Uu5lfaWdIffuQn/Rl9L48P7YIofMKO/
	SxuWeGey03a1WvCMCS4cSrb6xdwZo7j3vfFBIeMBxagLVPFR2WSa0cBRroXJCI7qzJDXl2sLX3P4m
	vdUfJRVFzGYb0niKxvqdZ/XuFFOUnkA5UXZUYkWy9YUN2cHpVSfeR9eMzw4BoyksbRIW9IQu0WZoZ
	7zeW9CPyyiRADzouxIX2loYL/8A16pmIWhl0cP0aVpT8EeLTaOMlQ8Z64B4P6qDWEvCTJ/Au/JLx5
	8DGDZy+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrC5-00000005fCa-3XMG;
	Wed, 30 Sep 2026 10:05:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrBQ-00000005el0-2P6v;
	Wed, 30 Sep 2026 10:05:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=yIxks3DXTrqp82FQeTc6lc4nvaDYoVa1/B4+8wPGph0=; b=ZRrcWY9Q6e25mcJQKnOHXtNtPS
	oMeD2wm7GzM8vdEajhDg/bCdOJ5oYX9gpSOS+lI6qgQxdorMS0hNVQ8mWsv1UDZHGlbDHKHDVpTYy
	ENYdrFp/S6B1Pc08Jor+Pj3+yt4VUOKDg4H7RVM+NSRPshBCfhaYrJLjxr2bTDOLz6YEqmuKYRR+p
	/QBLgqdnuSa+Z94L7Os4G7x/tOSefQ3xe62xuWOoqZLslzJ/sSBL8et15JBSiHQB0kG3BDGhB2FB3
	cYgfPjw6DLaCSf7fL++N+wxzrS5Ub268MM/8ZfrR9MjzG8wYVOl36/KTdD2QRksGY4X3tsscgPE9E
	ve4UW6oA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBrBK-00000003cNe-3DaL;
	Wed, 30 Sep 2026 10:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790762687;
	bh=N/gfAH31l8mrKB/AS7h6cKPIeBrVPBLmkhBTL9KMgHY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NzdKf8B1WdR5g8hVvGdAHZOjiAZCB5ntzf9T5s5EIgRwwr7vIHVwcSRlGj5LiMe/p
	 gwCfwg827oq5B4rtkJOj0pIEE54ly7lMYoRZqi9ROTvdhmK69brThK3GgRv2XTKCmg
	 Vy8/ztKegArNb+H4YEMjNeyQTyWv2LvjAYEEI22QnnWsTB1PRWHeAMiDvK9gD4AzZl
	 SLSucwySAyR37kvZ0q3W8aTKpmKLCfBVih+5vDymZRjFSNLeDGOQAtIa3ov0jCzTP3
	 jfYXIfnUpceryvV6+nlqqyFWdfu+LqfryS+S1k9nXlsCPJGhGEDDCAuVa3Dfdz8Db1
	 7EWbZHnBcsVtg==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 603F917E0D5D;
	Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 113E8480030; Wed, 30 Sep 2026 12:04:47 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Wed, 30 Sep 2026 12:04:32 +0200
Subject: [PATCH v16 3/7] phy: rockchip: usbdp: Drop -EPROBE_DEFER hack
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-3-bc144f80afc4@collabora.com>
References: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
In-Reply-To: <20260930-b4-rockchip-usbdp-cleanup-part3-v16-0-bc144f80afc4@collabora.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Zhang Yubing <yubing.zhang@rock-chips.com>, 
 Frank Wang <frank.wang@rock-chips.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com, Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Igor Paunovic <royalnet026@gmail.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1574;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=N/gfAH31l8mrKB/AS7h6cKPIeBrVPBLmkhBTL9KMgHY=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGq83r7EPXloWqTEAU0T+XU9pKXT4yYtgyc3f
 avcsSV4rGMlbokCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqvN6+AAoJENju1/PI
 O/qaYLMQAJJuIMYvglmvGiIxtokwteqhIH/nYyTEIJS7Lr6tJxbxzZJ5rmOo1dXqnaDihdYmPuW
 z4HbZPChiZFR0MJqbLTvUWt1MQmcTGAOgapo0UAG2bf/R4Xhjky14zQRXv1EK3BazggM1WJh5+g
 gLXfNAhepDMrK2GUo5gXr6wuDwcRTO+4t6oudYkOX9cI6AYlQYFjnnS5/71OoUTPUdLSvYsqgE/
 MPFp5NWJ7dZ/SyHhk/TLKikA/M3yvQY2eAebRS6X1kLnO/Xg+nJE19UL7bK+y3f7IkTSsaNixcg
 fFHhcLmpgIkvOlTloI4LQuaCx9eGRcqq7q9WQf8Kd1aq/02MAgtnmwR6EgYWJcpnP0sfqUj/8yD
 4iDSy7Cbmx85/DZlAykydcpcheSqfrcNc3n39B41g98vcB9fup00VlXRYdlBLdgyz9C9a0kO3XS
 pJ3YoGP357zgZzui0UB+98WksFhzsFmTT0Ts0zOAkdvKResVZ99Ivq5iSV6EXfDRqM2y91jqLIT
 FvC1Lb0MJuCzDgq9pf4cjgFJUFkYEB1ezVq/XzYUcoulC2hJqHj/wDPm/X93rkZWX+Gok39W0hX
 msUX54gdWKPFOqUgiDyoRXHLYPDMS9imvZZ8Tfj+ZLSNHUm2+qndnKqMEQy/pefLpapYXsTf8oJ
 bsJvcW/mgOHdgCsci9ToxjQ==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_110459_672257_05B2A347 
X-CRM114-Status: GOOD (  16.39  )
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

The hack to return -EPROBE_DEFER when the lcpll lock timeouts is no
longer needed. The driver now does a reset during its PHY init, which
avoids the problem.

Since rk_udphy_status_check() is called after the probe, it should not
return -EPROBE_DEFER.

Tested-by: Igor Paunovic <royalnet026@gmail.com> # Orange Pi 5 Plus
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/phy/rockchip/phy-rockchip-usbdp.c | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
index 0f39982c70b1..144d83997a79 100644
--- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
+++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
@@ -749,17 +749,7 @@ static int rk_udphy_status_check(struct rk_udphy *udphy)
 					       (val & CMN_ANA_LCPLL_LOCK_DONE), 200, 100000);
 		if (ret) {
 			dev_err(udphy->dev, "cmn ana lcpll lock timeout\n");
-			/*
-			 * If earlier software (U-Boot) enabled USB once already
-			 * the PLL may have problems locking on the first try.
-			 * It will be successful on the second try, so for the
-			 * time being a -EPROBE_DEFER will solve the issue.
-			 *
-			 * This requires further investigation to understand the
-			 * root cause, especially considering that the driver is
-			 * asserting all reset lines at probe time.
-			 */
-			return -EPROBE_DEFER;
+			return ret;
 		}
 
 		if (!udphy->flip) {

-- 
2.53.0



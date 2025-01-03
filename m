Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A267E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 03:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIBEM670RvqWSaRcll0q5z/CPLiq0EZ43/sciweh1xc=; b=FukEGkZ8ib9g0+/1HMnFyRtyea
	croSncpWY2CDpMjv6xp0roNLY4WZ76IYl/F+sWEyXf/3gMmnTTdN9ZTf+mCPkcpUfM1lPEKcMNxYy
	NT0tnhLrimDvl0asQ/ClNj2b72CXqyW5D41vHvvtMWn5eBIhEwx86IlJB3oVXQgMYg9RHbA5PNJ+h
	ro1g5peP6rYAtyWXoshLpGIn3MW8T4+zt46RFZlcKObXoJV0fSR9aGvc4+JVW4dXXKtAQ6JyTdAKu
	aE89/kQjMbosWdKAMAuEhDACv5KHFqFg0odyNlvnsA55+sada+ZZa+ditHSBTVxISO/AZ25rhAOKM
	tpChpAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTYPh-0000000C17u-2pH2;
	Fri, 03 Jan 2025 03:31:53 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTYOS-0000000C0vl-2r10;
	Fri, 03 Jan 2025 03:30:38 +0000
Received: from amadeus-Vostro-3710.lan (unknown [119.122.213.157])
	by smtp.qiye.163.com (Hmail) with ESMTP id 791e1b01;
	Fri, 3 Jan 2025 11:30:22 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	p.zabel@pengutronix.de,
	robh@kernel.org,
	vkoul@kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: rk3568: add reset-names for combphy
Date: Fri,  3 Jan 2025 11:30:16 +0800
Message-Id: <20250103033016.79544-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <688c8fb6-68f7-45f1-98fc-8b3252b3ecbf@kwiboo.se>
References: <688c8fb6-68f7-45f1-98fc-8b3252b3ecbf@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0sdVkxCGR1KSxhCGh5PQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKTkxZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-HM-Tid: 0a942a36cf0d03a2kunm791e1b01
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NAw6Ezo5HTISIS0VPy5ODTA9
	KhVPFDVVSlVKTEhOQ0xOS0lIQ0hPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpIVUpOTFlXWQgBWUFKS0tMNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_193036_906990_AC4D3AC9 
X-CRM114-Status: UNSURE (   9.09  )
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

Hi,
> The other patch in this series:
> arm64: dts: rockchip: rk3568: add reset-names for combphy
> is missing in v6.13-rc5, which will break pcie2 of rk3568
> because the phy driver has changed.

I don't know why the dts patch hasn't been merged into the mainline yet.
Maybe the merge window is different. Can you test the following patch?

```
--- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
+++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
@@ -325,6 +325,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
 	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
 
 	priv->phy_rst = devm_reset_control_get(dev, "phy");
+	/* fallback to old behaviour */
+	if (IS_ERR_OR_NULL(priv->phy_rst))
+		priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
+
 	if (IS_ERR(priv->phy_rst))
 		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
 
```

Thanks,
Chukun

-- 
2.25.1



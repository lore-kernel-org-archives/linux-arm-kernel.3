Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C218C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 13:23:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxZZ0TGOpjtH72dkoKnZWW88kNby7Z+Q4guO4gQ788U=; b=b2eQ4nCDVYKy8iao3Mm5G34Y9K
	5yfR0Vvxs24QeI/G2eUdu8NFh+M/lByzS259o/nq/zoPAdH2D2lxKj1Q+PJ3Gjt+zVh/4dUkZO8Bv
	s5LAz6PZuR74yvWO18OCkcRcxu9Gky2k34g0BGs8VnF900gahpqFT93YkEbKu3eXW4T1PNzVrnh02
	aPEZKibW3ORjM4sOIrynQVwiiS9PysbtoOoo04LevCa7RuJxxPHDTYRbBTgnFppe2krTWxsBKtyZY
	Z+lHV1l0BY/UmqhLniododokzRNfa3qUho7wqoT3DVYqRl/4Zj6Fa2knh6t9HnlwlRzIgTebVGlvR
	RRA8/L8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkIO-0000000Go23-2qMq;
	Tue, 29 Jul 2025 13:23:08 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugkFv-0000000Gnn4-2X14;
	Tue, 29 Jul 2025 13:20:37 +0000
Received: from localhost.localdomain (unknown [119.122.213.139])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1d9eb0240;
	Tue, 29 Jul 2025 21:20:30 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: jonas@kwiboo.se
Cc: amadeus@jmu.edu.cn,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	ziyao@disroot.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
Date: Tue, 29 Jul 2025 21:20:25 +0800
Message-Id: <20250729132025.2359761-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <e2fd11db-543a-43eb-b118-9f246ff149b5@kwiboo.se>
References: <e2fd11db-543a-43eb-b118-9f246ff149b5@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9856577cae03a2kunm6ff7b3281d7629
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDHkJOVhoZTh5PS0xLSxhMQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKSEJZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE5VSktLVU
	pCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_062035_806232_BD3AB2CC 
X-CRM114-Status: GOOD (  16.22  )
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

> Both avddl_1v1 and avddh_3v3 are controlled by the same gpio, I do not
> remember if using two regulators with same gpios is supported, can only
> remember it being an issue in the past, so I opted to just describe it
> as a single regulator and gave it a new name and added labels for the
> name used in schematic.
>
> Would calling it vdd_8367 (after gpio_8367_en) be better or do you have
> any other suggestion on how to describe these?

Would it be better to just call it avddh_3v3 and add a comment?
This makes it easier to find in the schematics and match phy-supply.

> See above, I had issues using the reset-gpios of the switch, because the
> switch was probed twice, once deferred by gmac, and by the second probe
> failed with -BUSY because of the reset-gpios still being claimd by the
> first probe.
>
> I can change to describe the reset pin in the switch, however that will
> likely mean Ethernet is unusable until the issue in devres/gpiolib is
> tracked down and fixed by someone.

I don't think it's a devres/gpiolib issue.
It looks like these two resets are competing:

  priv->reset_ctl = devm_reset_control_get_optional(dev, NULL);
  priv->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);

reset-gpios works if reset-names is specified:

-	priv->reset_ctl = devm_reset_control_get_optional(dev, NULL);
+	priv->reset_ctl = devm_reset_control_get_optional(dev, "switch");

Or just remove the reset controller, I'm not sure if it's really needed:

-	priv->reset_ctl = devm_reset_control_get_optional(dev, NULL);
-	if (IS_ERR(priv->reset_ctl))
-		return dev_err_cast_probe(dev, priv->reset_ctl,
-					  "failed to get reset control\n");

Thanks,
Chukun

--
2.25.1




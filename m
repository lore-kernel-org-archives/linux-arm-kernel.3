Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAB8FE77198
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jan 2025 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G+VWLlVMe0NIBLCLPdud8b8oJVUQtwWS+yIO1GTIdA8=; b=ffs7m9gQrTcVcH9G0loMaC7dVy
	yg6O1s081mfQQ8BwBaHxkqb8iyBVR/CzZnRZtM6ScMR0WRUo5F7HT/ddt7vs2haYEouI+dPZKe1e9
	feVsS4jFfVEdSn7IelOHP/z5Xj/RCq8h3sPRKuzjQjoxjwRkY0no97zfmo4t4L2h+5RDcBSVLW7MU
	So4CCFDtOJLLl0cuYr7wMt79iE3Rc2VSCW1vj05yAwuJ6CYsr3+D0znRL9nfcRWYESGbDI3bYWXiL
	VlyekWEzMQC6iONtqgO/14lv8vUdSAqf0fODBwRAf8G7UfFtNTbzOqQb3qW729fbhp9TCDmMoqb/F
	y3+8yKyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhtk-00000000RAX-40bJ;
	Mon, 06 Jan 2025 07:51:40 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUhsX-00000000R3k-0yk6;
	Mon, 06 Jan 2025 07:50:27 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c05:ad20::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7d116aa9;
	Mon, 6 Jan 2025 15:50:19 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: p.zabel@pengutronix.de
Cc: amadeus@jmu.edu.cn,
	heiko@sntech.de,
	kishon@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	liujianfeng1994@gmail.com,
	vkoul@kernel.org
Subject: Re: [PATCH 1/2] Re: [PATCH 1/1] phy: rockchip: naneng-combphy: compatible with old DT for RK3568
Date: Mon,  6 Jan 2025 15:50:15 +0800
Message-Id: <20250106075015.1061630-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2b04ca7fa5135c1194c39a9fbf2d6ab5630d6ef3.camel@pengutronix.de>
References: <2b04ca7fa5135c1194c39a9fbf2d6ab5630d6ef3.camel@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSR9OVk9OSktPH0tITkpMQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtOQRofSUtBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	tVSktLVUtZBg++
X-HM-Tid: 0a943a97e21c03a2kunm7d116aa9
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pzo6NBw6STILEx8CLgEXGTQz
	PDkwFBVVSlVKTEhNSk9CQ0lKQ0pOVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS05BGh9JS0FBSllXWQgBWUFCSEk3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_235025_444694_939FF95E 
X-CRM114-Status: UNSURE (   8.89  )
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
>> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> index a1532ef8bbe9..372f5c07b5bd 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> @@ -325,6 +325,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>>  	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>>  
>>  	priv->phy_rst = devm_reset_control_get(dev, "phy");
>
> This should be devm_reset_control_get_exclusive().

I will change this.

>> +	/* fallback to old behaviour */
>> +	if (IS_ERR(ERR_PTR(priv->phy_rst)))
>
> Drop superfluous ERR_PTR().

I think it would be better if I changed it to this?

if (PTR_ERR(priv->phy_rst) == -ENOENT)
	priv->phy_rst = devm_reset_control_array_get_exclusive(dev);

Thanks,
Chukun

-- 
2.25.1



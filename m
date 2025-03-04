Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F53C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kzMMUzzea/tYscTw0VVrXaFhlZgjVe+wLcfSv5SQfpU=; b=Adjo0lgC/umI3LaeOg51z1TroZ
	gknSDX8eRd+uVEmikDNTxvaERY6cpYvBPtQrwjh89BqkoLz0Bj9u4zpGGzCdtfrNwkBooyc4zvh99
	4f5oUEdqNaalLM8D1RYnE/4BTzHYjAjuN1gXsiZYQyhG90QGsFUIFmomEGMrpUrOIUfrrpVja+6xM
	kVgDy7EqGqZQGjQBh6JA4sxWm1IIUVbFJVC2wygW/dsuSPTHbVa/NnbdnH7MQ5BW+gSC6KfrKVB24
	fONMeOl/7XptBoK1m69Hb57crldWnjdWO2QKN9xkMwP03bO4aXn4r21XxlWf4iVyvOl2fbO9KDbRX
	jnzCKQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYRr-000000068o3-2wAs;
	Tue, 04 Mar 2025 20:01:03 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYHO-000000066Qn-2m8p;
	Tue, 04 Mar 2025 19:50:16 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 0095C252B4;
	Tue,  4 Mar 2025 20:50:09 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOe44yWLNYEa; Tue,  4 Mar 2025 20:50:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741117804; bh=/vRWKQtZKb8AVks66fKFJNA8Q7HHHVpV5dIgIcKRJh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EWOlvoXB2lKejxwrdke4Er6of5ABdK3jBS9BAXlXEL0XFcLS/7C0FI/oEB1pz5JpR
	 yStJAX5kufOc7R5KTMYtpQvzZZClaZe1L05PLt1BJlCvyAp0TMiVt3jZyiEQhZKrrh
	 DC1g3n0EnlgV3+tBx61eFGMHLWBzWJuq3kRkNOP16r7p/9ZOBZKIVKjByeqdnt8ry/
	 pkLkd8wXvLy+ItQptFHSWKUtx0nVA9JiMlh7MObc7kiMZrzVqHDyUo+bduvDD9iybP
	 ZvfPyhbDp0qziwtu+YrJ/xUroOCsLzWzkjRo3HlIu3EkzYRmFG0gxi1zzBElz5i8f4
	 /EsfnkVnFBvTg==
Date: Tue, 4 Mar 2025 19:49:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: conor+dt@kernel.org, cristian.ciocaltea@collabora.com,
	detlev.casanova@collabora.com, devicetree@vger.kernel.org,
	frank.wang@rock-chips.com, heiko@sntech.de, jonas@kwiboo.se,
	krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 8/8] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
Message-ID: <Z8dZWYpABghRHHge@pie.lan>
References: <20250301104835.36439-1-ziyao@disroot.org>
 <20250304121036.1453284-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304121036.1453284-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_115015_116687_BFB16F0A 
X-CRM114-Status: GOOD (  19.51  )
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

On Tue, Mar 04, 2025 at 08:10:36PM +0800, Chukun Pan wrote:
> Hi,
> 
> > +	aliases {
> > +		mmc0 = &sdmmc;
> 
> s/mmc0/mmc1

Will take it and add the missing pinctrl, as Jonas already pointed out.

> > +&sdmmc {
> > +	bus-width = <4>;
> > +	cap-mmc-highspeed;
> > +	cap-sd-highspeed;
> 
> I think for sdcard, only cap-sd-highspeed
> is needed, not cap-mmc-highspeed?

This makes sense, will remove it in the next version.

> > +	disable-wp;
> 
> Missing pinctrl.
>
> > +	rockchip,default-sample-phase = <90>;
> 
> It seems that all rk3528 devices need to set this
> default phase, so maybe this can be placed in dtsi?

Yes, since the tuned phase offset is a SoC-specific value, as pointed
out by comment in the driver,

	this is _not_ a value that is dynamically tuned and is also
	_not_ a value that will vary from board to board.  It is a value
	that could vary between different SoC models.

Will take it in the next version, thanks for finding it!

> > +	sd-uhs-sdr104;
> 
> The rk3528 devices uses gpio to switch IO voltage, maybe
> more modes should be added here like vendor kernel?

I cannot get the relationship between things you mentioned. For the
regulator, yes, here vqmmc-supply is missing, as already pointed out by
Jonas.

> And these devices use 3.3V IO voltage by default.
> 
> 	sd-uhs-sdr12;
> 	sd-uhs-sdr25;
> 	sd-uhs-sdr50;
> 	sd-uhs-sdr104;

But I don't think it's necessary to lay out these slower modes
explicitly, since SDR104 seems to imply them, see
sd_update_bus_speed_mode() in drivers/mmc/core/sd.c[1],

        if ((card->host->caps & MMC_CAP_UHS_SDR104) &&
            (card->sw_caps.sd3_bus_mode & SD_MODE_UHS_SDR104)) {
                        card->sd_bus_speed = UHS_SDR104_BUS_SPEED;
        } else if ((card->host->caps & MMC_CAP_UHS_DDR50) &&
                   (card->sw_caps.sd3_bus_mode & SD_MODE_UHS_DDR50)) {
                        card->sd_bus_speed = UHS_DDR50_BUS_SPEED;
        } else if ((card->host->caps & (MMC_CAP_UHS_SDR104 |
                    MMC_CAP_UHS_SDR50)) && (card->sw_caps.sd3_bus_mode &
                    SD_MODE_UHS_SDR50)) {
                        card->sd_bus_speed = UHS_SDR50_BUS_SPEED;
        } else if ((card->host->caps & (MMC_CAP_UHS_SDR104 |
                    MMC_CAP_UHS_SDR50 | MMC_CAP_UHS_SDR25)) &&
                   (card->sw_caps.sd3_bus_mode & SD_MODE_UHS_SDR25)) {
                        card->sd_bus_speed = UHS_SDR25_BUS_SPEED;
        } else if ((card->host->caps & (MMC_CAP_UHS_SDR104 |
                    MMC_CAP_UHS_SDR50 | MMC_CAP_UHS_SDR25 |
                    MMC_CAP_UHS_SDR12)) && (card->sw_caps.sd3_bus_mode &
                    SD_MODE_UHS_SDR12)) {
                        card->sd_bus_speed = UHS_SDR12_BUS_SPEED;
        }

> Thanks,
> Chukun
> 
> -- 
> 2.25.1
> 

Regards,
Yao Zi

[1]: https://elixir.bootlin.com/linux/v6.13.5/source/drivers/mmc/core/sd.c#L448-L479


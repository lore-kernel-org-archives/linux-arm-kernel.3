Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 763B1CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 00:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXw9JUlZzx0lTXjNIvegbiSRMFehNUPYz28p3t2la1g=; b=eoUD2XFygwTFEGi/rDhABQ9Ufg
	EIDbP3ma1zepRK9Zh4RyC5G21Xw7RT53VWyy/n0Zz7prRIbgWDfSxuTGcUFMlmpFujuoPXjDbZlnW
	jbcoTfHF7+Ga6RF1d0LlxnkZFPwf3inUyFuIQOTkBUGaYjtnVE17dryLXcjRlPumGRr6kgqLcg113
	lFdiMH51HvqdjAn5zS7PujmLgCyvfg2QV3Jm6ppWHdhlUa/54x/ovzBHvciDITED1U9z5D3vuMGT6
	796opGTlBHmAUgQIvjCxEAxIe0P7lnzFCDNH6BsOw8fdun7r0KdWd/UDrXI961mSGwcFRI3Kxx6qo
	q471aGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uSW-00000009EY1-1qUj;
	Sat, 18 Oct 2025 00:06:08 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9uSP-00000009EWw-3i5n
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 00:06:06 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C82DD341FD5;
	Sat, 18 Oct 2025 00:05:58 +0000 (UTC)
Date: Sat, 18 Oct 2025 08:05:48 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, sophgo@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH] net: stmmac: dwmac-sophgo: Add phy interface filter
Message-ID: <20251018000548-GYA1481334@gentoo.org>
References: <20251017011802.523140-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017011802.523140-1-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_170601_947943_975C3CA3 
X-CRM114-Status: GOOD (  22.03  )
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

Hi Inochi,

On 09:18 Fri 17 Oct     , Inochi Amaoto wrote:
> As the SG2042 has an internal rx delay, the delay should be remove
                                                     s/remove/removed/
> when init the mac, otherwise the phy will be misconfigurated.
s/init/initialize/
> 
> Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-sophgo.c    | 25 ++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> index 3b7947a7a7ba..b2dee1399eb0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> @@ -7,6 +7,7 @@
> 
>  #include <linux/clk.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> 
> @@ -29,8 +30,23 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
>  	return 0;
>  }
> 
> +static int sophgo_sg2042_set_mode(struct plat_stmmacenet_data *plat_dat)
> +{
> +	switch (plat_dat->phy_interface) {
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII_TXID;
> +		return 0;
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +		plat_dat->phy_interface = PHY_INTERFACE_MODE_RGMII;
> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static int sophgo_dwmac_probe(struct platform_device *pdev)
>  {
> +	int (*plat_set_mode)(struct plat_stmmacenet_data *plat_dat);
>  	struct plat_stmmacenet_data *plat_dat;
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev = &pdev->dev;
> @@ -50,11 +66,18 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> 
> +	plat_set_mode = device_get_match_data(&pdev->dev);
> +	if (plat_set_mode) {
> +		ret = plat_set_mode(plat_dat);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
>  }
> 
>  static const struct of_device_id sophgo_dwmac_match[] = {
> -	{ .compatible = "sophgo,sg2042-dwmac" },
> +	{ .compatible = "sophgo,sg2042-dwmac", .data = sophgo_sg2042_set_mode },
I'd personally prefer to introduce a flag for this, it would be more readable and
maintainable, something like
struct sophgo_dwmac_compitable_data {
	bool has_internal_rx_delay;
}

then.
	if (data->has_internal_rx_delay)
		sophgo_sg2042_set_mode(..)


>  	{ .compatible = "sophgo,sg2044-dwmac" },
>  	{ /* sentinel */ }
>  };
> --
> 2.51.0
> 

-- 
Yixun Lan (dlan)


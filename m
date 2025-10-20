Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EDCCCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VBcpAydgMjv8oPtj/jsbFK1iGkELarw+yWPLnnEN1Fw=; b=aYS3LLuYI+pAAKT3DxBi/z5ldA
	aywhWaUW6Vh3/hQ2NCsVUTadqZazTEGiyCKVObESYtRM3qV8RfJpSfLV3g2LoWlsGnkui11U2fthF
	nAcMz7MnEUMNgcFM4tSuA3usaOrLQNDnl3yqAmMb1G451BdnD3xbZOzlKtK38WwICG5UKr4MSCqCF
	ydy+HLw9G2Q/qXW6c0gT8bkjIsnZz2f1iyG2hb+1clDlj71GlD53rTVd1FfC5gYgxMjwlIZGYVQI+
	p1KXw+il8ifXQSKyQby60t99rI5yIm7nqDGfLiSUdF62oHzdUSEbDG3SDtn32z3jXz7vr/cg2HQ6A
	Rufm+i3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnem-0000000Cyww-0uZg;
	Mon, 20 Oct 2025 11:02:28 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnek-0000000CywS-1AhS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 11:02:27 +0000
Received: from localhost (unknown [116.232.147.23])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id EF5D9341EEB;
	Mon, 20 Oct 2025 11:02:23 +0000 (UTC)
Date: Mon, 20 Oct 2025 19:02:19 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Han Gao <rabenda.cn@gmail.com>, Icenowy Zheng <uwu@icenowy.me>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <ziyao@disroot.org>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 3/3] net: stmmac: dwmac-sophgo: Add phy interface
 filter
Message-ID: <20251020110219-GYH1506524@gentoo.org>
References: <20251020095500.1330057-1-inochiama@gmail.com>
 <20251020095500.1330057-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251020095500.1330057-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_040226_344540_7B061E0A 
X-CRM114-Status: GOOD (  20.97  )
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

On 17:54 Mon 20 Oct     , Inochi Amaoto wrote:
> As the SG2042 has an internal rx delay, the delay should be remove
missed my comment in v1?

> when init the mac, otherwise the phy will be misconfigurated.
> 
> Fixes: 543009e2d4cd ("net: stmmac: dwmac-sophgo: Add support for Sophgo SG2042 SoC")
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Tested-by: Han Gao <rabenda.cn@gmail.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-sophgo.c  | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> index 3b7947a7a7ba..960357d6e282 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sophgo.c
> @@ -7,11 +7,16 @@
> 
>  #include <linux/clk.h>
>  #include <linux/module.h>
> +#include <linux/property.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> 
>  #include "stmmac_platform.h"
> 
> +struct sophgo_dwmac_data {
> +	bool has_internal_rx_delay;
> +};
> +
>  static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
>  				    struct plat_stmmacenet_data *plat_dat,
>  				    struct stmmac_resources *stmmac_res)
> @@ -32,6 +37,7 @@ static int sophgo_sg2044_dwmac_init(struct platform_device *pdev,
>  static int sophgo_dwmac_probe(struct platform_device *pdev)
>  {
>  	struct plat_stmmacenet_data *plat_dat;
> +	const struct sophgo_dwmac_data *data;
>  	struct stmmac_resources stmmac_res;
>  	struct device *dev = &pdev->dev;
>  	int ret;
> @@ -50,11 +56,20 @@ static int sophgo_dwmac_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
> 
> +	data = device_get_match_data(&pdev->dev);
> +	if (data && data->has_internal_rx_delay)
> +		plat_dat->phy_interface = phy_fix_phy_mode_for_mac_delays(plat_dat->phy_interface,
> +									  false, true);
> +
>  	return stmmac_dvr_probe(dev, plat_dat, &stmmac_res);
>  }
> 
> +static struct sophgo_dwmac_data sg2042_dwmac_data = {
static const?
> +	.has_internal_rx_delay = true,
> +};
> +
>  static const struct of_device_id sophgo_dwmac_match[] = {
> -	{ .compatible = "sophgo,sg2042-dwmac" },
> +	{ .compatible = "sophgo,sg2042-dwmac", .data = &sg2042_dwmac_data },
>  	{ .compatible = "sophgo,sg2044-dwmac" },
>  	{ /* sentinel */ }
>  };
> --
> 2.51.1.dirty
> 

-- 
Yixun Lan (dlan)


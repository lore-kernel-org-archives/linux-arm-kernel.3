Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7B710A88F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwqHAF6GilRUfb07/OFy98MgqKxm9IQW77RBf1hyaaM=; b=EVM61hEfMuD5+3yxoOwAYVYeSI
	MYNGpRokCbb0R9QytEFovQURj/V2FdHEG3RJcyQT0GwdjXp/7z9zex2etSbYSvUg1lZVL0VeSMxf1
	bmp33mZF5MJhKp9ZNLLryMVLlMx24daMa3Uml2Cu3UR+dw9aIru8Hayh8Dk7sB5YTKiIj4qpQcqT/
	zQxB9ki9jYUtbzejN/MHhm8Y7DpaxozObT74vPchW9GZnRwfAdP7Arh55Mv3fyJMHwDhBcxTZkulI
	OYXYxwZ5jqEMhe8qWX/88oNPz77oLmyt8EoE4NPx9MnF5ZcxOxYPv5sUtrdvV8SzszQzMrd2laGGK
	HTq8Nm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oYa-00000005xAv-0CtB;
	Thu, 26 Mar 2026 17:31:44 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oYQ-00000005x5i-1dXn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:31:35 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA2779A9;
	Thu, 26 Mar 2026 18:30:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1774546212;
	bh=mHuz9dD/zD769Vzc3Oy2YrsHQDGOSHJorSKK6FwAkVo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oDctDRaTumN+rKqm1apL6hQ5EeJKBozOuxXux4FR1BLSspMbcjhIASsgEkGV0F3K4
	 S9wn6jEcBNcS5x2bsCtPTCRMYaP/XciJ/0RN0C/0I4+YSEXceKjAw6XVpioelgjzBV
	 +jPuoWkcfkVapeJfhzE/BMxSFi8DeArKke7dxYgs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260325210003.2752013-2-laurent.pinchart@ideasonboard.com>
References: <20260325210003.2752013-1-laurent.pinchart@ideasonboard.com> <20260325210003.2752013-2-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH net-next v4 1/2] net: stmmac: provide flag to disable EEE
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>, Francesco Dolcini <francesco.dolcini@toradex.com>, Frank Li <Frank.Li@nxp.com>, Jakub Kicinski <kuba@kernel.org>, Joy Zou <joy.zou@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Stefan Klug <stefan.klug@ideasonboard.com>, linux-arm-kernel@lists.infradead.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, imx@lists.linux.dev, netdev@vger.kernel.org
Date: Thu, 26 Mar 2026 17:31:29 +0000
Message-ID: <177454628933.1078312.13488207016388509694@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_103134_593863_9334E439 
X-CRM114-Status: GOOD (  28.08  )
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

Quoting Laurent Pinchart (2026-03-25 21:00:02)
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
>=20
> Some platforms have problems when EEE is enabled, and thus need a way
> to disable stmmac EEE support. Add a flag before the other LPI related
> flags which tells stmmac to avoid populating the phylink LPI
> capabilities, which causes phylink to call phy_disable_eee() for any
> PHY that is attached to the affected phylink instance.
>=20
> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> to the receive clock domain, and takes four clock cycles to clear, this
> leads to interrupt storms as the interrupt remains asserted for some
> time after the LPI control and status register is read.
>=20
> This problem becomes worse when the receive clock from the PHY stops
> when the receive path enters LPI state - which means that lpi_intr_o
> can not deassert until the clock restarts. Since the LPI state of the
> receive path depends on the link partner, this is out of our control.
> We could disable RX clock stop at the PHY, but that doesn't get around
> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
>=20
> Previously, iMX8MP worked around this by disabling gigabit EEE, but
> this is insufficient - the problem is also visible at 100M speeds,
> where the receive clock is slower.
>=20
> There is extensive discussion and investigation in the thread linked
> below, the result of which is summarised in this commit message.

This one has been a roller coaster, but I'm glad we got to the bottom of
it.

I hope someone from synopsis takes note and and documents this for
future silicon integrations.

Can't wait to see where else this pops up.


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

>=20
> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Closes: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart=
@ideasonboard.com
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Tested-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  7 ++++++-
>  include/linux/stmmac.h                            | 13 +++++++------
>  2 files changed, 13 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 9b6b49331639..ce51b9c22129 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1438,7 +1438,12 @@ static int stmmac_phylink_setup(struct stmmac_priv=
 *priv)
>                                  config->supported_interfaces,
>                                  pcs->supported_interfaces);
> =20
> -       if (priv->dma_cap.eee) {
> +       /* Some platforms, e.g. iMX8MP, wire lpi_intr_o to the same inter=
rupt
> +        * used for stmmac's main interrupts, which leads to interrupt st=
orms.
> +        * STMMAC_FLAG_EEE_DISABLE allows EEE to be disabled on such plat=
forms.
> +        */
> +       if (priv->dma_cap.eee &&
> +           !(priv->plat->flags & STMMAC_FLAG_EEE_DISABLE)) {
>                 /* The GMAC 3.74a databook states that EEE is only suppor=
ted
>                  * in MII, GMII, and RGMII interfaces.
>                  */
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index 5b2bece81448..e62d21afd56d 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -207,12 +207,13 @@ enum dwmac_core_type {
>  #define STMMAC_FLAG_MULTI_MSI_EN               BIT(7)
>  #define STMMAC_FLAG_EXT_SNAPSHOT_EN            BIT(8)
>  #define STMMAC_FLAG_INT_SNAPSHOT_EN            BIT(9)
> -#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI         BIT(10)
> -#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING      BIT(11)
> -#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP      BIT(12)
> -#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY   BIT(13)
> -#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD   BIT(14)
> -#define STMMAC_FLAG_SERDES_SUPPORTS_2500M      BIT(15)
> +#define STMMAC_FLAG_EEE_DISABLE                        BIT(10)
> +#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI         BIT(11)
> +#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING      BIT(12)
> +#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP      BIT(13)
> +#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY   BIT(14)
> +#define STMMAC_FLAG_KEEP_PREAMBLE_BEFORE_SFD   BIT(15)
> +#define STMMAC_FLAG_SERDES_SUPPORTS_2500M      BIT(16)
> =20
>  struct mac_device_info;
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>


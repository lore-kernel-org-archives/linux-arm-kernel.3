Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4BFCC79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 18:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTba1NzUG5xbAP4x+gUk6us1Ud5EI0aPxbPupazDE+E=; b=AsOm1h1soop5SAfpQzs4Yxzh77
	skxDBFWSCvFYvxlmIhg84DsncOSCfg/6zEWFjms6mnzLiejwtL8gGBlINbIsVbVeh0S9qvF0QL1+M
	iZHrQAG2Twpk34juFAA+boBThMYiz8XUEnRJ4LENSBFllfQqlJUWCS4i0cRod34zSIh/YJNCrE9FA
	6dlOugNBuf1SnYWyjcc8P3oqltueN40Hsn0DCGc943ZPlFvh2CNck7iNptxSOk4swgVcVKKXPNOlN
	vakG3r98kltO5+DcD6z4ikatsWsRoKByB7d5D/h7Nlc31EZFjhbMtxIeblWsaD/9QvYAPoXMEqtcI
	HsD8w85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jHY-0000000F8Fd-1LCu;
	Thu, 10 Sep 2026 18:13:56 +0000
Received: from mail.tipi-net.de ([194.13.80.246])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4jHV-0000000F8EO-2pOc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 18:13:54 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7832FA0580;
	Thu, 10 Sep 2026 20:13:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1789064031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gTba1NzUG5xbAP4x+gUk6us1Ud5EI0aPxbPupazDE+E=;
	b=3a+j74DPcEdAczUXBJ2bDGgzvEK5RyO+Ay2DOQr7R33QufMvsp0nffsp1zBVquSVDnGc5J
	TyUU2qWlioSFDGm8grYtMTRTx4Z7FJi0MHY7SozgArH83dIq4qLNIQJ4TTeUnVLhCuuEu3
	umKNP+Wj1eWVFll8NeAzku9iC5S2fqB/tREeCLzXAd/OL0UXxUyuo1y1y7AvaLrSfy9ecr
	MnfBY70d5ciTr5nZcygs98uzPqgKsZbFySqcYqC32OM08pa4hN2lwPY2wjnnUStUIHDMDC
	WHend6RCCH8FZeXtDesIMK7JWPYMYZiGJnoF5CLy7pwMz432k+8WS7l2GKosjA==
MIME-Version: 1.0
Date: Thu, 10 Sep 2026 20:13:50 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Russell King <linux@armlinux.org.uk>, Heiner Kallweit
 <hkallweit1@gmail.com>, =?UTF-8?Q?Alexis_Lothor=C3=A9?=
 <alexis.lothore@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Emil Renner Berthing
 <kernel@esmil.dk>, Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Jan Petrous <jan.petrous@oss.nxp.com>,
 Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Jose.Abreu@synopsys.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, PKneuper@dspace.de, David Laight
 <david.laight.linux@gmail.com>
Subject: Re: [PATCH net v2 6/6] net: stmmac: selftests: Account for alignment
 shift on dwmac1000 for Jumbo test
In-Reply-To: <20260910151404.976753-7-maxime.chevallier@bootlin.com>
References: <20260910151404.976753-1-maxime.chevallier@bootlin.com>
 <20260910151404.976753-7-maxime.chevallier@bootlin.com>
Message-ID: <999537422e65948cc80714942b3d152a@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_111353_912952_D81AD8B2 
X-CRM114-Status: GOOD (  17.63  )
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

On 10.9.2026 17:14, Maxime Chevallier wrote:
> On dwmac1000, we currently only support single-descriptor frames. The
> Jumbo test started failing when NET_IP_ALIGN was added to align the IP
> header, as this tests tries to send the biggest possible frame.
> 
> On dwmac1000 the DMA transfer is aligned on 4-bytes, so adding a 2-byte
> shift at the start-of-buffer address means it takes a whole extra 
> 4-byte
> DMA burst to receive the Jumbo packet, causing it to spill over the 
> next
> descriptor.
> 
> This doesn't seem to happen on dwmac4 and xgmac that appear to 
> correctly
> handle unaligned xfers (only tested on dwmac4)
> 
> Let's account for that in the Jumbo test, reduce the size of our big
> packet by the align size.
> 
> Fixes: 23680bf5f8c6 ("net: stmmac: restore NET_IP_ALIGN in the RX DMA 
> offset")
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c 
> b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> index ec56ee0031ab..fc8d69260f43 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
> @@ -1776,6 +1776,9 @@ static int __stmmac_test_jumbo(struct stmmac_priv 
> *priv, u16 queue)
>  	struct stmmac_packet_attrs attr = { };
>  	int size = priv->dma_conf.dma_buf_sz;
> 
> +	if (!dwmac_is_xmac(priv->plat->core_type))
> +		size -= NET_IP_ALIGN;
> +
>  	attr.dst = priv->dev->dev_addr;
>  	attr.max_size = size - ETH_FCS_LEN;
>  	attr.queue_mapping = queue;

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai


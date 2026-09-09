Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD5EC79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pGC6HZ9uyZkKy06/6NNUy5COxbIDi6w5V6zYh4L2LLQ=; b=DNnOwGcOrklpwyqgPoL0KlGedx
	zEX0LjF0AwlxahEHvNZ6iWT4qYq6AzP1EhzSbTPtIak70pkICAI4rgzboGCVWPUqRn8yZ5mfftQ9F
	3KsAfDxisFfBjuAoLQ6czgmM3pdrHhZ+GKsuf+D4VS+ueJRnIz7YyiVUnPZyiiGpIYHV3MYa0BFyv
	mpnj3noAxWn+yCXwjlJpMfRdDbJ0xbVm/BDzEh/Du395MxyNcQA0irqjs/kEdfKkuj36jmCjoDmTJ
	mg73tKrdJ7cWPV3t4nV59i1syN9fEKWnRheSsqEBVhodCpo/N8iVyf+oPvRopnq+ruTx9g729uSWn
	l8WONw+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M2w-0000000CTbs-2nDJ;
	Wed, 09 Sep 2026 17:25:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M2s-0000000CTb6-16fO;
	Wed, 09 Sep 2026 17:25:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 90BCB601F0;
	Wed,  9 Sep 2026 17:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD6531F000FF;
	Wed,  9 Sep 2026 17:25:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974713;
	bh=pGC6HZ9uyZkKy06/6NNUy5COxbIDi6w5V6zYh4L2LLQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W24FkBl5KvkzxbniUTFT3e5LDRnH2G5w9A6DSLU8/IKFQ+F88esI3/gY6j3yyXHBL
	 Ow5Qw769UBFZHL1VJNQiWhbM1696eQYezkbX0FAXsfr58MoNhzdZd4mX11WCNid4PS
	 jzYTqa3JTTL4CA8rtD+m3Yvxj8KARVZ2wHhw75LI54IEUqtCq0V1A+eNe7DxjCfTqw
	 neS4N8WNEJePRmlY8NgblD2FuCKIq6ov8qVj4E/fpvUc6gLw7pKw9G5tYkdQBiQuH/
	 8rjDJwsDwvDF/LCbRXPHy2rClREH/ta27xO8Hj34IW50I5F2ml++zqMYSGGNLiKpV0
	 LeePmTnGMZ1PQ==
Date: Wed, 9 Sep 2026 19:25:03 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask
 to SoC data
Message-ID: <cydeh263kd5o2un27oeplqx2phe7vzhxvk53kr7dbvtplazafv@rs37qtkhguhj>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-12-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-12-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:44PM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for the eDP PHY found in newer
> SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
> data.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> index 4603f28d1466..f5aadc5fdc42 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> @@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
>   * @regs_ana_lane:  Register (layout) offsets for ana_lan
>   * @regs_dig_glb:   Register (layout) offsets for dig_glb
>   * @regs_dig_lane:  Register (layout) offsets for dig_lan
> + * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
>   * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
>   * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
>   * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
> @@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
>  	const u8 *regs_dig_glb;
>  	const u8 *regs_dig_lane;
>  
> +	/* Register masks */

Duplicate comment. With this removed,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்


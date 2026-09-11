Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A654C88E42
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Re4OuRwLxErTc9uR7CpD1jNt1FFENy/RKFyXLL/LfjI=; b=UoWvw1lC+iHPNqiPXUo2o4628Y
	EJF5IwUhrPMBuICpk2kdoZBjNj7xtl1Xi2B7p0alZfCgGbO5iV7BeFR1Hk488Ra4UMazneCtU8rxX
	ao+vfVbu64ONkw4tEh2B1YnOdK3A6ZNHn4gkpTNXRES9wz9jYnZx9UEnzcGhQj6WHpJj9Pyvpaw79
	qGF3isiH4geoZIsyt8yKK+G0RNUs/vuJTBlp78vTnFat8hmqKljaM5dXCRkxcqihSh4jiQYgwcXVP
	iB8YITrILBPOuS9uaX715kGubXJu4pbmrCeqjau/m7qZ+n2wlp7yYP+wxwSRSPxU3BBlj1K5ZKtKH
	5/OMlesQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tbt-0000000FqhI-2AHM;
	Fri, 11 Sep 2026 05:15:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tbs-0000000Fqh3-3N3C;
	Fri, 11 Sep 2026 05:15:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D612A409FE;
	Fri, 11 Sep 2026 05:15:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4014D1F000FF;
	Fri, 11 Sep 2026 05:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789103735;
	bh=Re4OuRwLxErTc9uR7CpD1jNt1FFENy/RKFyXLL/LfjI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IJUV/GsKHHvt9HrUKFv1KLSB1qHKzOiUQX8PYVGxYjP+6GKODDx7yyMP2zHhC8/SW
	 pczlz20cM18LzibHOMKTJJ8JMfBfaa2hBQDetiD/d6mwq3/zOQ0fxw0D++FV7Ln9r6
	 +/8mdx3vSyGNbwTtqZIV30bThMaYlkK3LpH8vX7btR4mqJJwU53jOgnmFNMp0CyvlY
	 cPS5nP6kVuu7BGd5lWQx+YM8Ou8zQUPN0jwZ7XBBXaxFJ51Q/JLhf+QKzF4MpDWD2k
	 zTnR69WtvBkinYcgt51aN5lJ87ZtRqhRwjJM3oyJeM4UOvtEXGa+bkzfnH+AAMXdzb
	 6A53O1yu12W8Q==
Date: Fri, 11 Sep 2026 07:15:26 +0200
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
Message-ID: <m3fpa2igwmsnsxhhxtg5hubsmxbn2vmzcpo4hwacs66z52x5ll@xrl5kac2qmtk>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-12-angelogioacchino.delregno@collabora.com>
 <cydeh263kd5o2un27oeplqx2phe7vzhxvk53kr7dbvtplazafv@rs37qtkhguhj>
 <4e658914-7a17-444b-b20b-8d8b647238b5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e658914-7a17-444b-b20b-8d8b647238b5@collabora.com>
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

On Thu, Sep 10, 2026 at 11:05:39AM +0200, AngeloGioacchino Del Regno wrote:
> On 9/9/26 19:25, Manivannan Sadhasivam wrote:
> > On Tue, Jul 07, 2026 at 05:42:44PM +0200, AngeloGioacchino Del Regno wrote:
> > > In preparation for adding support for the eDP PHY found in newer
> > > SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
> > > data.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   drivers/phy/mediatek/phy-mtk-dp.c | 13 +++++++++----
> > >   1 file changed, 9 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy-mtk-dp.c
> > > index 4603f28d1466..f5aadc5fdc42 100644
> > > --- a/drivers/phy/mediatek/phy-mtk-dp.c
> > > +++ b/drivers/phy/mediatek/phy-mtk-dp.c
> > > @@ -220,6 +220,7 @@ struct mtk_dp_phya_imp_sel {
> > >    * @regs_ana_lane:  Register (layout) offsets for ana_lan
> > >    * @regs_dig_glb:   Register (layout) offsets for dig_glb
> > >    * @regs_dig_lane:  Register (layout) offsets for dig_lan
> > > + * @mask_dig_tx_ln: Register mask for PHYD_TX_LN_EN field
> > >    * @val_dig_bitrate:IP Version specific register values for Bit Rate setting
> > >    * @ana_bias_r:     Internal resistance "R" Selection Settings (global)
> > >    * @ana_cktx_imp:   TX Clock Impedance Selection Settings (global)
> > > @@ -239,6 +240,9 @@ struct mtk_dp_phy_pdata {
> > >   	const u8 *regs_dig_glb;
> > >   	const u8 *regs_dig_lane;
> > > +	/* Register masks */
> > 
> > Duplicate comment. With this removed,
> > 
> 
> Sorry but I think you didn't understand what the comments are there: the kerneldoc
> is used to describe the structure, of course, but the comments in between are used
> as a way to describe (and kind of enforce) the order of members.
> 
> /* Register offsets */
> u16 member1;
> u16 member2;
> ....
> 
> /* Register maps */
> const u8 *regs1;
> const u8 *regs2;
> ...
> 
> /* Register masks */
> u32 mask1;
> u32 mask2;
> ....
> 
> etc.
> 
> Does that make sense now? :-)
> 

Yes it does. Sorry for the oversight

- Mani

-- 
மணிவண்ணன் சதாசிவம்


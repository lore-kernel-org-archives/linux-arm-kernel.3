Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0884CC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 05:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQkaItX0xqo5kFCTOPQvErm+zlth+OHMFg4BhhYP06c=; b=I5SQ/fNwCtFcLk58RdwRS44T0y
	YYxXRiQRCX3UYyx0kbsjTu+Jb0oaZfM+GDAfMYv9VPXsZLwEbmxcwTqF63G3cbTMC3NTLMWaIdmmF
	y8BRkVDxLJHr5ME7RA84TL1HbA1qTSMlidzwXZMosYxFruRChkHnybSK4QFKJ8u0SRh3HLm37f25u
	uf2JiphFGKnZCUywc6p2+m2VIzqqyRf9/+cV2hNoNwBf7UMNDLVMtfsUGuh0IARKXUTTnQer8Wb1N
	EIpNkvjWrCdqDO9W8mLpxQZORaNNA1pLt5n7znPVn2h7eQYrHeulJ8/2SOGUPOOy3IFRI66vJJ1OW
	MpDL5Otg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tgP-0000000FrV3-2jcR;
	Fri, 11 Sep 2026 05:20:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4tgO-0000000FrUh-29Sa;
	Fri, 11 Sep 2026 05:20:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2F528431E1;
	Fri, 11 Sep 2026 05:20:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DED1F000FF;
	Fri, 11 Sep 2026 05:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104016;
	bh=zQkaItX0xqo5kFCTOPQvErm+zlth+OHMFg4BhhYP06c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m4bAq3t6xGNaDJIAUQZb5j72asbrzo3kHL9Z95osZGv0FSm+lI+GiTji1/5h9z5Na
	 SdjWZapU5O7ZCqDBU0DO09eDrxABIvz97cYjMC5Sdlvhjd4X65ZXLa4WMgQxwLAfnw
	 p9jylw7kLyiJSZgPD1NI/ALAdP0vRi3xXBZRcwL5Hn+liVDz3xBDuD7GQCAElU31VC
	 Jf0bkgZ6zZAIaQATdwkyLAjemkhynonHl+/zp5qmoYsh5h7rdN9VHgJv7mr/2eJp+2
	 s2LQia0fpY/ORQRx0byN3JPmVrc3YfSs2jFAg80Z/4xUVfwd49977V0nZhvvgkZL11
	 oY7j5hhsHvZlg==
Date: Fri, 11 Sep 2026 07:20:06 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v4 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask
 to SoC data
Message-ID: <dcywgc2ccerd6h7rsib5dak2tmanhy6tnbl3fuzvl4ni2ua2lw@jiqbmfni7uou>
References: <20260910092038.48291-1-angelogioacchino.delregno@collabora.com>
 <20260910092038.48291-12-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260910092038.48291-12-angelogioacchino.delregno@collabora.com>
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

On Thu, Sep 10, 2026 at 11:20:37AM +0200, AngeloGioacchino Del Regno wrote:
> In preparation for adding support for the eDP PHY found in newer
> SoCs, transfer the register mask for PHYD_TX_LN_EN to SoC specific
> data.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்


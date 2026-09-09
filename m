Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4848C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HgC9sEOwgkiHFo9nm8IwcHna7p/hR9fCjHKYivIfM14=; b=pK/7mVyx4rA0eDFESv1mzt4Ps4
	JD6F5NOHR4nRs59DsmYSFvAXeUeIpqRo7ze2AobfNm0epXFwcPyurgIQYLNmJsRgRibj37f7URWsm
	ofqODiewvwP4eJfAoPqQXPoPLBaaKSbJMZ6bL3O7FCyq+s4tkrcSrcAtspNC8JmVzA/l5/WMG9WaZ
	fgUJzYJL/GjttACaCrXMf4reoS1cjdxO2GbSC7qbf2EkXRnRUh+httdslSoZn9pYz/m5fxAYvO0F3
	GMQhu5QVHM6/yDVjfCfpClWyDEaN9fRL9s82xyBZ2mftY51g79XMkCnJNhJCU5M3bCOKQR33PXa90
	pkKfHhkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LWn-0000000COSY-1hiE;
	Wed, 09 Sep 2026 16:52:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4LWm-0000000COSH-2ozX;
	Wed, 09 Sep 2026 16:52:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 08948600CB;
	Wed,  9 Sep 2026 16:52:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 573181F000FF;
	Wed,  9 Sep 2026 16:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788972723;
	bh=HgC9sEOwgkiHFo9nm8IwcHna7p/hR9fCjHKYivIfM14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CfC+MCc0nrX7sMf/aBoff2VzQK24psnb39s3VkoDRq+ZhH3P6alsK7j92SN649FA2
	 tUPITzXgmaBspYY1PWbUV0Xe+VvZbGNMPtCQMuPYziiEtX6wORnCfKwQUu3mfaqvNC
	 xVjLr2LssKMqtTMNkIc8gK+Ls02og5sFm/2iZVlAr686Dwx/qUGgseOBLqXw2RRMFo
	 Y+A6ZRAKwJJAwo9StOnlUkdJLHDJ5Du4eSU5yr0OBveWL3Wwr/JBHZiM47stWgtTQ+
	 x9tv2u5sEyTUYm2gHMCBe9ere+sf4Ji91HsSBzcj8YAl8glI4XJJ+raDv2lGkpojQu
	 X1hp2a542rnZg==
Date: Wed, 9 Sep 2026 18:51:54 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 01/12] dt-bindings: phy: Document MT8195 and MT8196
 DisplayPort PHYs
Message-ID: <flb6ugxd5ssocnrxqs7vtjfvtjschvscoputms6bruw2uelpf3@xp2eumt5pwmk>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-2-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:34PM +0200, AngeloGioacchino Del Regno wrote:
> This adds bindings for the DisplayPort and Embedded DisplayPort
> PHYs found in the MediaTek MT8195 SoC (and variants of) and for
> the Embedded DisplayPort found in the MT8196 SoC (and variants).
> 
> This PHY supports varying impedance calibrations for the various
> signals to reach an optimal EYE signal pattern for any specific
> board(s), especially useful for very high bitrates such as HBR3
> and higher, depending on board design.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்


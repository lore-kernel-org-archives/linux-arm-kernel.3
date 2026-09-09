Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE81C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 17:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTiLgaAW8oDG8ctZ/GijkFx6Ydc/BMWX2BkNbD07Dek=; b=BU55lCR+jrNpvpriQNDjoS00zZ
	pBhm5b4XUphKjEFsim6i+qb4/b/l4ujFX2HPpdAJb54JTUkhr+Tuqdjyj6w3BfQZJUiWt9hFoPiiB
	SZC0X6KRY6+QkC7ZrJTxqYVQfiWRUBlB85mR/kaD9Viq1+LLr8qIj/aJjGm74Czisz9Vnw2Uwc7Hb
	zyT2V0gniKAjTFp3VPEOiUZy1HxX0DzHoytCN1XHG9DX9aZQ26/kKmfXco4lfQx16a1KYDuYrTqbT
	YMJaSfRqvZ+/AGWYT4VSwfI1kNpDeTkgsc8prnv9uaBmryWnhfbnj3jLIh0/8iEt8Sw+z946QFx/c
	NISFikLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M02-0000000CT60-404J;
	Wed, 09 Sep 2026 17:22:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4M01-0000000CT5Z-2sxe;
	Wed, 09 Sep 2026 17:22:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B94442AD1;
	Wed,  9 Sep 2026 17:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E61391F000FF;
	Wed,  9 Sep 2026 17:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788974537;
	bh=TTiLgaAW8oDG8ctZ/GijkFx6Ydc/BMWX2BkNbD07Dek=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FzZ6zHuuZr55mmH4+vSo24dCuLDTV+Favm5/kzoxEge48jXhuODYPdH5y8bEQ1l5D
	 GE7FqzMWcNU7kPSglZmQeb9d8WQ4uj/x/pDYT5RFhtPs98xPNA5egwh51UQYDKWRm5
	 f59ftgqJmpgIN0n2TDgmuuLGHPw9ZK5Dc0Lk1PPvk4/fur0xbMOGvxkpVpvFNr2+QJ
	 o/JLBwa2e3OFVdZXYhG6JKx/w1nkV2xaAXY54cB4XjD1+n+2VhsnXrzfVTHRJ6MBFT
	 p6Ic2wrme/sYDLrEfnTSsRtbS1FlMZJ9/y3Ma/4mHv+JK3fX+BQnqnrjLSTtPzdhFX
	 coPAqhMgvJsdg==
Date: Wed, 9 Sep 2026 19:22:08 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunfeng.yun@mediatek.com, vkoul@kernel.org, neil.armstrong@linaro.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	chunkuang.hu@kernel.org, p.zabel@pengutronix.de, justin.yeh@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v3 09/12] phy: phy-mtk-dp: Rewrite and document default
 driving param macros
Message-ID: <ztidtis3m3g5ykkolsje2xeq7xl4gh2bbbbkxhxajorenvnkpt@yztuepbseogg>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-10-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260707154245.198361-10-angelogioacchino.delregno@collabora.com>
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

On Tue, Jul 07, 2026 at 05:42:42PM +0200, AngeloGioacchino Del Regno wrote:
> Use FIELD_PREP_CONST and add nicer definitions/macros to build the
> default driving parameters for the PHY and, while at it, also add
> comments explaining what they are supposed to set in the PHY.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்


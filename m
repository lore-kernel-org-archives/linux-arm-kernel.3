Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F734C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 06:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B7UPSLc11oKfyrOgLlliKH9fMg05j0h2vVmhD/w231c=; b=Va2FJxACJ5o4nfOaxzL9nRTXDd
	Ibc6vwZIAxZWHbrtDYF9crGgCqU2Aq8lP7e+pNoqxfWlylHVyE2pRvoXryuRoKuCucZRgbMMhnYH5
	IaQRfwf2Inys0kYvOQXJvz87y6XFMOdSEvnWmVppG6hewSoVMT852wVAuPf8p3sF9JAAEA51AnHt6
	ErJdqcwb6aPs/gHkaxrCtxGIIXDnynaPzQyblPWL7av+7iTmFwB3s+0s8ACdrd1z1hIXeXibQ0prK
	SqjnO9WQvd14k1ElA7u7tpnVvh0Rpeu99zk2dCP8qs+NuPAvFZKtnL8l5F9L9kYelTHN6cFCnnTML
	LWF9SapA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ekG-0000000DsiF-11Fi;
	Wed, 02 Sep 2026 06:46:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ekE-0000000Dsi5-3SvW;
	Wed, 02 Sep 2026 06:46:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C47F600C8;
	Wed,  2 Sep 2026 06:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08FC1F000E9;
	Wed,  2 Sep 2026 06:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788331609;
	bh=B7UPSLc11oKfyrOgLlliKH9fMg05j0h2vVmhD/w231c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ovzwl3VrOuy3uhuXQ2RZbSDLYYTe1Ii9BoP5dQVJhvgTn1GSz3xT2hmg8zJATCtDi
	 uX0jyf6AVYDRVOBUprOfJtgQ995c024rYYE23SMdUgO4sf/iLWqk1p+juyNZtLrXtt
	 G7+ajEU4XYF3il3uI55Vge18AwIf/u5OrEBml0DDlKlXB8pImMxN62hMuffRU7Udl5
	 bfh/9S5/oIHLsvDbbFFlYbNnlzajMxGmpL0snqPYOAE/s7sWBi7g87WmZ+n5abIN02
	 bPRhnpRJ95k6LrkfesAgVFFpmxsALnr5Kv9I7KjzC8x61muqGTPa4NEibKacBEaKM3
	 3ces20pbfOz/g==
Date: Wed, 2 Sep 2026 08:46:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Congcong Yao <congcong.yao@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Zhengnan Chen <zhengnan.chen@mediatek.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: memory-controllers: mtk-smi: Add
 support for mt8189
Message-ID: <20260902-calm-vivacious-mouse-a7eaac@quoll>
References: <20260831-8189-smi-support-v4-0-8ae66dd3eeed@mediatek.com>
 <20260831-8189-smi-support-v4-1-8ae66dd3eeed@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-8189-smi-support-v4-1-8ae66dd3eeed@mediatek.com>
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

On Mon, Aug 31, 2026 at 02:52:06PM +0800, Congcong Yao wrote:
> From: Zhengnan Chen <zhengnan.chen@mediatek.com>
> 
> Add the SMI LARB, common and sub-common binding descriptions for
> MT8189.
> 
> MT8189 adds an SMI sub-common block. Document this topology in
> mediatek,smi-common.yaml.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>
> Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
> ---
>  .../memory-controllers/mediatek,smi-common.yaml     | 21 ++++++++++++++++++++-
>  .../memory-controllers/mediatek,smi-larb.yaml       |  3 +++
> 2 files changed, 23 insertions(+), 1 deletion(-)

Just to get it out of DT Patchwork:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



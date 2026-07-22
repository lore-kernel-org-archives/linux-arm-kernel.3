Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBE6C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 06:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdvYnB+kWeZ1KxPeBGxQmiB4q+ygBCOu5lRTKg/qEN0=; b=aD49g2Av+MGxvVdV/SOy8IlVEh
	qI9ybA+C6RF77jnxv48n2WdSKidL6c8lnh9PiiLbT9NaLZmpGKQAB932veH0QXlhIPAlqWy/U13oN
	EE+p4BGhrGBXbOQi470cDggRBd716DQTuSAdGPuyAVEC1wQudCR5ue9VTYfJ4qosHfrabmIcfxve8
	R/+AFpDRY2WkS0z9DwdpHogmdFmrVo2EVPRy935TH5Efj7koZYyOGsoJsiVMNaNpd/3hnu2LKYBXN
	q/1qvFfeXrQzun7KHNqUcHeYuwDjN1oC4bn03Wh2U7rD0d7Yv4snJfaTtjeh8ih1sJSNkA+2wZLvU
	2Nn8Muqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQov-0000000B0aC-1SDN;
	Wed, 22 Jul 2026 06:52:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmQot-0000000B0Zv-1rJl;
	Wed, 22 Jul 2026 06:52:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DD07160A64;
	Wed, 22 Jul 2026 06:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 908361F000E9;
	Wed, 22 Jul 2026 06:52:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784703162;
	bh=xdvYnB+kWeZ1KxPeBGxQmiB4q+ygBCOu5lRTKg/qEN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BQZI6bI17aExhSauJW3kHtAiZ/lPh/4uFjw9l8DBrK28ghwPbiocAFm9yC4OfvlWF
	 xxujk1JJ6k7qOKpr6cwvZshfk1n30bgsrQ0Kz7VKUizSC0BCALTZLzn3/6UTzq+zQN
	 SpWKd/gVPu88rropTW4m5rnZOJKLkvB48VxOzE/ud/J2vK7TfEpoEwQZ3tDAPjjWuB
	 GV03IHMeXQZ9SNQ6O6eT0xE+4GRkCF8qILPsyPuzCj9cu9p0OZ2gAx29YjI7FvClya
	 uzpeckF1Yd69mdqOXJivFrWywWyBzdJ5BGpIp60ivZWMh1v6qUS7EcGdBcXe/w+6ql
	 yGZq+XuzYPyCQ==
Date: Wed, 22 Jul 2026 08:52:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jianhua Lin <jianhua.lin@mediatek.com>
Cc: nicolas@ndufresne.ca, mchehab@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com
Subject: Re: [PATCH v10 1/3] dt-bindings: media: mediatek-jpeg-decoder: add
 MT8189 compatible string
Message-ID: <20260722-discreet-imperious-mustang-22dcf4@quoll>
References: <20260720062829.7343-1-jianhua.lin@mediatek.com>
 <20260720062829.7343-2-jianhua.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720062829.7343-2-jianhua.lin@mediatek.com>
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

On Mon, Jul 20, 2026 at 02:28:27PM +0800, Jianhua Lin wrote:
> Add the compatible string for the JPEG decoder block found in the
> MediaTek MT8189 SoC.
> 
> Compared to previous generation ICs, the MT8189 JPEG decoder requires
> 34-bit IOVA address space support and only needs a single clock
> ("jpgdec") instead of two. Therefore, it is added as a standalone
> compatible string without falling back to older SoCs.
> 
> Update the binding schema to include the new compatible string and add
> an `allOf` block with conditional checks. This enforces the single clock
> requirement for MT8189 while preserving the two-clock requirement
> ("jpgdec-smi", "jpgdec") for older SoCs.
> 
> Signed-off-by: Jianhua Lin <jianhua.lin@mediatek.com>
> ---
>  .../bindings/media/mediatek-jpeg-decoder.yaml | 50 ++++++++++++++++---
>  1 file changed, 42 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



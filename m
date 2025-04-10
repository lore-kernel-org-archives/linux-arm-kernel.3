Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB535C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 07:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oThSx5n/tjeCp6Jl7Yik3li/kiCb5KMFScK736mNcfg=; b=ADs4g/w1fvUccZtvPgi1Dmnnh6
	UA7hkfSE792KHXC1c/UwgDQbY1lcI40E97m0GPh9c2h/g1qkGXQjGg6Eq3g+xoNno7z9gXV7xvvc2
	NZJ+zjZ7e0r0DIhb8xf2wl0/nNt2ZgfGZz8g/HdAlavumPlEVoYCgNu4tI+DNGg81IBsup0txQ/NI
	r50jlGj0v7PFBuQASXnhWA042pP+RmuwKER+LVqFJrZhyYv1vaL/IXzdlJfNxDkXlE2zLcWih4IZ1
	dazIoBKrIhx5ezOXNjFCRBrvWl1XbK7Gvs4gnQ9syT+N1/s+3pLrsNLzK1u3UtM1T7ss8xXLoh4un
	o765/sew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2m0q-00000009Tay-3qy2;
	Thu, 10 Apr 2025 07:07:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lZt-00000009Opf-44ME;
	Thu, 10 Apr 2025 06:39:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A56F3A498E9;
	Thu, 10 Apr 2025 06:34:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564BDC4CEDD;
	Thu, 10 Apr 2025 06:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744267196;
	bh=qIxq6rm05hndLmxdtwm+Juf9aChyLKD49TOqyEtT0AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2Ao9rgOsYNPb8Y95yxbhe2W68oV3pEjBBTB9tPTAxCjARjQ6MEskgNwtqxD3UMji
	 e00nFQc40dFUn2VWNXCLc0nOkt61LjcHseDXQnIT7TJloTiTidNJzNWPdKOUF5JzC9
	 UNIT/vXrecs37PLOH6ncJDREtCFfP2MpIixRRKFy82q2lnlCXyWrffLTRkao8GJvwR
	 sZ0pDYyZ19dI0S8qpost5vtxwxabVZU2q9d2kQpQDx7R3Qwgfi3/KBiUCjtKG5pDsN
	 AiI3S3nwFIeBdFCPmdby8MxSYWkKVaP2zipAbLkdm60lpY55VAlC2dzbfF/MTXuFHW
	 XqHB1dE4rw9tw==
Date: Thu, 10 Apr 2025 08:39:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "kyrie.wu" <kyrie.wu@mediatek.com>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 01/12] dt-bindings: mediatek: Add mediatek,
 mt8196-jpgdec compatible
Message-ID: <20250410-wandering-righteous-hound-ac5edd@shite>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
 <20250410063006.5313-2-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250410063006.5313-2-kyrie.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233958_070265_C3C03F37 
X-CRM114-Status: GOOD (  14.09  )
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

On Thu, Apr 10, 2025 at 02:29:54PM GMT, kyrie.wu wrote:
> Add mediatek,mt8196-jpgdec compatible to binding document.
> 
> Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>

Usual mediatek comment - looks like copy paste of username. Please reach
to your colleagues how to fix it.

> ---
>  .../bindings/media/mediatek,mt8195-jpegdec.yaml           | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> index e5448c60e3eb..28a9a9bfdbf8 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mt8195-jpegdec.yaml
> @@ -14,7 +14,9 @@ description:
>  
>  properties:
>    compatible:
> -    const: mediatek,mt8195-jpgdec
> +    enum:
> +      - mediatek,mt8195-jpgdec
> +      - mediatek,mt8196-jpgdec

And devices are not compatible?

Best regards,
Krzysztof



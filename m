Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D23D44C41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RXVzOxFkgWBKQMNVu/rXBMKFrSMtpSEwuzmuFE6pyAU=; b=TuIHyUesV8+lmgu5WUrG6hU72C
	tKo35uQTGVGnL6pAs1cS2btKOB34RTJ+2Lwz6ZKq/wg/8McJIm2ms1T61skfRCDmPWxlApgkaj+md
	IwUA8RXWenz0ThYfvdkwXb6IlgZE/c2Ga1FYGpbcxG+/34agE11U55KiAVocr8JwbEnf7xDHPPZzJ
	i3ftph4s4RM4orRdSkycgydSbTFmplvs09fCPhWfhtUM1jhAkJUNJ0McGwOQIJ38yiWW0dLylIW+o
	lgEKZULbv6uTcX/7IJAXNUi9E0ZikMx+YtUWNaCzIEvIWTBVOuBXrgriWTbok+mKzZIf2eW3n8ecT
	IZFstp3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNDg-0000000COqt-1zds;
	Thu, 15 Jan 2026 13:17:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNDf-0000000COqf-2yDp;
	Thu, 15 Jan 2026 13:16:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2862460195;
	Thu, 15 Jan 2026 13:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0634BC116D0;
	Thu, 15 Jan 2026 13:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483018;
	bh=NEHndrv/GFLkXIcpeLx+QdTY9TQn1VHLAJq60OQCti0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NTNrOMeDrEwZPo0YuwydGexojvyGkalxYJsGJuevjCwnIuZyq7chxL69MRA1sxONM
	 iqkmkPjX1P5gPB8knUCiRkNirOCBmtiZuFWKQdVreqOcZrncGESC9hY5gzUT0BDF9Y
	 OJ70HjfDAtGrcOu4tXbtxCgV+j0Im8Rsnr0VgPAJypz+dzEOk+MIax888XnRWFKhl1
	 6ub7q9aDNDNJD2DEvH6O5j7AfkvKGt7m7qKjfmTwRMnbzGMFBR7HMvFoJVCbrNJ6bo
	 41TmKxXa3Q+stIjrAo4N+YevgIs3h/eeR62Rj9KqUDGoZnWI5jJhTNQTbNhrosIC8g
	 W08/SSRR5Yshw==
From: Pratyush Yadav <pratyush@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org,  krzk+dt@kernel.org,  conor+dt@kernel.org,
  tudor.ambarus@linaro.org,  pratyush@kernel.org,  mwalle@kernel.org,
  miquel.raynal@bootlin.com,  richard@nod.at,  vigneshr@ti.com,
  lgirdwood@gmail.com,  broonie@kernel.org,  matthias.bgg@gmail.com,
  julien.massot@collabora.com,  eugen.hristev@linaro.org,
  jiaxin.yu@mediatek.com,  shane.chien@mediatek.com,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mtd@lists.infradead.org,  linux-sound@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  kernel@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: mtd: jedec,spi-nor: Add Winbond
 W25Q(32/64/128/256)JWM
In-Reply-To: <20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
	(AngeloGioacchino Del Regno's message of "Thu, 15 Jan 2026 13:56:21
	+0100")
References: <20260115125624.73598-1-angelogioacchino.delregno@collabora.com>
	<20260115125624.73598-2-angelogioacchino.delregno@collabora.com>
Date: Thu, 15 Jan 2026 13:16:53 +0000
Message-ID: <2vxz5x93818a.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
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

On Thu, Jan 15 2026, AngeloGioacchino Del Regno wrote:

> Add Winbond W25Q32JWM, W25Q64JWM, W25Q128JWM, W25Q256JWM to the
> allowed compatible strings pattern.
>
> This also resolves a dtbs_check warning happening on all of the
> MediaTek MT8192 Chromebooks devicetrees (for winbond,w25q64jwm).

We normally don't allow adding any more device-specific compatibles.
This list here is only for legacy DTS. You should be using
"jedec,spi-nor" in your device trees.

>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> index 587af4968255..2db446c9ca9b 100644
> --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> @@ -29,7 +29,7 @@ properties:
>                (sst,)?sst26wf016b|\
>                (sst,)?sst25wf(040b|080)|\
>                winbond,w25x(80|32)|\
> -              (winbond,)?w25q(16|32(w|dw)?|64(dw)?|80bl|128(fw)?|256))$"
> +              (winbond,)?w25q(16|32(w|dw)?|64(dw|jwm)?|80bl|128(fw|jwm)?|256(jwm)?))$"
>            - const: jedec,spi-nor
>        - items:
>            - enum:

-- 
Regards,
Pratyush Yadav


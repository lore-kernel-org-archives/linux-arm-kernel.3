Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9633BCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Nov 2025 11:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0BryK7q8WNgZIMT0rsWAeJv+5LIAgjfyVpczHRwLJs=; b=R88rNZecm4gW9PRQiEXVpNXrjb
	zuaGRYjnllrB+zwy07aVMRLyi9oKVTWy5UkAiGjChaR6CjgdmKh6SctkxKB0fBsktAyY1CBT0eHIJ
	GhDxWpPcLwPDfUbtRnGbMWpbmpIebK34PJXSO5enYUgcPSdRK2DGzP1eyWnx6TegA+xjG71rBHOUS
	0SU/bom3By34xkNpm0kosmAnPut/eyAOHsICoyX3RHctlF2CTj+6AhnHLTJIJObmIxV+kU30zy+rw
	RzfHj6kj9sBnEa9+6RB6LSwtDaCrOjuSxWqFZPAiBr+IDsWGjD/59x0UQJjFQQkEkv02KCXCoa0BR
	q5XIWHFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFWYx-00000008WCt-0NGW;
	Sun, 02 Nov 2025 11:47:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFWYv-00000008WCh-42KU;
	Sun, 02 Nov 2025 11:47:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E9EB3601F5;
	Sun,  2 Nov 2025 11:47:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0A72C4CEF7;
	Sun,  2 Nov 2025 11:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762084076;
	bh=KO/jjXTKZVsrw6rCyoErvTVk/A4+o+Omg76KyraJmGc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vONUFMFD94gmqI+BBnwZYmyqRc0SQOqvxiYa4hfaa3nFdqCZXkeNuWOI8JAYcLFAm
	 SJ+5zNWokriMhORoIQLFjJpMw2DgLvoedr9g5LkmtCeGQbxel5NkeLsL43ETYXNXwe
	 W4g5mQI6cNtXKtQq6GANilqX5fMH0szKCkjKLHKxz939xHdI6rktLayxQDI2M2Pa5Y
	 i3L2KGtAlTkDSMTl+V8Ra0FQWi1aiFaaFuuU43VIffxfDp3rCaOD7x2nJj8tKFebzd
	 zPHWWKW7fa4M8btqmNzkqIvf/3S4AzCQZlD3KgCxA/E+UpYDhRKDKdNsmCMl3mXhkp
	 oXYpHIT/9piOg==
Date: Sun, 2 Nov 2025 11:47:48 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>, kernel@collabora.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: iio: adc: Add compatible for MT8189 SoC
Message-ID: <20251102114748.5b0b6da9@jic23-huawei>
In-Reply-To: <20251029-mt8189-dt-bindings-auxadc-v1-1-cd0496527a70@collabora.com>
References: <20251029-mt8189-dt-bindings-auxadc-v1-1-cd0496527a70@collabora.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 29 Oct 2025 15:52:53 +0100
Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com> wrote:

> Add compatible string for MT8189 SoC.
> The AUXADC IP in this chip is fully compatible with the one found in
> MT8173 SoC.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
This had me confused. I tend to review backwards in time so
I picked up Jack Hsu's equivalent patch from the 
[PATCH v6 00/11] Add mt8189 dts evaluation board and Makefile 
series. v6 being posted a day after you.

Thanks

Jonathan

> ---
>  Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> index 14363389f30aef85c596251fca0fe800200e2b41..d9e825e5054fe51c4010fc8a97af05c7639d4753 100644
> --- a/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml
> @@ -42,6 +42,7 @@ properties:
>                - mediatek,mt8183-auxadc
>                - mediatek,mt8186-auxadc
>                - mediatek,mt8188-auxadc
> +              - mediatek,mt8189-auxadc
>                - mediatek,mt8195-auxadc
>                - mediatek,mt8516-auxadc
>            - const: mediatek,mt8173-auxadc
> 
> ---
> base-commit: c9a389ffad27e7847c69f4d2b67ba56b77190209
> change-id: 20251029-mt8189-dt-bindings-auxadc-89ad9e0a7834
> 
> Best regards,



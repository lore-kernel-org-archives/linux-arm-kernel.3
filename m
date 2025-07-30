Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5617FC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 23:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9j9yX1967eLxOki2fQhz+Y5gTTmQmEw34RA/E/7wYA=; b=IIBRsb2b2nsCrZvvcfofHpFCoB
	iWZiYM1/ENQW4FLnc8ypTM+41YSYqOGWz7KCNoDCBnUHXFZv+2eN+C2oDUQcWQOE1ssnlEw2yOa2b
	t30IvKiq+PAjXngN9UWNAcKgV/sRPTCNk+tJn7rEmCwmC2ypqtZILCUhI8dU6StMNzu4b6OzOyP+x
	PLDeWg1/UYwoknGPV4bleKrS1eJKvxK/Dizf/uDFOqwzArbEhAg85imvXdwMS/N6yG2xijksGxkWI
	x7kOvGcupHtuYE/c8oq6NuSr/wViwYyHCNmXxkJLK5A140WlyfGGAshzjn1OtBIFTC+J+k8Kt5n9q
	/uI97r0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGgH-00000002dku-21CF;
	Wed, 30 Jul 2025 23:57:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGdp-00000002da4-1EfT;
	Wed, 30 Jul 2025 23:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E1B6601D2;
	Wed, 30 Jul 2025 23:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9603DC4CEE3;
	Wed, 30 Jul 2025 23:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753919691;
	bh=ksTAo89B5tD8/lmoPdu3reTp6aOUnIluUg9OleY9U14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSOLHC+2xcUclev5lMKl8YTnHqCnmu2FR84Qb5kWKtyZbtzmti1Wa3KT7HXqwee7d
	 XyCHLZKJitXDKtefOZDI+zCGWDIYnT2BBDuM56ofl267HDMSbr7C/g0Unv4i5o9lzr
	 tmAheYiFoK07Q/mv54PpuwelfzTTj6EE11VYCTTKAk5GARLbO5mfhdsEWg5eKsQey9
	 9pAfbmqhy4FU1ayoYWBiirB4O8w2dqVtwxIQzJPn+hG9CMAhqwAjXvFuxbJxA/Nott
	 Cfy12vaqHhWQHW/c0fjk8to667+B5u6m9hNT0st8d2NJUjvNyTM5PD6c9XYGj/JhLz
	 JveiUKPWniMQw==
Date: Wed, 30 Jul 2025 18:54:51 -0500
From: Rob Herring <robh@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Cc: srini@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com,
	lukasz.luba@arm.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, wenst@chromium.org,
	nfraprado@collabora.com, arnd@arndb.de, colin.i.king@gmail.com,
	u.kleine-koenig@baylibre.com, andrew-ct.chen@mediatek.com,
	lala.lin@mediatek.com, bchihi@baylibre.com, frank-w@public-files.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v2 9/9] dt-bindings: nvmem: mediatek: efuse: Add support
 for MT8196
Message-ID: <20250730235451.GA1911689-robh@kernel.org>
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-10-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730152128.311109-10-laura.nao@collabora.com>
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

On Wed, Jul 30, 2025 at 05:21:28PM +0200, Laura Nao wrote:
> The MT8196 eFuse layout is compatible with MT8186 and shares the same
> decoding scheme for the gpu-speedbin cell.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 4dc0d42df3e6..455b96c1e1f4 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -25,6 +25,7 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> +          - const: mediatek,mt8196-efuse
>            - const: mediatek,mt8188-efuse
>            - const: mediatek,mt8186-efuse

You just broke mt8188 as it had 2 entries and now has 3. I think 
(based on the commit msg) you want to change 8188 entry to an enum with 
mediatek,mt8196-efuse and mediatek,mt8188-efuse.

>        - const: mediatek,mt8186-efuse
> -- 
> 2.39.5
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40EBBC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ia2UV3r/DWdlCu9Y2+f241Vrp2ACDacTjx7N4cI4es4=; b=yTjxXVJa42bjerVNilC+/WZlUX
	0Iumwb9AWp1kTmewP3YRoHaH/lbNB6r5dFYUl8C8IPDbt3nLKsfePOQKRn94sNU4/UamesD+DiPKa
	HQQkF24I8D1fJs7pw6JeDlqdTYoOA39U0mfaOuPUDSQn5AOFgiVzXdns5re+oxYdBa0EWxKgpmM/3
	pGh/9XcaygX+u0PhZJ6UiZg7mcsc+x2drZX5oZdzxMbY7FcWqUM62QmdLcSYbtGLkIACuHSeRlXey
	4A3FUFiXelkoYFKi6I8mH+XH5YQp9DNAPe/oV2p3vnw5rHiDiya5RuiLNLmxxuo1IH7gav2GrOWM+
	Vn3z0Q8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7Y2-00000001GUQ-3R42;
	Mon, 03 Mar 2025 15:17:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7UG-00000001FE3-2Ti4;
	Mon, 03 Mar 2025 15:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F74C5C5866;
	Mon,  3 Mar 2025 15:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66C37C4CED6;
	Mon,  3 Mar 2025 15:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741014823;
	bh=SBZUhpymT0Ng8SaIzcFPvGl+P4B6oU/H9HGvmO04ZRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HVD5y0vSsPRzl4ffSylCValEHdYfZACbN3DXT7ToG+Yo4xmYpiWkPgMq9EsURnvMO
	 qow6QiO6v+Mi+w7MSpc9GxRMEG9R6nIj1MJkBLRhLMDDrLwAv7pbA6kHJrvVJ7hhur
	 Pndcx8h01cmrjSiuOb2KlcH7AdedTY/NGaCn6g3ZvVw/A3s55Gn88NTWN7NhUaqWA9
	 Z6YPNAYxRiTGGBmxhM5uuLVomxTwvOUlSDaC5uiNuuUC2Wa5Yx+KQVo/dg3YlncFsG
	 OpSWdhfFDs+QYpHXzvxWaJy+i/zvLwLfOxbuWCvpyy1VbQ5bIkNby1ERABE2HNWM2M
	 JGdo1lx90dhaQ==
Date: Mon, 3 Mar 2025 09:13:41 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 02/20] dt-bindings: mfd: mediatek: mt6397: Add accdet
 subnode
Message-ID: <20250303151341.GA1865196-robh@kernel.org>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-2-5bd633ee0d47@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250302-mt6359-accdet-dts-v2-2-5bd633ee0d47@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_071344_670429_D8E0CA9D 
X-CRM114-Status: GOOD (  13.82  )
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

On Sun, Mar 02, 2025 at 01:30:41PM -0300, Nícolas F. R. A. Prado wrote:
> Describe the accdet as a possible subnode of the MT6359 PMIC.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..1a8c5748a28da6ad8aa091f8c0a74bc1dc709644 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -224,6 +224,13 @@ properties:
>      description:
>        Pin controller
>  
> +  accdet:
> +    type: object
> +    $ref: /schemas/sound/mediatek,mt6359-accdet.yaml
> +    unevaluatedProperties: false

Don't need unevaluatedProperties here. The referenced schema already has 
the constraint.

> +    description:
> +      Accessory Detection
> +
>  required:
>    - compatible
>    - regulators
> 
> -- 
> 2.48.1
> 


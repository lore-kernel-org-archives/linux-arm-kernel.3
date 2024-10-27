Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CF1D1356A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ru0yIFYWuMhf3IasHtUUq8BsYt5R76v/wehofLPd+Q=; b=Q4fIOduO0R5GYok8Vh44Z3ECbD
	CTSCGatsyAn/ajwWoEss2Cl1tV08kZcb3chVfLikBqCpp+C/QN8Sxw5mKqF2HCbmPq9u4G4F+PvLx
	s+geWvONPepHxlWixQLhB0zMH+476Q+AJ3z57wlC00CKs1eETs74ZzWLJNWF+6KH8zclRKGgO36/l
	cr2CKDJRYGrnEV6+0V2Tf3d1VWL+a2c2gXF92Hp2g+X40wPlbaeULZfGshNQ1INrZ+37+DPxUwUzm
	dLk3ljmw+CIO4m+63qj4a9sHyWtOLjhKN1JtSjJt7UFhqbP83KlvSigxZ3QgD/658gpWRHVEdECox
	EVctyrTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ALD-00000008tbN-14kt;
	Sun, 27 Oct 2024 20:58:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AJd-00000008tTd-0xq5;
	Sun, 27 Oct 2024 20:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8B8235C3CBE;
	Sun, 27 Oct 2024 20:56:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7907DC4CEC3;
	Sun, 27 Oct 2024 20:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730062608;
	bh=wiW1+9/2t2c3YZRGJvpPEpiy2DceUIZ9uZej5DwHoas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jIZQ3Ir2v1baN+g79ZQtOPKDXApQwMCW86W0NTfi+Fa+fm8SCl89IDDW2M8+tAwG7
	 0p7umh6jVs2kC9JZ2z3rJfbycyispjtNuZsqglNvlmn5/No4GY9fmAcLBfq5++hovF
	 B7X0Mv6gn7hoSyuLOtTAKfyIq1q/jTijW/JWpKkwxKZytzL/mDuudVAytLUzVejZyw
	 ecZa8E+RRr21YNtxAfucZqXhUjNkgCAToQ1XkEctl8UjVV1Zcbh9J/pKzBWHTDJ5Wj
	 ZcoyHpzFXVJm8lf/Xc2Uuw9AqFD0vQkUPMPlfw2JcSNgqi6m65Fiv7OKUEi3WmvqCu
	 lwGqYPIuRiIeQ==
Date: Sun, 27 Oct 2024 21:56:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Mark Brown <broonie@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Trevor Wu <trevor.wu@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 2/4] ASoC: dt-bindings: mediatek,mt8188-mt6359: Update
 DAI link node pattern
Message-ID: <j5qw52grlce63mccduvryx467h4hvcnqrxrova74d52izq3g5r@wjiflssmq6a5>
References: <20241025104548.1220076-1-fshao@chromium.org>
 <20241025104548.1220076-3-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025104548.1220076-3-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_135649_335193_A0EBD2C4 
X-CRM114-Status: GOOD (  18.48  )
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

On Fri, Oct 25, 2024 at 06:44:42PM +0800, Fei Shao wrote:
> The associated machine driver is not dependent on the format of DAI link
> node names. This means we are allowed to use more descriptive names
> instead of indices without impacting functionality.
> 
> Update the binding to accept arbitrary DAI link names with a "-dai-link"
> suffix. This is the common pattern used by the target (MT8188) and other
> (MT8195, MT8186 etc.) MediaTek-based Chromebooks.

We do not want arbitrary names. Why for example green-batman-dai-link
should be correct? The existing pattern looks wrong. Please read DT spec
and chapter about recommended names.


> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> index 701cedfa38d2..2da34b66818f 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -40,7 +40,7 @@ properties:
>        name defined in the machine driver.
>  
>  patternProperties:
> -  "^dai-link-[0-9]+$":
> +  ".*-dai-link$":

This breaks existing users.

>      type: object
>      description:
>        Container for dai-link level properties and CODEC sub-nodes.
> @@ -112,7 +112,7 @@ examples:
>              "Headphone", "Headphone L",
>              "Headphone", "Headphone R",
>              "AIN1", "Headset Mic";
> -        dai-link-0 {
> +        hdmi-dai-link {

No. Not really justified.

Best regards,
Krzysztof



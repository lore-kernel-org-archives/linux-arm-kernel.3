Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0414ED13585
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dM5YmtEjZSENFbMYFFXTorlapyBszpcOJWCoA6m0IQk=; b=r0XCcEux6k1v1224I/Aw6ZDToH
	gFQOzsivzWWATWIn/H1iYvzffeMvAi1zY6RIPkTW3vrbfkg1wDCT7HjwEDhTjKnOwLsAdt+CRqB5Z
	+8fLnWNirzLKJaB7KcQxaaJvr7EGGdm17XGevhk3dzngogxqtHhqIpAsjHamkw05iHZjiSEqaCSsP
	kSyxaFZjwf6wjC+amfcZWavCC76T0RuvQ6a1jxB4zS1NO25XfGSSF7GKV8wyCiOxu9kFyBybF3Hh9
	atGAFQyaVitvDVSMZjC2kTRyqcxSzhUUKM5TJwiJz2C7Pg72QeU7BHXRY2N4HuzJKHhbyGRssErjs
	hSTWFUNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AGe-00000008t6J-3hxu;
	Sun, 27 Oct 2024 20:53:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5AF4-00000008sws-1ewY;
	Sun, 27 Oct 2024 20:52:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0AAD05C589D;
	Sun, 27 Oct 2024 20:51:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C105C4CEC3;
	Sun, 27 Oct 2024 20:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730062324;
	bh=YQvA8AaVapsjmTVTAY2FtWHoPIl3pWww+615y5P3MVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EEzL4258ubi7gLAucsKes8CpIkt/0PJUde2W0lNeLxNeYwAvkwEj6ml8A1lXS/l64
	 11G430dKvGGQyQNTK8z0QlGR8QvcdQi82gcIP5Aey1ZzlKGGpWy6VF6Nw7j+A+zgtJ
	 WRh4hhPnsY5xoNfwUmOiuQbAXQhSyBIj8pMrLeCikpZqu59DAeW1ALwZLjFSaVbuqL
	 BttcfwHQLxxHclh2wq4Ci+WD3q6ABNtl4EJsZMdQ5YY2hYz8fI+DFVU8glTznoVnDb
	 aZmJ/kqWVwMQzUVhp6taLq0in7zgRqxNx3OAO49fU9c0OqeE8EAuCSFrAINoQL/2cN
	 iYX5BYYX2Ik/Q==
Date: Sun, 27 Oct 2024 21:52:00 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Jitao shi <jitao.shi@mediatek.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add #sound-dai-cells
 property
Message-ID: <5vjaxo652w5hici5hxi3t6o2r5vkggrz25lqvm3or5fip3svke@fttqk5wabxqb>
References: <20241025104310.1210946-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025104310.1210946-1-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_135206_504927_52C1B52E 
X-CRM114-Status: GOOD (  13.68  )
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

On Fri, Oct 25, 2024 at 06:42:45PM +0800, Fei Shao wrote:
> The MediaTek DP hardware supports audio, and the "#sound-dai-cells"
> property is required to describe DAI links and audio routing.
> 
> Add "#sound-dai-cells" property to the binding and filter out non-DP
> compatibles, as MediaTek eDP doesn't support audio.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> 
>  .../bindings/display/mediatek/mediatek,dp.yaml   | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> index 2aef1eb32e11..c05c2b409780 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.yaml
> @@ -42,6 +42,9 @@ properties:
>    interrupts:
>      maxItems: 1
>  
> +  "#sound-dai-cells":
> +    const: 0
> +
>    ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      properties:
> @@ -87,6 +90,19 @@ required:
>  

You need to reference dai-common instead, since this is DAI.

>  additionalProperties: false

and this becomes unevaluatedProperties: false

Best regards,
Krzysztof



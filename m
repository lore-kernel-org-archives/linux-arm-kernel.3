Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 111A8CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 07:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XixqfOM9J0PoFklUsB1rnwvB9KfR6W1/d+d5wu0FUJU=; b=uyEsWtZQSgZVQGmonE8GL50pRB
	7oFP/R69YLUlSlMKY16SYpl2c8ToQjjuMKM17FD4NGB173LZUErFJ4uk2/qlrFpTPsswUzXnD1jTH
	W/fqZ0vV5w+rx/+Arn+y7i2GmRxvX+vbSv3GcRYboBDm2fCB5ge6FNc4VD0TvV4R7xeegLFjtwJMj
	cMlgLwF6MLdCiEwE/k+PHLkfUN2HhmDLvKRuJuVLL5fGSr/Z5ZSVOSDdWVLhnf21aUaIiFySEsKDX
	J6hWlgSMq3YmoPxeGU1Ho8jU2fCdiozMC8iTPs+ZqjGm8m+y3qF65dt9NSKW1gtxOMcPQQXwiB7P8
	4mnq6pjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uozSv-0000000G3zd-2d2k;
	Thu, 21 Aug 2025 07:12:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoz7h-0000000G0QK-1Y1v;
	Thu, 21 Aug 2025 06:50:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C6ABB60200;
	Thu, 21 Aug 2025 06:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3939C4CEED;
	Thu, 21 Aug 2025 06:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755759008;
	bh=u+lsxovfQh47JM2+/dnFIH86HtbVMZEaPA79GiUi060=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rWtcNuVzxcYsC34AHmhjHBgxMf2ouycBh5sbTI6IqDcMDOs4NOiAHwDiinq/rRFcp
	 Zgxpz9CoVE/6w1hlonzqs0taKH8bD0I8vlzYiEt0rlghWXCLkBz2/+nKPXojDrxuwI
	 NvUDXL8TsapMRtBVOYosrNgG2uUt6SsgcjjGQLyBXlIESLxLYwakv0ozJOyxoC7ZxP
	 292JeFide5WNt2qdhGCgu7c9WFuVYhx+jp++UHpQXyr1Q2DfXXvb0zrWJ8fzlizFG3
	 T2t4mnu9y1ueNesgpAAJrCut//SNpr/e7hd8Ru35/r+G3fPuwK+ByZsWf3r01mj1Vf
	 MJolRnW5Wm8EQ==
Date: Thu, 21 Aug 2025 08:50:06 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, amergnat@baylibre.com, andrew+netdev@lunn.ch, 
	andrew-ct.chen@mediatek.com, angelogioacchino.delregno@collabora.com, broonie@kernel.org, 
	chunkuang.hu@kernel.org, ck.hu@mediatek.com, conor+dt@kernel.org, davem@davemloft.net, 
	dmitry.torokhov@gmail.com, edumazet@google.com, flora.fu@mediatek.com, 
	houlong.wei@mediatek.com, jeesw@melfas.com, jmassot@collabora.com, kernel@collabora.com, 
	krzk+dt@kernel.org, kuba@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, 
	lgirdwood@gmail.com, linus.walleij@linaro.org, louisalexis.eyraud@collabora.com, 
	maarten.lankhorst@linux.intel.com, matthias.bgg@gmail.com, mchehab@kernel.org, 
	minghsiu.tsai@mediatek.com, mripard@kernel.org, p.zabel@pengutronix.de, pabeni@redhat.com, 
	robh@kernel.org, sean.wang@kernel.org, simona@ffwll.ch, 
	support.opensource@diasemi.com, tiffany.lin@mediatek.com, tzimmermann@suse.de, 
	yunfei.dong@mediatek.com, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v1 07/14] dt-bindings: display: mediatek,ufoe: Add
 mediatek,gce-client-reg property
Message-ID: <20250821-wandering-vermilion-pigeon-b8c9f0@kuoka>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-8-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-8-ariel.dalessandro@collabora.com>
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

On Wed, Aug 20, 2025 at 02:12:55PM -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for Mediatek UFOe (Unified Frame Optimization
> engine) is missing the mediatek,gce-client-reg property. Add it and

Why is it missing? If the binding is complete, it cannot be missing...

> update the example as well.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../bindings/display/mediatek/mediatek,ufoe.yaml      | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> index 61a5e22effbf2..ecb4c0359fec3 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ufoe.yaml
> @@ -64,6 +64,14 @@ properties:
>        - port@0
>        - port@1
>  
> +  mediatek,gce-client-reg:
> +    description: The register of client driver can be configured by gce with
> +      4 arguments defined in this property, such as phandle of gce, subsys id,
> +      register offset and size. Each GCE subsys id is mapping to a client

Don't explain what DT syntax is. We all know, so that's completely
redundant description. Explain the purpose. Explain Arguments with sechema - items.

Best regards,
Krzysztof



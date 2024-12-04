Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367A6E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 08:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a9AYEPylVfdATNTk2gjgdc2ITqFlSGPsVEQaOeH9Eks=; b=vCfNPfMx2A/Aecjrhvs5w9vL9/
	j0njF9ZVSl/urt4AC5dce2Aw9+mMo8CVPU1UBFbAbvlRc9kei1B1NALrTEMhGly1ti81TFXBmBbyj
	XhyMNHrvncQQVQategUhqK8QaxzBrsNRN8jkT2nk8bc9tmhygG+A0E9d25ISNc1e5JTPIILH4+BMW
	+rFRPFSHghYsXPLlObg5dNAHDQp13zxiK0dNPz4jUFRmpMoL1RCuJwgd1QIjD6QeXx/Fdt7evbiq5
	P00y7HktQTpCWoqYVDjS+tz5g1cF8xZdRIWWNFSzwNyRTck3WX7qy929J4v0+1sSm8/AmLj23778e
	k+JV03tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkuj-0000000BuRe-0tTz;
	Wed, 04 Dec 2024 08:39:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIksO-0000000Bu5s-0LMF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 08:36:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1946CA41B5C;
	Wed,  4 Dec 2024 08:34:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89127C4CED1;
	Wed,  4 Dec 2024 08:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733301411;
	bh=oRmMsiAGKz2uDprT3RwogdQ1d1T5E1DOL9rZ8RdpDZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dsbvJXY52ZwNbczyGsr+B7Uks+9znmzK6DZMnLc+Zz5y2Fm27kjABnAULGSFvsKA0
	 sE+uyxCvYK0Hr39kW4Howe44SkH3fugb12KCVvOZK1VfsYEZaTzzkooNIvY6Se3i3i
	 5UDfsj+MLSpjvD+pUoJvf1ogzFxtX/Ks8xFlfOcqr0q8fhCyULL2fEBYjkDCB2b9PP
	 hUfpKVjWNc5PbTD4+vfEN4Zomc9U4nz43Nu+yVqbH021GOSGUBqmgcTaO0w7STIPh4
	 wJw7wIX0kxbPpjlYIxOU8Ac5nsfDG7VG8DbAJinmucgSS0Lmd+TjDe/Ledak6XLj9K
	 okzUwJurInRcg==
Date: Wed, 4 Dec 2024 09:36:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: soc: ti: ti,j721e-system-controller:
 Add ICSSG ctrl property
Message-ID: <6b4xyh6wjbwt6l44as53wnj57wrga4xscczzjpnxpewd6epxcs@q5odjtm237ny>
References: <20241203173113.90009-1-afd@ti.com>
 <20241203173113.90009-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203173113.90009-2-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_003652_188385_690BFB1F 
X-CRM114-Status: GOOD (  14.39  )
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

On Tue, Dec 03, 2024 at 11:31:11AM -0600, Andrew Davis wrote:
> Add a pattern property for icssg-ctrl which can be part of this controller.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index 378e9cc5fac2a..9ba9cb100ab30 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -68,6 +68,12 @@ patternProperties:
>      description:
>        The node corresponding to SoC chip identification.
>  
> +  "^icssg-ctrl@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/mfd/syscon.yaml#
> +    description:
> +      This is the ICSSG control region.

Drop, regions are not described in DTS.

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B7CCC6B0E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 07:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y3K6Fo3wSzKNEryqAv1HUZhhJtBH6mOniNOOdKbMn3A=; b=3RNaWZRhJpWAChrNJO5Fecj5nw
	wEAJG7nFhhE4difY6neiqIou8r6AIsPdvdexb2BFnUZmToq9U1INIajUvpGJY6/cBiRn3IJp3Os0E
	3JS7TGFGJjtZoqjYjJRykSXg69insQXrzz5BF84ooZx0ttm9nBWlyXrIffq8ArKnoSaa+NP5M+CJD
	H8e9M95Im9BNUtBbYmjBIpo7ECDNg59V7kIzMM+h8fRh3zHV2L4DvqqrE4rxSOwUNPMd/mnWxQKO6
	17znmOfDtBfNYvb8n0aGgXGG+Odu3bdAvdGRN/EWN2DXysjpzT5pGmbzNEhVg8cR0YX9nhHKgMBti
	z+O0wwtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CTV-0000000H5IG-04oa;
	Thu, 02 Apr 2026 07:28:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CTT-0000000H5Hf-1Tq6;
	Thu, 02 Apr 2026 07:28:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C77A561855;
	Thu,  2 Apr 2026 07:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22974C19423;
	Thu,  2 Apr 2026 07:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775114898;
	bh=9coRbM7iQYguurCkJbtaZbv43ox1qglRLQ+Jv/1pW3k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YEYzy0dCdgAZaeFtTncS/0Geo14pHpbUm5TiDpNQtlPXUCbv7gf3Cu6a9AFE5CORR
	 gQJtqGMe+xBph2gKQkEuyOBqWThpV4rbo1PuWIoejFYI+1B60pUUovzHFrlf3Hr3zT
	 86kUT6sGKnx1btgom069H3GvuYCbq0aUkD438RejcRaroutMR6/A0XTi+rPWBDzubT
	 PGbpAH2vOAiVcf0+Zqj0Il4DBSdXL6PD5luQbYQB1sEMJibWPztODvDxOCEYZRzC8X
	 d66YxKw+b5c8ESxW0sMtqQ1yOM/jDLY/BVaqwj6LE7fNWt5JXXKQqjiNbdNkqGFOoD
	 vhMnw0LHusSAg==
Date: Thu, 2 Apr 2026 09:28:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nora Schiffer <nora.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Siddharth Vadapalli <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: ti: phy-j721e-wiz: Add
 ti,j722s-wiz-10g compatible
Message-ID: <20260402-unnatural-polecat-of-promise-31fbde@quoll>
References: <cover.1775045279.git.nora.schiffer@ew.tq-group.com>
 <b9d6a9322ce4f7dc3363dc00d93ab0256e12a8af.1775045279.git.nora.schiffer@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b9d6a9322ce4f7dc3363dc00d93ab0256e12a8af.1775045279.git.nora.schiffer@ew.tq-group.com>
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

On Wed, Apr 01, 2026 at 02:25:21PM +0200, Nora Schiffer wrote:
> The J722S WIZ is mostly identical to the AM64's, but additionally supports
> SGMII. The AM64 compatible ti,am64-wiz-10g is used as a fallback.
> 
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
>  .../bindings/phy/ti,phy-j721e-wiz.yaml        | 20 ++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml b/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
> index 3f16ff14484d2..283e3eedc0f31 100644
> --- a/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
> +++ b/Documentation/devicetree/bindings/phy/ti,phy-j721e-wiz.yaml
> @@ -12,13 +12,19 @@ maintainers:
>  
>  properties:
>    compatible:
> -    enum:
> -      - ti,j721e-wiz-16g
> -      - ti,j721e-wiz-10g
> -      - ti,j721s2-wiz-10g
> -      - ti,am64-wiz-10g
> -      - ti,j7200-wiz-10g
> -      - ti,j784s4-wiz-10g
> +    oneOf:
> +      - items:

Same comments as for netdev patch.

Best regards,
Krzysztof



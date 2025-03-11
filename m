Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D914C28B2E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 07:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqTtKMuVE4OJZRf4mvwOGw0qL3Umj2fOzDAE8AxwP/0=; b=Lg07i0jLYiaVgp4xmJpCspHC2S
	FYKx6MnCPWn0CTz4Z0EfL3Bf42X/8CeO7d422jj3xLKgiO7lw6j1lspTEMRkV8t4MEYJxk3sCOYp8
	I/mOdLz6EGFITT9ai2m0+ZxHroBIv1JI4yZuS9axWiESbq1ezt/RBwuKlF4s388USzEFwnaB08dRy
	xCEDhA+0XH3ToT4RkeE1Ai2jf3HGgUmLqf9lD1CyygEUAmM2o+W5AT4m+cfwUJ1PKSy2IyLGvKvK5
	JWyNHkey/7QOUwCMFAp2CtpEO4zgPUfWLOnsZjaM3WkJcbxupzpjWskv8iVt2e69Rj26BbOqKq4Yl
	l2Nwm+ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1truR4-00000004uy6-0mpF;
	Tue, 11 Mar 2025 07:53:58 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1truP2-00000004uRU-3TLs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 07:51:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BA36AA45E07;
	Tue, 11 Mar 2025 07:46:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B819EC4CEE9;
	Tue, 11 Mar 2025 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741679511;
	bh=sgPc3Qvg0vgmi1gbRN19F9lZOqeVer1XVd9n2oDi5Nk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hBlgToLCWNhHLQM49b0jfSigvXzWgDtpL4wroyDom0phMXBTPN/44Iqyvdw1dr4He
	 48/fKjrsIbLP82a0DaqlamJ6Nc/ZXp9W8dUS2g3AV2dD4ufXMyyed9zWq4jsaQ5R30
	 wP+MyCVPxyX0eqD9FGpOiROcux4u3HxxeHRiw3KVuquuzbphqV62qdPjBs7AA/aCvX
	 1uyVADxfKpDtjqwCXCqmYAr0F98W0y+XQbWI/ASI+Tyf+r0caRUDXQnCddp36vyFiy
	 4C/huKSzMg593dmW4vrZJZRhvSIBf3utvIDxILeOHV0x68VWaTgjb6JEGjG7u40wJK
	 Fix209mp90HcQ==
Date: Tue, 11 Mar 2025 08:51:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Matt Coster <matt.coster@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randolph Sapp <rs@ti.com>, Darren Etheridge <detheridge@ti.com>, 
	Alessio Belle <alessio.belle@imgtec.com>, Alexandru Dadu <alexandru.dadu@imgtec.com>
Subject: Re: [PATCH v3 02/18] dt-bindings: gpu: img: Add BXS-4-64 devicetree
 bindings
Message-ID: <20250311-bizarre-debonair-macaque-451c4f@krzk-bin>
References: <20250310-sets-bxs-4-64-patch-v1-v3-0-143b3dbef02f@imgtec.com>
 <20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250310-sets-bxs-4-64-patch-v1-v3-2-143b3dbef02f@imgtec.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_005152_998121_F7FC8BC9 
X-CRM114-Status: GOOD (  17.56  )
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

On Mon, Mar 10, 2025 at 01:10:26PM +0000, Matt Coster wrote:
> Unlike AXE-1-16M, BXS-4-64 uses two power domains.
> 
> Like the existing AXE-1-16M integration, BXS-4-64 uses the single clock
> integration in the TI k3-j721s2.
> 
> Signed-off-by: Matt Coster <matt.coster@imgtec.com>
> ---
> Changes in v3:
> - Include adding the second power domain so it's in context
> - Remove unnecessary example
> - Link to v2: https://lore.kernel.org/r/20241118-sets-bxs-4-64-patch-v1-v2-8-3fd45d9fb0cf@imgtec.com
> Changes in v2:
> - Use normal reg syntax for 64-bit values
> - Link to v1: https://lore.kernel.org/r/20241105-sets-bxs-4-64-patch-v1-v1-8-4ed30e865892@imgtec.com
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml | 34 +++++++++++++++++++++-
>  1 file changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> index 5c16b2881447c9cda78e5bb46569e2f675d740c4..d9409d33154d429019776ddbf9d123b33f8c9740 100644
> --- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> +++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
> @@ -18,6 +18,11 @@ properties:
>                - ti,am62-gpu
>            - const: img,img-axe-1-16m
>            - const: img,img-rogue
> +      - items:
> +          - enum:
> +              - ti,j721s2-gpu
> +          - const: img,img-bxs-4-64
> +          - const: img,img-rogue
>  
>        # This legacy combination of compatible strings was introduced early on
>        # before the more specific GPU identifiers were used.
> @@ -49,6 +54,7 @@ properties:
>    power-domain-names:
>      items:
>        - const: a
> +      - const: b

No, you just affected old device claiming it has two items. What's more,
it's not synced with power-domains. Both properties must have the same
constraints, but above power domains have "anything".

>  
>    dma-coherent: true
>  
> @@ -74,12 +80,38 @@ allOf:
>          - power-domains
>          - power-domain-names
>  
> +  # Cores with one power domain

Drop

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,img-axe-1-16m
> +    then:
> +      properties:
> +        power-domain-names:
> +          minItems: 1

Drop

> +          maxItems: 1
> +
> +  # Cores with two power domains

Drop

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: img,img-bxs-4-64
> +    then:
> +      properties:
> +        power-domain-names:
> +          minItems: 2
> +          maxItems: 2

Missing constraints for power-domains.

Best regards,
Krzysztof



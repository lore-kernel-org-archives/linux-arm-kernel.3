Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93096C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 21:41:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpQFakc7ADEUOoeWFNjk9SVCUxYjcaGUFeT9R+ZGaX4=; b=PLQ+NllLg/l+UchZgtjVVzl5vE
	8Z20EqUnFWt7t5fcjUhQLBjO1Is9zgKbNpk1u0JWeMzTiz7xX+FnoRAcPLScSZK1Qbc0MCkahEU3h
	eX9F31KAinGWtz1PDhTvnxKFsmyUda3h8wHHTzaWoR83YdojgWl8rkleNQG2zxMiUP/2a9uf9CL5T
	ZCizM9GOoRyqNmv1UMLXg0+pmC3pcOAkSIBey0DSy5U2QtL55izZvN7uBBsAbJB8IqG7AtIzMFmLJ
	r+KRhyJTeF0rRXQfkoLj4f2zHK8q0YSKtMXhGs74Ce38p8VN4Cc6jY0cEH41DQDDAlGyyoqIT2o6b
	1WAZjX2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIyY-00000005s9p-06X7;
	Fri, 10 Jul 2026 21:41:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiIyW-00000005s9T-3p8A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 21:41:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A3CE432E6;
	Fri, 10 Jul 2026 21:41:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7D31F000E9;
	Fri, 10 Jul 2026 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783719696;
	bh=fpQFakc7ADEUOoeWFNjk9SVCUxYjcaGUFeT9R+ZGaX4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HL0+PXIAgq/vTsJi6Sh27o6ad89xc88z3hy9jTsiZAmdHlLWitHpEJBWyZmKRGkdy
	 cj1wzzk7MIdjD1WwWy4uYQUYKVaiIRtmLWXZj+Ch0oY13OCQ3cwygnRtVs4p5ef8VY
	 pSXTehCpIbdJuqP1Tl6H/nkna90WmB+i7ZqPzeaVSo8g0aD5a+WthJKj16ArQPQCr0
	 PhFlSMZ46lsrZ6dgtGDYsMvYQlzPqdWHt1ZM3INWXSgl4Pu1eXUPqbuZczWbBcDc3M
	 JAXqBCrb+Ov2lg5WUG2H3rbqYXbCCVudc5MhfStHB0V5o7LhFwIJ/ekaqBwbuHwQYe
	 hxsRHbNGOwbqA==
Date: Fri, 10 Jul 2026 16:41:30 -0500
From: Rob Herring <robh@kernel.org>
To: Stefano Radaelli <stefano.radaelli21@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	matthias.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: ti: Add bindings for Variscite
 VAR-SOM-AM62
Message-ID: <20260710214130.GA1387333-robh@kernel.org>
References: <cover.1783689915.git.stefano.r@variscite.com>
 <10775b12b801255546c9cdefdb153e421aedf910.1783689915.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10775b12b801255546c9cdefdb153e421aedf910.1783689915.git.stefano.r@variscite.com>
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

On Fri, Jul 10, 2026 at 07:43:07PM +0200, Stefano Radaelli wrote:
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> From: Stefano Radaelli <stefano.r@variscite.com>

Something wrong with the Acked-by here. It goes with the Signed-off-by.

> 
> Add devicetree bindings for Variscite VAR-SOM-AM62 System on Module
> and its carrier boards.
> 
> Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> ---
> v2->v3:
>  - 
> 
> v1->v2:
>  - 
> 
>  Documentation/devicetree/bindings/arm/ti/k3.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> index 69b5441cbf1a..b9da6e62ab79 100644
> --- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
> +++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
> @@ -104,6 +104,12 @@ properties:
>            - const: tq,am625-tqma6254
>            - const: ti,am625
>  
> +      - description: K3 AM625 SoC Variscite SOM and Carrier Boards
> +        items:
> +          - const: variscite,var-som-am62-symphony
> +          - const: variscite,var-som-am62
> +          - const: ti,am625
> +
>        - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
>          items:
>            - enum:
> -- 
> 2.47.3
> 


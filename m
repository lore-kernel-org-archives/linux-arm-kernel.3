Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2E63FD4F04
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 16:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=R5t8OVfsgwzV4HybMnFY0XqulMkPuB+TKjbHDJFbQsw=; b=Oy9Fq1QZ8F2DnR
	63wFglIZ1qTFW28oUz597OuBcXQbzVQmq3E1CksGnqEgSLaU/PJgbkxGiYwzIF4jAUnHTVN3JKfWr
	o5aFb/6S7L2kdx3Cx97q2R/0DqhSjJ5f1uUbMZ1/2XMpfexe6JoZL+Sq9OAbrm0NOUUohmVoKSAg0
	gk5niblzJraNeNliDfZ3WVmptN6aleSniOQMkjLFlV26uT6B/z7ZeGKHEUm6P4algL8jXqDMpudX7
	CB0KwuJSu6y0nWFoWahlhITKN0B5Yrwei4ibmTGOgdntE4HBGoCX0Y8gtncEz38iW9e1EgvsLRI5t
	jQpn8yx//atGGVDQq+yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzei-00000009t6I-2GEb;
	Tue, 10 Mar 2026 16:10:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzzef-00000009t68-1lEv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 16:09:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8243460054;
	Tue, 10 Mar 2026 16:09:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 046ABC19423;
	Tue, 10 Mar 2026 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158996;
	bh=/u5ToRGUYQeBmSQ5KOibb/buWYss9cKiWPPn1ZPU6a0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=EmlBIPWaKCFdyZ30bnuFlVKVbfiYLP9vYWq7zeBabad5/I1TXSJ/iK5ZmmhXbozI1
	 rdCPfrFX3WDqdB2sQjEFLWoA8WncHA05oksjQ+DQUST35zRAdcVmx3VLbMc1PG8p6H
	 Z9Qv55UZjaPo/0+02no43xuv2m/ao0KC4heIOZ9uqPjaMHfUdVGxGVK9inbLGJgDzU
	 ZvcuiOCfd2nDUL4LNDQY4mtGAhMS3se5+t8RLkpyFXpgyBqKY/thXFuRUkHJ0BXpiH
	 e31jDj6Oz2KW+R6JUwiXKj3bplMorUu7K7HqwHuuEi0itBsYtv6kiLGa9/vvg9jT/o
	 NFjv51mskmsqA==
Date: Tue, 10 Mar 2026 11:09:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
	mani@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, peter.chen@cixtech.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v2 1/2] dt-bindings: PCI: update CIX Sky1 PCIe Root
 Complex bindings
Message-ID: <20260310160954.GA691804@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310065338.2337761-2-gary.yang@cixtech.com>
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

Re the subject, every patch is an update.  Can you include something
about the *content* of the change?

Also run "git log --oneline Documentation/devicetree/bindings/pci/"
and make yours match.  In this case, something like:

  dt-bindings: PCI: cix,sky1-pcie-host: Add power-domains

On Tue, Mar 10, 2026 at 02:53:37PM +0800, Gary Yang wrote:
> add power-domains and power-domain-names property
> 
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> ---
>  .../devicetree/bindings/pci/cix,sky1-pcie-host.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
> index b910a42e0843..1d8ee8310588 100644
> --- a/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml
> @@ -38,6 +38,12 @@ properties:
>    ranges:
>      maxItems: 3
>  
> +  power-domains:
> +    minItems: 1
> +
> +  power-domain-names:
> +    minItems: 1
> +
>  required:
>    - compatible
>    - ranges
> -- 
> 2.49.0
> 


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17772E6F074
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 17:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YnSLDvK7aPfCBAXfwFQK9/z41+TuE05E6oeUfzZVRkI=; b=aYrZs2jIYebmXAS8VFOYthAFNE
	EIWRxi+z6bUUNIwOY5kfUwj7fZKkQKjKbdrN9xpSMyQxf7jBlH2fr4O9xjbw48tqrxmSvEC4gqaKE
	xw0povFVXwd8l/74u7LOrjaU7sFK7aaPvSWG790mUBjXsDGU0hL/77bdjLve5bEDbTIUJ1wZMCgnD
	ePAr2xRjTu27xpoF5Yia09WDqQGlx9L7ADC5cazDzmiPK1cl3iKsY/aYNs/0FYYXGwaveg7NbTgmc
	inpjGXDLLv+oUImnm1sRhatYw0Xhh50x3aR2ZYIg7ennJlxqj3lH3WVF0ZOn+x4dmKCdMZPjEas6M
	3QUWyRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vh4-00000007sL5-061u;
	Fri, 01 Nov 2024 17:44:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6vcD-00000007rlB-42E2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 17:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 118A55C57DE;
	Fri,  1 Nov 2024 17:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F4ECC4CED2;
	Fri,  1 Nov 2024 17:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730482756;
	bh=MjpluMk4z1Rdc7ccRrPusPdZsycZJ1/7Dl1Io0hhDd0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rNugFRiWXU9A1hv0yLrPnNuqZWo/NBrOFcGqfFlDK4gWybtlvZuoCNl+xcrBGUYdP
	 OWJ/PlOntDhgHvzfpTtieKf5A0bMLOFaz/ruk/y/KmzHzo2MgkXQho/c1oYD22G4W1
	 b3iCEs9xsocPs1dZflBHc5ZEQSk14PuA2/drhm1SCS+hKb13/ZHluOX7lACK4B81M9
	 Y9HHvanYUTX6Aa0i91zO6apUgfleVN/5XOtnMPunbeUQrvT0th4DppCBkAs4+WLY3c
	 Bd1KqSp+/JZoJdHn9nD6+Drkxg0iWix+QdpgwBpt3OIPaeveosCxqX+LLdczdp69Mm
	 EYoCxGjcKYtvg==
Date: Fri, 1 Nov 2024 12:39:14 -0500
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 01/10] dt-bindings: soc: imx-blk-ctrl: add
 'fsl,power-domains-boot-on' property
Message-ID: <20241101173914.GA3786619-robh@kernel.org>
References: <20241028102559.1451383-1-dario.binacchi@amarulasolutions.com>
 <20241028102559.1451383-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028102559.1451383-2-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_103918_381949_26558BBA 
X-CRM114-Status: GOOD (  17.99  )
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

On Mon, Oct 28, 2024 at 11:25:24AM +0100, Dario Binacchi wrote:
> This property lists the state of the power domains, indicating whether
> they have been left on or off by the bootloader/firmware.
> This information becomes relevant, for example, in the case of supporting
> the simple framebuffer.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml       | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
> index eeec9965b091..00aa0b8d8ea9 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx8mn-disp-blk-ctrl.yaml
> @@ -56,6 +56,15 @@ properties:
>        - const: csi-aclk
>        - const: csi-pclk
>  
> +  fsl,power-domains-boot-on:
> +    description: |
> +      Provide the on/off (1/0) status of the power domains. It allows
> +      specifying whether one or more power domains have already been
> +      initialized and left powered on by the bootloader.

Sounds like a common problem *if* we wanted to fix it in DT.

Why can't you just read the h/w registers to see which domains are 
powered on? Perhaps because some are on, but you want to turn them off.

Also, for simple-framebuffer, I think you can list the power-domains to 
keep on.

Rob




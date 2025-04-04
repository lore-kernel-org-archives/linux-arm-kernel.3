Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2630BC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 09:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UkGhpRwbzS0VPnH1TZfEQLwmTd3JyghrN/O4RuEAQws=; b=uwhidSIplClmn89mBiVDVf4CMO
	XwCIsYMkp6mHGgIYBGiyqSu+sPpyrfegcr9R0TbsCNzi97bDjFx9WjfTbkBrzu3dQ09lAXrZGAm+I
	eWKJvIcxZdkS6VlYfq9IJree4XvS9yozboruKJudZ5K2yfyOGc/iAj4KoagXbjb8YtQvCUvsdfEbv
	m4QCrV2ddU7FGBGo4plB7WS0m4QgMspIz8c61McawD6UnF5Vhnf417IV3JSIZr3SSwnixHTrvATAH
	nl4UD9VghmQYnlZGoMOpkgTzihmTVh3p+ugGud+EGDqBdS1+exQjX0c+NRO0an/mYv5G1aDYRRA2E
	6z0+EU2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0daY-0000000BJAl-3aeL;
	Fri, 04 Apr 2025 09:43:50 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0dYW-0000000BIsR-0dfj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 09:41:46 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 95D6D1F99A;
	Fri,  4 Apr 2025 11:41:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1743759695;
	bh=UkGhpRwbzS0VPnH1TZfEQLwmTd3JyghrN/O4RuEAQws=; h=From:To:Subject;
	b=rM36v9PegNSof5+k1AZosOO95S82pCG12s5H1kAQn3tvMp8p/k7+sdFmwvoIcpEaS
	 1EbZnOU2ZfcaZqcfLtZBw8uKWB7YMw5CxqhqkjwD/e7B7W2cZVnHNtYcUxBN/yEDXT
	 ZjK/wtatzssOVL3fNZiKn77aGX2jMRlVaBkDwFVpWd89csspEl8XuhjNxTbItmC4bN
	 XnNLLOci4o3SmrFY7wT53qthCWduaaSpyRrnXwyXRROOkoX9MUkAd6fKmQpiQI3wuy
	 czMP+IxxwbcgvQug+9IkreCSFe5iEU2j/cuPijpfjnhHE2xC07eRT2V1qybBr+9paj
	 Kk3OTqjOrMhrA==
Date: Fri, 4 Apr 2025 11:41:30 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Sherry Sun <sherry.sun@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-imx@nxp.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 2/4] dt-bindings: imx6q-pcie: Add wake-gpios property
Message-ID: <20250404094130.GA35433@francesco-nb>
References: <20231213092850.1706042-1-sherry.sun@nxp.com>
 <20231213092850.1706042-3-sherry.sun@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231213092850.1706042-3-sherry.sun@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_024145_082753_0F6C196E 
X-CRM114-Status: GOOD (  16.02  )
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

Hello

On Wed, Dec 13, 2023 at 05:28:48PM +0800, Sherry Sun wrote:
> Add wake-gpios property that can be used to wakeup the host
> processor.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>
> Reviewed-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> index 81bbb8728f0f..fba757d937e1 100644
> --- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> +++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
> @@ -72,6 +72,12 @@ properties:
>        L=operation state) (optional required).
>      type: boolean
>  
> +  wake-gpios:
> +    description: If present this property specifies WAKE# sideband signaling
> +      to implement wakeup functionality. This is an input GPIO pin for the Root
> +      Port mode here. Host drivers will wakeup the host using the IRQ
> +      corresponding to the passed GPIO.
> +

From what I know it is possible to share the same WAKE# signal for
multiple root ports. Is this going to work fine with this binding? Same
question on the driver.

We do have design exactly like that, so it's not a theoretical question.

Francesco




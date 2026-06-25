Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AC01CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0aI9wxuGKnbMvNl58qFdzMKLZ8nilpFIGpTQF1yLvJQ=; b=47rqr3WXpu8c3HTZPCipv6ZMni
	9h3mb4FSKBw//p/2j9vARNy2B8f4a7sJnjn5hFhE4mWEdKRZUb/+WZ0nSwWSNXGIlVqV1aoQENm82
	L2b5LhrCswZcMsXdvI+J5osesBW+YQxSItU9SfFwSfKcS/Sgk0nJA8ZaxAWJ6B9UeSqdNSC8S991v
	4B03VZPhOVN5WxLR6BOWyAaITEp5XbvtIJcQ9qjjYiwV+WdgRt+kaRyKMEcky1Nz7OAB4tCaa4d99
	WBny3YPzMb1PxFCV9JrwV0YWIe6/y9d+hFxrKqogo4nJ2rE3vcC52hl8GtWr4CdX0C9sE9ENML1U/
	OgSs+54w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcenc-00000008mlK-1ytL;
	Thu, 25 Jun 2026 07:47:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcenb-00000008ml2-0sFC;
	Thu, 25 Jun 2026 07:46:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C0FA643C7A;
	Thu, 25 Jun 2026 07:46:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA2C41F00A3A;
	Thu, 25 Jun 2026 07:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782373618;
	bh=0aI9wxuGKnbMvNl58qFdzMKLZ8nilpFIGpTQF1yLvJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=euU89ZS/Uej3WNn+mAK8by30KuxAIW5caVo5xUmeAUal8lqQ6MedvJ5BKWgTFjYpn
	 5E8zQWM6/KHOW1H8jtCf8lMXfiDKw2zT0gRbCVzM2dkGyor88Fl0a9NDMOpdz8ASZV
	 MapuD5aSvtASL/sD4jHD6sFKou1pCQtj4uHDKy7FWwD6dmavic0oJavxOQNyZyubsj
	 0th0tf4iTu5msvTuS3xIbW0QLilMYvidsc/fcB8JxDWHSGNswrEW5keWBgsBnclPY/
	 l1g/DS9ZCwHD98ynwAaf1O6ZgHpZWLodumWGNKceaX6gRg7gC0RmWhPtRj20OTJaAh
	 OWqFgv2VjbEvQ==
Date: Thu, 25 Jun 2026 09:46:54 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Diederik de Haas <diederik@cknow-tech.com>, 
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: usb: Add Rockchip RK3568 compatible
 for EHCI and OHCI
Message-ID: <20260625-rare-kiwi-from-hyperborea-8f080c@quoll>
References: <20260624192726.781864-1-jonas@kwiboo.se>
 <20260624192726.781864-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260624192726.781864-2-jonas@kwiboo.se>
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

On Wed, Jun 24, 2026 at 07:27:24PM +0000, Jonas Karlman wrote:
> The Rockchip RK3568 EHCI/OHCI controller depends on clk_usbphy1_480m
> being enabled, or the system may freeze when registers are accessed.
> 
> Add Rockchip RK3568 EHCI and OHCI compatibles with a similar four-clock
> constraint as RK3588, also extend the EHCI constraint to include RK3588
> to match similar requirements of RK3588.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Existing DTs for RK3568 use the plain generic-ehci/ohci compatible,
> next patch make use of these new compatibles and adds the missing
> clk_usbphy1_480m clock references.
> 
> Existing DTs for RK3588 have contained the required four clocks since
> the initial addition of the EHCI/OHCI nodes.
> 
> Changes in v2:
> - Include rockchip,rk3588-ehci in the EHCI constraint
> - Make clocks prop required for EHCI and OHCI
> ---
>  .../devicetree/bindings/usb/generic-ehci.yaml      | 14 ++++++++++++++
>  .../devicetree/bindings/usb/generic-ohci.yaml      |  7 ++++++-
>  2 files changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/usb/generic-ehci.yaml b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> index 55a5aa7d7a54..a39f01e740b1 100644
> --- a/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> +++ b/Documentation/devicetree/bindings/usb/generic-ehci.yaml
> @@ -52,6 +52,7 @@ properties:
>                - ibm,476gtr-ehci
>                - nxp,lpc1850-ehci
>                - qca,ar7100-ehci
> +              - rockchip,rk3568-ehci
>                - rockchip,rk3588-ehci
>                - snps,hsdk-v1.0-ehci
>                - socionext,uniphier-ehci
> @@ -186,6 +187,19 @@ allOf:
>        required:
>          - clocks
>          - clock-names
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - rockchip,rk3568-ehci
> +              - rockchip,rk3588-ehci
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +      required:
> +        - clocks

This is ABI break for RK3588, so your commit msg should also mention
that RK3588 is not working for example. Otherwise you provided rationale
only for breaking RK3568 ABI.

Same for OHCI part.

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2031ECAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 15:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WX+3QVQrdEoBVgygNt/gvGVjG0i16otbvUqZM1g4YOE=; b=Knqy9Ashs8ul7kB58SaYxC66JM
	cPvU9LXcRLS5A5QLEu2DzY/gmWE7SDw3zZ07y/2q2X/dWB+NayX00zSvIm7B6KFujC6LNve4vaN7C
	kPrqnwSWSIE/awi37lFeLyCVvP+huefvOes9vMD8mjsyei8QibCrc+kLTLB1VqXzFd62Yo5dRZOte
	kOmA6AR+MBkpG5hx71GVwEPseKZAw0cZAYSkhUqXljj0LsrvfsQcKXYIAwY02vNNBf2KdVqf+P+lj
	leOpaZ2/VyGu0pfuPLIApkVpzpwshHDuvJBrcl+HZbYmrC+nvQ0HutzwouG/KsW9il0CGjmxJ96Xg
	m+E3C7kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcyG-00000003Jc6-10aA;
	Fri, 19 Sep 2025 15:24:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzcyE-00000003JbY-2wZE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 15:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 253B360194;
	Fri, 19 Sep 2025 15:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6B27C4CEF0;
	Fri, 19 Sep 2025 15:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758295461;
	bh=ABPSXlxAq7jRyiDCS/EVwlVL/meoOY0nO0Ad+jU4kDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DU3dHtFIBsAxB7Pt5UVMSZJt7VS4WcAeAutUWseQBKC3/LV2iFNdTkOSl/JwGx2i/
	 sLZdGnErEYEAnsGyaijiiaZ6WDIOVntvtMC7lgCKAFrGN08e1if82OrLI+K3F7dmpO
	 MLBQHh9Ijh22VanE3obrw/2WwaxYSWN3nwNB4Cu3c+AFaFgX6iNk5WStniMZxlCaAQ
	 DDBhLjgbgo56vcWx/G2yobWmdru3hZbMEUfkasPAqnoC5ixr+oewGsXXV9oTTPY9PM
	 keZff9OUrkv1q5YI9gzQkiqRnXErR7arzVhi76QCBOFtJ7n+GzOoVaz5akrRgRb9y8
	 5XFW5AMSHhUNA==
Date: Fri, 19 Sep 2025 10:24:14 -0500
From: Rob Herring <robh@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v6 7/7] dt-bindings: soc: fsl: qe: Add support of IRQ in
 QE GPIO
Message-ID: <20250919152414.GB852815-robh@kernel.org>
References: <cover.1758212309.git.christophe.leroy@csgroup.eu>
 <7269082e90d20cf2cb4c11ceb61e24f0520d0154.1758212309.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7269082e90d20cf2cb4c11ceb61e24f0520d0154.1758212309.git.christophe.leroy@csgroup.eu>
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

On Thu, Sep 18, 2025 at 06:23:27PM +0200, Christophe Leroy wrote:
> In the QE, a few GPIOs have an associated IRQ to notify changes.
> Add IRQ support to QE GPIO.
> 
> As not all GPIOs have an associated IRQ, the driver needs to know
> to which GPIO corresponds each provided IRQ. This is provided via
> multiple compatible properties:
> 
> 	compatible = "fsl,mpc8323-qe-pario-bank-a"
> 	compatible = "fsl,mpc8323-qe-pario-bank-b"
> 	compatible = "fsl,mpc8323-qe-pario-bank-c"
> 
> 	compatible = "fsl,mpc8360-qe-pario-bank-a"
> 	compatible = "fsl,mpc8360-qe-pario-bank-b"
> 	compatible = "fsl,mpc8360-qe-pario-bank-c"
> 	compatible = "fsl,mpc8360-qe-pario-bank-d"
> 	compatible = "fsl,mpc8360-qe-pario-bank-e"
> 	compatible = "fsl,mpc8360-qe-pario-bank-f"
> 	compatible = "fsl,mpc8360-qe-pario-bank-g"
> 
> 	compatible = "fsl,mpc8568-qe-pario-bank-a"
> 	compatible = "fsl,mpc8568-qe-pario-bank-b"
> 	compatible = "fsl,mpc8568-qe-pario-bank-c"
> 	compatible = "fsl,mpc8568-qe-pario-bank-d"
> 	compatible = "fsl,mpc8568-qe-pario-bank-e"
> 	compatible = "fsl,mpc8568-qe-pario-bank-f"
> 
> When not using IRQ and for banks having no IRQ (like bank D on mpc8323)
> the origin compatible = "fsl,mpc8323-qe-pario-bank" is still valid.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  .../gpio/fsl,mpc8323-qe-pario-bank.yaml       | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> index 0dd9c0e6ca39..c34aeea119e0 100644
> --- a/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> +++ b/Documentation/devicetree/bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml
> @@ -14,6 +14,22 @@ properties:
>      items:
>        - enum:
>            - fsl,chip-qe-pario-bank
> +          - fsl,mpc8323-qe-pario-bank-a
> +          - fsl,mpc8323-qe-pario-bank-b
> +          - fsl,mpc8323-qe-pario-bank-c
> +          - fsl,mpc8360-qe-pario-bank-a
> +          - fsl,mpc8360-qe-pario-bank-b
> +          - fsl,mpc8360-qe-pario-bank-c
> +          - fsl,mpc8360-qe-pario-bank-d
> +          - fsl,mpc8360-qe-pario-bank-e
> +          - fsl,mpc8360-qe-pario-bank-f
> +          - fsl,mpc8360-qe-pario-bank-g
> +          - fsl,mpc8568-qe-pario-bank-a
> +          - fsl,mpc8568-qe-pario-bank-b
> +          - fsl,mpc8568-qe-pario-bank-c
> +          - fsl,mpc8568-qe-pario-bank-d
> +          - fsl,mpc8568-qe-pario-bank-e
> +          - fsl,mpc8568-qe-pario-bank-f

Is this supposed to be mpc8569? I don't see any existing 
"fsl,mpc8568-qe-pario-bank" compatibles.

This breaks the ABI. If the OS relied on "fsl,mpc8360-qe-pario-bank" for 
example, you just broke it.

As the GPIO bank doesn't do any interrupt handling itself 
(mask/unmask/ack), you can just do this (using 
fsl,mpc8360-qe-pario-bank-a case):

interrupt-map-mask = <0x1f 0>;
interrupt-map = <15 0 &qepic 0>,
                <16 0 &qepic 1>,
                <29 0 &qepic 2>,
                <30 0 &qepic 3>;

And then a user of the GPIO interrupt just says "interrupts = <15 0>;".

Rob


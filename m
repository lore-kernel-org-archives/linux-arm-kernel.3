Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6711CC369C5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 20:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHN8nx+hJA0ddmkWp6/hd5dD3IMZy4t+7PEv3GvSSSk=; b=0wKsMgoEE25UscbLRMje7QFKn4
	EFECPvpYcopxGWY9sVromP6QYIjDLUiU43y1n2rz4KeIA5bgSaTdArC3ewreZBiKRNLDlIYiPq59c
	gFrjDNYQAdkLMisclgrSUTt8Kzdfgn4wmjASvbQ7XC3kEXxwTeTft9Ah9ZETaCnLS/GOGTop0PiHV
	9kI2trAcbCigS5XTfp25KM6VHbngFNiyKfZbSreh8eUZArs26i0FhV/U4w666KGfv4slonye2C33p
	BGDf+56Y/Bnq5YCLHRy/hA3/kSjWAUfRORW+dN/qPPIB+RgSYsc3g39LcEYdrtns5OwkcYgbB/8vA
	Ui5hCo2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59GS-0000000Anj9-1mGe;
	Wed, 16 Apr 2025 20:21:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u59Cn-0000000AnB5-2fOm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 20:17:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09B0F5C355F;
	Wed, 16 Apr 2025 20:15:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D5FC4CEE2;
	Wed, 16 Apr 2025 20:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744834676;
	bh=Rqjfm170FU04ptSuzldQXNurK+mFSfeb6c6X8NWF9pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hivB+JetRtogsRvxo2jcHwJQU7ACyQBe7X6ol7HpWhfrKq2kebyAGsXVlg4hb+EwA
	 ZMxSbHkTE79VtFICzI6sJ3n8e9UcmyOnkFlEz+nrT5KIegI3hx5+2FNkW71kVsTVjL
	 NGcjF+jgq9y7KELzkZk8cF4+zTha+tmRRqFcI3ykUJ+UupOWiT4VFbobS8zuxFtYS+
	 hLXN41GvYwYyyx7Mt7OTwcGBRI8VKtndBloxgsz679gQW2BEhLh31YcrlFPLk9VbWQ
	 oBFxVe1Y6NloUXt/l6TUWex7vQLKXpHEv6c5VLw75wv6RLAjbx9hb6GJp+ZOOkemF2
	 txyThFvyc+8sg==
Date: Wed, 16 Apr 2025 15:17:55 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 07/13] dt-bindings: arm: vt8500: Add VIA APC Rock/Paper
 boards
Message-ID: <20250416201755.GF3811555-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
 <20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-7-f9af689cdfc2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_131757_725926_A8F33B40 
X-CRM114-Status: GOOD (  17.30  )
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

On Wed, Apr 16, 2025 at 12:21:32PM +0400, Alexey Charkov wrote:
> APC Rock is a development board based on WonderMedia WM8950 SoC
> released around 2013. Paper is the same as Rock but lacking a
> VGA port and shipped with a recycled cardboard case.
> 
> While at that, put myself as the maintainer, given that Tony is
> unavailable as of lately.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/vt8500.yaml | 19 +++++++++++--------
>  1 file changed, 11 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/vt8500.yaml b/Documentation/devicetree/bindings/arm/vt8500.yaml
> index 5d5ad5a60451f569e6ef30c924a1964d02e1aa82..1906a8843b0ceebe31eebc3b429560dd0d9cea6a 100644
> --- a/Documentation/devicetree/bindings/arm/vt8500.yaml
> +++ b/Documentation/devicetree/bindings/arm/vt8500.yaml
> @@ -7,19 +7,22 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
>  title: VIA/Wondermedia VT8500 Platforms
>  
>  maintainers:
> -  - Tony Prisk <linux@prisktech.co.nz>
> +  - Alexey Charkov <alchark@gmail.com>
>  description: test

Delete this line while you are here.

>  
>  properties:
>    $nodename:
>      const: '/'
>    compatible:
> -    items:
> -      - enum:
> -          - via,vt8500
> -          - wm,wm8505
> -          - wm,wm8650
> -          - wm,wm8750
> -          - wm,wm8850
> +    oneOf:
> +      - const: via,vt8500
> +      - const: wm,wm8505
> +      - const: wm,wm8650
> +      - const: wm,wm8750
> +      - const: wm,wm8850

Keep all these as a single enum.

> +      - description: VIA APC Rock and Paper boards
> +        items:
> +          - const: via,apc-rock
> +          - const: wm,wm8950
>  
>  additionalProperties: true
> 
> -- 
> 2.49.0
> 


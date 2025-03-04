Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64DDC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kRXHjVkh0D670pU3KBuvulpK+zQZbcXjeUBGTCYPhD0=; b=3fxG9L+cgUhHJr1lJGBlC55e42
	j4Wjli1EBb7UE2t1lJPaq7H6cF2t0YIIosrXUETNperil/o4fEIJ++3Ymg41k0ElI1z3/Foxp3fQG
	HT73Fyg2yBwDiX4DTmvsruQY9Jsakd7l+x0AxgJm73zoj748iDak2bOGOKcmuSTY8DcENL0yVzgaC
	jPwlfBDbq7iTsVcWMxekGG+raTrBU4GX/e1aiYj9VnmySiRYMeKmi89zqG0lKbYnoGsi0H5qDvE1/
	dvJSUjCY4jGgpgrD+b8JT7fIpbCOOFe7kN8kYad0gbfwuO0iZXhRDiW4kFG5P3MmPKxQubW0Up5RI
	HOgZQcPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpT91-00000004xoP-1207;
	Tue, 04 Mar 2025 14:21:15 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpT7Q-00000004xTx-49IO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:19:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 29825A44FD2;
	Tue,  4 Mar 2025 14:14:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70751C4CEE5;
	Tue,  4 Mar 2025 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741097975;
	bh=8jHtcSbIl6KMW0jgkbyI/Ws4v68dSrEq5fvmCHAfE7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AwL3mjOwXgWUC1OD8LtZoy5XIgAH2/zu3uezpVQKogKMMMQlEAMZmgmFuiOwlq2nb
	 bqNAPpDmz87vwFK10kZKxU+0LJTS4pLxwBSOumM0zCLuhAO1J/UUFChIQOyvRH/i52
	 o2aoemQsfaEJbdQbwZauG/lzaQR4cf8yt2JnLhLGVQr45SFxlbR4+BG+fNYzqGCjhV
	 AcL/SwBCRyUwz1mFMu2Q14bBjeaLXMjdjHUm+LkeL/HtGYurU0qGzSNGRcl1nKz7g8
	 64NLm2xxcIMSnHAmGqTEoYfeh35788XJoruCGCPRs883If2bpkDZ6NsroiXTsGY4O2
	 1g0sWDKhHVh6A==
Date: Tue, 4 Mar 2025 08:19:33 -0600
From: Rob Herring <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6 02/10] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
Message-ID: <20250304141933.GA2543583-robh@kernel.org>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
 <20250304-bcm59054-v6-2-ae8302358443@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304-bcm59054-v6-2-ae8302358443@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_061937_172241_EF058224 
X-CRM114-Status: GOOD (  19.84  )
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

On Tue, Mar 04, 2025 at 07:20:33AM +0100, Artur Weber wrote:
> The BCM59054 MFD is fairly similar to the BCM59056, and will use
> the same driver. Add compatible and specify the allowed regulator
> nodes.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v6:
> - Replace mfd/brcm,bcm590xx.yaml with mfd/brcm,bcm59056.yaml
> 
> Changes in v5:
> - Replace mfd/brcm,bcm59056.yaml with mfd/brcm,bcm590xx.yaml in
>   regulator bindings description
> 
> Changes in v4:
> - Fix yamllint errors (missing unevaluatedProperties)
> - Drop comment with regulator name list
> - Use full schema paths for $reg
> - Change description of regulator binding to mention BCM59054
>   explicitly
> - Drop quotes around vbus reg name
> - Change "Power Management IC" to "Power Management Unit" to match
>   official Broadcom naming
> 
> Note that I did not end up moving the regulator refs from
> allOf compatible matches; I explained my reasoning in [1].
> 
> [1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/
> 
> Changes in v3:
> - Split regulator node into separate file
> - Removed quotes around compatible
> ---
>  .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
>  .../bindings/regulator/brcm,bcm59054.yaml          | 56 ++++++++++++++++++++++
>  2 files changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
> index b387ef9885c3ac524e0782545dbca9c0e81a556c..b67d7a723fc242869e5bdc6b3602785f62af45bd 100644
> --- a/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm59056.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: brcm,bcm59056
> +    enum:
> +      - brcm,bcm59054
> +      - brcm,bcm59056
>  
>    reg:
>      maxItems: 1
> @@ -21,7 +23,6 @@ properties:
>  
>    regulators:
>      type: object
> -    $ref: /schemas/regulator/brcm,bcm59056.yaml#

Just do:

additionalProperties: true
properties:
  compatible:
    contains:
      enum:
        - brcm,bcm59056
        - brcm,bcm59054

(This patch should just add the last line)

And drop the allOf below.

>  
>  required:
>    - compatible
> @@ -30,6 +31,27 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm59054
> +    then:
> +      properties:
> +        regulators:
> +          $ref: /schemas/regulator/brcm,bcm59054.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm59056
> +    then:
> +      properties:
> +        regulators:
> +          $ref: /schemas/regulator/brcm,bcm59056.yaml#
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>


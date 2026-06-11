Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6782FCD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 07:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdnqG6HuOV9OtKkF5ww4O5HMNFK+JDqxC6oYIJO1qR8=; b=2L8Yl67GZI8hClbeHrJo4iOqtl
	/GGPRNOM3/YAMzFIov7a8MTfTx32x715H5OKlA2brPDROJ8rYRibOL4lNiWUnG5CDNJgLiuJFs2X5
	yVMAxfIuts+hC3/5YkzcTcrCwfE5dpfff3oWCqUfdBRCAwx45dTew/jGMUf+0/SmsAX2qV5DxKHmp
	F6Z/fQlbjV+XPvlfMi9E0cr8x7hhPJpyqjUMYYzrCfpyys98L5ZK+l/25owjEmK9yzCI4up0XrS9t
	P3AWfFpheNQrjfOJsOBr1iwF8LaOvkGtdzj4UV4CoX2ZZmAlYx4poO228IW9zOryEcdjmIVd7hqUd
	F/6914nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXa1c-00000008tDN-0fJR;
	Thu, 11 Jun 2026 07:40:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXa1a-00000008tCw-3gOY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 07:40:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 00C5E60052;
	Thu, 11 Jun 2026 07:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BA871F00893;
	Thu, 11 Jun 2026 07:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781163625;
	bh=UdnqG6HuOV9OtKkF5ww4O5HMNFK+JDqxC6oYIJO1qR8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pf5jT1qWShYnBKo7WlrpSjwNa0q6F3mWdYLMT30kYYaP72XCVK29bzLIBBySlxlql
	 8ItQlvep2nIykpVJryzcBXZyb51YPXOc5ITEKeB1BELHHKURLmSH7t0Vx+72QocsVj
	 D3mXwcAzH5Ojx06ZePiiIyM9H03JCnjo1ZQAPvun2sE76dP+p4u2oeE8QmaDwRZWU9
	 6/x0hyxH6iXyFkiPOqMkRlpxw2tKZIAZE8gVriYNm7jo84x6oIX+5hqRuebk1GmeoU
	 0sQMycH516IoEmHKtykK4CX+WR412dUwuV4k/u/5Ih+UCG69gl2WL6wk/JdL++x8WI
	 QJuuu7EW82qmw==
Date: Thu, 11 Jun 2026 09:40:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, bmasney@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
	gary.yang@cixtech.com, cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: soc: cix,sky1-system-control: add
 audss system control
Message-ID: <20260611-gorgeous-macho-cricket-f1b78c@quoll>
References: <20260610075645.3581145-1-joakim.zhang@cixtech.com>
 <20260610075645.3581145-2-joakim.zhang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260610075645.3581145-2-joakim.zhang@cixtech.com>
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

On Wed, Jun 10, 2026 at 03:56:41PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> The Cix Sky1 Audio Subsystem (AUDSS) groups audio-related clock, reset
> and control registers in a dedicated CRU block. Software reset lines are
> exposed on the syscon parent via #reset-cells, following the same model
> as the existing Sky1 FCH and S5 system control bindings.
> 
> Add the cix,sky1-audss-system-control compatible to
> cix,sky1-system-control.yaml for the MFD/syscon parent node, and define
> AUDSS software reset indices in
> include/dt-bindings/reset/cix,sky1-audss-system-control.h for I2S, HDA,
> DMAC, mailbox, watchdog and timer blocks.

All this is pretty pointless - you explained the binding, which answers
nothing why you did it that way. Instead you must explain the hardware
design.

> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../soc/cix/cix,sky1-system-control.yaml      | 52 +++++++++++++++++--
>  .../reset/cix,sky1-audss-system-control.h     | 25 +++++++++
>  2 files changed, 72 insertions(+), 5 deletions(-)
>  create mode 100644 include/dt-bindings/reset/cix,sky1-audss-system-control.h
> 
> diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
> index a01a515222c6..61d26a69fd44 100644
> --- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
> +++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-system-control.yaml
> @@ -15,11 +15,16 @@ description:
>  
>  properties:
>    compatible:
> -    items:
> -      - enum:
> -          - cix,sky1-system-control
> -          - cix,sky1-s5-system-control
> -      - const: syscon
> +    oneOf:
> +      - items:
> +          - enum:
> +              - cix,sky1-system-control
> +              - cix,sky1-s5-system-control
> +          - const: syscon
> +      - items:
> +          - const: cix,sky1-audss-system-control
> +          - const: simple-mfd

Just so you are aware - this means children do not depend on the parent
for operation. You will not be able to fix it later, if it turns out
that children do depend...

> +          - const: syscon
>  
>    reg:
>      maxItems: 1
> @@ -27,6 +32,28 @@ properties:
>    '#reset-cells':
>      const: 1
>  
> +  clock-controller:
> +    type: object
> +    properties:
> +      compatible:
> +        const: cix,sky1-audss-clock
> +    required:
> +      - compatible
> +    additionalProperties: true
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: cix,sky1-audss-system-control
> +    then:
> +      required:
> +        - clock-controller
> +    else:
> +      properties:
> +        clock-controller: false
> +
>  required:
>    - compatible
>    - reg
> @@ -40,3 +67,18 @@ examples:
>        reg = <0x4160000 0x100>;
>        #reset-cells = <1>;
>      };
> +  - |
> +    audss_syscon: system-controller@7110000 {
> +        compatible = "cix,sky1-audss-system-control", "simple-mfd", "syscon";
> +        reg = <0x7110000 0x10000>;
> +        #reset-cells = <1>;
> +
> +        clock-controller {
> +            compatible = "cix,sky1-audss-clock";
> +            power-domains = <&smc_devpd 0>;

My questions from v2 from the other patch are still valid - why audss
system clock controller is outside of the power domain? Why the audss
reset is outside, but audss clock not?

This does not feel like correct hardware representation.

Best regards,
Krzysztof



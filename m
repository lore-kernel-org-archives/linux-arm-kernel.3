Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80935D25056
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s+0zR7sU74JK93BP9J7oK5/pVz/+oj+wiFweJGhzTPw=; b=pL8X9H0PWB2Gg4slmqGLxU/TWK
	DYs1pRCB7Ux0Htl3M83vpuymu2+qqXiLaUhHJ3B3+SvF1gG69s7qIreN3aO8Fpnf/zMC6NnpRuNxT
	eyNgW3kfw6pHHDU1TBWB/AFMb6/t3/R0gzTDkt4o9Lyzj+ESoKTr7daZtrtKp18ij4BPFn53sqndS
	Us2mRFN3gyHziGa/X5jzELJ6EbahBiqQHKaYZBCcJ7KqaVgNREzhfq3hyWq+FabaemjKvisrGbKGr
	jHTj9r6QBjjMH/f5bdfKDAtdYsXneHydJG8IrfRWtnSEvW+xLd28LIJBHAr+rnvU2h/OMroP+AUF8
	T8fixqpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDwU-000000053YT-2Kem;
	Mon, 12 Jan 2026 09:10:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfDwT-000000053YN-082U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:10:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9328060166;
	Mon, 12 Jan 2026 09:10:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B56C2BC86;
	Mon, 12 Jan 2026 09:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768209026;
	bh=btIfgvN//QCdfFLDobhX7wI+ddL2rHMM6ASGnTTOltI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C9hUOhhBivbYhH0L79leJUnCAzU484e/Z8gGzumvj6wzb4MN6U2NNqybUhnfcOyQO
	 Zhne5wgu4VbOhr73oWsDCMLLQb5oQVokoSDiTQzShgJV9o4f972SXVcnyxphapswkj
	 U8+yyWXoSHe29KEtxgerrKJzwnLPE/GsjjxRSfriQYqFfnZaDVdj+deU6kbLYa7cr+
	 d75nsNdcqPAGBoJU6ZINvGXhYeZRXR2xFHlKrC8QyEfvNDsqtLR9n3j5pknqwsnCkI
	 cd2wejipsyGe3qAsBwW3bacLNUKRplkQ3XSCLVw3HDHxQVeBjdeYfy9aumhIIajCER
	 6iF1dxv2dCAyQ==
Date: Mon, 12 Jan 2026 10:10:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladimir Zapolskiy <vz@mleia.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: nxp,lpc32xx-pwm: Add optional
 Motor Control PWM interrupt
Message-ID: <20260112-garnet-axolotl-of-acceptance-3978fd@quoll>
References: <20260110014524.3379187-1-vz@mleia.com>
 <20260110014524.3379187-2-vz@mleia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260110014524.3379187-2-vz@mleia.com>
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

On Sat, Jan 10, 2026 at 03:45:23AM +0200, Vladimir Zapolskiy wrote:
> NXP LPC32xx Motor Control PWM has an interrupt line shared with TIMER4,
> and the interrupt may be used to report events from programmable counters
> e.g. timer counter limit (period), match counter (pulse-width), or from
> counters on input lines of PWM channels.
> 
> As a reference and for more details see NXP LPC32xx User Manual, table 595.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
> ---
>  .../devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml       | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> index cdd83ac29caf..53520f005acb 100644
> --- a/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> +++ b/Documentation/devicetree/bindings/pwm/nxp,lpc3220-pwm.yaml
> @@ -32,6 +32,16 @@ required:
>  
>  allOf:
>    - $ref: pwm.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - nxp,lpc3220-motor-pwm
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1

Properties must be defined in top-level. You only narrow constraints or
disallow them :false per variant in if:then: blocks.

Best regards,
Krzysztof



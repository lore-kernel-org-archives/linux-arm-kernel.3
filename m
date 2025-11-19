Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8733CCF258E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 07:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5s1aWI4zWUrb7+jptllveuGVEMO5Ub33WYiOXodfPg=; b=q6RpCDVJrZw/+emQIiQGE6JJjS
	zyWgDQ17G0eges5i3sBS9OBxklN+QKbXn3DzZM0jAWMGrlVZNwtBqTI4L9rOjATbuzyQs1EIrZ6qT
	XgWdhPIwvstmZPMLWLKUcjyHhE41accxFHnPB+q3ojdIvV7zPmYYdiWZ25dlRMMHS/rCkMffxNpYf
	bJhBlNXc5+65RM5vj7teVx6HBKP6xWNSIyG6lGV/2zWANNl3WZDloQpNxv6UlhwXdx+TfmqOUGYvb
	sNQQzPvqPUH8qpy4mimLMr0fLYA1+vgHcCJpk8yMriOSoiuBBrJglD0/FS8k+8FWsfLe5747XYnRQ
	NUD6j+TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcUD-00000002ggD-3n8j;
	Wed, 19 Nov 2025 07:20:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLcUB-00000002gfq-2SX9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 07:20:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 009C043D91;
	Wed, 19 Nov 2025 07:20:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49EEC19423;
	Wed, 19 Nov 2025 07:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763536814;
	bh=RSm/suJ/Pepr1yB59pObwuGdY4AF0Z9ZtGNsBqUmi+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gm15Ny59BIhiuZbk0udrxSlQTJ4Z3Htko5cmlrG3kyhS4JMXkb3ohZfTTSszP7Op3
	 8Y+mjg170oQM59KieR7Zp9/GcYyl9gFPkcgOM0xG/C6SqhgTLlEbSUAhFdZ+epL1iU
	 8JIVITlUGB5ox9lkpJbCI1nKnqJ/rkL7yceFclWYtLc3cC7GKDSj63rI6sVckdULfG
	 J7GLuhA9pyDn1673wGKFra6+VvMnn206vs4GrCDwTCoth9cYlMfJdt8OTESoSr9lmm
	 qyyWskspgyrzzpG1ekyzKUpRbjizuHMzI4z5VGhpfJbZzOROk/27gDX53g26v+TAsG
	 EpIxh4Eig07OQ==
Date: Wed, 19 Nov 2025 08:20:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add AST2700 compatible
Message-ID: <20251119-married-vehement-nautilus-3542a6@kuoka>
References: <20251118-upstream_pwm_tach-v2-0-4d9bc13d34f9@aspeedtech.com>
 <20251118-upstream_pwm_tach-v2-1-4d9bc13d34f9@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118-upstream_pwm_tach-v2-1-4d9bc13d34f9@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_232015_645967_F60BD66E 
X-CRM114-Status: GOOD (  17.94  )
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

On Tue, Nov 18, 2025 at 05:11:53PM +0800, Billy Tsai wrote:
> Adds support for the AST2700 PWM/Tach controller by extending the
> compatible string enumeration in the device tree binding.
> 
> The AST2700 PWM/Tach hardware is compatible with the existing binding
> schema and requires no additional properties or modifications beyond
> the new compatible string.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  .../devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml          | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> index 9e5ed901ae54..8b579321915f 100644
> --- a/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,g6-pwm-tach.yaml
> @@ -18,9 +18,13 @@ description: |
>  
>  properties:
>    compatible:
> -    enum:
> -      - aspeed,ast2600-pwm-tach
> -
> +    oneOf:
> +      # AST2700 with fallback to AST2600

Drop the comments, useless and redundant. We can read the schema.
Inflating code with obvious comments is not making it better.

> +      - items:
> +          - const: aspeed,ast2700-pwm-tach
> +          - const: aspeed,ast2600-pwm-tach
> +      # Only AST2600
> +      - const: aspeed,ast2600-pwm-tach

And why are you removing blank line?

>    reg:

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06978FF4955
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LrwRV+VT4Oy2URDdWLrWZUFQZ2Gju7gIfZLc/Op2ok=; b=IvfrVbk+yX0iKoAm/nFaa2tKno
	Bvw0cIFfsuitjoHt7ofArqbmbK7dSU/kSqQmGyT5hV9K86eKzsNdqfEUWxHJiLOH4mNWwCmbW6H/f
	hkw8vsjDscSn+6StgwCf/hh3IAhabH95c/p5+snXisVRnzAXsrRokVZSx32C18FA7PnuF5YXB/ZxO
	S8JBvtKBUbFpV1EFo3dv0TKCTA2cjNL8v+2Fc+u9Cm0tAmUdEgn9hr//curRh6UmBQkz0zGqlpxVn
	buxV1kJktt26YzqaApQi5gqYki+b/TyBXkwMHmNk0Zhu1mSdV03dLxffv3e2C7EOK6GLS6k2n/JhO
	zUyb5WOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76mX-0000000Ajga-3e1A;
	Mon, 30 Mar 2026 07:11:29 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76mW-0000000AjgT-37cW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DBB6D6011F;
	Mon, 30 Mar 2026 07:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08008C19423;
	Mon, 30 Mar 2026 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774854687;
	bh=t8c60sheKpZc2laaTB+QyMe7+0vi7yMHUuQWRlKN5xs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=biqkW+MwKIFT62FDhSen26uAsy4mAH6nJRbMyYBYijv8WE/0GmNN+27xd2flh33fi
	 59EMkznou8CzdIUbUbb46Ulb5yypz4q67Y51XX4iraEEAFI4z4p8yEh2aCNoJ0zCGN
	 z3oW501TZZb6/hdGgK21khjx0V8N5UWIDHglbmJmlIrN++mIH22IgnYp6hRsQ6Tj4N
	 3pL9uJBkUYi4ordeXB4mdiUSMmVyjxdP8/2AHsZAJHCw0+PzrwZyP4JRvj9gfUgJ1c
	 9K/UiAzfCZh5Zhveb3hFQJr1t3aMgxHPGR0xmyMFUJhBvjrXl/lgXYPFJ1S3keS/mf
	 Z1zOEUL8uT9HQ==
Date: Mon, 30 Mar 2026 09:11:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	sudeep.holla@kernel.org, james.quinlan@broadcom.com, f.fainelli@gmail.com, 
	vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com, 
	michal.simek@amd.com, dan.carpenter@linaro.org, d-gole@ti.com, 
	jonathan.cameron@huawei.com, elif.topuz@arm.com, lukasz.luba@arm.com, philip.radford@arm.com, 
	brauner@kernel.org, souvik.chakravarty@arm.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 06/24] dt-bindings: firmware: arm,scmi: Add support
 for telemetry protocol
Message-ID: <20260330-large-raven-of-order-bf4e4a@quoll>
References: <20260329163337.637393-1-cristian.marussi@arm.com>
 <20260329163337.637393-7-cristian.marussi@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329163337.637393-7-cristian.marussi@arm.com>
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

On Sun, Mar 29, 2026 at 05:33:17PM +0100, Cristian Marussi wrote:
> Add new SCMI v4.0 Telemetry protocol bindings definitions.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> index be817fd9cc34..e936ae7c0fb9 100644
> --- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> +++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
> @@ -298,6 +298,14 @@ properties:
>        reg:
>          const: 0x19
>  
> +  protocol@1B:

It's always lowercase hex in DTS.

> +    $ref: '#/$defs/protocol-node'
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        const: 0x1B

Here as well.

Best regards,
Krzysztof



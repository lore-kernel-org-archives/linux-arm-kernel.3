Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEF8CA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 06:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P5VwjfKYVSDYAYJM9q7TEEVakSHWBpFYqmQbJbCfhOg=; b=IDeUxKiAkDAVifu3A8dCH0KyY2
	qFjjpHTWXsW9YFUXvgy4WTq2/V2M8q8zJFQJSQx5A+gLfMX/Rb2SeW+rA92Sj1W53CsrHJqhHyd+d
	9zDN3cKhdgkv/ir/EzeuNU+RCYFCVf1O71SJK+fiNoTUaTMg/+9iwsiWkb4bOGQP+3cPMy0M+TJB9
	B8RMgvKx09b/Z9KAyPg9g+YXOMP/XlbGmJRZgU6q+cJ0IcS1FuIyB5E4RQSrK+VSismISEKj6kYqR
	AHxfsonczP0+dWs5nPAUPl9Evv+f5N7sjRnOiB0WdeNrT1Q7BfuYAF9Eo60V/mUDpAFWMS1Jtrtgh
	00MCPYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWkR-0000000AiMF-0PkB;
	Fri, 02 Oct 2026 06:27:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCWkQ-0000000AiM6-0ltq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 06:27:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FA834127F;
	Fri,  2 Oct 2026 06:27:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B07C1F00893;
	Fri,  2 Oct 2026 06:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790922477;
	bh=P5VwjfKYVSDYAYJM9q7TEEVakSHWBpFYqmQbJbCfhOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kj0nE/ky6wliTggjFUkJLVrez1VLVBXnwWc3ztijEm2gWCvzZv+8yPiFZ9lCvedZE
	 Z36EU8D14bjn6OET0SHMqirnZCxGCn04hqEiBPJ0tnQwPu8xSBTpZdUj67JyD8TgrD
	 RUIq6cc2kDaKZLLJjycixpZXst37r5AJKzQwfFUpFtaphGU0yh3W1KN2qDPtqlHuK0
	 ZpZuxQKbU/WRw/SrWD0S8NDm4cMSwxrX8+2xsYxv0iIO40DJZrjinzHIQfuBiIeDTT
	 /YuamlGrn9Qs+v1sCnk5+yuILqZBAQ9Q7NJdbk47AHnp9Yqt+wrzzb5XFUpn/VX8l4
	 bVHnjrhEzWhsg==
Date: Fri, 2 Oct 2026 08:27:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Beleswar Padhi <b-padhi@ti.com>
Cc: nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, afd@ti.com, u-kumar1@ti.com, 
	vigneshr@ti.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: keystone: ti,sci: Update nodename
 pattern
Message-ID: <20261002-rugged-nondescript-cheetah-8caa9b@quoll>
References: <20260930194131.117129-1-b-padhi@ti.com>
 <20260930194131.117129-2-b-padhi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260930194131.117129-2-b-padhi@ti.com>
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

On Thu, Oct 01, 2026 at 01:11:26AM +0530, Beleswar Padhi wrote:
> The $nodename pattern for TI-SCI controllers mandates specifying a unit
> address, which in turn requires a 'reg' property. This 'reg' is only
> used to describe an optional memory-mapped debug-messages region.
> 
> Some controllers may not implement this debug region, so it has no 'reg'

Which ones?

> and unit address. Therefore, relax the $nodename pattern to allow the
> unit address to be omitted for such controllers. Keep the unit address
> mandatory for the existing ti,k2g-sci and ti,am654-sci controllers.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Note: This patch is independent can be applied directly.
> 
> Cc: Nishanth Menon <nm@ti.com>
> Cc: Tero Kristo <kristo@kernel.org>
> Cc: Santosh Shilimkar <ssantosh@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
>  .../devicetree/bindings/arm/keystone/ti,sci.yaml  | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> index 25a2b42105e54..67acce8a559a1 100644
> --- a/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> +++ b/Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml
> @@ -30,7 +30,7 @@ description: |
>  
>  properties:
>    $nodename:
> -    pattern: "^system-controller@[0-9a-f]+$"
> +    pattern: "^system-controller(@[0-9a-f]+)?$"
>  
>    compatible:
>      oneOf:
> @@ -84,6 +84,19 @@ required:
>    - mbox-names
>    - mboxes
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - ti,k2g-sci
> +              - ti,am654-sci
> +    then:
> +      properties:
> +        $nodename:
> +          pattern: "^system-controller@[0-9a-f]+$"

Drop, not worth complexity.

Best regards,
Krzysztof



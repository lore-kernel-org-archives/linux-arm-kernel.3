Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79A3AC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Sep 2026 09:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhzoAzdU7CmBYcfp6mL1Ifuo2y1CgJrgv3i2FzMU4lk=; b=MSdIl77xK/3KEiXRgjM8akS50R
	sIn+ue0fd133FY+IDMULUk64Jh0E7KOm/7/4Rt0VgvNwDYM6JyyXhfYMV2wN5F+M2k65l24Mkzk73
	zfM7zTbDvjgxkMcdkcRti6U42O+Pdoyan6ho9LS8NJWwYoGD6GsX5VwecCQv1vmho86QisGDB21B5
	M1+2qLvxsq/JRrtXWF94ShfKa16aIFMXvk0mp+ngSKbi+LrEFfndUvN68//0G+FODLYYT3gi5Yxgx
	+1L8nugrMhUJfIJ68yRlZyqxdKc6p8bmtZsZIAknXjjQS5PhQwksflxxHoS0yWcZ3AEtqOfp5jz4Z
	IaLUXdLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5gk8-00000001YtE-08yI;
	Sun, 13 Sep 2026 09:43:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5gk7-00000001Yt8-36yQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 13 Sep 2026 09:43:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 317DA60DBD;
	Sun, 13 Sep 2026 09:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E84E1F000FF;
	Sun, 13 Sep 2026 09:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789292602;
	bh=YhzoAzdU7CmBYcfp6mL1Ifuo2y1CgJrgv3i2FzMU4lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RmlH6tMsbBxSE1YKcpXsPIAUEaku18W9kekwmFuSfzHL0zy6BUFc0tpmWpmVXjc+1
	 fIDirXVXc96dC2DELbLH250OLey8gFQBIQMxX3mpIugcoE1cYY8FOb+gyU1TqRynQZ
	 cqnQZ23uPkU0JH7OR6dxKAg2fJ3B4rfqli8GWEI6oEtGXVso3qzJl9zQUaWsVxOuhF
	 Um6lZ678hA8cUJ3t4cWlD0IXZLS4gJ6kOToGTOYe5zzi03EswtUF8cvbY/3dwrP8+J
	 Xl7MalC3nd2vwO7BTqpPLXiykNeXddOqmSl1Z71BZQWC3+2yS7HSREG7+fqgC/7N4W
	 yZdLytjdhG8KQ==
Date: Sun, 13 Sep 2026 11:43:19 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: fsl: add Free Mobile Nodebox v3
 CPU Module
Message-ID: <20260913-granite-toucan-of-drizzle-cf4b2f@quoll>
References: <20260912-for-upstream-nbxv3-dts-v5-0-ead604dba61b@free.fr>
 <20260912-for-upstream-nbxv3-dts-v5-2-ead604dba61b@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260912-for-upstream-nbxv3-dts-v5-2-ead604dba61b@free.fr>
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

On Sat, Sep 12, 2026 at 03:32:37PM +0200, Vincent Jardin wrote:
> Add DT compatible string for the Free Mobile Nodebox v3 CPU Module, an
> NXP LX2160A based board.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 656f2596e1d5..baff4f4159b2 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1937,6 +1937,12 @@ properties:
>                - fsl,lx2162a-qds
>            - const: fsl,lx2160a
>  
> +      - description: Free Mobile LX2160A based Boards

Why this cannot be part of "LX2160A based Boards"? And what other boards
are based on Free Mobile LX2160A?


Best regards,
Krzysztof



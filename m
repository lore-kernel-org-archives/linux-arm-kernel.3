Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C260E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 08:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzFju8tsUhobZAusz7TDi/emiCmKnrpFwCaQAn3hxCk=; b=m+E1BuzGm/rHuD0OkReskbIDiX
	PFxnzUiSpJ9mmAdsvYN9nwe1tCK1cqgUiijGK6td5osnV+L5jdYSA4HIpFp2/XvPk6Jpm9urL1T/n
	Ci7ljU0mpfxg0q7xAkOQXJEY5r7CO5zK11eC4iYII9sWaqHlFVQI680EKc65VcY3BbL39qP92ZR5l
	RxNZr1VGrWHgXUret820aro1DCvBTe2F933ZzDOGcAPt+yuKc32nLRuiqSAL6tjRIjP0FmIdW7AbB
	uDRiJoWAPfDutSisy0KgLVHDkfY2/BXr8GEdbsvF9zThrwB2b8sh8IEIqdfWodgfxomybLuL4g4J/
	xTkUeePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkrX-0000000BtvP-0yup;
	Wed, 04 Dec 2024 08:35:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIkqW-0000000Btmx-2lNM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 08:34:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 22F475C6AA4;
	Wed,  4 Dec 2024 08:34:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 021E7C4CED1;
	Wed,  4 Dec 2024 08:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733301295;
	bh=rSzKOzSv4FFk6DhAiPq4v58LUiP0VwC+Z1/9gQ5Xn5I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EStGtzNqdZtWUYWgVanvABgZUlfsUkT0/LaFgHXY5scPUyyBzZS+qrMLa32+mZAmM
	 NB6+OFYhAM+tIssNK4RYxs+mnWT8KxaZ0Kuk/nN5xlEs1tkE4gVxhi/6W9yvxRdtx2
	 5yJAZAK4fVgEtDBXT0eG5euW3VmYPtqtnRJJbXUA1B7q1bR6GAb4V71ef1zPbx97I0
	 Pg1cQKpf9d66Mu1cWEsr0j5hwz85gb7fvH+eipX9CpZ06H1WxgIUa0oW6XT7a34g8K
	 SmAX/uHvMWmvUALSO7A5Yy9OoFyV25DM9GK8B7hXqy4+0Y7Fw5BxSg1KZdSyq8UlMX
	 rVOSmjpSFq0aQ==
Date: Wed, 4 Dec 2024 09:34:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: soc: ti: ti,j721e-system-controller:
 Add MAC efuse property
Message-ID: <xknwuwjuedakc2f4ln3nsvsc2lux7ma55ivcetdoao6qq7jyzo@6nqyex3h2v4n>
References: <20241203173113.90009-1-afd@ti.com>
 <20241203173113.90009-4-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203173113.90009-4-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_003456_737439_C6CD4B20 
X-CRM114-Status: GOOD (  14.68  )
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

On Tue, Dec 03, 2024 at 11:31:13AM -0600, Andrew Davis wrote:
> Add a pattern property for MAC efuse which can be part of this controller.

Can be or is? Please describe the hardware what do you have there.

> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index ead0679b30e3f..fbaae3d1bef60 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -80,6 +80,12 @@ patternProperties:
>      description:
>        This is the PCIe control region.
>  
> +  "^ethernet-mac-syscon@[0-9a-f]+$":

Drop syscon, unless this is system controller because in such case drop
ethernet-mac.

Best regards,
Krzysztof



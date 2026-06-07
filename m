Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72041CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 08:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRIWT9QfFadFGAisYuKX9tvKA4Mdgf+SJMo6TftBjg4=; b=X5awOTknCFTzQbxV6PZu5R/0fb
	q7dkWO0LPqEPUVrpydi7Uho/8NrbK7DabYMXFwTylZHlsLWrZZvlCyVI8Lc5kD+a16vF8Thn/haFk
	P3S8i90WIK5Z2CWULTcGD4ai0ATdGkiO23dG+P/7m7wIlGVOuw0DM6SA5JkRbh6jsTDA5gZqZs+gk
	rLNfOEE9KhGREWQqvK36xw41bxIQ5S0lqLPD2LCqllQY/QeSlmzBDnT6IrC1112TSocaQRjzK6gLC
	gJ8t+pJQlXq3ve1T0SeHU+tih8xL3vrbNeM1hP3aePVOKhS6k2ij269bjz82da7kzUvqAwb0qFvL2
	16kM4oyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW95r-000000028zv-47kd;
	Sun, 07 Jun 2026 08:42:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW95r-000000028zi-0jL6;
	Sun, 07 Jun 2026 08:42:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9F004443B8;
	Sun,  7 Jun 2026 08:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 617331F00893;
	Sun,  7 Jun 2026 08:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780821774;
	bh=RRIWT9QfFadFGAisYuKX9tvKA4Mdgf+SJMo6TftBjg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IoEPL0XunMZnQJVGyObEvotFqZgwS0HY2R2sSWqiQW0/PVM3J4Vyj9stOiVT6h8z+
	 VPTf83iBa9vP2KsfgNpsv6FRMG7b3qSbOdOHg5oLgY+JM9OqCbHdg89y6XpTviandS
	 NDQEDNnc1g4VZygFgsGrDKi17B5RiQJl1s9q15QlK5yfxYLrrT+u1ip4xXSrBNfEfK
	 DGQu3pTGpohiCc9cF12o/jEn/X/boEERmiEduzLr6Uax7zxguOo5jbQfSZb7x5f0lr
	 QOpl/gLF/8n8TEM/IDKOWuSvwQnPKHblTQ392I5hlUR//xAACOrCOqG79e29QVMIYn
	 +i7GMfrKf97QQ==
Date: Sun, 7 Jun 2026 10:42:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: rockchip: add Vicharak Axon
 board
Message-ID: <20260607-favorite-messy-anteater-a56e7b@quoll>
References: <20260601132529.139172-1-hrushirajg23@gmail.com>
 <20260601132529.139172-3-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601132529.139172-3-hrushirajg23@gmail.com>
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

On Mon, Jun 01, 2026 at 06:55:29PM +0530, Hrushiraj Gandhi wrote:
> Add the device tree binding for the Vicharak Axon single-board
> computer based on the Rockchip RK3588 SoC, and add the vicharak
> vendor prefix to the vendor-prefixes list.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml    | 5 +++++
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  2 files changed, 7 insertions(+)

Please organize the patch documenting the compatible (DT bindings)
before the patch using that compatible.
See also: https://elixir.bootlin.com/linux/v6.14-rc6/source/Documentation/devicetree/bindings/submitting-patches.rst#L46

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



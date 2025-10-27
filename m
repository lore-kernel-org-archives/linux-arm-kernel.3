Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20D9BCCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=74D/cP7pFiURZ3JuqRKHPfcmtlRbgAjQ4Nd4ybjX2qY=; b=iqUC5LEtcq8davJsqbn/8DtLgZ
	pVTARSGR2ss8dg/rkfRuMq3Hi5eKwiL4FqunVzhT/s03Q/xVO9ekXtSGD2ymJV27DykcBtF8zMXWS
	mi1ZicLmVuH2S5O6LAZ7/s87AFfeF0IstN2Z6BZYJqwYYb2MnFpOlTPv7UBxaGZzPDNf2n90OMRH/
	uOWT++UGQLF8CedmpPojiwXrneAQ2E7Kttv0Q+1RZIz/gyRlSbUfHU4pGHbQPfiZDHLXDng+5VE53
	9t64JPnUiqoAm+ixRdrHKyEZDfKY8pDMIamWAKfq0V0IqXZrPAVVnj2hU6XeogW0JxFazRyWFnUHq
	isORoUog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSya-0000000EgGc-29Pm;
	Mon, 27 Oct 2025 19:33:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSyZ-0000000EgGG-2Gxq;
	Mon, 27 Oct 2025 19:33:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BF71662079;
	Mon, 27 Oct 2025 19:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 065A5C4CEFD;
	Mon, 27 Oct 2025 19:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761593634;
	bh=GBuTHku0HZy+N4bLq8h+zIHugchhObZYaWI/ZaqLViI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CB2wAqAXCd/BB8/BunSqi7t8cuGIdnwMtSgaxpuj9p59XOiO31MeOL5zM6ifVnaV4
	 iuefubtyNvSxYAwTvkUqis4tKHehdEQQrq+lrA9ebAKQdR35IBWt8ReFf2UUAiJQGj
	 ykqic2i6CR6itbn9zTBbYqjLO4YJAQkAxTVw8ao39GzzAJXGIh/WajnI7x7A9REZNd
	 tXcFYm6NoY7SrLpu6wXXdPoUle/k9xXO+mnqaHpYAgHVsKzApXvfeGA59TAaKiGiAw
	 fIOLe7G557DyFoPl/tLx/MjdFdN0SF6i+nu8D9igcCv4lxbqmyyYLlAAJMQQlG9QEc
	 xxXSDeMBK008A==
Date: Mon, 27 Oct 2025 14:33:52 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
	Dragan Simic <dsimic@manjaro.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 2/3] dt-bindings: arm: rockchip: Add NineTripod X3568
 series
Message-ID: <176159363059.1460567.9335053361524523986.robh@kernel.org>
References: <20251026150358.1078453-1-coiaprant@gmail.com>
 <20251026150358.1078453-2-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026150358.1078453-2-coiaprant@gmail.com>
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


On Sun, 26 Oct 2025 23:03:57 +0800, Coia Prant wrote:
> This documents NineTripod X3568 v4 which is a SBC based on RK3568 SoC.
> 
> Link: http://www.9tripod.com/showpro.php?id=117
> Link: https://appletsapi.52solution.com/media/X3568V4%E5%BC%80%E5%8F%91%E6%9D%BF%E7%A1%AC%E4%BB%B6%E6%89%8B%E5%86%8C.pdf
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



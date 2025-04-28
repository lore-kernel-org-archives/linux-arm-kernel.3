Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D2D3C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 08:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kiCrTOBQ1WQnEvSTrH5wRzIRZ6TpG0/zh39U8i5yYs=; b=pNT1HJjJQLDhzstlcTzXcDJkl/
	iQOAqioEPmObxXCt+6qBlQ4MAFsfR9BGrIYpIktqRFq4ZMPSjUmLib2GpRaHMe4NXD0A6bKey9ajq
	KyWFBzxM+JHpeUVCMLlkRK/QRt5ROWN1vPd4WFrkAcClahzKztyM/r9he8kH93gs74fHSljlVf+H0
	kaXxVIDAedySZN0uPIfR1BfRghTIA1Qfl/xjerw5mcY/9PNItERAq+gmiPV7Y891D9763AWqHWae6
	QdZ0+t1EybLLRdjYJ1cP/YS0/vCqwo1I7acLrsIduhbB+l3Xl/jDo9Wnv3BHg+Un/QKY5EQOIngG8
	nZPuKA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9K5t-00000005VB7-2qUh;
	Mon, 28 Apr 2025 08:44:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9JrZ-00000005RXA-14ey
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 08:29:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 961554A454;
	Mon, 28 Apr 2025 08:29:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23DB9C4CEE4;
	Mon, 28 Apr 2025 08:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745828956;
	bh=cGQWR8jhKsA88ie48McerFwOTjkySfn7kxfyN/o03kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iSsc9NbZ2OSX6s0FYmkOrwZ4Y74di5SxQ6HBbf6tgdP7n2h957ekjxLAv9ilO/rD2
	 dirqo66vOK6jJtwxntmnjuAfK9JdXlgGf4sMesLv7Z90drZS9fZqpl1+Rp8d65/pPI
	 mp7I/0Yp9ILFuLR+wwL2ZEysja3HLgT2u23WG603H1EOPEP/zec4Hv1SlX2AiT5/nb
	 8OFdNeDp7A5nB5ztO+cBYLW9M5WOIRlOvIMjX8G0jPGnf+7haxCnlpQL6CHQOT65AI
	 GyiRBBGT0lQxy/mI6HpomVcx38Hje4+xxayzjLfDhLTb1r1mr+OiVaHn6TNEDuzojP
	 3GREHEKb+H+TA==
Date: Mon, 28 Apr 2025 10:29:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	upstream@lists.phytec.de
Subject: Re: [PATCH 1/2] bindings: arm: fsl: Add PHYTEC phyBOARD-Nash-i.MX93
 board
Message-ID: <20250428-neat-manul-from-avalon-b2db3a@kuoka>
References: <20250425064107.174548-1-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250425064107.174548-1-primoz.fiser@norik.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_012917_313770_085218B1 
X-CRM114-Status: GOOD (  10.71  )
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

On Fri, Apr 25, 2025 at 08:41:06AM GMT, Primoz Fiser wrote:
> Add devicetree bindings for PHYTEC phyBOARD-Nash-i.MX93 board based on
> the existing PHYTEC phyCORE-i.MX93 SoM (System-on-Module).
> 
> Adjust the compatibles for the existing phyBOARD-Segin-i.MX93 board, to
> be able to add additional board based on the phyCORE-i.MX93 SoM.
> 
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



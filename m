Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1501C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pk4ErvGmQrZOLIOGBljUuFGpUWFpUDhlnCt2Mj3RrMo=; b=JYGQopFELATe90lD3yNBvcTgxq
	Q0jtnM2zcgRim65PWsylyzjgDjnBhlDVNu2YvREkDnWh2hxTm5azSRuJxVWgzFkJ2+HDyi5lKw9Ih
	U2GfvFCi/Vh5jX1pbLo1wYazq0RlpUI81TeguqYhlJs7TekMGzZTF+K2LlOOstGMCS/nH6zT4Bi70
	uwMw014nvZKkD92jXev9WdfHOS3vWehYpQEYSayhT7jE3rgp63vxhhxcin4rbS3VsC+wBxTqowgId
	Sl5KWx4sozlU/XByeQIfo8dXjrcLJUCjd6pnCN5Y/idcTVVGf/aUX09T/iYetAY6OhhgS4T+t/IRU
	PsDHhulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xft-00000008wEj-2HB4;
	Mon, 31 Aug 2026 08:47:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xfs-00000008wEa-1pJM;
	Mon, 31 Aug 2026 08:47:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D03C841983;
	Mon, 31 Aug 2026 08:47:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9CBC1F000E9;
	Mon, 31 Aug 2026 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788166047;
	bh=Pk4ErvGmQrZOLIOGBljUuFGpUWFpUDhlnCt2Mj3RrMo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BIEFSvuzZBvTfLfVp+Vn+FHw9YzHUiaLSCr0qYW0HW0RTzuDXNHNewgiSgSY7+N86
	 TeSAUngT5um33hCuSvsZHzP6ZjGg7sbw3J4bkoujboHQlFlDtt3vWo51Q1q99T4YUG
	 i6GNrZIsHJ8EeUqkz0SbLR0sSlKdCMpuiq9J/+EiZZ//Vhjkq2ZRlMKVz20ehkWlmt
	 HeT7Pf0bHeWrVCvee6UdZ6JXq9RlDMTeG9bcQODpwq7yxHLrTG3VDNpZnqVOWP55XK
	 RGiy3YiNC2aTplQaKe3BiCpC+SH3W+yF8YzOXWKYS2/s1AdikKtyTU843iIZKLZ6VW
	 cl394f5bEgf7g==
Date: Mon, 31 Aug 2026 10:47:23 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-phy@lists.infradead.org, Pankaj Dev <pankaj.dev@st.com>, 
	Rahul Kumar <rahul.kumar05@st.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christian Bruel <christian.bruel@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Rob Herring <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org, kernel@dh-electronics.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v4 1/2] dt-bindings: phy: Document ST STM32MP25
 USB2-FEMTO PHY
Message-ID: <20260831-festive-gerbil-of-prestige-2fbeeb@quoll>
References: <20260828150739.174460-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260828150739.174460-1-marex@nabladev.com>
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

On Fri, Aug 28, 2026 at 05:06:56PM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
>=20
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
>=20
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Co-developed-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Cl=C3=A9ment Le Goffic <clement.legoffic@foss.st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



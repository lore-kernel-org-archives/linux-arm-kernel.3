Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7531CCCF2C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 19:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u9zVdZ+60UPJ7jM3vWMuHHt67z2QYJr3Ac8P9XHs1+M=; b=he2aMG2+Q9gx9x3WJnW6hxR1Pe
	cU3d+nclSsaBFyvjTmaK2QLOE+5ZmcOpJqJCIE4zzgRUKdmESNDvkrfrnHsGHG2Te4wY20kMhIuBj
	23nCBV5rrxnAtH5Z1m+iltyNnRMLR3hQ7iC1w1XtymWJGs1+IwFh4Hj4iBa6uhOALXGThqt4eUGOk
	DvxvdaCq6Y+f+TZ+LA44HwoFxxbGV1zitLKahZTZQw0XPil68RwnZG778rJIcHLtCabTfrW9yZ8Z5
	TRcOfXrzE5nxCS9T9tJmy7yKssbYu3lJ8cApWLsqzg0KyIISqrwRtM9ntSbsC4rMfExObg4VMWxQR
	bzR8aYBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHnaA-00000003tPX-2uhj;
	Fri, 16 Oct 2026 19:27:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHna9-00000003tP1-23vK;
	Fri, 16 Oct 2026 19:27:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2DA7740B44;
	Fri, 16 Oct 2026 19:27:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA7761F000C4;
	Fri, 16 Oct 2026 19:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792178829;
	bh=u9zVdZ+60UPJ7jM3vWMuHHt67z2QYJr3Ac8P9XHs1+M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Eavl7/umDyhp+rfXD0qTHvLLemfRf4zYdG6nBp6UbrEXrxDNAOpfUBtzXyfCAmadw
	 4g/FLa2uilQMhD2/P46Fj3ZHyIxQBaMmPj+/4qjtaCRNSlVSFjOH6t1QpKNwWPkMBc
	 t3uAdqfvw7q9apekFqD+85XuV5fSMDyA7YhGprwTA/zmNiiBiegVzJZwon+UEdXyj8
	 HULUQLlrxS/RTNJazNZBPelCvOr/bReNbpgUieRbnNHAvQvw9fzP+MHILK3TVJBwB+
	 TC+5K1yjTpIn31Ohgmrjrp/Q8uKmvN+d5gpCIYadVyVgeTcILVyZdNzj+QvGfzJ+Ub
	 IwJDBGWIp5aDw==
Date: Fri, 16 Oct 2026 14:27:08 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-phy@lists.infradead.org, Pankaj Dev <pankaj.dev@st.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Rahul Kumar <rahul.kumar05@st.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Rosen Penev <rosenp@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org, kernel@dh-electronics.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: Document ST STM32MP25
 USB2-FEMTO PHY
Message-ID: <20261016192708.GA138068-robh@kernel.org>
References: <20260902141312.649406-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260902141312.649406-1-marex@nabladev.com>
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

On Wed, Sep 02, 2026 at 04:13:02PM +0200, Marek Vasut wrote:
> From: Pankaj Dev <pankaj.dev@st.com>
> 
> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
> Two such PHYs in total are present in STM32MP25 SoC, they both are
> slightly different, therefore they use different compatible string
> to discern them.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Pankaj Dev <pankaj.dev@st.com>
> Co-developed-by: Rahul Kumar <rahul.kumar05@st.com>
> Signed-off-by: Rahul Kumar <rahul.kumar05@st.com>
> Co-developed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Signed-off-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Co-developed-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> Co-developed-by: Marek Vasut <marex@nabladev.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
> Cc: Christian Bruel <christian.bruel@foss.st.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Pankaj Dev <pankaj.dev@st.com>
> Cc: Patrice Chotard <patrice.chotard@foss.st.com>
> Cc: Rahul Kumar <rahul.kumar05@st.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Rosen Penev <rosenp@gmail.com>
> Cc: Vinod Koul <vkoul@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-phy@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> ---
> V2: - Fix up Sob/Cdb lines
>     - Fix up compatible string in example
>     - Use additionalProperties: false
>     - Expand description:
>     - Use clock-cells = <1> to discern OSC and future PLL clock from the PHY
> V3: - Move clock-cells next to PHY cells
>     - Fix the bindings
>     - Fix up Sob/Cdb lines further
> V4: - Reorder the properties: list, put #...cells at the end, reg after compatible
>     - Split this from series arm64: dts: phy: st: usb: Add STM32MP2 USB support
>       https://lore.kernel.org/all/20260822074816.548662-1-marex@nabladev.com/
> V5: Add RB from Krzysztof
> ---
>  .../bindings/phy/st,stm32-usb2phy.yaml        | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/st,stm32-usb2phy.yaml

Applied because the schema depending on this one is already applied.

Rob


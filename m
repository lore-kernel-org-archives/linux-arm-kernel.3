Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A618EC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMzBLGzM5x11CiP/ao86g8aNPF3qkJ/I+TlMQgJ9s+E=; b=QELiBqo4iXlboDa7NAiP8hqta0
	IwdHMNMS/ssVd87QQ47KIQ43F1IHQhR1es6K8M//yhmw46fjc4txJGrTUJrQuPr24U7TaAv+Avut6
	HNjnr8V+YH0GAn+Eyp/mWE0IoQ9L4y5lIAt42vNH6nkz0V+V5CqqMezcf6KpCb8csPTSXbzI/oGPy
	Kw1kFYIoAe3G7tjmcRTJIJX89bHRypNU/Gw+UEY3AsoiMCeTFnEW/X8Ojr9kce8Ob1Idhhf3bxPeV
	QkMe8/KjuHBwSQVwB2RHUi0ndX6CqO3q4UJg9lR9+uL2ZmF+iqsW8SjWqig8GP0hGC6Kzg1cHu9hu
	7a2eyvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5cT-00000003qxw-0s8I;
	Mon, 16 Jun 2025 08:55:09 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4u2-00000003kWy-1a2b;
	Mon, 16 Jun 2025 08:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A19ECA51411;
	Mon, 16 Jun 2025 08:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7441C4CEF4;
	Mon, 16 Jun 2025 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061353;
	bh=ZCTP2/KUxDBBTDWSD2jPN9l79DgfK77S6TqfxgzSUaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BI4kWD82040tlVQMNLetNaZSuG6+NbqVcIJZURB4XdOSPd4/idPYxU/bPnI5lDnad
	 wWFmyksnH4CZqJ6jCMtiTKq2ZmgYcIRR2HqwyaaV9Nzpt5asFh2SjF6X1r8QE+23E4
	 g5mcChEHbxO8fWlM/wFhXZ5ZhpW/6l7HmFYW0gHni2DUEz1a69Fdx2JnTGHIPBAEXR
	 EDQlNoR0InTOOywUfwHPXM2gx25GZQeMiuIgLBiyZ/Hy2CnHlifaAQewrg8ndVipC6
	 QwRNY8KWIiSXSHOO83ui12Ym99+A9cBCPnquNUcNRZci3yAsYGWwFii8akvIDMGgco
	 L3GaMAQP/1kwQ==
Date: Mon, 16 Jun 2025 10:09:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Pritam Manohar Sutar <pritam.sutar@samsung.com>, vkoul@kernel.org, 
	kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alim.akhtar@samsung.com, andre.draszik@linaro.org, peter.griffin@linaro.org, 
	kauschluss@disroot.org, ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, 
	s.nawrocki@samsung.com, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, dev.tailor@samsung.com, 
	faraz.ata@samsung.com, muhammed.ali@samsung.com, selvarasu.g@samsung.com
Subject: Re: [PATCH v3 9/9] arm64: dts: exynos: ExynosAutov920: add USB and
 USB SS combo phy nodes
Message-ID: <20250616-perfect-fervent-robin-a1bc3c@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055106epcas5p46a2e5e2d6f0e8811644643f6282fd9ca@epcas5p4.samsung.com>
 <20250613055613.866909-10-pritam.sutar@samsung.com>
 <9455a4e1-6352-4832-ac9f-2816f889c3a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9455a4e1-6352-4832-ac9f-2816f889c3a4@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_010914_486502_3F8AEC6E 
X-CRM114-Status: UNSURE (   7.73  )
X-CRM114-Notice: Please train this message.
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

On Fri, Jun 13, 2025 at 11:12:26AM GMT, neil.armstrong@linaro.org wrote:
> On 13/06/2025 07:56, Pritam Manohar Sutar wrote:
> >   		usbdrd31_hsphy: phy@16490000 {
> >   			compatible = "samsung,exynosautov920-usbdrd-hsphy";
> >   			reg = <0x16490000 0x0200>;
> > @@ -1109,8 +1120,8 @@ usbdrd31_dwc3: usb@0 {
> >   					 <&cmu_hsi1 CLK_MOUT_HSI1_USBDRD>;
> >   				clock-names = "ref", "susp_clk";
> >   				interrupts = <GIC_SPI 491 IRQ_TYPE_LEVEL_HIGH>;
> > -				phys = <&usbdrd31_hsphy 0>;
> > -				phy-names = "usb2-phy";
> > +				phys = <&usbdrd31_hsphy 0>, <&usbdrd31_ssphy 0>;
> > +				phy-names = "usb2-phy", "usb3-phy";
> >   				snps,has-lpm-erratum;
> >   				snps,dis_u2_susphy_quirk;
> >   				snps,dis_u3_susphy_quirk;
> 
> I think at least patch 6 & 9 should be squashed.

Yes. Changing lines which were just added is a strong hint, that
patchset is incorrectly organized.

> 
> Neil


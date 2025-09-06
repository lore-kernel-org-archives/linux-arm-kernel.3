Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C977CCA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 14:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hdz1IXPxD69RvzVQVv1KLuhJWBeYqAlL5nvpy6TmTUw=; b=Abo4QSEDSCPloKUUsG66mWKvF/
	oHCTKRbb1e86rCr5CrVA75p5iGcBy+yqRlVWOd3k0Sv2GculSOyt2Y3ln0KTSaYfl5gnA+bdtm94M
	qiJhqVScYSiJo8zN0YcJlNniBw3JU1j1hB7PTzE2fi2WEVClpBco9UX++KYpP0VyqenQSaC0aJMaT
	TZ0jSqMMZGUB8kW7MufGkuiQAkmuZNtEn9mOZ8vi6/MZWm1XVq2u0yoj90A+4PL+rSfa+iVGRQBgf
	hLacXR3h/wkIfIRGqkrKJR3Qwf6fZtVwqEZbhv7qjLm5kVosWeUjwFI9IldePec2tG/IomuwL3QF6
	x9FzssXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuu8D-00000007wHJ-0PpF;
	Sat, 06 Sep 2025 14:43:09 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuu5L-00000007w0U-3Y1w
	for linux-arm-kernel@lists.infradead.org;
	Sat, 06 Sep 2025 14:40:14 +0000
Date: Sat, 6 Sep 2025 16:39:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1757169602;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Hdz1IXPxD69RvzVQVv1KLuhJWBeYqAlL5nvpy6TmTUw=;
	b=YZeaiJdtt8APk1CwKAYZ2d1Fj18ySlsQfFCdpCyJyJyKXHWASzHZ0O4LOoStxOMHDwqCMJ
	ZxQels++QzlNAWWm0vDyovdk/LSu8qdzPxaMbrv/Q0sReLLhsLX7AiIsuJbNmfLsXOT39d
	BO/Xv2J9D74BaDGE8P2stFjjVjhOAk8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: samsung: exynos5250: describe sromc bank
 memory map
Message-ID: <20250906143958.GA7600@l14.localdomain>
References: <20250904-smdk5250-sromc-v1-0-b360c6ab01c6@grimler.se>
 <20250904-smdk5250-sromc-v1-1-b360c6ab01c6@grimler.se>
 <4959ce59-84aa-40a5-aa07-f2dfa856d9b2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4959ce59-84aa-40a5-aa07-f2dfa856d9b2@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_074012_569937_53663A31 
X-CRM114-Status: GOOD (  16.15  )
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

Hi Krzysztof,

On Sat, Sep 06, 2025 at 02:24:21PM +0200, Krzysztof Kozlowski wrote:
> On 04/09/2025 08:10, Henrik Grimler wrote:
> > According to public user manual for Exynos 5250 [1], the SROM
> > controller has 4 banks, at same addresses as for example Exynos
> > 5410. Describe the bank memory map of the SoC.
> > 
> > [1] https://web.archive.org/web/20130921194458/http://www.samsung.com/global/business/semiconductor/file/product/Exynos_5_Dual_User_Manaul_Public_REV100-0.pdf
> > 
> > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > ---
> >  arch/arm/boot/dts/samsung/exynos5250.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/samsung/exynos5250.dtsi b/arch/arm/boot/dts/samsung/exynos5250.dtsi
> > index b9e7c493881804647534b1d7395f6eb62a07fb92..741cc693f5d8f6b33772d7819c965c590571f305 100644
> > --- a/arch/arm/boot/dts/samsung/exynos5250.dtsi
> > +++ b/arch/arm/boot/dts/samsung/exynos5250.dtsi
> > @@ -1214,6 +1214,15 @@ &serial_3 {
> >  	dma-names = "rx", "tx";
> >  };
> >  
> > +&sromc {
> > +	#address-cells = <2>;
> > +	#size-cells = <1>;
> > +	ranges = <0 0 0x04000000 0x20000
> 
> 
> These should be separate tupples, so
> 
> <0 0 0x04000000 0x20000>,
> <....>,
> <....>,

Thanks, will send a v2 to fix it, and update exynos5410.dtsi, in a day
or two!

> Best regards,
> Krzysztof

Best regards,
Henrik Grimler


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB45C71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 08:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilT0coZftsz3/ezO+CwiOnhGhl1dA0J8Wb8xo6uCOeM=; b=B83WuhNq3s8lOwre0Id2lSADPn
	mA/HJRTCWmuXsjPSip/j5usV/2OH84f/1X2AV9+3kEi+lvAKP3iR+CdRL4l7W9E/1aA59ZAYZEIA6
	do2EZtjymjDd1C3pgAkFHBKsXRRONMjzv4/NXtDDlNjnSePIdgyeoLgxV3oLiw5dcZ57GZijTBZR/
	w2ydqcXrQY4EOCA6P3A6cAVBPDGOWG31DPU3nPwklOT2/MtuB/Sx6e8I/85SDxlcfB7f1Wizy36xt
	hmteTsUiZRCC1HdHE4mj5ClmjcOnTk99waIlvIstuSuJM4DjtlZeXToGU88S511LV2WoHEHwRxSjL
	YuI4j6eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR5gq-00000003reP-3e2M;
	Mon, 16 Jun 2025 08:59:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR4xX-00000003l2b-0pUN;
	Mon, 16 Jun 2025 08:12:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E9DAF5C5928;
	Mon, 16 Jun 2025 08:10:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FC3C4CEEF;
	Mon, 16 Jun 2025 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750061570;
	bh=6MEk2BlPGWOkhwr9aRQ+chOO33WvaGPh8Hj0e4+4rFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMp8R6tsGTt1rLEDP2Tw2IlA1XbFx0ITH0vQ9LQW5IdSXNJs5JECLTh2/rhb+Y7dY
	 RNa5sEwqrGs503u8bPIRhHg7PFkCX+LjQJy3A6YzEi3qZ2gzvD3O1ZkTu66kI6M/cB
	 KDAojqFv7FOd9V2nVummPdi6KsqPzYFlLj4dXSF5VRhHhG+gEAUbtQ8W41Obhk1X1m
	 KOuWtkOMjvmvF5MrnRzGB5b8vAYlW8/EKWUhoy6O79u+rrnd5ya+/rYiTSzhUKoK4+
	 0ETkvsvKDw1Bh/6cY5EvpEbFHC9sP4UqY136asq8mcEO5jeH4/RdOieI/iXE+AP4+G
	 Y5XftitOANYhw==
Date: Mon, 16 Jun 2025 10:12:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pritam Manohar Sutar <pritam.sutar@samsung.com>
Cc: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org, 
	ivo.ivanov.ivanov1@gmail.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com, 
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com, 
	selvarasu.g@samsung.com
Subject: Re: [PATCH v3 1/9] dt-bindings: phy: samsung,usb3-drd-phy: add
 ExynosAutov920 HS phy compatible
Message-ID: <20250616-outgoing-industrious-turaco-affe39@kuoka>
References: <20250613055613.866909-1-pritam.sutar@samsung.com>
 <CGME20250613055040epcas5p35219ddeddd9fe5f4632ca837db91847a@epcas5p3.samsung.com>
 <20250613055613.866909-2-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250613055613.866909-2-pritam.sutar@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_011251_275827_4A7E85DE 
X-CRM114-Status: UNSURE (   7.46  )
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

On Fri, Jun 13, 2025 at 11:26:05AM GMT, Pritam Manohar Sutar wrote:
> Add a dedicated compatible string for USB HS phy found in this SoC.
> The devicetree node requires two clocks, named "phy" and "ref"
> (same as clocks required by Exynos850).
> 
> Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
> ---
>  Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F6DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 14:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPq5/MpVX9YXrflNMV2WLcK25TVLBV9sIea7y0JuAsw=; b=UmCshW69LU4nb0UzkfFtIUk4ud
	PsyV/F9Nhs2UlM1CytEHG296444fbSJG06qSmVR1A5ohlsKisaFNUycUOFPchxcisOLH/MnPMFRu6
	Is/sSk//ydID180svt+5qLuXO7jxE2twCKhAfjAFoT38D9++NkhlTjOI2p4miPYEJtuiv9lDwoGtd
	yLReFds6m6V+nfcdJ4rM+Q62evlN1IgQw+UBKQKVS8ldWnjXVXTQRVgLUygY5FfhpPhgc+DWRkPec
	AM6PA2npAe52AFTgRetr1eK5vGd3DpAWSHVBsF5+DB3ZxtJnxHpqzFWZDny0gFwYXysTBdiH+6m70
	ThyuCqUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F2h-0000000E21Z-2hnW;
	Fri, 11 Apr 2025 14:07:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Ee9-0000000DxzB-1O78
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 13:42:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D2CF96845A;
	Fri, 11 Apr 2025 13:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A547C4CEE2;
	Fri, 11 Apr 2025 13:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744378935;
	bh=nS4mtmxGRp+CcFT9tVDGPOWxYtnM+243zUP7ZIU9t4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wveHEQwU8QrxS6q3qjGn/QYQwFp5Wu9bwvhXBzF5ePMzmcNztJHnud0AdX+yOVylA
	 YOyQBQ2tHfE8TjwG7Z8IGtk1XrzHRw8sgDKX205WpOQVcsaAwlNiWTZVHubUn1k+99
	 GrJBgVvG4AdvJ+p86Lx61F/sN+3BAoPBSpnoLy/4=
Date: Fri, 11 Apr 2025 15:42:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: usb: samsung,exynos-dwc3: add
 exynos2200 compatible
Message-ID: <2025041157-stilt-sculptor-c978@gregkh>
References: <20250321144804.1435502-1-ivo.ivanov.ivanov1@gmail.com>
 <20250321144804.1435502-2-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321144804.1435502-2-ivo.ivanov.ivanov1@gmail.com>
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

On Fri, Mar 21, 2025 at 04:48:02PM +0200, Ivaylo Ivanov wrote:
> The Exynos2200 SoC has a DWC3 compatible USB controller and can reuse
> the existing Exynos glue. Update the dt schema to include the
> samsung,exynos2200-dwusb3 compatible for it.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/usb/samsung,exynos-dwc3.yaml          | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

This doesn't apply to my tree, can you rebase it and resend the series?

thanks,

greg k-h


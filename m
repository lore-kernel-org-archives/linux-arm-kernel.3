Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12838CD4F4F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEdXl9qnShAu6ENbmWuqyv+UamPvMhUWspMuwN2vs70=; b=IWrPEfjETuGIK+Z5f0Kw7oYcQy
	HbObT1mW5uD49X44BEqhDgtJ877tM1cUa6GWMVDvbg0rFrbOFgjohqh8DgcKd8mH0vIS1AakNkJnK
	phjYB7ftpNPnDwpmNrzS4DHNJAPVsY9rWy4hPPFKOYzakh4Q4U/wDzq6jIiX3/4KSu7WdsqevEul/
	Xi9TI81Dy2n/AHiv06yfvLEyFOLkRxcEomr63UUJvMdq1fFF603Zyk2+OsTEr8TRJRGn39Kwryqz3
	Ldx0F7PdFZ0hBsbyvemLb/Nki92Y0l+eMOUoX/P+BG2JOPzWaS60w3NNEOQwzQpe2MLHTfKDOhdUU
	BEEjZ4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSJS-0000000A328-1iiO;
	Thu, 13 Nov 2025 08:04:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSJR-0000000A31x-05W5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:04:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2DA55601E6;
	Thu, 13 Nov 2025 08:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 526C0C4CEF8;
	Thu, 13 Nov 2025 08:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763021051;
	bh=i1oNMIHvWsAeS3i6DTVuOuI5Z+m3+7ctncfDc4TLaio=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZBE1EexDU5SbeIBNCQGmYj8/m63V4lR+zfzROzdqGDKjM2mL7y4rq5P9DWb66k2tb
	 AbTrQ+JE+LKrzBP2phVxlorNSmnAu17Vv7LoJ18WZWegW4whxD6JYO3aSOSSDtFtL4
	 d+9JLOPAWLtwea/5qGJKhNUYjymYcLYYUNFt05BgmffDSZRhs9MHdXA5xwJqhIZ2dT
	 oWT+CUXqI2jP7Av/cQNClyxFYPnFxkpFMEa9fWKuZhnoiJJvybKoeMNo5+iKs+ApJo
	 5xl0FR0D778RAbRDBApao8GcAE9zrmVk3Ms5VW7NJnmURMNi2GQNmoQjIqUwVwtSXY
	 z+1+n5lIFfKUA==
Date: Thu, 13 Nov 2025 09:04:09 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roy Luo <royluo@google.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Peter Griffin <peter.griffin@linaro.org>, 
	=?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v6 1/2] dt-bindings: usb: dwc3: Add Google Tensor G5 DWC3
Message-ID: <20251113-stoic-authentic-angelfish-c52a32@kuoka>
References: <20251112123257.3755489-1-royluo@google.com>
 <20251112123257.3755489-2-royluo@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251112123257.3755489-2-royluo@google.com>
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

On Wed, Nov 12, 2025 at 12:32:56PM +0000, Roy Luo wrote:
> Document the device tree bindings for the DWC3 USB controller found in
> Google Tensor SoCs, starting with the G5 generation (codename: laguna).
> 
> The Tensor G5 silicon represents a complete architectural departure from
> previous generations (like gs101), including entirely new clock/reset
> schemes, top-level wrapper and register interface. Consequently,
> existing Samsung/Exynos DWC3 USB bindings are incompatible, necessitating
> this new device tree binding.
> 
> The USB controller on Tensor G5 is based on Synopsys DWC3 IP and features
> Dual-Role Device single port with hibernation support.
> 
> Signed-off-by: Roy Luo <royluo@google.com>
> ---
>  .../bindings/usb/google,lga-dwc3.yaml         | 140 ++++++++++++++++++
>  1 file changed, 140 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/usb/google,lga-dwc3.yaml

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



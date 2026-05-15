Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C943CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 07:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EwbLwHfMSu6qOrZtfxXN59lyAFcatn8laGBCGtmHADU=; b=aCP/RchvgeLgSaZhPjWrMAAKEA
	MbW94cuGP3p5qmy7rc98Nfl/DuPxDtFXJ9+Cp6DMsqTCtDy9UhCoyaiqS3rlFGuiPrbjoqUXIxB1z
	IQh/G27QbFiMEQaroRBcOQTy7sFjaq6zaM2X02RpsNb5MRcYCzrVnW7dlriNdbhII6oIfw7Kg57tZ
	jFIA0qVJY+MV88vDud4QGUx5msSoRMBc6xyaKWDH0bDCHHH9lqA1yD9f1WOHw6w0m6dt8uMNW2sUk
	lKEyeYwJcqgrj6oB5RPQDzB5rl0JbYQdBt61JsaWxuK8/mvNWdgiuoe3gnzhLgcN9D5kJsIi8lIMX
	HiLy99/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnNU-00000007fRV-0GPK;
	Fri, 15 May 2026 07:54:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNnNR-00000007fQY-17YT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 07:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 23FA944293;
	Fri, 15 May 2026 07:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0D4BC2BCB8;
	Fri, 15 May 2026 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778831672;
	bh=6C+cQGLy0rdE2XnSkobZ4ut7/daRJW7apsXEcNGcyK4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XnLa8UZU+O3beqJ4GcvQoUyaGmaAA/+lNlNiQBj/NmRbHexRd0RT/bh7RGzH/Uc6w
	 hX8k21ur+Y8Nj4wuo/SnLXa5+XAP0pL9TQmFYJidzIfAWaWHnYAx+xfCcwzkDj1W+l
	 rxYEPYZOI+NXLzJE+Tiyy6QRaLlLXVN50f1uEjah6l8lMX4Nj5rodxiwkiDkqJIG5Z
	 HDVIV+laOn2QlgEyYwFWaDbsKTEqlcOMlNSGMmYGB00ojXMGEO2XxNVWD4G2pc7hbN
	 IndhGex7XIrqkQuO84zAG5CHUtbds3WDwjcVWb9fbmSB8dYIsVZqRBa46OmuxEUPKC
	 9shF+rG0EDchg==
Date: Fri, 15 May 2026 09:54:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	gregkh@linuxfoundation.org, pawell@cadence.com, rogerq@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	cix-kernel-upstream@cixtech.com, linux-arm-kernel@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH 4/4] arm64: dts: cix: add Sky1 USB4 and USB5 controllers
Message-ID: <20260515-stirring-venomous-alpaca-715ffd@quoll>
References: <20260511024244.981941-1-peter.chen@cixtech.com>
 <20260511024244.981941-5-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511024244.981941-5-peter.chen@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_005433_325534_BE60D830 
X-CRM114-Status: UNSURE (   8.33  )
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

On Mon, May 11, 2026 at 10:42:44AM +0800, Peter Chen wrote:
> Add the Sky1 USB4 and USB5 Cadence USB3 controller nodes with their
> registers, interrupts, clocks, resets and S5 syscon control. Enable both
> ports on the Orion O6 board in host mode with the required VBUS pinctrl.
> 
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts | 30 ++++++++++
>  arch/arm64/boot/dts/cix/sky1.dtsi         | 68 +++++++++++++++++++++++

DTS cannot be part of USB patchset.

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC89F513ED
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 00:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ov73DzZ3JhHogHTHhwz04YTeAjbKYlk1ylDd5W0pMgo=; b=zXuOzB6L1RplzKSHnHDntvItMl
	eBLYfPRWy1Sh9xol1ldk6HGhNtx05feo7YcbHcPhY3658c49EGWb+0b2R0BjMuWFsNLiBTVPjS9g7
	ayTxxqSjaOaOxwBY8bl23/qIapdRxVJV3j/NmAGoYzcJpdJ4S223R2c2jR116HJXu5DJac/+ib3+T
	kP/D9Jl0e75+h2GSwui5oi1j1D8XnBS+0EYVBLEdBAiJR74hnJd/Toh7qebU9cSqmiGdGTVhO7oOI
	D/jhko8HXJbiS4G7bpHbKJTiu6O/nbhFGJxa0C/PbJmHXWD13ZgWoUnsyUa+6Q7YhwsYY5HefBAEQ
	bgSq8LUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJV6-00000002oCX-1JCB;
	Fri, 06 Mar 2026 00:57:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJV5-00000002oCR-3Jck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 00:57:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F04B9600B0;
	Fri,  6 Mar 2026 00:57:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 879C0C116C6;
	Fri,  6 Mar 2026 00:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772758626;
	bh=9QPHXsJibYdiI9qqEiSAHrmKf9tnT4G0DXCtKS89QIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zg9h/R5dfAalOU6ZrHNSdH4Kmx50xx+BKM/S1ZhLdPBFgNDbq/eNtVcRFFQPdnGFu
	 6VBZ9uBGfVhIEBzJN9cGtMMXnrPgbNHEdFeXy4zfuwzKO7g5jnK2W04QFsLfwQQupC
	 V5jaR5689kUMI/OjxLunX48h77KQxGVmjk6Xcrs7Ti4w4dGlWrrnE2XrROArfaHLpY
	 icc3JmgjXwp/NLOGwgsYlbPhKvpaqhUXStZh9PqL6TEJEHSwsf+1IfMpDsYAa+DTRQ
	 kkzb+uR+JgPtlK+b8CY+oW4WJCytU/bwUh3HEyeWb9OXbnMwqeEPIazYx8GMr+1TSb
	 3+K++YazKbKng==
Date: Thu, 5 Mar 2026 18:57:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peter Rosin <peda@axentia.se>,
	Conor Dooley <conor+dt@kernel.org>, Haibo Chen <haibo.chen@nxp.com>,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 2/6] dt-bindings: pinctrl: Add generic pinctrl for
 board-level mux chips
Message-ID: <177275862503.886378.14653051699126465622.robh@kernel.org>
References: <20260225-pinctrl-mux-v2-0-1436a25fa454@nxp.com>
 <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260225-pinctrl-mux-v2-2-1436a25fa454@nxp.com>
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


On Wed, 25 Feb 2026 18:55:06 -0500, Frank Li wrote:
> Add a generic pinctrl binding for board-level pinmux chips that are
> controlled through the multiplexer subsystem.
> 
> On some boards, especially development boards, external mux chips are used
> to switch SoC signals between different peripherals (e.g. MMC and UART).
> The mux select lines are often driven by a GPIO expander over I2C,
> as illustrated below:
> 
> 	┌──────┐      ┌─────┐
> 	│ SOC  │      │     │    ┌───────┐
> 	│      │      │     │───►│ MMC   │
> 	│      │      │ MUX │    └───────┘
> 	│      ├─────►│     │    ┌───────┐
> 	│      │      │     │───►│ UART  │
> 	│      │      └─────┘    └───────┘
> 	│      │         ▲
> 	│      │    ┌────┴──────────────┐
> 	│ I2C  ├───►│ GPIO Expander     │
> 	└──────┘    └───────────────────┘
> 
> Traditionally, gpio-hog is used to configure the onboard mux at boot.
> However, the GPIO expander may probe later than consumer devices such as
> MMC. As a result, the MUX might not be configured when the peripheral
> driver probes, leading to initialization failures or data transfer errors.
> 
> Introduce a generic pinctrl binding that models the board-level MUX as a
> pin control provider and builds proper device links between the MUX, its
> GPIO controller, and peripheral devices. This ensures correct probe
> ordering and reliable mux configuration.
> 
> The implementation leverages the standard multiplexer subsystem, which
> provides broad support for onboard mux controllers and avoids the need for
> per-driver custom MUX handling.
> 
> Allow pinctrl-* pattern as node name because this pinctrl device have not
> reg property.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2:
>  - change descriptions for device, not for driver
>  - add missed additionalProperties: false
> ---
>  .../bindings/pinctrl/pinctrl-multiplexer.yaml      | 57 ++++++++++++++++++++++
>  .../devicetree/bindings/pinctrl/pinctrl.yaml       |  2 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



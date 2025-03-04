Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7051EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 14:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5F49zAeaUwfP7KAjm/B9INY5OSmoTR5LT9KkF6OZlso=; b=jFRXgiKbvd2bw/jmP5FkZxciKO
	oAf+lKJYuEXwC41xFu/ZS7RZXPL/6bDE3XAooGjIagtd6mjPA83A3BqdNXZ55CiBb+KkLn2LXho/I
	67CCsY9ceNwITqzXSOsDhbAIv4ZOvIjRQZjPMF++LoD9TNh9OO6fp6MnFQOV+Ejez/wLCrvvr69VZ
	ZZDR7Fk8MIXpJHOFmvksXP8V5y+JTbMMX9JBS4pSVhkGfx1a9r/BMs0NEAl8J+oshNtimSmNdNFfg
	CBWzZXbRL02oUr+Peyng2XgIOHiwj2K4ikghwaOkfS4nc7dDnyb+JR1ACii18TPRrmfqgQ18Cvk3/
	84tR72mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSwc-00000004uyL-2jqY;
	Tue, 04 Mar 2025 14:08:26 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpSqr-00000004tPi-1Kqd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 14:02:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 19DB6A4550F;
	Tue,  4 Mar 2025 13:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7362AC4CEE5;
	Tue,  4 Mar 2025 14:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741096947;
	bh=eQZKk95b5WPL13CMB19MPEXFzwQxauyC3cepDZM5T0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EXwWU10Z/5kwkQ2U9e9n43/YfZLRv/ZsbKx8iai1tKZINb6WxQf/uZUemaHwWLAOJ
	 Po7bB9ep20IGSLEH26kpKgnPp7u54iC6vIdYAnOYQ7AIfzDNSqA4XIM1qEVwnvzz+B
	 JkjweF22Z16wPYo4EU9LSND4inWiI3juy0xMqkkJfOW2r0XoNVS3EJqRdxBJ7AuKIv
	 zC5JFos8274sBl4nphT0OV6L9ciyO1nVWBr1k9p4saKhCliesb1tJ271kZqGKeDmFH
	 atgGkIAM9KBWQME3PSHdEwDM3kr+5SdZF26pD7yzYRrh6CgzAz2o/HRXMWnxverd0W
	 AzlgK/Ze9dLOQ==
Date: Tue, 4 Mar 2025 08:02:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	~postmarketos/upstreaming@lists.sr.ht,
	linux-arm-kernel@lists.infradead.org,
	Scott Branden <sbranden@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] dt-bindings: pinctrl: Add bindings for BCM21664
 pin controller
Message-ID: <174109694544.2517876.17977367715126492989.robh@kernel.org>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
 <20250303-bcm21664-pinctrl-v3-1-5f8b80e4ab51@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250303-bcm21664-pinctrl-v3-1-5f8b80e4ab51@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_060229_420497_25C74563 
X-CRM114-Status: GOOD (  14.57  )
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


On Mon, 03 Mar 2025 21:54:46 +0100, Artur Weber wrote:
> Add device tree bindings for the pin controller included in the
> BCM21664 chip. The bindings are based off brcm,bcm11351-pinctrl.yaml;
> both chips use the same driver, but have different pins, and the
> BCM21664 has 6 alt modes instead of 4.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v3:
> - Fix example for I2C pins
> - Specify bias-pull-up/bias-pull-down as a boolean
> - Add gpio16/gpio17 to list of I2C pins in slew-rate description
> - Use additionalProperties: false on pin group and specify valid
>   properties for more strict checking
> 
> Changes in v2:
> - Drop "property: true" declarations which had no effect with
>   "unevaluatedProperties: false"
> - Define property limits for I2C pins only instead of standard pins,
>   making the pin-specific "if" condition significantly smaller
> ---
>  .../bindings/pinctrl/brcm,bcm21664-pinctrl.yaml    | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6CDC9833F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91pwuU3OgL0Wr24qMPAa6xDt2dy0IpMtRco3IPDhLJU=; b=qv4pl3KB+dqWyMRcHmLK/D9zVK
	Fwzp6hcIlKuxnEJg0YmtE1OAJ3r2MxmXBDcZmbOfvG/7d1eI4cJNcdW9lOmK7paoXj3FHegUP80Ut
	7WUhiQTWxcy4LRuDYnVTHLfa7smE+ZzGgFjPDXkf2lGj46T3R+5l6oGTcIDfDk0EkA8pXSMq42bWs
	igAsmrTvz9YPo94rvPCc5s7e9+mL7/nVrPS3YEiudsw6Vu0BfjCNdu2zATAjSypv1ICi7gBYEj8YF
	+8SGVsKsYnXfxBJOAmhxeqrJElfH00L7j82JZYxIGPYKwlAL8NxwOehw0B6g876Zj40X7m1gyUaQk
	xr/GZEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAU3-00000000YOG-0s2e;
	Mon, 28 Sep 2026 12:29:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBAU2-00000000YNx-1rc2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 12:29:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B1AD600CB;
	Mon, 28 Sep 2026 12:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2B4C1F000FF;
	Mon, 28 Sep 2026 12:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790598565;
	bh=91pwuU3OgL0Wr24qMPAa6xDt2dy0IpMtRco3IPDhLJU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hgISBTHIMG8Pboxc5goHyUdq32kOJBjr3EhjdyMvX4FlJY4UA6dK4Q5eENJdFgi1n
	 QZmGFFL5zyIklL1B/Zmbet1T3Akaym3eaGcBG1QvwdzbAaWk4Q5uVaRk+U9hPid6O7
	 bf6WvXFjXM5t8953wETH9r5dQNQLAGksEpfE5laEfA1hihxK39AUn2XdB9YtKS2Eta
	 UlTIU5JtkfJ26iMDocPwAFbtT+Rh6/euSqvTsf44fqvlYL6hy2VOZfFeAt3UZ6JUcx
	 OMn52AxsbJctqvpfnZQlURHy6nZDSqqbmeOUBQmzwOd2BWNeDdnzkt/JxIXAgEHobv
	 0bo37iDuiSFZw==
Date: Mon, 28 Sep 2026 14:29:22 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zi-Yu Chen <zychennvt@gmail.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>
Subject: Re: [PATCH v10 3/3] arm64: dts: nuvoton: Add I2C nodes for MA35D1 SoC
Message-ID: <arpdMZ1KHd00_oLK@zenone.zhora.eu>
References: <20260921083753.1109826-1-zychennvt@gmail.com>
 <20260921083753.1109826-4-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921083753.1109826-4-zychennvt@gmail.com>
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

Hi Zi-Yu,

...

> +&i2c2 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +
> +	nau8822: audio-codec@1a {
> +		compatible = "nuvoton,nau8822";
> +		reg = <0x1a> ;

please, remove the space before the ';'

Thanks,
Andi

> +		nuvoton,spk-btl;
> +	};
> +};


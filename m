Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8CFD3399F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 16:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vOGWxeNo10IJ1zx3NeNqhpFpTCjszPdvsXE0VdFejGc=; b=q7BxKGoTk/ujawqOkAsfFkKVj/
	8KK0Q/ZtbsZeBc7MUI7ybB7a0BPF5m+uCVONMc8Fgj1KhbWurq/p9vi/zmDxPlWWMBhUExf2bAY00
	1/9NghL0bzs02SphdT9liQCZe8LSUGmIQxnlEr9zrxyQWCegz0FlwdqXm4v6/0hanXmRpwj4SYGrj
	srvqM3vBOJSpfRtBJpd3LvZcIycdUAD6JnBA8ttGYUv7tgOUwV1dSDe+QWgBo77Ymdw5E9u+Ezx9t
	+jhVUFoiFcqtahXP14WxAo1NrRop7k7iRTjKdwcUtz2bgW9Q2D8cncIol1COgRCkgPP9mx/zmJXfm
	vMRb2Meg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SkM-0000000BVpk-44ns;
	Mon, 28 Oct 2024 16:37:38 +0000
Received: from thales.epochal.quest ([51.222.15.28])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5SGZ-0000000BQDA-1wI3;
	Mon, 28 Oct 2024 16:06:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=epochal.quest;
	s=default; t=1730131609;
	bh=Bu58v2gr38UKxgFPQsmkozo+upmq0xR+OgYGP8APTu0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IM7SQiOvG7FJObmipWN8JTq47jKeael3a2b8Q6gnuceSY6J+yNMxhDmxAmuWj7EkP
	 YuV92LsR4eoZvbj4dnYwmDRIV/S1AEqQ+kidPEm42ZjWfu+dYcu9DlcYoJJn89i8CP
	 WhhNvG52oeCzbGaB4InOH+YCHsC+0f+OT4qPUEYHOi4nwQiSpj+IMsfyVZAU9cqUeM
	 iMvgq1Ek/lqRbMk/xeCB3dQWrvMQBneH5vdSGfXvJXlM+t8Lv6F20fUEDC/hROSHO8
	 8Y5TvAWX/92Q2t/G7gFHn8jNsYr7Nk3UYO9Hq4jt6krloaONiYqfBW9XDWI9tEqZvw
	 tv/pc+yqAHLGw==
X-Virus-Scanned: by epochal.quest
MIME-Version: 1.0
Date: Mon, 28 Oct 2024 13:06:48 -0300
From: Cody Eksal <masterr3c0rd@epochal.quest>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Maxime Ripard <mripard@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 Parthiban <parthiban@linumiz.com>, Yangtao Li <frank@allwinnertech.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Vinod Koul
 <vkoul@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Thierry Reding
 <treding@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, Viresh Kumar
 <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, Stephen Boyd
 <sboyd@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>
Subject: Re: [PATCH 05/13] dt-bindings: usb: sunxi-musb: Add A100 compatible
 string
In-Reply-To: <cdfocja5u4jh6xh2jkouzyztsjinggep45ymbdwxc4zpscy376@i5voj36oqrrf>
References: <20241024170540.2721307-1-masterr3c0rd@epochal.quest>
 <20241024170540.2721307-6-masterr3c0rd@epochal.quest>
 <cdfocja5u4jh6xh2jkouzyztsjinggep45ymbdwxc4zpscy376@i5voj36oqrrf>
Message-ID: <91fc635a58ce647a3183d17c35e33ba4@epochal.quest>
X-Sender: masterr3c0rd@epochal.quest
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_090651_671816_333C1C0D 
X-CRM114-Status: UNSURE (   8.10  )
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

On 2024/10/27 5:47 pm, Krzysztof Kozlowski wrote:
> On Thu, Oct 24, 2024 at 02:05:23PM -0300, Cody Eksal wrote:
>> diff --git 
>> a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml 
>> b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
>> index f972ce976e86..d4993336a29b 100644
>> --- 
>> a/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
>> +++ 
>> b/Documentation/devicetree/bindings/usb/allwinner,sun4i-a10-musb.yaml
>> @@ -24,6 +24,7 @@ properties:
>>                - allwinner,sun8i-a83t-musb
>>                - allwinner,sun20i-d1-musb
>>                - allwinner,sun50i-h6-musb
>> +              - allwinner,sun50i-a100-musb
> 
> List looked ordered, now doesn't.... are you sure you keep intented
> ordering here?
I'll move this entry to fit the expected order for V2, thanks!

- Cody
> Best regards,
> Krzysztof


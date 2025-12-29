Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8511E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 08:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+dfQkKrpOevUTSpd1UtLk3ThuuZ/qZjG4te7veJs44w=; b=47yx12vI6NIsAUSs+sdmtLPape
	HIcoYcLasKYhewaT4Ew6+pgHX7y4549ku1XwneOqxCm7W+oJhaR1ILHzUQYPXhh7ItlhVjuwMdcFw
	4onZ/vZn8s980EdzuWuUmVbz+eAOKEDZ82y/4KEGS49tEh36XU6I6hC7csGf1ckOCeP9Nwm8AlW6R
	a+Ws0ZE6nTrjb47jn8XN5nWwT3kHvF+7hPJX9vmttAZpzDy4pbikXKIr3wV3WHdD+ZXKd91VUPGgw
	T7B2od7wBGWPuh2TF0lvYw8Zp5JdBRtmw3OY70xTpRFhPfsOs35Ax3rcqMr0+ZSr8Oaxz+/x5DnBK
	GRDUls+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8v4-00000003UM8-1F8Y;
	Mon, 29 Dec 2025 08:48:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va8v3-00000003ULz-1oRL;
	Mon, 29 Dec 2025 08:48:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 841BD60010;
	Mon, 29 Dec 2025 08:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8ED58C4CEF7;
	Mon, 29 Dec 2025 08:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766998080;
	bh=v44N2XjK2sH90Tnjd62vX1wVHggfuf7c0wYY7lW0ojw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j6wR2jaz06bwagPAFZPp9NkfKLy0tfyM0sR6Ei4rugvguB0/p45UYoVOiYhoXEJOH
	 Eih13gd10GToygImTgWkbJy4EIGXbJ3lwdO3eNZAp6Hg2Aatl/jJiu8DZrcenWSzZ2
	 QXHCoHHCmK1I2+zXTt9G18LvqAsiPCAuMvd2vaWsE4YxN+VyF1M1La6TvboxyRLFVi
	 VLa8WVXUBY3RRoLNCmjfTUoVxJBlCpVMo8Ex4mlddkA74oYVd2bD+dXgIfKZfRXsgd
	 UoUJ7L3k5I73UW66GchIZW7HDBErav/OZmQjgwXyNnOgTbSOHILRlyZ6wZ+5U04VpI
	 d6pgLuMQYqUyg==
Message-ID: <57d27a43-4c3a-415b-b633-3d52c9f96f5a@kernel.org>
Date: Mon, 29 Dec 2025 09:47:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] ARM: dts: rockchip: rk3506: Add pinctrl and rmio
 dtsi for rk3506
To: =?UTF-8?B?5byg54Oo?= <ye.zhang@rock-chips.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Rob Herring <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>,
 conor+dt <conor+dt@kernel.org>, linux-gpio <linux-gpio@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-rockchip <linux-rockchip@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "tao.huang" <tao.huang@rock-chips.com>
References: <20251227114957.3287944-1-ye.zhang@rock-chips.com>
 <20251227114957.3287944-8-ye.zhang@rock-chips.com>
 <ebb720f6-4756-437f-a71a-d94f45d732e8@kernel.org>
 <AGkAtwAtJy-UDFfi3M2RSaqR.3.1766993111418.Hmail.ye.zhang@rock-chips.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <AGkAtwAtJy-UDFfi3M2RSaqR.3.1766993111418.Hmail.ye.zhang@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 29/12/2025 08:25, 张烨 wrote:
> 在 2025/12/28 18:37, Krzysztof Kozlowski 写道:
> &gt; On 27/12/2025 12:49, Ye Zhang wrote:
> &gt;&gt; +		/omit-if-no-ref/
> &gt;&gt; +		rm_io28_touch_key_in6: rm-io28-touch-key-in6 {
> &gt;&gt; +			rockchip,pins =
> &gt;&gt; +				&lt;1 RK_PC3 7 &amp;pcfg_pull_none&gt;;
> &gt;&gt; +			rockchip,rmio-pins =
> &gt;&gt; +				&lt;0 28 49&gt;;
> &gt;&gt; +		};
> &gt;&gt; +
> &gt;&gt; +		/omit-if-no-ref/
> &gt;&gt; +		rm_io28_touch_key_in7: rm-io28-touch-key-in7 {
> &gt;&gt; +			rockchip,pins =
> &gt;&gt; +				&lt;1 RK_PC3 7 &amp;pcfg_pull_none&gt;;
> &gt;&gt; +			rockchip,rmio-pins =
> &gt;&gt; +				&lt;0 28 50&gt;;
> &gt;&gt; +		};
> &gt;&gt; +
> &gt;&gt; +		/omit-if-no-ref/
> &gt;&gt; +		rm_io28_sai0_mclk: rm-io28-sai0-mclk {
> &gt;&gt; +			rockchip,pins =
> &gt;&gt; +				&lt;1 RK_PC3 7 &amp;pcfg_pull_none&gt;;
> &gt;&gt; +			rockchip,rmio-pins =
> &gt;&gt; +				&lt;0 28 51&gt;;
> &gt;&gt; +		};
> &gt;&gt; +
> &gt;&gt; +		/omit-if-no-ref/
> &gt;&gt; +		rm_io28_sai0_sclk: rm-io28-sai0-sclk {
> &gt;&gt; +			rockchip,pins =
> &gt;&gt; +				&lt;1 RK_PC3 7 &amp;pcfg_pull_none&gt;;
> &gt;&gt; +			rockchip,rmio-pins =
> &gt;&gt; +				&lt;0 28 52&gt;;
> &gt;&gt; +		};
> &gt;&gt; +
> &gt;&gt; +		/omit-if-no-ref/
> &gt;&gt; +		rm_io28_sai0_lrck: rm-io28-sai0-lrck {
> &gt;&gt; +			rockchip,pins =
> &gt;&gt; +				&lt;1 RK_PC3 7 &amp;pcfg_pull_none&gt;;
> &gt;&gt; +			rockchip,rmio-pins =
> &gt;&gt; +				&lt;0 28 53&gt;;
> &gt;&gt; +		};
> &gt;&gt; +
> &gt;&gt; +		/omit-if-no-ref/
> &gt;&gt; +		rm_io28_sai0_sdi0: rm-io28-sai0-sdi0 {
> &gt;&gt; +			rockchip,pins =
> &gt;&gt; +				&lt;1 RK_PC3 7 &amp;pcfg_pull_none&gt;;
> &gt;&gt; +			rockchip,rmio-pins =
> &gt;&gt; +				&lt;0 28 54&gt;;
> &gt;&gt; +		};
> &gt;
> &gt; Why are you defining all pins? This is wrong, your driver has to do it,
> &gt; not DTS. All these definitions when not used are just pointless.
> &gt;

Don't send HTML to us. I cannot parse above.

Best regards,
Krzysztof


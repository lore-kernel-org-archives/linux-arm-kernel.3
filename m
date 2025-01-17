Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29DFC02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 04:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XcDuxFeWzuXfTWafBcbG5fJTSAMGNQ34729FlOyIdY4=; b=YZppeAqzWsSLBggYQ4tKNSSIkH
	FmUaw3mdZ0K5/utQZqdm1maOqaI7xJP+IsuJEotuw2iZYaLqP6Pc1g3e5j5PfD/FgTmbumD53V/ft
	26AsJuK65AxEq4oqSy6wdgp2u/wFi90MHZs236JFK869D5nWP68UNuJLnDM8n2sA7/2VE1lfELqCz
	KEhpVU0m+2gyLWkB86UguH3VGesosyjOqub3jsY9bnAG5sT9j7CBgLMoD607pRV1FXnUJXkRTQxf2
	s65/fOLaXMzRDdhrtm/4Dh44dzVet58FeLgtMFY7wcjIXEOB60uGU/eiV19HYo7KA6UR4ep2GorIw
	0aNBQccA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYdhs-0000000GxxG-3cFo;
	Fri, 17 Jan 2025 04:11:40 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYdgb-0000000Gxqh-2qXA;
	Fri, 17 Jan 2025 04:10:23 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1737087017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XcDuxFeWzuXfTWafBcbG5fJTSAMGNQ34729FlOyIdY4=;
	b=Ppd6h7TkOtUNwrw7j5Em7vty1G3E6oqLVmQ4l+GdT8GwrJuhj4pD+e+aM83VsRwswtSmXm
	NqQTGul5fScMwP3HcGS/iRTFdfIddu83EYZY9LDquJAx0XzxE6GiA+gTsuEH5p6g0WuZM1
	OpwY2xt1iH7RREbkitEwmYruQkomWXtKGpHf0YwurbtQVVUXBlEs55pcnYsCWbRGa191Mg
	kTq4eX7Xv6/4PfgropdAjgmIsoUpFyBH8SZtE9SnkRo8TZok/N7fEFGszFu67+V5eKQ9XN
	hX3E5OlHdqcHR36YKo6OTYKS2iPjTT+o1TCrfWc5fDLpAp/25ZHfVYirtxlhXQ==
Date: Fri, 17 Jan 2025 05:10:15 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Diederik de Haas <didi.debian@cknow.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, zyw@rock-chips.com,
 kever.yang@rock-chips.com, frank.wang@rock-chips.com,
 william.wu@rock-chips.com, wulf@rock-chips.com,
 linux-rockchip@lists.infradead.org, Alex Bee <knaerzche@gmail.com>, Conor
 Dooley <conor+dt@kernel.org>, Johan Jonker <jbx6244@gmail.com>, Jonas
 Karlman <jonas@kwiboo.se>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob
 Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 4/6] arm64: dts: rockchip: add rk3328 usb3 phy node
In-Reply-To: <D73NJYSP62XH.28CVZPNUE21H3@cknow.org>
References: <20250115012628.1035928-1-pgwipeout@gmail.com>
 <20250115012628.1035928-5-pgwipeout@gmail.com>
 <7c7ce820-8a9b-46df-b143-f77835b7e5a0@kernel.org>
 <D73NJYSP62XH.28CVZPNUE21H3@cknow.org>
Message-ID: <1bc91b4214a1099801aaed6b3ef81ef3@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_201022_038692_758838B6 
X-CRM114-Status: GOOD (  22.99  )
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

Hello Diederik,

On 2025-01-16 17:53, Diederik de Haas wrote:
> On Thu Jan 16, 2025 at 2:01 PM CET, Krzysztof Kozlowski wrote:
>> On 15/01/2025 02:26, Peter Geis wrote:
>> > Add the node for the rk3328 usb3 phy. This node provides a combined usb2
>> > and usb3 phy which are permenantly tied to the dwc3 usb3 controller.
>> >
>> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>> > ---
>> >
>> >  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 39 ++++++++++++++++++++++++
>> >  1 file changed, 39 insertions(+)
>> >
>> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> > index 7d992c3c01ce..181a900d41f9 100644
>> > --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> > +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
>> > @@ -903,6 +903,43 @@ u2phy_host: host-port {
>> >  		};
>> >  	};
>> >
>> > +	usb3phy: usb3-phy@ff460000 {
>> > +		compatible = "rockchip,rk3328-usb3phy";
>> > +		reg = <0x0 0xff460000 0x0 0x10000>;
>> > +		clocks = <&cru SCLK_REF_USB3OTG>, <&cru PCLK_USB3PHY_OTG>, <&cru PCLK_USB3PHY_PIPE>;
>> 
>> Please wrap code according to coding style (checkpatch is not a coding
>> style description, but only a tool), so at 80.
> 
> I'm confused: is it 80 or 100?
> 
> I always thought it was 80, but then I saw several patches/commits by
> Dragan Simic which deliberately changed code to make use of 100.
> Being fed up with my own confusion, I submitted a PR to
> https://github.com/gregkh/kernel-coding-style/ which got accepted:
> https://github.com/gregkh/kernel-coding-style/commit/5c21f99dc79883bd0efeba368193180275c9c77a
> 
> So now both the vim plugins code and README say 100.
> But as noted in my commit message:
> 
>   Note that the current upstream 'Linux kernel coding style' does NOT
>   mention the 100 char limit, but only mentions the preferred max 
> length
>   of 80.
> 
> Or is it 100 for code, but 80 for DeviceTree files and bindings?

I don't know about the DT files and bindings, but the 100-column limit
for the kernel code has been in effect for years.  In this day and age,
80 columns is really not much (for the record, I've been around when
using 80x25 _physical_ CRT screens was the norm).


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7136CD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 17:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9xMgLOI1cS11QU37jU00P3mPm7u8NVNTN1EpkK6OCI=; b=T+xcOJ7qHoXb5MV0dppJoPBinA
	x07rDo8T3hG5i86fw37+FuZ9kMHCosuu/BXpgeUqeKvP9skLvX1FaatlS3N7hwM5P3P4K/voyMtWb
	+cL4Wy1PLm2v1kNznpp1SLlc32ro3ejukKzkso1bsJcY+oFFj6LN6DY3m6yICEtI+0RIXnWZC0rOP
	Q0U7uB6gH5JgMdaixes1Gvh387NO24atiX2rIMM9vlcFH/g0H1A3uUx1MJyEg9gYX0c5QQ134HViV
	cizs1v+BK0TobqaPlwMI12olZI2lz6AzLjhm6Xvr/eVrL+cER6d8Q7HYSzMsSi59iN8I05USiZr9W
	wce6oI9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTYv-0000000BWiy-3bdu;
	Fri, 22 May 2026 17:21:29 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQTYu-0000000BWht-0I1a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 17:21:29 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4gMXBD2VH5z9v2j;
	Fri, 22 May 2026 19:21:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779470484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e9xMgLOI1cS11QU37jU00P3mPm7u8NVNTN1EpkK6OCI=;
	b=vh7PRy8PKXI7TtWXkPQ6X4TnSBSGgF5ICMPn/MTOwcrmKahVesVTjlHTZUrheQmeC9qYqt
	/CxlWBG5gkYtE5b2CgsmUVbZjLuQlf5cDkYBP/9ri5jIdCCC6tgR3aUDaTbKomB8x9fFqR
	dH52ZD77CLTkfYERUUl17Uk+ece/QHHkZiZ1ex+bywqHaaxIToBzuksI7snw109o5uNubI
	MGSEahQiMFzrGveGQMQtN/LIEhrQmBMEDi9JfU7qWaDEuzSlMKvsTjqBpx2FJZMPG9KgqL
	aiHhcjq61F2MrfSrMx4hjmhptmYdyQFaoZ9XNbTy103WjHe9ql8m/Qx/UETuMw==
Message-ID: <cc9fea02-4b92-4542-9f97-64226179f2a3@mailbox.org>
Date: Fri, 22 May 2026 19:21:17 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 7/7] arm64: dts: renesas: r8a779md: Add support for
 R-Car M3Le R8A779MD Geist
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Nguyen Tran <nguyen.tran.pz@bp.renesas.com>,
 Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260504144534.43745-1-marek.vasut+renesas@mailbox.org>
 <20260504144534.43745-8-marek.vasut+renesas@mailbox.org>
 <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <CAMuHMdWwantdbvPSFoYm=+_OoQQkKwz+K=qwWgy-7tSp1BNJBw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: nsbpgrknzctogmk1dc6wqeswpo4mh6gp
X-MBO-RS-ID: 76a7294ae1c8eed5402
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_102128_258219_5F50505B 
X-CRM114-Status: UNSURE (   9.53  )
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

On 5/22/26 5:47 PM, Geert Uytterhoeven wrote:

Hello Geert,

>> +++ b/arch/arm64/boot/dts/renesas/r8a779md-geist.dts
> 
>> +&avb {
>> +       pinctrl-0 = <&avb_pins>;
>> +       pinctrl-names = "default";
>> +       phy-handle = <&phy0>;
>> +       tx-internal-delay-ps = <2000>;
>> +       status = "okay";
>> +
>> +       phy0: ethernet-phy@0 {
>> +               compatible = "ethernet-phy-id0022.1622";
>> +               rxc-skew-ps = <1500>;
>> +               reg = <0>;
>> +               interrupts-extended = <&gpio2 11 IRQ_TYPE_LEVEL_LOW>;
>> +               reset-gpios = <&gpio2 10 GPIO_ACTIVE_LOW>;
>> +               reset-assert-us = <100>;
> 
> 10000?
> 
>> +               reset-deassert-us = <100>;
> 
> 300?
> 
>> +       };
>> +};
> 
>> +&pfc {
> 
>> +       pwm2_pins: pwm2 {
>> +               groups = "pwm2_a";
>> +               function = "pwm2";
>> +       };
> 
> Shall I drop this while applying?
> 
>> +&pwm2 {
>> +       pinctrl-0 = <&pwm2_pins>;
>> +       pinctrl-names = "default";
>> +
>> +       status = "okay";
>> +};
> 
> Shall I drop this while applying?
> 
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I sent a V3 only of the 7/7 In-Reply-To this message, I hope it helps.

Thank you for the reviews !


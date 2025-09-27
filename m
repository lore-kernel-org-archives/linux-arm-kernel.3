Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 357FACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Sep 2025 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kDJxiELqf4U5lRLf3tONs5cV8e4+Ke0rdHsBjyMJTgc=; b=PtC14ipLseTIPUK+bcice0XgaQ
	8l7sg34JNHq9n6soTK0KDk/Nsppx3v94ttqUbrXCwnXi9ml706a5Wc48rUbigDOp6rvsXgPooR1Ts
	T2STc4G/pq2JGzkJtH8uDc4XOC9bnuObvFF1oKti9uSImD+IAgh721vpnbe2oTuNJED4xt7Kp29Mf
	0IZM3l1/rQbylVMCmcuac1opjIGR4dTKe4e4YXDWtr+JgrwUN898XVc4zlV/Gz1icOrXUgVvjnpEG
	AhQDBPDcCKjBRp5dLCMKFaTOmIH3Cp6Vlsg8rt9Z5NjSsOw1k9gSIUP2x7fkGYmULNrqXCjZMjyQb
	/z+qU6fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Vfi-0000000AFlq-38O1;
	Sat, 27 Sep 2025 14:13:10 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Vff-0000000AFi4-3YyW;
	Sat, 27 Sep 2025 14:13:09 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1758982385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kDJxiELqf4U5lRLf3tONs5cV8e4+Ke0rdHsBjyMJTgc=;
	b=XvFFGawF9nEueZNw9RqkWyjr9N8/47dhxMb5QRL40fuerjSMVv8W9/oetahfHvOLEznbrt
	JyefKJ8hg3cHMZabL6U/H/9xVZwMy/GA+6O8Pw3Mm2mLJ1Bl/Nmqt0wAsl63/ksGSFsPJn
	CakoeRrz8K50V5xW8aKa7zYpj9Xaf/XSJ3yypekBG7hfPlYmdi9WXBqPk/GDNkc/0UBbgh
	6XQlRVRxBV0Txmsx6FnUecyPFggfXf8KCg2W75xHtEeYxy/IpCB+M4Wwj8xwy1Nk4XJ8C9
	K710to/g0Ys4WvTwNRk4voXaPB1HEl/xX6qyl1L0tKI7ub0ecfWpWMUQKuEacg==
Date: Sat, 27 Sep 2025 16:13:04 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Tianling Shen <cnsztl@gmail.com>
Cc: Diederik de Haas <didi.debian@cknow.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jonas Karlman
 <jonas@kwiboo.se>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add devicetree for the
 FriendlyElec NanoPi R76S
In-Reply-To: <ad4a7dda-8f6f-4d2a-84d9-838611f2285f@gmail.com>
References: <20250922091509.2695565-1-cnsztl@gmail.com>
 <20250922091509.2695565-2-cnsztl@gmail.com>
 <DD2V17FJ29MV.3YDX1VUWGKEH@cknow.org>
 <1bb00ad6-ffe1-4783-909b-032dfb984180@gmail.com>
 <DD3EST9Y5UHF.12FJMDJUSZNYL@cknow.org>
 <d0a3d5d4480eac12ba5e2b15bcbc578f@manjaro.org>
 <ad4a7dda-8f6f-4d2a-84d9-838611f2285f@gmail.com>
Message-ID: <5aa5862c4f744b5eb67ad6fe0677e7b1@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_071308_225902_9BB4508C 
X-CRM114-Status: GOOD (  14.83  )
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

On 2025-09-27 15:52, Tianling Shen wrote:
> On 2025/9/27 21:47, Dragan Simic wrote:
>> On 2025-09-27 09:37, Diederik de Haas wrote:
>>> On Sat Sep 27, 2025 at 3:19 AM CEST, Tianling Shen wrote:
>>>> On 2025/9/27 0:07, Diederik de Haas wrote:
>>>>> It is recommended to use the labels in the schematics to define the
>>>>> pinctl nodes (and thus their references). In quite a lot of cases 
>>>>> that's
>>>>> indeed the case, but not for gpio-keys (USER_BUT) or these 
>>>>> gpio-leds
>>>>> pinctls.
>>>> 
>>>> I cannot find any specific naming rules from the gpio-keys[1] and
>>>> gpio-leds[2] bindings, did I miss any update?
>>>> 
>>>> I think this naming matches the current practice at least in 
>>>> rockchip's
>>>> dt tree.
>>> 
>>> There is an unofficial rule/aim:
>>> https://lore.kernel.org/linux-rockchip/5360173.ktpJ11cQ8Q@diego/
>>> But granted, there is 'some' inconsistency.
>>> 
>>> And used in f.e.
>>> https://lore.kernel.org/linux-rockchip/20250727144409.327740-4- 
>>> jonas@kwiboo.se/
>>> 
>>> Where you can just copy the pinctrl labels from the dts[i] and paste
>>> that in the schematic document and you're instantly at the right 
>>> place.
>>> Which is the exact purpose of that rule/aim.
>> 
>> Is the schematic actually publicly available?  I tried searching for
>> it, but found nothing, unfortunately.
> 
> The schematic for NanoPi R76S is available at
> https://wiki.friendlyelec.com/wiki/images/6/60/NanoPi_R76S_LP4X_2411_SCH.pdf
> 
> For more information please move to
> https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R76S.

Oh, I see.  I'm sorry, somehow I got the NanoPi R76S mixed up with
another board whose DT has also been submitted recently, [1] for
which I was unable to find the schematic.  I already found the R76S
schematic, which was actually really easy to do.

By the way, it would be good to provide a link to the schematic as
a reference in the description of patch 2/2, if there turns out to
be v3 of this series.

[1] 
https://lore.kernel.org/linux-rockchip/20250925-print-defog-992c12970b37@spud/T/#t


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AC7FC6182
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Jan 2026 20:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtAfMVPdP7lodKfgjOchQV30L9EPvlesZ8OYGCU3Tso=; b=iuNcPVJrQXFnYURl6DSeSo2yWm
	GorovHrhRlB9JI47NWmGVIR0dlkkHDwkh6ua5yVE/oJwq6CFSQxlmU9dWnhX/RnI7MhmZCClW07mt
	NSEnkagavWTNNTUDSzc+gd/TnHvweFk9dqBkYPTNcximbidftZPv4IkYS6WmkA4IbjSD9M50m0kaT
	Yebkr6C89fn0mpQx76UTWUOJ/CS6q4ZtbBJYat4SSe1Xgcl7JU9vfrNzvIb4DaArDHJcxqU26kaeZ
	WPwcZZ1ZxgJvrUWDn5Q4KdxjlQOp7s+kT4BV7LyiEq2rVQohqJ9h+u9aalTpK2GV/fPgwJ+ew6Mh3
	lzdP0Keg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc8eM-00000009nko-1Ggu;
	Sat, 03 Jan 2026 20:55:02 +0000
Received: from smtp6-g21.free.fr ([2a01:e0c:1:1599::15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc8eI-00000009njY-3mqZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Jan 2026 20:55:00 +0000
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:db5:e0b7:ba17:f0e9])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2EC3B780368;
	Sat,  3 Jan 2026 21:54:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1767473691;
	bh=79OSn/nn6J9vtRRKoZXJfWBazAKPVTzO2TC7kHnwTp8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=BwHAuSZxbYu3MAjHoUUsV5YWU3A9ekBsHmUJWlfoyTP3rX8FS/1E8s3fddoOug9E2
	 2E8Pod3tSK+15lxs5s1L1aaSXidkxY7dbMPyvijLUaEfYGXzxPDQGfpVYjpZusB+g2
	 eGYn7S+h7JpHfd5zLJQyyyF9lAbh2WxTQ4HlpLWN318aVM1yeaz1wl4bBsnvMob1Bf
	 Pebz829kFom1eko5Hs9Wc5YNHuwtyIdevHDClT622lXdjyMFVxxWtrMiIhlZXXN7qz
	 Wj2GeuHugnyTjJ8FR3gkDyydemLp/ttnye31yPGy3yegRUo2mH1KFrsoE2mxaVczcg
	 dF1n7J35JTw7g==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: "Arnd Bergmann" <arnd@arndb.de>
Cc: "Rob Herring" <robh@kernel.org>,  "Geert Uytterhoeven"
 <geert+renesas@glider.be>,  "Magnus Damm" <magnus.damm@gmail.com>,
  "Krzysztof Kozlowski" <krzk+dt@kernel.org>,  "Conor Dooley"
 <conor+dt@kernel.org>,  "Daniel Mack" <daniel@zonque.org>,  "Haojian
 Zhuang" <haojian.zhuang@gmail.com>,  "Andrew Lunn" <andrew@lunn.ch>,
  "Gregory Clement" <gregory.clement@bootlin.com>,  "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>,  Linux-Renesas
 <linux-renesas-soc@vger.kernel.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: intel: Drop pxa2xx
In-Reply-To: <4e5c631e-8c7f-4f38-a60e-2db829ff9f06@app.fastmail.com> (Arnd
	Bergmann's message of "Wed, 31 Dec 2025 01:02:55 +0100")
References: <20251212203226.458694-4-robh@kernel.org> <m2345fmkg7.fsf@free.fr>
	<35405ed3-1319-4d3a-84a5-ad67f4c823ad@app.fastmail.com>
	<m2wm26lv28.fsf@free.fr>
	<4e5c631e-8c7f-4f38-a60e-2db829ff9f06@app.fastmail.com>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Sat, 03 Jan 2026 21:54:35 +0100
Message-ID: <m2qzs6l8ms.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_125459_367374_26B67FF0 
X-CRM114-Status: GOOD (  17.12  )
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

"Arnd Bergmann" <arnd@arndb.de> writes:

> If you or anyone else is still using PXA27x, we can always
> bring it back later, but I'd then put the burden on them to
> submit the dts file for inclusion without introducing DT
> warnings.
Well not anymore, for RAM constraints as I said.
I can still fallback to an older kernel though if I feel like 
hacking.

>> +	docg3: flash@0 {
>> +		compatible = "m-systems,diskonchip-g3";
>> +		reg = <0x0 0x2000>;
>> +	};
>
> This currently has no upstream users I can see, so
> removing pxa27x would probably mean we should remove
> that as well.
Yep, this driver was only used on the Mitac MIO A701 (my main 
board,
pxa27x based).

>> +	panel {
>> +		compatible = "toshiba,ltm0305a776";
>> +		lcd-type = "color-tft";
>
> I don't see a driver that matches the compatible string,
> does this one actually work?
Yes it does. The compatible string doesn't really matter. What is
relevant in that part is the "timings" node, which is used by 
pxafb
driver to setup its registers to control the LCD panel.

More generally, each and every part of this DT was working 3 years 
ago.

Cheers.

--
Robert


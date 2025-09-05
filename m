Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58B0CA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 14:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nOXqfCWmN5V41agEEtvIimfepPpb3P+Yh9dklxlQJFY=; b=QmK0Y9Z4rjwBOe9hl1lnGeML35
	qlJmSZcqhTDZRV0fxkcvtpDTBOQyKYyPiAsr2uxHZ8i9w14wO9GrSLsBJaMZ3PZ4fFgYqa7A1e5Fi
	XFZYKap2HvOvDzH4nzS2y8yCgOK7c0X29pNmbQcl9UOGkdLN7nt4GRmr3ZUxOu6uflu9ncvcZ3tJ7
	S5wM4mzRjKeMG0oW/IUDCm6+hg/dI2Rbqv8xSz4b7GdTC2tAHwTARnA+0r77kAKIgI7gb720KC+Jh
	49bragcgkEUfJF3/BbzVL8aSVzNzshsnJtQRj0BG43AVAS1obyyebsZngb8+NXHxHw0MEdfCSAYJB
	6sgqAlUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXUr-00000002Jug-04Q8;
	Fri, 05 Sep 2025 14:33:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuSbZ-00000000h4U-46S7;
	Fri, 05 Sep 2025 09:19:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=nOXqfCWmN5V41agEEtvIimfepPpb3P+Yh9dklxlQJFY=; b=m1PORwTqSEuHSqXJsATOHKvBAf
	6BNrLRhnvLgks1uTdOPcubsBVsYX3Fg3f+rnDxpdVS4QPex38Wyz4AWI/6jxQaQ1wDIU7/0HVNT8q
	jhNUO8rkU5/mayuTVA3DJHnkKxnD0KuzmbH1VlyPNMcJ7feEk6ADkEgMrfP+mbPNi55kfdbHCs6Vi
	2ndkqVFI752kYWgjQC8/ZqcuaQ8DzsTZobFbltiKN1joKNsyIEfBKJxxEw5uTbmr4f1BsxCeDb6GT
	RfyIulMW/oCalJQVZujrpm0IGaW9W09HIZJY6ah3QIygwFhLYvu5FwnHXCa1ZC8eoClIi6kF3Z6q7
	goxFdS7g==;
Received: from i53875bb6.versanet.de ([83.135.91.182] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uuSbO-0005d9-Gg; Fri, 05 Sep 2025 11:19:26 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kaison Deng <dkx@t-chip.com.cn>
Cc: Wayne Chou <zxf@t-chip.com.cn>, Quentin Schulz <quentin.schulz@cherry.de>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 FUKAUMI Naoki <naoki@radxa.com>, Peter Robinson <pbrobinson@gmail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Kaison Deng <dkx@t-chip.com.cn>
Subject: Re: [PATCH] arm64: dts: rockchip: Add devicetree for the ROC-RK3588-RT
Date: Fri, 05 Sep 2025 11:19:25 +0200
Message-ID: <2744084.BddDVKsqQX@diego>
In-Reply-To: <20250905090115.718622-1-dkx@t-chip.com.cn>
References: <20250905090115.718622-1-dkx@t-chip.com.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_021938_036841_A937A88A 
X-CRM114-Status: GOOD (  10.05  )
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

Hi,

Am Freitag, 5. September 2025, 11:01:15 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb Kaison Deng:
> The Firefly ROC-RK3588-RT is RK3588 based SBC featuring:

On the webpage it is unclear about the soc, both rk3588 and rk3588s are
mentioned?

https://en.t-firefly.com/product/industry/rocrk3588rt

>=20
> - TF card slot
> - NVME 2242 socket
> - 1x USB 3.0 Port, 1x USB 2.0 Port, 1x Typec Port
> - 1x HDMI 2.1 out, 1x HDMI 2.0 out
> - 2x Gigabit Ethernet, 1x 2.5G Ethernet
> - M.2 E-KEY for Extended WiFI and Bluetoolh
> - ES8388 on-board sound codec - jack in/out
> - RTC
> - LED: WORK, DIY
> - BTB connector for PCie, UART, USB, CAN, SARADC, GPIO
>=20
> Signed-off-by: Kaison Deng <dkx@t-chip.com.cn>

you definitly need a 2nd patch adding an entry to
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/arm/rockchip.yaml

The rest looked pretty good on a short glance :-)

Heiko




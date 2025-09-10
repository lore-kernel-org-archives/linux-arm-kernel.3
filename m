Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DF80CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGA5dcZRWUigTt8GjmWGSHBP8/IP5ng6CyXB4N9opa0=; b=JDpyVpaXWIp9lrz6waZ4Eol558
	ONNRAortCXSNqgYC6I0v49xkwGRZCYxKOpiAc+9YQ3wLxTwHWbZfy/aj6RwEIPuUWL+LSBYjJFuyq
	/ECRFGwmAtlu5nK6lgAn9IL2EvaCBypdQ2poYy1wK9YXWqoHDNhN2dBuu0VOjrv8m+IRb/Wzt1itk
	1F2j8gkK7A/zAOXLpAhiaSXo7dqhGi6IS9lQJObjtXEk/C1KS5WWStoJnxqcbv2lCcA20LIVPzsiK
	SDIAhnjxmfWJ8m37vLin5+VwVE9SKvb2EUeuxWT/imDANozoIJsah9cNeBbMtQa6r3+7J6aueC0Wu
	vM/OB60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFCk-0000000CXPq-2cBF;
	Wed, 10 Sep 2025 07:25:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFCi-0000000CXOx-3kZ2
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 10 Sep 2025 07:25:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZGA5dcZRWUigTt8GjmWGSHBP8/IP5ng6CyXB4N9opa0=; b=lsBusMszsCTkM9abA/MgBOP5al
	fpbed/R/GmR9gFmtlkKj5gg9OsM6ZLmIDrTEGAJ962NwN8o8afgKw3S09A3/5+/eAidI7WAJ7TIba
	UhtOEcxtea3V5iwV+4kqw0fpHNxz4OwKJorMTnK4mRQWWpk6HqA4FH6drA+A/3exHVHij9B/KjjSe
	1xjZS+mturAjQ3d8bV8TFz43aIxel90kJTpXculrKhlZTGtEk8xvXsRl51pxBS6nAiuKyoMiJMC6o
	Yn1W67pNCcwaZEX0hnDrd5CCIDnQQ0XCxhO5AUSz0lQYvuoOOjQQMwPi8SbagFmDH2qVrK6VF0YLa
	X7TB2Xiw==;
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFCf-00000005l4z-1ipU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:25:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757489109;
	bh=ZGA5dcZRWUigTt8GjmWGSHBP8/IP5ng6CyXB4N9opa0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M/Df+4gFpZo2jnpBnoKNNy4pZfOibmyNCP2ItaqHQzdlNhAKBa/0O+dBS5GgBf4bN
	 5mcazSvVUOpTQK0w8gbnr0cSGCsKACMEr0oZohlttaK6NqqlncezqOJdM5TNJe4DUD
	 5IYXoF72KmeTtZlY+Ekg+QHpUdUI4h3Yb0L9VqK68wl74rD89V3tlw+fhwQWdOF1Tw
	 miNU11LDzRqh6+tvMe9MH1q7+fZdyd0tTKh13APQBm81mAHac4u2JMwhn6r46ZozlD
	 S7Hx9MvZeR1mvohCH+1YOPlhe2n+MZeBftdPi4tUmK2RlsyvjIF7AVqJTl1PSCEiSc
	 Db4UnHy8/6b1g==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMBzR1HQnz4w2S;
	Wed, 10 Sep 2025 17:25:07 +1000 (AEST)
Message-ID: <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
 AST2600-i2cv2
From: Jeremy Kerr <jk@ozlabs.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Ryan Chen
 <ryan_chen@aspeedtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	 <conor+dt@kernel.org>, "andriy.shevchenko@linux.intel.com"
	 <andriy.shevchenko@linux.intel.com>, "andi.shyti@kernel.org"
	 <andi.shyti@kernel.org>, "linux-aspeed@lists.ozlabs.org"
	 <linux-aspeed@lists.ozlabs.org>, "devicetree@vger.kernel.org"
	 <devicetree@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	 <openbmc@lists.ozlabs.org>, Mo Elbadry <elbadrym@google.com>, 
	"linux-kernel@vger.kernel.org"
	 <linux-kernel@vger.kernel.org>, "joel@jms.id.au" <joel@jms.id.au>, 
	"p.zabel@pengutronix.de"
	 <p.zabel@pengutronix.de>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org"
	 <linux-arm-kernel@lists.infradead.org>, "linux-i2c@vger.kernel.org"
	 <linux-i2c@vger.kernel.org>
Date: Wed, 10 Sep 2025 15:25:05 +0800
In-Reply-To: <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <50327725-f3b8-4a8b-94a2-85afccd2868a@kernel.org>
	 <OS8PR06MB7541B0DBC64B3EF6838DFE74F2CD2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <d1b184c5-84c1-4d76-a1d0-a9f37f1e363c@kernel.org>
	 <OS8PR06MB7541D1D2E16C5E77037F3BB0F2CB2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <069b9fe4-c54a-4efd-923e-1558c59fe3f4@kernel.org>
	 <OS8PR06MB7541C69AB8E6425313DA8606F2DF2@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <677cb075-24ae-45d8-bfb4-9b23fbacc5df@kernel.org>
	 <OS8PR06MB7541C3B70B15F45F4824772BF2D92@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <994cb954-f3c4-4a44-800e-9303787c1be9@kernel.org>
	 <SI6PR06MB753542037E1D6BBF5CE8D2E7F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <4523caea-3406-4de0-9ab5-424fb7a0a474@kernel.org>
	 <SI6PR06MB7535BAD19B51A381171A0E64F2A42@SI6PR06MB7535.apcprd06.prod.outlook.com>
	 <8e8aa069-af9f-453f-9bd0-e3dc2eab59ab@kernel.org>
	 <OS8PR06MB7541FD8691B43EA33BDC1D22F2A72@OS8PR06MB7541.apcprd06.prod.outlook.com>
	 <99053328-a117-493e-b5f3-00902669c8e7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_082518_153042_1A9B5364 
X-CRM114-Status: GOOD (  15.75  )
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

Hi Ryan & Krzysztof,

[my response is intended to make progress on the newer v18 submission,
but we still have this item from v16 to resolve, hence picking up this
thread]

> Your compatible already expressed that there are two interfaces, so
> your drivers can just choose whichever they want. If you need to toggle a
> bit in system controller, it is fine. If you need different compatible,
> then that's a NAK.

I think the mention of "two register interfaces" is a bit misleading
here; it implies that it's just two interfaces to the same hardware.

From reading between the lines on the datasheet, it seems that this is
two completely separate IP cores, that:

 * are mapped to the same MMIO space; but
 * both happen to be I2C controllers.

- where the single "global register" (which you mention above) provides
the facility to mux the MMIO mapping between the two. Some versions of
the overall SoC have only the old core, some have only the new, and some
have both, selectable via this register.

Ryan, can you confirm whether this is the case?

Given there are actual behavioural differences between the two
peripherals - beyond just the register set - that would seem to indicate
separate binding types (+ a syscon mux control) to me, but I'm keen to
hear any other options.

Krzysztof, if that is the case, any thoughts on the representation of
separate bindings?

Cheers,


Jeremy


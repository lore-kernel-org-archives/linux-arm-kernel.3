Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 846A8CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 08:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7gl1yA8FosrECQLRFjm2EwEpzMLXBdUuHFs7UBoYns=; b=H1D+VmNbBr9dKVM35yFgGm5cI+
	426cwV8QGNbiOMqgVtWkQ+tVFtR/joo4rCLIhLkojOYNscmwYtw1CrcO1Hr1Jk7mF/+6XyV6phXVg
	r5W6ul+bmAJFzSQ2iHCF/wxaawiwe96FQWPIgWAqUzfO2iw/iUT5l+9eVjCzBy3rtM/3SP4pvdaom
	qYYGayYbLKRSGq2TDMOBpFLMCkItwmUMltk3pW8VGsd1hfgYqxjkFAm6ibqDys6Hhi6JyVcr5bghi
	rm7rlWJ17a75G2qQ48gc++83C5t+1G2HWVryFZFL26CjP0OGZc526a7AWK/S6CzDnT9P0wbd7wIV6
	6wIUP8ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGEd-0000000CwFi-39QI;
	Wed, 10 Sep 2025 08:31:23 +0000
Received: from gandalf.ozlabs.org ([150.107.74.76] helo=mail.ozlabs.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwGEa-0000000CwE8-33gi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 08:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1757493077;
	bh=a7gl1yA8FosrECQLRFjm2EwEpzMLXBdUuHFs7UBoYns=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=GpqpnhttBFZ3t7+EYAY8r50I5QXZ+3f71OrC7eF312pWWb0TnmG76HKmlIt51Vehs
	 Cb90rtCtW+C4EBcCElvH4SgJxieVNCsxBJ0Rc9NlSjdIYO+3HMuCNHf5HGb2LVIAos
	 52rQtXuJqEvyAxJGvW3tk5VLu0qWRVQNXvgsWmrhE7EHJN6A1ut1negsdt+0jif3Wd
	 Gy/uwXR+DNzEOO3qohcoqC3C3JgCjFCzI5aezlOPgxtgJ1X4STR0F29DzzXPiUBo18
	 vG07Lv1ol6zRZx58ubvHTMWgJ7e9lzzKnQFFyY/DLHavFjV68cXQRa5wkqp2ffKnoa
	 6ALJK6cL2D6XA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4cMDRl1Cmlz4w1l;
	Wed, 10 Sep 2025 18:31:15 +1000 (AEST)
Message-ID: <52943e49aaea7bb6def5bc51dfd57392b6ae66e4.camel@ozlabs.org>
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
Date: Wed, 10 Sep 2025 16:31:12 +0800
In-Reply-To: <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
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
	 <44ef5c93448a3625fcfd003b47a516e8ba795b62.camel@ozlabs.org>
	 <f9fc4b59-bdcd-4983-b7c2-0fec94e62176@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_013121_135689_21E39BF5 
X-CRM114-Status: GOOD (  23.41  )
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

Hi Krzysztof,

> You trimmed response and brought some very old thread which does not
> exist in my inbox.
>=20
> I have absolutely no clue what this refers to.

OK, reconstructing the relevant parts of that thread - Ryan providing
background on the old/new register interfaces (trimmed a little for
brevity; original context at [1] if you need):

>On 24/03/2025 09:30, Ryan Chen wrote:
>>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>>> AST2600-i2cv2
>>>
>>> On 19/03/2025 12:12, Ryan Chen wrote:
>>>>> Subject: Re: [PATCH v16 1/3] dt-bindings: i2c: aspeed: support for
>>>>> AST2600-i2cv2
>>>>>
>>>>> On 17/03/2025 10:21, Ryan Chen wrote:
>>>>>>> Neither this.
>>>>>>>
>>>>>>> So it seems you describe already existing and documented I2C, but
>>>>>>> for some reason you want second compatible. The problem is that you
>>>>>>> do not provide reason from the point of view of bindings.
>>>>>>>
>>>>>>> To summarize: what your users want - don't care. Start properly
>>>>>>> describing hardware and your SoC.
>>>>>>
>>>>>> OK, for ast2600 i2c controller have two register mode setting.
>>>>>> One, I call it is old register setting, that is right now
>>>>>> i2c-aspeed.c .compatible =3D "aspeed,ast2600-i2c-bus", And there
>>>>>> have a global register that can set i2c controller as new mode
>>>>>> register set. That I am going to drive. That I post is all
>>>>>> register in new an old register list.
>>>>>>
>>>>>> For example,
>>>>>> Global register [2] =3D 0 =3D> i2c present as old register set Globa=
l
>>>>>> register [2] =3D 1 =3D> i2c present as new register set
>>>>> It's the same device though, so the same compatible.
>>>>
>>>> Sorry, it is different design, and it share the same register
>>>> space. So that the reason add new compatible "aspeed,ast2600-i2cv2"
>>>> for this driver. It is different register layout.
>>>
>>> Which device is described by the existing "aspeed,ast2600-i2c-bus"
>>> compatible? And which device is described by new compatible?
>>>
>> On the AST2600 SoC, there are up to 16 I2C controller instances (I2C1 ~ =
I2C16).
>
> So you have 16 same devices.
>
>> Each of these controllers is hardwired at the SoC level to use either
>> the legacy register layout or the new v2 register layout. The mode is
>> selected by a bit in the global register, these represent two
>> different hardware blocks: "aspeed,ast2600-i2c-bus" describes
>> controllers using the legacy register layout. "aspeed,ast2600-i2cv2"
>> describes controllers using the new register layout
>=20
> Which part of "same device" is not clear? You have one device, one
> compatible. Whatever you do with register layout, is already defined by
> that compatible. It does not matter that you forgot to implement it in
> the Linux kernel.

So, I'm trying to pick up (from Ryan) on whether we're actually dealing
with separate devices here; that was ambiguous in his responses.

To me, it seems like we do have separate IP cores, just multiplexed to
the same MMIO space. And if so, what the preference on binding
implementation is, particularly with different SoCs having either only
the "old", only the "new", or a switchable set of both.

Hence my query:

> Given there are actual behavioural differences between the two
> peripherals - beyond just the register set - that would seem to indicate
> separate binding types (+ a syscon mux control) to me, but I'm keen to
> hear any other options.
>
> Krzysztof, if that is the case, any thoughts on the representation of
> separate bindings?

- given we may not be dealing with "the same device" in actual hardware,
in reference to Ryan's proposed compatible split between the two.

Cheers,


Jeremy

[1]: https://lore.kernel.org/all/20250224055936.1804279-2-ryan_chen@aspeedt=
ech.com/t/#u


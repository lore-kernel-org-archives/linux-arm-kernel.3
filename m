Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81422D59D95
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 21:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgUfumfpK8IIvCsoZJdwGQ9G22gqg60C4Us0iM2ajKk=; b=CMJ2cXBUb2acht5vKXuNKFNC/G
	EJElFnnNybHvig4oAM3AVNi+9QWStshfQZjXqGEz7fs5iZMJvYwPfX3U5EKmUXVy2jMdqdPBPxwtv
	X89RKX/PmzA+eWybsTHUueqQ+sMvYkqatHqgu/AaKYRtlSPmBMuewhG+pLdK/1I9t3oVHpUfWTaPz
	YyJdB7amasGYtB8W7oXWpWCRvzJBG+u30VPMcyoNaqFaWZAqzgluTrc72hvXUxrHTDKeiiR01DWr4
	GHMs9uBieKzjaCIkUtPyNSd+YK0r7LONc2KVfQwjkxQTgS9AQHWA3tdrQoBN35ksxvKdn7AAsr36k
	mniK8+lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAWa-000000016Uh-2OCm;
	Fri, 12 Dec 2025 21:18:04 +0000
Received: from smtp1.ms.mff.cuni.cz ([2001:718:1e03:801::4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUAWX-000000016UH-3Dig
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 21:18:04 +0000
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560+5C/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1765574234; x=1766874234;
	bh=SgUfumfpK8IIvCsoZJdwGQ9G22gqg60C4Us0iM2ajKk=; h=From;
	b=OE3fP7qMrQ9bg3lfj4OuqwhlpebxqbREJxoAPnzCEMv2XNlSmscAXITSuUS9Qd9b3
	 o9xqJOBix4IP2TR5FssIj/ZFEzre6naHZTyCPKZOEkb1Q2YtsCfgK8/FaTAqdDkGnU
	 kxr2EqCPeEV2I6v75dloTs0VeXUPgeJWHKYW1/RACH8LWWT4TUz5CSaTfnXgGQ+2W8
	 9Ey9CUeMRCCeT7jq+n3KRat6PaXdT2BklyyLYT8WJ/SXYCJ1R3Q97Rl8fQTJo+b6P6
	 3jIdjYNq60x9NsHOLkt5L0KIOrkbjUYuC/VOyJmunZKUEpeBAI0y/u6cua/XdpHv3G
	 U7R0QdmL7vr2g==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.18.1/8.18.1) with ESMTPS id 5BCLHCKs025210
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 12 Dec 2025 22:17:13 +0100 (CET)
	(envelope-from balejk@matfyz.cz)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Dec 2025 22:17:12 +0100
Message-Id: <DEWJTWZ6Q51B.13HQYMDJZRFWA@matfyz.cz>
Cc: "Johannes Berg" <johannes@sipsolutions.net>,
        "Rob Herring"
 <robh@kernel.org>,
        "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, "Andrew Lunn" <andrew@lunn.ch>,
        "Gregory
 Clement" <gregory.clement@bootlin.com>,
        "Sebastian Hesselbarth"
 <sebastian.hesselbarth@gmail.com>,
        "Francesco Dolcini"
 <francesco@dolcini.it>,
        "Ulf Hansson" <ulf.hansson@linaro.org>, "Frank Li"
 <Frank.Li@nxp.com>,
        <linux-wireless@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-mmc@vger.kernel.org>, <~postmarketos/upstreaming@lists.sr.ht>,
        <phone-devel@vger.kernel.org>, "Jeff Chen" <jeff.chen_1@nxp.com>,
        "Peng Fan" <peng.fan@nxp.com>
Subject: Re: [DONOTAPPLY RFC PATCH v2 4/4] arm64: dts:
 samsung,coreprimevelte: add wifi node
To: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>,
        "Brian Norris"
 <briannorris@chromium.org>
From: "Karel Balej" <balejk@matfyz.cz>
References: <20251026182602.26464-1-balejk@matfyz.cz>
 <20251026182602.26464-5-balejk@matfyz.cz> <aTCv75hjdX5XvgCh@google.com>
 <DEW3NQVZ84JU.22G38WMULFZJG@matfyz.cz>
 <b92172f3-10f4-470f-b90a-121ff7fea988@dujemihanovic.xyz>
In-Reply-To: <b92172f3-10f4-470f-b90a-121ff7fea988@dujemihanovic.xyz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251212_131802_386499_45BE7791 
X-CRM114-Status: GOOD (  19.50  )
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

Duje Mihanovi=C4=87, 2025-12-12T15:55:48+01:00:
> On 12/12/25 09:36, Karel Balej wrote:
>>>> +			};
>>>>   		};
>>>>   	};
>>>>   };
>>>> @@ -523,6 +531,13 @@ &sdh1 {
>>>>   	pinctrl-1 =3D <&sdh1_fast_pins_0 &sdh1_fast_pins_1 &sdh1_pins_2>;
>>>>   	bus-width =3D <4>;
>>>>   	non-removable;
>>>> +	#address-cells =3D <1>;
>>>> +	#size-cells =3D <0>;
>>>
>>> I wonder if this should have:
>>>
>>> 	vmmc-supply =3D <&ldo16>;
>>>
>>> rather than regulator-always-on above.
>>=20
>> You mean ldo15 right?
>>=20
>> Not having any board schematics, I don't really know what exactly the
>> regulator's purpose is. As I mentioned in the commit message, the
>> communication with the chipset seems to work even if this is disabled
>> (e. g. FW loads, networks can be scanned for,...) which doesn't seem
>> like it should be the case if this was a main power supply for the bus,
>> only actual connecting to networks doesn't work (gives
>> CONNECT_ERR_ASSOC_ERR_TIMEOUT errors).
>
> To me, this strongly suggests that the regulator powers the WiFi=20
> transmitter or at least a part of it (such as the RF amp).

Something like this occurred to me too but would the chip even see the
networks if this was the case? Although you are right that it could only
power some specific part of the radio.

>> So this didn't seem too fitting for either vmmc nor vqmmc as far as I
>> understand their semantics, so I went with the regulator-always-on
>> approach to be safe.
>
> Considering the above, I'd reckon it'd be good to have the option to=20
> toggle it for rfkill if anything. I'm however not sure what would be the=
=20
> right way to do so, nor how rfkill even works, if at all, with mwifiex=20
> (from what I see, the driver does not use the API).

I have experimented with rfkill here before. The chip has a specific pin
for this so I don't think handling the regulator alone would suffice.
But yes, it should certainly be associated with the rfkill if possible
so that it could be turned off to save power when the radio is disabled.

Brian, is it possible to attach the rfkill pin (and ideally this
regulator) to the wireless device solely through the device tree in some
generic way or must this be implemented in the driver? I have
experimented with the rfkill-gpio driver in the past but it appeared as
a separate rfkill device with its own controls independent of the
mwifiex device and I could only soft block both (soft blocking the
rfkill-gpio device of course had effect on the wifi though).

Regards,
K. B.


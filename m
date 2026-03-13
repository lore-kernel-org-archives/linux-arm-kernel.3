Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 110AB103E305
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:57:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MoF3QQCgUBtPBs0REwD2E8i1ubx1T9i27G2lzB3OK88=; b=hoW6ur2ZV1Y2r56YMFCoQDY0/T
	kksmy4mwNZEmp52LLXgiM+lC9EkmwbiFvvjVbCFuqC0Hn5DwIBIn9NeQB1JpWsK4VS54leZfYMfE9
	cFbyaRagOeCWYzVceRhYOS1xmT5sdHhD78YlAaonkRE+8K8Fw4aCHF3D45YNLaAOB73b28wyG2yzM
	P1iz/IzVkyI1hhxJyFLRwpdwitw/PviYzwfGE2y/STXAZzaB+rTO5C3Ck3Zaqlri7HQYol3Ckd19e
	OXKiPk1IBErZs5nQdmGMaVTm5HVQesKb6BTgZI42nmacWBayS1RhPP2ZwOaIwZNMTyp8JJ6txZ40O
	fvb9gx7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14tV-00000000b51-2wLe;
	Fri, 13 Mar 2026 15:57:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14tR-00000000b4Q-3vJH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 15:57:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 83E241A2E04;
	Fri, 13 Mar 2026 15:57:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5833C60027;
	Fri, 13 Mar 2026 15:57:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7738210369F3A;
	Fri, 13 Mar 2026 16:57:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773417459; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MoF3QQCgUBtPBs0REwD2E8i1ubx1T9i27G2lzB3OK88=;
	b=huDnKXF9EG1bHiZ4YXebhCBw0dPf2W6er7dNNtRkaArdHgRrT8jEh127IBB19MiXk81bF5
	OnVrgKgctALyS1COGZZe2ARL6jGIa11GP1jHUE20n6xNrDVwTpQ+B6t/YUAitT8vfZACi5
	cGPE//aGd9FeAdsanFvOXqPTnvvWNI0USqJsZOPVsPR9UkMqmy/773aoVxIIh04ADLWZyk
	VW/h9DwzmypPj88h6SxQJBhHipdrH1VQzWPkkqaHNLjAp4P9E2ELF+FRudAM4lVS8R+u3v
	blynlo2Bbv3phdOWEtDoRgjcKilox3E/nxGZwlG8QpHx4PCt9OJfKco0GBRgRw==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Gabor Juhos <j4g8y7@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' properties
In-Reply-To: <41a42087-dc36-41de-a8f2-0c8b39425ffd@gmail.com>
References: <20260304-armada-37xx-drop-usb-misc-reg-v1-1-800c1b746b7a@gmail.com>
 <db997887-2431-4baa-8e96-04f53ea59060@lunn.ch>
 <874imug18l.fsf@BLaptop.bootlin.com>
 <cacefc69-dba3-4ff6-a039-85fe35a91e0b@lunn.ch>
 <41a42087-dc36-41de-a8f2-0c8b39425ffd@gmail.com>
Date: Fri, 13 Mar 2026 16:57:37 +0100
Message-ID: <87pl5767ta.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_085742_110661_CAC0502F 
X-CRM114-Status: GOOD (  17.14  )
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

Gabor Juhos <j4g8y7@gmail.com> writes:

> Hi Andrew,
>
> 2026. 03. 05. 14:28 keltez=C3=A9ssel, Andrew Lunn =C3=ADrta:
>> On Thu, Mar 05, 2026 at 08:54:34AM +0100, Gregory CLEMENT wrote:
>>> Hello Andrew,
>>>
>>>> On Wed, Mar 04, 2026 at 08:12:43PM +0100, Gabor Juhos wrote:
>>>>> The 'marvell,usb-misc-reg' property is present both in the EHCI and
>>>>> in the XHCI USB host device nodes, however it is not documented. Thus
>>>>> 'make dtbs_check' produces warnings like these:
>>>>>
>>>>>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell=
,armada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-mis=
c-reg' was unexpected)
>>>>>           from schema $id: http://devicetree.org/schemas/usb/generic-=
xhci.yaml
>>>>>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell=
,armada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-mi=
sc-reg' was unexpected)
>>>>>           from schema $id: http://devicetree.org/schemas/usb/generic-=
ehci.yaml
>>>>>
>>>>> Apart from the fact that the properties are not documented, those are
>>>>> not even used by any USB host drivers. At least 'git grep' says this:
>>>>>
>>>>>   $ git grep -n 'marvell.usb-misc-reg' v7.0-rc2
>>>>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-=
utmi-phy.yaml:30:  marvell,usb-misc-reg:
>>>>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-=
utmi-phy.yaml:41:  - marvell,usb-misc-reg
>>>>>   v7.0-rc2:Documentation/devicetree/bindings/phy/marvell,armada-3700-=
utmi-phy.yaml:50:      marvell,usb-misc-reg =3D <&usb2_syscon>;
>>>>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:372:         =
                     marvell,usb-misc-reg =3D <&usb32_syscon>;
>>>>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:383:         =
                     marvell,usb-misc-reg =3D <&usb32_syscon>;
>>>>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:396:         =
                     marvell,usb-misc-reg =3D <&usb2_syscon>;
>>>>>   v7.0-rc2:arch/arm64/boot/dts/marvell/armada-37xx.dtsi:406:         =
                     marvell,usb-misc-reg =3D <&usb2_syscon>;
>>>>>   v7.0-rc2:drivers/phy/marvell/phy-mvebu-a3700-utmi.c:231:           =
                                              "marvell,usb-misc-reg");
>>>>
>>>
>>> I don't follow:
>>>
>>>> The phy-mvebu-a3700-utmi.c does use it, and does document it:
>>>>
>>>>   marvell,usb-misc-reg:
>>>>     description:
>>>>       Phandle on the "USB miscellaneous registers" shared region
>>>>       covering registers related to both the host controller and
>>>>       the PHY.
>>>>     $ref: /schemas/types.yaml#/definitions/phandle
>>>>
>>>> And the patch which added the property to the USB nodes also added the
>>>> PHY nodes.
>>>>
>>>> commit 05d168a56fae8ff50432d5dfe6e7423b989455a8
>>>> Author: Miquel Raynal <miquel.raynal@bootlin.com>
>>>> Date:   Tue Jan 29 10:36:34 2019 +0100
>>>>
>>>>     arm64: dts: marvell: armada-37xx: declare USB2 UTMI PHYs
>>>>
>>>
>>> You stated that the property is used and was properly added.
>>=20
>> I can understand your confusion. The commit message is not great. I
>> had to read quite a bit of code to convince myself the change is
>> correct.
>
>> The property is used and documented in the Generic PHY driver,
>> phy-mvebu-a3700-utmi.c. And the properties being removed are in USB
>> nodes. The properties in the PHY node are not removed.
>>=20
>> The properties in the USB node have never been used, as far as i can
>> see.
>
> Thank you for the review, and sorry about the confusing commit message. P=
erhaps
> I should have skipped the 'git grep' part.
>
> @Gregory: Shall I send a v2 with a reworded the commit message?

Yes please it would be nice if you can do it.

Gregory

>
> Regards,
> Gabor
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


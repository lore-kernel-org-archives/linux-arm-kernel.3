Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91355103E161
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 10:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaQF8Rk+pj0ruLxQsZHfi0rM4RAp8TegoCfMnyVAwdg=; b=y3kvj1tvZde2d1JdTSTM98DUU9
	K031vOcqk7AbgtKasChrHdjmh43FtnVnCt+9gibomS6T0CywknLQCsgMdfckw/xTHLZOwlpAngCIh
	jyw9auBWZV515uldLrp4VARP8XxLDF0Ds4fL+KQVM+1UaoaDJLNf/UZjCr5XMKNrmtPSFfJjvDnZ6
	Z4oLLaQqExJQoXNnZcwMxZIzI7D+idv2+3hvabcUEsFXEvSW80ljIkX461/vhpxhU72Zf/PSGfKdo
	M9bQmL+vM+/eAzsbNPySAaDYWcyY6NQw+b0SSPd+QjEhLFVCFKJPEOkvDNvVmlSqNMQT+dG415ydJ
	Uur/GlYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oVK-00000008Exr-497E;
	Wed, 18 Mar 2026 10:51:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oVE-00000008ExD-2ivX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 10:51:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 065BAC55069;
	Wed, 18 Mar 2026 10:51:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80A896004F;
	Wed, 18 Mar 2026 10:51:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1A64D10450782;
	Wed, 18 Mar 2026 11:51:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773831093; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uaQF8Rk+pj0ruLxQsZHfi0rM4RAp8TegoCfMnyVAwdg=;
	b=YJgF5KS8ujsrm5AiN97YgWQpsPd++BRHIKDOVBY1kjPdT05MK1ww23hofLU2szthf4AFAd
	O585qgmOCVLk0cZNcXFvsIVxezE/jYdilRMSPa3/occ2oMa2oAjiaJH+OtvvabHW3SdcuT
	5/3fMGYWGsld1jfLU7lvpdAA6YaGDyioTSNq70j1tnMRWNW2ukpRwKJsZ6ZYquyGOJDdVD
	oqrkStBLh3OHR6DVh2+CuvJljImul3WgVMSPGiGZyc0BCXSPNh+jFGcVQVGWUNcnLx8JJn
	cYFnpm5gf25x0YwUCQFgfHZTQ6Hv0QACSCk681+wJpxa8pgUOUytQ5dhO5/VzQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: Gabor Juhos <j4g8y7@gmail.com>,  Andrew Lunn <andrew@lunn.ch>,
  Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  linux-arm-kernel@lists.infradead.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: marvell: armada-37xx: drop
 'marvell,usb-misc-reg' from USB host nodes
In-Reply-To: <875x6t5ska.fsf@BLaptop.bootlin.com> (Gregory CLEMENT's message
	of "Wed, 18 Mar 2026 11:40:37 +0100")
References: <20260317-armada-37xx-drop-usb-misc-reg-v2-1-ddff72114414@gmail.com>
	<875x6t5ska.fsf@BLaptop.bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 18 Mar 2026 11:51:31 +0100
Message-ID: <87o6klcswc.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_035153_856362_1ED24CA3 
X-CRM114-Status: GOOD (  17.44  )
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

On 18/03/2026 at 11:40:37 +01, Gregory CLEMENT <gregory.clement@bootlin.com=
> wrote:

> +Miqu=C3=A8l
>
> Hello Gabor,
>
> Thanks it is better,
>
>> The 'marvell,usb-misc-reg' property is present both in the EHCI and
>> in the XHCI USB host device nodes, however it is not documented. Thus
>> 'make dtbs_check' produces warnings like these:
>>
>>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@58000 (marvell,ar=
mada3700-xhci): Unevaluated properties are not allowed ('marvell,usb-misc-r=
eg' was unexpected)
>>           from schema $id: http://devicetree.org/schemas/usb/generic-xhc=
i.yaml
>>   /arch/arm64/boot/dts/marvell/armada-3720-db.dtb: usb@5e000 (marvell,ar=
mada-3700-ehci): Unevaluated properties are not allowed ('marvell,usb-misc-=
reg' was unexpected)
>>           from schema $id: http://devicetree.org/schemas/usb/generic-ehc=
i.yaml
>>
>> Apart from the fact that the properties are not documented, those are
>> not even used by any USB host drivers. Due to this, drop the properties
>> in order to get rid of the warnings.
>>
>> Note:
>>
>> With the same name, there is a property used for the Armada 3700 USB
>> UTMI PHYs of which dt-bindings documentation has been added in commit
>> e60958699afa ("dt-bindings: phy: mvebu-utmi: add UTMI PHY bindings").
>>
>> Additionally, the property is handled by the 'phy-mvebu-a3700-utmi'
>> driver since commit cc8b7a0ae866 ("phy: add A3700 UTMI PHY driver").
>>
>> When the nodes of the UTMI PHYs has been added to the SoC dtsi by
>> commit 05d168a56fae ("arm64: dts: marvell: armada-37xx: declare USB2
>> UTMI PHYs"), the properties has been added to the USB host controller
>> nodes also. According to the commit message this was intentional,
>
> Miquel will confirm that, after speaking with him, it appears to be a
> mistake rather than an intentional act.

Indeed, I believe it is a leftover, the property should have been added
only to the PHY nodes, not the host nodes.

The sentence above should be: s/intentional/unintentional/, the commit
messages clearly states that PHY nodes were targeted, not the
host. Plus, a follow-up commit adds the missing phy properties to the
hosts, so clearly reaching this syscon through the host node directly
does not make sense and was not intended.

Once this single word fixed, you can add my

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for the fix!
Miqu=C3=A8l


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEF9DC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWNBnU32Hax8vzNhlyGLQMM8Dzn78jiOs3g+Xja4Foo=; b=0vo9qZw0aHJ0xBnWax3La5oRQb
	m+WP2YrAf/U3YAKP5evkF+bc56dH5lngDsGq+YKWBjeiG9SrA/UYGPWEsYy7QABEyuZw7Nj8ruSsF
	4Tx+je5+nK7cIHgV2wY8fIjS6Emmyuqv8V3n58/X3/kRwvSOiiKNH/z57g/NZqGKjN73y2rU3sgIH
	B4w44rm6/oyCvQ0bi0AtUGxfInINqOa1gzz2IDPMSLVIi79AQt4gm5g4QQY1CiMUP8UM7AdZZ+B28
	EH3j+wpmu9D86Osx4hMGDfbH1IJxgIcFv3PHto9Jb5OenQp2I/ezqzN03e4X1lJ40NfNbNYDduAmO
	7ofUis4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnN-0000000ADfN-0PIC;
	Wed, 11 Jun 2025 14:51:17 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPImr-00000009d4p-0c2o;
	Wed, 11 Jun 2025 10:34:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1749638014; x=1750242814; i=frank-w@public-files.de;
	bh=cWNBnU32Hax8vzNhlyGLQMM8Dzn78jiOs3g+Xja4Foo=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J1vAcMuQ/X+Huc7X9kuDkee8C60p0s8C+iNRJSTWJigcexmhxeZR8JNQpAXK8j74
	 6eEtC5aNsCYvetLfwSxLk8iEq0RuoNQfyWUD61XTaEidEOltUYnaJx4No9oiobvk3
	 LGPHbgCr/sQcuuNV/8lmr35E+hIv2buDJ7UcuLoSWXiRhAzgCVvbM+Di053aqCmFU
	 Dm/LJhfOwIPEu8N9W4WlUiJd/idW8+kRPrlq5A1qkh4g1qO2+NLqmGTCOfQQEs0iB
	 8GqeOfZgcWFWXqgMGl4qOXL9bG9pfjgjsgkH2sT3NX9oXkxVl2ZL7bjbRvPRGfhcZ
	 I6uJ/0SfRGkecdYVmw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [100.67.37.148] ([100.67.37.148]) by
 trinity-msg-rest-gmx-gmx-live-b647dc579-v9bgf (via HTTP); Wed, 11 Jun 2025
 10:33:34 +0000
MIME-Version: 1.0
Message-ID: <trinity-4ce9e572-1086-4923-86e0-abaa27188e9b-1749638014100@trinity-msg-rest-gmx-gmx-live-b647dc579-v9bgf>
From: Frank Wunderlich <frank-w@public-files.de>
To: angelogioacchino.delregno@collabora.com, linux@fw-web.de,
 myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 djakov@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, matthias.bgg@gmail.com
Cc: jia-wei.chang@mediatek.com, johnson.wang@mediatek.com,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, daniel@makrotopia.org, lorenzo@kernel.org,
 nbd@nbd.name, linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH v3 10/13] arm64: dts: mediatek: mt7988a-bpi-r4: add
 gpio leds
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Jun 2025 10:33:34 +0000
In-Reply-To: <12816e74-9708-4e83-939a-347e1f6f6f5c@collabora.com>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-11-linux@fw-web.de>
 <12816e74-9708-4e83-939a-347e1f6f6f5c@collabora.com>
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:sQJ+G3vx4lQLO/1us4HSSqYa4aIOgh/X4VmH81XkjnSBmWG+StQM2/7wuK/sJavC1Vemp
 cy3QwTSMVgb+5tR8PdzmeWk/mOS4CsVEZJO14TReMlKTUIYcErvBLsnhTC4yJ/EtynNmFkFhWKoQ
 ggSyQirOUOporTs8TszXZgNW33oR024YqW3FPEVcFw83/nNZ9lOolguJRMslHJa/32CsFeiyc0Av
 bqxRCB0ZIiAA39AN8WV4zwR/g2f2w3vEsVK93bSdrXmDHzdQRuowT8UXtwYbl9VC9BOPA6OxVxPj
 9iGRMJQz9Dwsy3/XuEZiJPK+PZUnlVxS2H9R5H91yUmjJS2cFDkdqG5fXFqYML/ymo=
UI-OutboundReport: notjunk:1;M01:P0:H9i8Vf2yInE=;hIoT85gqjXtsSgDflPDbs8/4Swp
 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
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_033429_481108_F9DB9E53 
X-CRM114-Status: GOOD (  13.02  )
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

Hi
> Gesendet: Mittwoch, 11. Juni 2025 um 11:33
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> Betreff: Re: [PATCH v3 10/13] arm64: dts: mediatek: mt7988a-bpi-r4: add =
gpio leds
>
> Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >=20
> > Bananapi R4 has a green and a blue led which can be switched by gpio.
> > Green led is for running state so default on.
> >=20
> > Green led also shares pin with eeprom writeprotect where led off allow=
s
> > writing to eeprom.
>=20
> This is extremely ugly from a hardware perspective and I'm sad to see su=
ch
> a thing here.

i know, but cannot change this...found this out while testing the eeprom..=
.

where uboot allows the writing of eeprom currently without having this pin=
 configured, linux does not and require green-led switch off.

> Though, I don't see any other solution, so I can only give you an advice=
:
> don't ever write to the eeprom from the kernel. Things will eventually g=
o
> south otherwise.
>=20
> I would also advise to add a read-only property to the eeprom node.

the eeprom is empty from factory, but can be used to store e.g. mac-adress=
 which are random by default.

i tested a bit with tlv_eeprom command in uboot and some additional patche=
s to archive this.

imho green-led as running indicator on (=3Dwrite-protect of eeprom) is a g=
ood solution
=3D> readonly by default, but allowing to write it if user is really sure =
:)

> Regardless (and sadly),
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@colla=
bora.com>

Thanks for your opinion and RB

regards Frank


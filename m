Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6AFC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 09:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qAOUbI/BEbZDvaPix7eWz3Zl3lsDI9E9B/i/XFncmrE=; b=BJhvc3x/9i2H48kpLkCjKL5i63
	EItEwtalPJuP2+zmgXI99Ded3goKNRgr8Sf3DXSugD+EVL169wLu5OF6wCAVZIoso5VrY3YUY/rWT
	SBfP+T07CGbyjWUV/sxFvCFKlovEX3JAfmtnUf+VKpN+TwJ4oQi25M1sX7+i3iD3+XLHNro57GhbZ
	m/2EFMMk5Q+e7Y2Wry51PCORHJqmUGuALdHs70eeUOiIHQTMYmTOmvYoZFAfDd387bF0IdEH33Yc+
	uFmZ2Hd9zeku+2EIpRgTpl969bCZnGkA7g8uaF9/nb1L1jGx+sQVKtkkTRTwcRlwawyP1xf1ZZU1p
	TwPMiw+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOXK-00000003sQ8-3H2J;
	Tue, 04 Mar 2025 09:26:02 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpOVj-00000003rmY-32L6;
	Tue, 04 Mar 2025 09:24:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1741080239; x=1741685039; i=frank-w@public-files.de;
	bh=qAOUbI/BEbZDvaPix7eWz3Zl3lsDI9E9B/i/XFncmrE=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=AR4OKWdvdxDkf5DnYJm79Y0Sc4ijHsQWiPWZt9Jxh7CXEcy3rWXJVsRT3FEsY5V1
	 arkL5I0mVS06IXKJzsJ6EL5n7OKgaBfXEQm07zyx8teMKZPBkyv58BVwCX77qkXCQ
	 NDyyNdNY/TzgHHzji5S/hJZJy4mqeoR2iv215vEIaPL1z0imelNWTr4s3+YySLAKZ
	 kMuP8puk2OI5D8aFIvk0WW7eZ7SGGJyQBSygnqxp4jm38b1dnVeejUK4uk2AcXg5v
	 cteS8a02dNP5iJ5E2PNoKFJmYCsDacJJrVdAHcjiOica9LInOsX2vgvIdAP0tAdkb
	 nnngzLRRmEEKWDArhA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [194.15.84.185] ([194.15.84.185]) by
 trinity-msg-rest-gmx-gmx-live-5779db864f-7hl68 (via HTTP); Tue, 4 Mar 2025
 09:23:59 +0000
MIME-Version: 1.0
Message-ID: <trinity-a81b2adf-df25-4888-9490-cc33257061b2-1741080239272@trinity-msg-rest-gmx-gmx-live-5779db864f-7hl68>
From: Frank Wunderlich <frank-w@public-files.de>
To: angelogioacchino.delregno@collabora.com, mikhail.kshevetskiy@iopsys.eu,
 matthias.bgg@gmail.com, daniel@makrotopia.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Aw: Re: [RESEND][PATCH] arm64: dts: mediatek: mt7986: fix pwn fan
 settings for sinovoip bpi-r3 board
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
Importance: normal
References: <20250226050132.547353-1-mikhail.kshevetskiy@iopsys.eu>
 <618b3cdb-0fef-4194-aeb0-4111c011904d@collabora.com>
Date: Tue, 4 Mar 2025 09:23:59 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:KFILJolE/lIPpZ7AIJtQRhRvi++wI/bcQ2lgkUKddOMA3Q7Xb/PEi20XCxNzINqPUzkHm
 r7bRg3aTVEVsMlCFezAHQpCfZIo0rmfInJ2+KshK3/HnsDZVQyToDOfIq7Yg8TUITj56FlSD79uJ
 au2duhPJe/A8BywlmkG/zages3nOVMXUZpRudMTyhvgo9ASG9EMq7pUL7v5YnA7dBXvdqCXeAygt
 hZbvoECRr1DoZaOcqaJQxu8MG07dfNHknBdI7vF/3G+J8lWUMPq46r5DYZ+ogOorGIrIxlfNjHDD
 NE2eaCL+j9qRs6ulzEcIxr0a1XQpGMGixNQ8jBP66Lvlx+cYXMiL3KDNoM8gKzEbI0=
UI-OutboundReport: notjunk:1;M01:P0:AxtGf+C3hYI=;FsXk14KBPKOyZP9J+CXltFfvtq2
 dkwYcHX+hPt9iTQqnJndWDKtrP2/oQun9cOggieklZuBgtwYaKW49tHL+CuHemzdlUDGJVpDu
 vwbfyYwXvWuk653PnMYvro0nqq4iuyzAJrauVKriQoApj6IJzvfEYSe7rJn20docf0vk6vRSa
 Ox6uLXiFB6rd4dW0u32lqFrnSJZMSxrU3a2pZQKniOBP23BhtFUBzHi1+Lx067uHyDSlD1ZsI
 xIJHauw41xHXmRE6e6xJ6Ddowzdm12er5T4+wx45slQjZPXBYwChWpOqwtC9wZSLa/Xj/q03a
 3Ttf8GMDTWZBOz0GIZPMhBhm/yTooJJBnyo/R7DXoj1Gxf0waCuQU6gp8/28gmEanPQl5EkwR
 wGtUPwl2fkJ+Hkr6QewmizRuh7ssrIEfGRZHcFxRYJVPLYzwyK6HwTiW6yaJPyj9vm2544pFv
 zyxbFRqMnW0lj8SjmtOqhyZinC5HQnnrTUcLs8S/piCBg9FyxSVNQwbto+Adg03sQM+5mjf3r
 zKMU2Yi5JdFdH9M+L6JJptDGHZz26P+7Wh5ckfF+EQZ23bfBFtlEqGlDZf73dA5IYSQfhk+Gw
 F0xKm2lMp9U9u2oc5hwtiIeMtbVX2FKM0UbaW87jreVzAljQlCNFCRHJpwNn8c8O+jdkgvp5v
 N80nE+vcDiIMwkXew8goRl999b0yfe3HCy4qZvpG3unhfkINIAv9+X1x6LAn9BgQghSEdbe5P
 EqKVsc35uCYrI/ksr6s1LXj/aTJk8ndZe1g2m78eTc/5k7ORl+SoavD3IWn3GGi984p78vxNT
 +yLpCYBNeab8R+jelpy4Ptnq0iW/v6WptYRSfilS+ucN6+6I+adWjtuE8K/MLt/wH1iG3c9Jo
 T6sIfnmXl4JkTa2kF8ZNVufhUMY1phc2syJBy7xbjvEaslVIPc8HV31jr7M1P/J+27Xh/FDce
 y/6pn/wrrPSdqmputgAQzGAoBajxhAhVW2pjWobo/6jVhRz/ui/3Po6fHi2lTYex3DTq7T9p4
 Y4QW2jnluSWJEJ3pJgjwNGSBn0znCFLWkO3vXtM+ti38NhYuDf5apyjM1d1GtbnVwLUIe8fe3
 x/HoX9uQtV9Yho7DH9h+InsuuEoS8z6SlOAZ5k7q7C8lIiYJXYTIao25kc16kCneD4FLqeGS8
 u16NW7a097nFzsjtWWs8Pyh4XdB+H7iLafDpXOUCimWo213NtkMTsKvl3FRVPVDkLWV9oXfaA
 vdfFMJv3KA12sFRTPLWFeRSD1uElb0l7Bj1wv+kf9f6hnGFBMauN8gk=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_012423_915752_65B2B21A 
X-CRM114-Status: GOOD (  12.65  )
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

> Gesendet: Mittwoch, 26. Februar 2025 um 10:46
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> Betreff: Re: [RESEND][PATCH] arm64: dts: mediatek: mt7986: fix pwn fan s=
ettings for sinovoip bpi-r3 board

> I get that the cheapest fans you can get are not working correctly with =
the current
> mid pwm setting, but you can't break things.
>
> This devicetree should, at this point, hold default values that would ge=
nerally
> make the vast majority of fans to actually spin, because it's impossible=
 to have
> something perfectly (or vaguely, sometimes) optimized for each fan on th=
e market.
>
> Of course this means that you need to properly configure your fans in us=
erspace
> if you want to reach the sweet spot.
>
> I added Frank and Daniel to this thread, as they are the ones who origin=
ally did
> upstream this device.
>
> Frank, Daniel, any suggestion regarding the PWM values here?

Hi,

sorry for delay

i have the fan from sinovoip and that was working for me, but if your fan =
only works with new values, i have no point against this change.

btw. angelo, how is state for my r4-dtsi change?

regards Frank


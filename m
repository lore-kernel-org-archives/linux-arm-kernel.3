Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DFDE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLbbSxJ8rOCZV34Ppdmdr/BcVBls3TYQ0BnZjPUlHaQ=; b=DaMnq8in7mDyUgymDMR2d2I4Om
	jCA1O3UapbVqyOqlCj/eetm7Km5XJmq4mTb4xTxqFmuw7SzoDTBxxZAl1UZqrqkPc3UU0tJtB9RFR
	6qepnnNOphGZId/6Ahx7cSJkLCwXSmY3ZN9TjIpNAVHmRsRw2FMOrfOmveAeCfp1V/FjORuno+qFn
	7zJT+bwmuFNPtOp9qaXfqbO1zeKIPrYUwfSqVmb+2P7B7qZePCIoxs0LLmYAJN/6o/0PeNCDIwras
	rLrwkbbefaeuJBX7QonIgUGZHqwEfRfoTaP7i0tbJMVWEXoGRDNU3z17M3OOWYMn1tDnF81AIQmNf
	oX7PtFFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUOqn-0000000Gkf6-37d3;
	Sun, 05 Jan 2025 11:31:21 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUOpY-0000000GkTT-3fBy;
	Sun, 05 Jan 2025 11:30:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1736076580; x=1736681380; i=frank-w@public-files.de;
	bh=yLbbSxJ8rOCZV34Ppdmdr/BcVBls3TYQ0BnZjPUlHaQ=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=giHzQki8mwpHL1X1Upv9XAD2p7y7qccymTqilRNIKRYCF2r7HH/RgxDfKQH0GtvP
	 Z5Cl1CIPWQoRf5+ahJGDl+GgsBg4BlcTQvnaeiQPkbnF10CTF5clv13vCJpsW46WF
	 +gRxRKAn+eNRuJTDt6R7axU1NQVqBXJL8j3J6ql7BcBDJJ96cAALj4RCoef2HdCGj
	 BwL3kcwfhItF2Fa8y5NU8bdI6NDLH+guPDGuqvomGCC0s1CjKamtWQY7KhYKbVgNr
	 IRWwtzhHKUEHTk80WLjsMCpOJw7wZEjeuLib9zOqQZi5/cOG1C9Cvt776I4r0+Ke/
	 mrE1r81U/K9b+GJKNg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.79.38] ([80.245.79.38]) by
 trinity-msg-rest-gmx-gmx-live-548599f845-nqxpf (via HTTP); Sun, 5 Jan 2025
 11:29:40 +0000
MIME-Version: 1.0
Message-ID: <trinity-80459cab-e571-4699-b3f0-d73a00fe0858-1736076576826@trinity-msg-rest-gmx-gmx-live-548599f845-nqxpf>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux@armlinux.org.uk
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, nbd@nbd.name, john@phrozen.org, sean.wang@mediatek.com,
 Mark-MC.Lee@mediatek.com, lorenzo@kernel.org, andrew@lunn.ch,
 hkallweit1@gmail.com, lynxis@fe80.eu, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, p.zabel@pengutronix.de, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, daniel@makrotopia.org
Subject: Aw: Re: Aw: Re: [RFC PATCH net-next v3 3/8] net: pcs:
 pcs-mtk-lynxi: add platform driver for MT7988
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <Zv_9HuaHqtgIA4Et@shell.armlinux.org.uk>
Importance: normal
References: <cover.1702352117.git.daniel@makrotopia.org>
 <8aa905080bdb6760875d62cb3b2b41258837f80e.1702352117.git.daniel@makrotopia.org>
 <ZXnV/Pk1PYxAm/jS@shell.armlinux.org.uk> <ZcLc7vJ4fPmRyuxn@makrotopia.org>
 <ZiaPHWXU-82QMrMt@makrotopia.org>
 <89bd21ac-78f3-4ee4-9899-83f03169e647@public-files.de>
 <trinity-af6fdd0b-b72c-42a9-bbae-af45c02f539f-1728051457848@3c-app-gmx-bs32>
 <Zv_9HuaHqtgIA4Et@shell.armlinux.org.uk>
Date: Sun, 5 Jan 2025 11:29:40 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:cPQBleyjsF3yVX6DIROFzgJoSZ9+njddCvA1Zg7Q0R7NQ3dqksbmDt8KviNuosx6RZ3R7
 ZmKOd3Nxj7ouB2aML4I7GDumerwX9UpoEH2jmlzOqRGe6hH7yHOlD6OHk8Q/+wvf7PqpwaBjkm0/
 OTvI4KebYTP3IfIxkFVmiFzwAJ724X8J5wmwp7wVttDfaSCIw+Vuhe0R2CxsJQlmmBI+LfzU4VUF
 GTp2GZLQnn3BRGh+pJbUurUUP92izBY7teDFQ5DvC/Ux8hYb2dqx18+y2FAhkWy90nIJb/pjRfgN
 ntMvlyZUag83U3fB2L+QStyIoMPNMzrNgKN3Kd3FB4zuHwHAx2gBK1Zn0WwVtXb7mE=
UI-OutboundReport: notjunk:1;M01:P0:i8+cRb5wjRU=;tWzo9G7VqNUGJNBYvFdykWxunF4
 qcUYRTAgNtkuNzjEZbxWZYdTk2FXK+/bm8WeM+rQ4PvNgb2xROin0VDwLRqA3IcdsdQ6WHqk5
 quD0Bzg1/xxsmCzgQ4V5usPTXEudYQhbZbjofMbHikFi2u5Dn2eunjeeP7OPGX5drWKFHRhQ/
 V0I5egqb/CFj1a3N2iPBcycKJ2S2y8+CRY32m+IAQODjhyJAaEO8eu+3OWoXBllehnQUmYN2A
 WBb+LHQ4OJrAwOxbbXvBy1o8KKo1V9auiPHii+38kOQnZRaNIdOoVaG9ts3aZmR9CRhVQ2FTr
 sHCGuXBtlgter6DQIMYC3mJTCSGuYQQLbbwaobvivJPnV6bk27Sxm7Kwt1IwJjIFIxXTI/CkI
 Z1SGjkIzfN3uYXT9mOgyw6sqJZCECObxtBmnYSxzw6eCqqildFPm0i/PVVjRZQH6nw/ckKBOr
 7w/f4GujwrLbAmLmTP8TFjk+bjLbeH1bCeIdqfwxDfRLsiZBQsyqeC/NlqtdEa7RqRhYBqU9y
 DwEPyFI0y62+Ljqc1nJJtgG8sjBGbKWaRRmu9Gfku0ZRKKGFGbb9SDbM6SqqbvGjjsrbI6xaD
 DoJePLR5fiLfEvncocIrtEnCqi2U08eikELOBwpAbHrtRn+mmPlL5vK9e63hhX/TVhfjU/kXa
 ZgQrAQta2XzbdY62Uj5EowS8zRVwTLnj2cetG5VbHrCjfhSC8J5Jj1Slq/BFqa/vhjPhhgpZP
 ll/EPQm6/XNinwPcLaer24ocz5rC/A8X82hQGmqniM0q63BF0+m2Thws2vLOIb8SvR3R2ID3K
 RMUQevL0/fJOjuKBno0bmq8d4vqygfL7EzRErAZZDI3dDLydUO5ihSX0urwfxH3zYQcrsybTG
 AJheBTIfNPDoMCBhPkB+GWMa4/G05mQgCws8=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_033005_234672_6B393160 
X-CRM114-Status: GOOD (  24.57  )
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

Hi Russel,

> Gesendet: Freitag, 4. Oktober 2024 um 16:35
> Von: "Russell King (Oracle)" <linux@armlinux.org.uk>
> Betreff: Re: Aw: Re: [RFC PATCH net-next v3 3/8] net: pcs: pcs-mtk-lynxi=
: add platform driver for MT7988
>
> Hi Frank,
>
> Sorry, but I've not been able to look at this, and I've completely lost
> all context now. I was diverted onto a high priority work issue for a
> while (was it from April to end of June) so didn't have much time
> available for mainline work. I then had a much needed holiday (three
> weeks) in July. I then had a clear week where I did look at mainline.
> Since then, I've had two cataract operations that have made being on the
> computer somewhat difficult, and it is only recently that I'm
> effectively "back" after what is approximately six months of not having
> a lot of bandwidth. I've seen the cataract consultant this morning, and
> just found out that my optometrist appointment for Tuesday is too soon
> after the cataract operation, and needs to be moved two weeks. The
> optometrist doesn't have availability then, so it's going to be another
> four weeks. FFS... I wish I'd known, then I could've made an
> arrangement with the optometrist months ago for the correct date.

How are you? I hope you're feeling better now....
I see you were more active on the Mailinglist in last time :)

> Now, XPCS has introduced a hack in a similar way to what you're trying
> to do, but I wasn't able to review it, so it went in. We're heading
> towards the situation where every PCS driver is going to have its own
> way to look up a PCS registered as a device. This is not going to scale.
>
> We need something better than this - and at the moment that's all I can
> say because I haven't given it any more thought beyond that so far.

Have you found some time (and were you able) to look a bit into this ([1])=
?

How would be the right way here? Daniel posted generic infrastructure for =
standalone
pcs drivers [2] similar to phy to have a generic base which all drivers ca=
n use and
which can be extended if needed.

There was some discussion about how pcs should handle if the underlaying d=
evice is removed...
unlikely on SoC, but possible on external bus devices like mdio or pcie. I=
mho this could be
a callback in common code handled by vendor driver (query information from=
 mac driver or for
SoC simply return fixed value).

How should the subsystems talk with each other (callbacks, shared memory, =
...)?

DT maintainers want to avoid syscon compatibles which are widely used for =
nodes representing only
a register range that is used from different subsystems. As we are current=
ly upstreaming mt7988
(e.g. ethernet), there are some of these "devices" which currently have no=
 own driver and only
handled by syscon driver to get the regmap. Should we really write differe=
nt drivers with additional
compatibles (duplicate code!) only to handle exchange of the regmap betwee=
n subsystems? For mt7988
which can have up to 7 syscon devices it is maybe better to have substruct=
ures like phy, pcs and so on
packed into an own driver to have a better overview in devicetree. But for=
 some functional blocks
imho it makes not much sense (when really only a regmap has to be exchange=
d between different devices).

Daniel needs an answer to his questions in [1] (and [2]) on how to proceed=
. So please help to get the
pcs-part into the right shape.

regards Frank

[1] https://patchwork.kernel.org/project/netdevbpf/patch/8aa905080bdb67608=
75d62cb3b2b41258837f80e.1702352117.git.daniel@makrotopia.org/
[2] https://patchwork.kernel.org/project/netdevbpf/patch/ba4e359584a6b3bc4=
b3470822c42186d5b0856f9.1721910728.git.daniel@makrotopia.org/


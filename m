Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE354CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 18:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptnqTZTfTELHpPJgP6yR+QIuzZE2vlEB2i6IcDEP+XY=; b=sZYkEVgzX3pSxjwz3Lh3OUG1j+
	oLtKcPUVvYs7Kk+RzQ5YRBOW64yxPEnnEDGYNWN1zUPJKOcGvCbGf0saW2SlbgnL6M8PcyYHFeFQx
	5iPFfMiHGby3YskysgJqIm65djn7hQMkfSpJo0SF/iY68dazFGzr/ZqLFyIO+pJixkgbc7QadK/j3
	SudhbWzLezRVbES7jn2AhNqbQqcmIiy1pzalkkfmpRS+XPLCXxy546iHp+mOsFUI1uDZg3+NyNq3z
	j+ZCwS7O6pA/n/PAxOJ696Ja4WiJ7oIh22TvMyOFVV2eHpLGl9pDvlasbYAjqD5jixnz8vQjzVgVk
	xj/KcaUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo4fl-00000008Mq8-3jBm;
	Mon, 18 Aug 2025 18:33:33 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1ss-00000007vh2-3e34;
	Mon, 18 Aug 2025 15:34:56 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout3.routing.net (Postfix) with ESMTP id 0F9086153E;
	Mon, 18 Aug 2025 15:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1755531289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ptnqTZTfTELHpPJgP6yR+QIuzZE2vlEB2i6IcDEP+XY=;
	b=Hb5C7pVX6XxUvhpqKMnkMEhUIOchbtKcyt5Lyae7Mu/L9Zl3U7GdPPFQG+rLcM105bFOKb
	+mz0NVFQIBlGWoOe4ZLsI0s/ivsFcyjmKWAsVmINiXpOdPKL5PAcfAW0EF+VGZVP2/l7m9
	RmbjhXw6AIghBjpTqEJUqMSz2Ma+2GA=
Received: from [127.0.0.1] (fttx-pool-194.15.86.117.bambit.de [194.15.86.117])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 7F0091005B5;
	Mon, 18 Aug 2025 15:34:47 +0000 (UTC)
Date: Mon, 18 Aug 2025 17:34:49 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 angelogioacchino.delregno@collabora.com
CC: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 djakov@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, arinc.unal@arinc9.com, Landen.Chao@mediatek.com,
 dqfext@gmail.com, sean.wang@mediatek.com, daniel@makrotopia.org,
 lorenzo@kernel.org, nbd@nbd.name, frank-w@public-files.de,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 00/13] further mt7988 devicetree work
User-Agent: K-9 Mail for Android
In-Reply-To: <8A21C091-0C26-4E9F-9B9E-E28A01F71369@fw-web.de>
References: <20250709111147.11843-1-linux@fw-web.de> <175218542224.1682269.17523198222056896163.git-patchwork-notify@kernel.org> <8A21C091-0C26-4E9F-9B9E-E28A01F71369@fw-web.de>
Message-ID: <D12E349E-3AE6-46B3-A5A3-B99BA964A6F0@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 80625685-b893-450e-8532-3c47c92350a6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_083455_074154_FFC5A9C9 
X-CRM114-Status: UNSURE (   8.00  )
X-CRM114-Notice: Please train this message.
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

Am 16=2E August 2025 08:55:51 MESZ schrieb Frank Wunderlich <linux@fw-web=
=2Ede>:
>Am 11=2E Juli 2025 00:10:22 MESZ schrieb patchwork-bot+netdevbpf@kernel=
=2Eorg:
>>Hello:
>>
>>This series was applied to netdev/net-next=2Egit (main)
>>by Jakub Kicinski <kuba@kernel=2Eorg>:
>>
>>On Wed,  9 Jul 2025 13:09:36 +0200 you wrote:
>>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>>=20
>>> This series continues mt7988 devicetree work
>>>=20
>>> - Extend cpu frequency scaling with CCI
>>> - GPIO leds
>>> - Basic network-support (ethernet controller + builtin switch + SFP Ca=
ges)
>>>=20
>>> [=2E=2E=2E]
>>
>>Here is the summary with links:
>>  - [v9,01/13] dt-bindings: net: mediatek,net: update mac subnode patter=
n for mt7988
>>    https://git=2Ekernel=2Eorg/netdev/net-next/c/29712b437339
>>  - [v9,02/13] dt-bindings: net: mediatek,net: allow up to 8 IRQs
>>    https://git=2Ekernel=2Eorg/netdev/net-next/c/356dea0baf4c
>>  - [v9,03/13] dt-bindings: net: mediatek,net: allow irq names
>>    https://git=2Ekernel=2Eorg/netdev/net-next/c/23ac2a71bdbd
>>  - [v9,04/13] dt-bindings: net: mediatek,net: add sram property
>>    https://git=2Ekernel=2Eorg/netdev/net-next/c/c4582a31efd9
>>  - [v9,05/13] dt-bindings: net: dsa: mediatek,mt7530: add dsa-port defi=
nition for mt7988
>>    https://git=2Ekernel=2Eorg/netdev/net-next/c/588cb646ce70
>>  - [v9,06/13] dt-bindings: net: dsa: mediatek,mt7530: add internal mdio=
 bus
>>    https://git=2Ekernel=2Eorg/netdev/net-next/c/66a44adf4c3d
>>  - [v9,07/13] arm64: dts: mediatek: mt7986: add sram node
>>    (no matching commit)
>>  - [v9,08/13] arm64: dts: mediatek: mt7986: add interrupts for RSS and =
interrupt names
>>    (no matching commit)
>>  - [v9,09/13] arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>>    (no matching commit)
>>  - [v9,10/13] arm64: dts: mediatek: mt7988: add switch node
>>    (no matching commit)
>>  - [v9,11/13] arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for eth=
ernet
>>    (no matching commit)
>>  - [v9,12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and l=
ink to gmac
>>    (no matching commit)
>>  - [v9,13/13] arm64: dts: mediatek: mt7988a-bpi-r4: configure switch ph=
ys and leds
>>    (no matching commit)
>>
>>You are awesome, thank you!
>
>Hi
>
>Any comments on the missing DTS parts or can they applied too?
>regards Frank

Hi

Moved mtk maintainers in TO header=2E
regards Frank


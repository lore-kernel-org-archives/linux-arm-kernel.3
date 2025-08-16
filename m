Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB8B6CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 06:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOdNjKyebw/s0rYRUwH2anrLdBAU4WTiR9sWOyp0RzU=; b=aVl7Uk4c+ebHQnUlTN3I6qP8A2
	pqcXXtnzyTAI+tZIslIB+ZK/NIJ8UOpfbAJzeNzkvaL/xBmDzFueoR3u+S5GAOEAP+x5Hm72C2HI2
	stnpt4kXLUMI5IGSupuokfSUE/mPnkxxeU+o6TiKL5+fj78ttK14sV6c6SC6ZknHMRt6wX7JeZG4d
	KPDJw7IU/4S3G13+It/MHFs8ye2uSY72/nttiw6mOyrAlvzmOZPOzokFX83hON5pGgPlcW703VyaX
	wIXouP+A5u+nJU3lhOhkEy6PD7JVL3xtn3E79AhPt+tC5+FTZRG7rF7gGucERFwup/HH7S2j5FjYE
	RE4dtAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unAs8-00000004B8y-04Ob;
	Sat, 16 Aug 2025 06:58:36 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unApZ-00000004AiE-0O5P;
	Sat, 16 Aug 2025 06:55:58 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id 87FCD10078F;
	Sat, 16 Aug 2025 06:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1755327352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cOdNjKyebw/s0rYRUwH2anrLdBAU4WTiR9sWOyp0RzU=;
	b=B90Bbbv3kORkuslteF8M9lfemmr/Ar1i0t3y1qMPZ3aNWD5GMw4AF99Zmf/twP1Z2Xvzxh
	VHoMItSyNhLXYNk6eJP2k+iwn8QLsnvEmMzpau4i7qAkKW02XnkQBDIX7WsMeXFCbyVHbA
	JGT7zABH+1AdtypI/z6yjto4yaFzkLc=
Received: from [IPv6:::1] (unknown [IPv6:2a01:599:a34:a3b8:9076:e76e:6930:1412])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 156781002C7;
	Sat, 16 Aug 2025 06:55:51 +0000 (UTC)
Date: Sat, 16 Aug 2025 08:55:51 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: patchwork-bot+netdevbpf@kernel.org
CC: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 djakov@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew@lunn.ch, olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, johnson.wang@mediatek.com,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, daniel@makrotopia.org, lorenzo@kernel.org,
 nbd@nbd.name, frank-w@public-files.de, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v9 00/13] further mt7988 devicetree work
User-Agent: K-9 Mail for Android
In-Reply-To: <175218542224.1682269.17523198222056896163.git-patchwork-notify@kernel.org>
References: <20250709111147.11843-1-linux@fw-web.de> <175218542224.1682269.17523198222056896163.git-patchwork-notify@kernel.org>
Message-ID: <8A21C091-0C26-4E9F-9B9E-E28A01F71369@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: d7d08745-eee0-42d0-ad9e-cba520e4f9d1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_235557_301078_2D725B11 
X-CRM114-Status: UNSURE (   8.88  )
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

Am 11=2E Juli 2025 00:10:22 MESZ schrieb patchwork-bot+netdevbpf@kernel=2Eo=
rg:
>Hello:
>
>This series was applied to netdev/net-next=2Egit (main)
>by Jakub Kicinski <kuba@kernel=2Eorg>:
>
>On Wed,  9 Jul 2025 13:09:36 +0200 you wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> This series continues mt7988 devicetree work
>>=20
>> - Extend cpu frequency scaling with CCI
>> - GPIO leds
>> - Basic network-support (ethernet controller + builtin switch + SFP Cag=
es)
>>=20
>> [=2E=2E=2E]
>
>Here is the summary with links:
>  - [v9,01/13] dt-bindings: net: mediatek,net: update mac subnode pattern=
 for mt7988
>    https://git=2Ekernel=2Eorg/netdev/net-next/c/29712b437339
>  - [v9,02/13] dt-bindings: net: mediatek,net: allow up to 8 IRQs
>    https://git=2Ekernel=2Eorg/netdev/net-next/c/356dea0baf4c
>  - [v9,03/13] dt-bindings: net: mediatek,net: allow irq names
>    https://git=2Ekernel=2Eorg/netdev/net-next/c/23ac2a71bdbd
>  - [v9,04/13] dt-bindings: net: mediatek,net: add sram property
>    https://git=2Ekernel=2Eorg/netdev/net-next/c/c4582a31efd9
>  - [v9,05/13] dt-bindings: net: dsa: mediatek,mt7530: add dsa-port defin=
ition for mt7988
>    https://git=2Ekernel=2Eorg/netdev/net-next/c/588cb646ce70
>  - [v9,06/13] dt-bindings: net: dsa: mediatek,mt7530: add internal mdio =
bus
>    https://git=2Ekernel=2Eorg/netdev/net-next/c/66a44adf4c3d
>  - [v9,07/13] arm64: dts: mediatek: mt7986: add sram node
>    (no matching commit)
>  - [v9,08/13] arm64: dts: mediatek: mt7986: add interrupts for RSS and i=
nterrupt names
>    (no matching commit)
>  - [v9,09/13] arm64: dts: mediatek: mt7988: add basic ethernet-nodes
>    (no matching commit)
>  - [v9,10/13] arm64: dts: mediatek: mt7988: add switch node
>    (no matching commit)
>  - [v9,11/13] arm64: dts: mediatek: mt7988a-bpi-r4: add aliases for ethe=
rnet
>    (no matching commit)
>  - [v9,12/13] arm64: dts: mediatek: mt7988a-bpi-r4: add sfp cages and li=
nk to gmac
>    (no matching commit)
>  - [v9,13/13] arm64: dts: mediatek: mt7988a-bpi-r4: configure switch phy=
s and leds
>    (no matching commit)
>
>You are awesome, thank you!

Hi

Any comments on the missing DTS parts or can they applied too?
regards Frank


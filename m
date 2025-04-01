Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F890C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 12:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Date:References:In-Reply-To:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=314azYR/JbbY2hCBpsgvAz5tUM2tZbL82gkKcYRBAe8=; b=TzpK4TLdWPdsnUgaCFw7DoPDYg
	UWjOMFxUuTfx7QQoFZH3TxCGCJkph5HjS+8I0sCATDfo+gHXzUv/SkdtHdmUeTTuscJMQpozlZVuq
	DX81uK1erhzcxk4noVCA6aTMCJofXo5PD0QUrpDZ+EWbcYe7guDmmEwsdQqYZGAkS/kqlzQiOY7NI
	inlm62mpd6ffRNnVrzYg53aO1LCwHINaiZpcR61OHi5sqyzlxrKmpLZzwodbvJLucrnbf9+c39xgQ
	e0easfp2hPQaMR/tFEOuz4e9Ayl4iR+4+GYqIN8zacV3a4Oh286EyEmyQ/8NY8KAVVsXM2atam6yN
	YEZ+kJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzb3i-00000003LZE-1HFf;
	Tue, 01 Apr 2025 12:49:38 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzaks-00000003Eih-2h6h;
	Tue, 01 Apr 2025 12:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1743510596; x=1744115396; i=frank-w@public-files.de;
	bh=314azYR/JbbY2hCBpsgvAz5tUM2tZbL82gkKcYRBAe8=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:In-Reply-To:References:Date:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=WRD1dDH1Z5dm1F0PHXxxw2Sv8yzCCwknwAKTtAxE8pVrkW/9qDO3EJZ8uMY6XEbw
	 vnEmXFcevDyKkl5aPAV0KVqrZVT/XlPA8JVAK5TceaD2whZ7JMeMS0m1SZ14xeO4r
	 479h5zikQWkimMt2wXPNjRdqoMI4aWFxaIhYKAGuBKGPw8sld03DPNndC5zykcpcD
	 9CasdZhmqzgB2t4MKeNve9FHpFylPEs8GHlYI5gfc1HE00oJkxYMdaybmU3awNdOB
	 DJm7nrNup4VfFesbvr4aYjQVKc7qLiX3Vz5NJ1IrjqqrTB0wS9xu3crS8D3UnnjYB
	 q1fnUsI3FBE8BBkxfQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.145.244] ([217.61.145.244]) by
 trinity-msg-rest-gmx-gmx-live-5779db864f-w2xpz (via HTTP); Tue, 1 Apr 2025
 12:29:56 +0000
MIME-Version: 1.0
Message-ID: <trinity-c9848e65-6104-4ea3-b983-1fccabff02f0-1743510596556@trinity-msg-rest-gmx-gmx-live-5779db864f-w2xpz>
From: Frank Wunderlich <frank-w@public-files.de>
To: frank-w@public-files.de, angelogioacchino.delregno@collabora.com,
 linux@fw-web.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4: allow hw
 variants of bpi-r4
Content-Type: text/plain; charset=UTF-8
In-Reply-To: <EADAC3BA-3D8C-4E04-B8E3-629CAFF0194F@public-files.de>
Importance: normal
References: <20250207135501.30741-1-linux@fw-web.de>
 <b56a7597-fa39-4e02-b601-db05bfa48472@collabora.com>
 <EADAC3BA-3D8C-4E04-B8E3-629CAFF0194F@public-files.de>
Date: Tue, 1 Apr 2025 12:29:56 +0000
Sensitivity: Normal
X-Priority: 3
X-UI-CLIENT-META-MAIL-DROP: W10=
X-Provags-ID: V03:K1:4VRM3IN2xqwyiroQzv9ZBTrpMY4KOsQ9V3DWJyXUoYyOPpn9RII3pOpQ8u85uf/7D0WBp
 sdDz1c/6lXm0Mt8etJHZXjUgKXPv4qRTwdRqB6W7lJFHbTbhRE8xJQcr/IQiUCPpjyBQDFfc9CqF
 qRUq/4FEnc+5wYuZKR26lrzcs1eyQR+Res7lNP/+o304WX/7tWauwIfnn9s/du8Ry3WkOhAeQJfA
 m3UaOZagAt3DxMwc0VaU2cl6dTjqrJPlc3hNfbi2j23lWAdMmXpXkBy6yKylqEhSNMLAWJE8C+8/
 HseFKlWGaE1mOQesXmzErCcmDZiqEe91vihLKmidEEbjOazuVGA3mRwvmx17YVVh14=
UI-OutboundReport: notjunk:1;M01:P0:rlhv7Yp+WeU=;xTZDCLa+ksK3z2B9knBYio9c8Pq
 07sobUwTamYzYIFwAJ3iPyYjcxyPf5Zi7BBgyO8L8mRmDq5U28oXLufMXfEpSMlU+URjUJnCY
 x4FImp7+HIwQIiMMGDR1/oGk5k2nIMtqQiEuqBUo8VYM02qAdp8JRSmdFNwtM+qLEOM+6g5be
 HAFM27yJVvnPc5LBr88irXUhMRT1EpTfW8L+YswIGuAj32r2LT+DZB6znweAVRCtovyN5qwEW
 tJo1HjhX3RB6VEpc//B53W52yQJEH8vQMQY/NspwWorcobDM6GJOp9cs5Ot0Sgg0i5ErSV4d9
 SIfvEGpXYq8gVAHNBshuqo0TA0bHSq4AFUZLYyoCBEzO4dyWHLPCHyZdCmlAQnMR8LDXNQtqm
 KbjFIGzvYSDr8kpUol3TzlSO+fry3n+TPesUtduIpFZa2s1mXrKDykZwjWJJ4L8/JWz5Yhcbi
 Gp2dZ90ard2h0CCcRRCni6yPqXQQALvnD1AUI4aL0ZcuZMyrOoRMBLr5xyYDH4m2zckh5yoZn
 tB3trSWBVOE4pluRhmdvAVMWVe/Sh2j/v2/FN4F2obPCPHkIhK2jx5m8ea7E0XveXECxBV//c
 qBnUWF2ykKnWt1bYFLHsD3VsN1HZePXjSxL5//xf4+vGFL/ufjACPlFDHoKqdwfCcf2E2Tl3H
 lb//03NSqSllY8UlHsn4NflztrEuoDQGqabIZfNiJ+7LXzkel+yzWMmUD+eY4haRiYCFJk0f+
 BobBWeUTNw1cFz3z8sapWrzw8dNg3eZApKhQOw3owdNlYIjkA9pFaw6t0vEIIqe5dPu6UyPSy
 oOxhVmWJAZV6QtRc0Du6qlbqfQb0hxdVDByRa1/2Xpdm5Be+kNAwBVEv4sAo0HZU3tiDuyPaT
 e8mYIXIVta0hkz45tMotFvkf1V7m67tnrtiCdPDg1NQ3Y8BtbD9DAPDUTDqDMRCbfO5PFajv4
 9+6Z+oYZCmJ1HqEnmcM7qJwTkLIYU1eoD5XTWdwMdzieWm4Y905k7nAEtahlTXyjmthZG0K0c
 95gS0Z4XNoxZxSRse2pUcCib1nbl7X2anuhRtx9CXWmpo/vIJI4gr+DQZKad6bHkFUrF7qmRl
 8Zyj6dni5mwxTooWo1RRLUUF8d6y1EtP7Lk+kJ7GNLNYPURcfOpX7HpZVxhP5ITFYT3ZQmF3j
 wsVFi6rJeuIoyb0IW0R6AdOQhQgG+tNZe9DO10FeZRgDez3EYQua8oPN8Xmenb60AETce+MNn
 nbGlmMoLizsTsZDDstRIJacXZuIgbJQNlZw5N4Dmw5tIbpdpjjoX6TU=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_053010_998078_3873B53E 
X-CRM114-Status: GOOD (  18.10  )
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

how to proceed here?

> Gesendet: Montag, 10. Februar 2025 um 12:18
> Von: "Frank Wunderlich" <frank-w@public-files.de>
>
> Am 10. Februar 2025 11:56:40 MEZ schrieb AngeloGioacchino Del Regno <ang=
elogioacchino.delregno@collabora.com>:
> >Il 07/02/25 14:54, Frank Wunderlich ha scritto:
> >> From: Frank Wunderlich <frank-w@public-files.de>
> >>
> >> Sinovoip has released other variants of Bananapi-R4 board.
> >> The known changes affecting only the LAN SFP+ slot which is replaced
> >> by a 2.5G phy with optional PoE.
> >>
> >> As the SFP-Ports are not upstreamed yet this patch simply renames the
> >> current board dts to dtsi, creating new dts for the board including
> >> the new dtsi and move i2c-mux channel for sfp lan to board dts.
> >>
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> >
> >I understand what's going on, and I agree, but this change alone doesn'=
t make a lot
> >of sense, does it?
> >
> >If I were to see a commit that moves everything in a dtsi, and justifie=
s that by
> >adding two dts for the two variants, though, things would be different.=
... :-)

what is the difference to this commit (imho it does basicly the same for o=
ther SoC)?

73955991b8fb 2025-02-06 arm64: dts: mediatek: mt8390-genio-700-evk: Move c=
ommon parts to dtsi
arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts
arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi

> >> ---
> >>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dts  | 404 +--------------=
---
> >>   .../dts/mediatek/mt7988a-bananapi-bpi-r4.dtsi | 403 +++++++++++++++=
++
> >>   2 files changed, 407 insertions(+), 400 deletions(-)
> >>   create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bp=
i-r4.dtsi
> >>
>
> It is preparation for adding additional nodes like sfp cages. I only hav=
e the dual-sfp board so i can only add these based on schematic. The one (=
wan-sfp) would go into dtsi and lan-sfp go into dts because other variants=
 using a phy here as described.

regards Frank


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFEB1C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Jul 2025 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SFHjmBfONw4toFYpDQyyxLKf2g6u6KINpULYTGLZT3Y=; b=NCozRsZdqczzoNE/vsQCtattcX
	HFyXmonR7VJDtyQi1D+UVSzsXtcPjsMmWPo0RfG0yIcvZsae7bMJuV/GQTliseIQl0ZXway6jGsI/
	XsiOJBLlUit7/uJm5mP6eJwvSUabJN3WmGA591mFbCzsm1Ubb+YQvUg9jWRyEQLEN1pOM9tGoiVOJ
	sPutKmceW2GFNXZc8o1F9Ejw2njq0+iIgm8L2TOM024J2mLDlRCRAlKQh3JHbK2Oc81J4eJqDx+Hs
	y0OQ7FkwjwhMb49bQwWuG0gW30vPeC83LoFTpa2vvuaRLo5dw5SAv8o5yMKkkZcn3itBTo1VrP8zM
	U5E/VX0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh49F-00000001Ev0-0fqT;
	Wed, 30 Jul 2025 10:35:01 +0000
Received: from ni.piap.pl ([195.187.100.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh44t-00000001EXe-18X8;
	Wed, 30 Jul 2025 10:30:33 +0000
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
	by ni.piap.pl (Postfix) with ESMTPS id 2C134C3EEAC9;
	Wed, 30 Jul 2025 12:30:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 2C134C3EEAC9
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,  Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,  Heiko Stuebner <heiko@sntech.de>,
  Paul Elder <paul.elder@ideasonboard.com>,  Jacopo Mondi
 <jacopo.mondi@ideasonboard.com>,  Ondrej Jirman <megi@xff.cz>,
  linux-media@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: FYI: i.MX8MP ISP (RKISP1) MI registers corruption
In-Reply-To: <175344176070.2811177.10693943493658922992@localhost> (Stefan
	Klug's message of "Fri, 25 Jul 2025 13:09:20 +0200")
References: <m3h5zbxkc6.fsf@t19.piap.pl> <m38qknx939.fsf@t19.piap.pl>
	<175308758352.3134829.9472501038683860006@localhost>
	<m31pq9y98z.fsf@t19.piap.pl>
	<175326599663.2811177.16620980968274114885@localhost>
	<m3h5z2vw12.fsf@t19.piap.pl>
	<175344176070.2811177.10693943493658922992@localhost>
Date: Wed, 30 Jul 2025 12:30:23 +0200
Message-ID: <m3qzxyug1s.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_033031_468368_AAE7A2FF 
X-CRM114-Status: GOOD (  10.07  )
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

Hi,

still investigating the problem, but I can't see a simple way to work
around it.

It happens with the second ISP only, so the single camera setups (using
isp0) are immune.

The ISP MI (memory interface) register read operations are not
a problem, the workaround uses LDP instructions (for registers located
at addresses not on 32-byte boundary) or read multiple times and return
the most frequent result (fortunately the MI reads have no side
effects).

The writes are a problem, though. Especially writing to
RKISP1_CIF_MI_ICR register (address 0x32E21504) can (and does) corrupt
other MI registers, like RKISP1_CIF_MI_CTRL (0x32E21400):

Camera apps just started:
32E21400:   7A2001       20 3C180000   1FA400
32E21410:        0        0        0 3C200000
32E21420:    FD200        0        0        0
32E21470:        0    10001 3C0C0000   1FA400
32E21480:        0        0 3C140000    FD200
32E214F0:        0        0        1       3C
32E21540:        0        0        0  2000000
32E21550:      780        0        0        1
32E21560:        0      780      438   1FA400
32E21570:        0 1E1E00EF 1E2200E0        0

Video stream halted:
32E21400:  1000007       20 3C240000   1FA400
32E21410:        0        0        0 3C2C0000
32E21420:    FD200        0        0        0
32E21470:        0        0 3C0C0000   1FA400
32E21480:        0        0 3C140000    FD200
32E21490:    7E900        0        0        0
32E214F0:        0        0        1       7C
32E21500:        0        0        0        7
32E21540:        0        0        0  2000000
32E21550:      780        0        0        1
32E21560:        0      780      438   1FA400
32E21570:        0 1E060000 1E0A0000       77

Note that e.g. the 0x32E21400 register, MI_CTRL, has changed value from
the valid one (0x7A2001) to 0x1000007, which probably originated in
MI_MIS (and was to be written to MI_ICR).


It appears the problems are not constant, they manifest themselves in
maybe 10% of system boots. Once a system boots, the problems are either
present (and don't go away) or not.

It appears the ISP uses 3 clocks (+2 used by CSI receiver) - dump of
their CCM registers (Clock Control Module, IMX8MPRM page 227 and so on):
MEDIA_ISP           EN mux 7       post 0 SYSTEM_PLL2_DIV2 =3D 500 MHz
MEDIA_AXI           EN mux 1 pre 1 post 0 SYSTEM_PLL2_CLK / 2 =3D 500 MHz
MEDIA_APB           EN mux 2 pre 3 post 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
MEDIA_MIPI_PHY1_REF EN mux 0 pre 0 post 0 24M_REF_CLK =3D 24 MHz
MEDIA_CAM2_PIX      EN mux 2 pre 0 post 0 SYSTEM_PLL2_DIV4 =3D 250 MHz

Now, it appears that in certain cases changing the MEDIA_APB
(MEDIA_APB_CLOCK_ROOT) "fixes" the problem (for current boot only), or
make it less (or more) visible. I'm changing the POST divider in
CCM_POST_ROOT21_SET register directly (the MEDIA_APB frequency is then
100 MHz):

0x30388A80 MEDIA_APB EN mux 2 pre 3 post 0 SYSTEM_PLL1_CLK / 4 =3D 200 MHz
# devmem write32 0x30388AA4 1
0x30388A80 MEDIA_APB EN mux 2 pre 3 post 1 SYSTEM_PLL1_CLK / 8 =3D 100 MHz

Examples - bad read counts from register 0x32E21400 (mi_ctrl)
per 10 millions of read operations:
POST=3D0 (default)  with POST=3D1
945               1
1448              2361
1088              2419
1842              2451
1333              0
67                5
2033              0
1                 8
13                16
2                 4
7                 0
1                 0
539               0
2605              0
1                 0
1723              1

I'm starting to run out of ideas.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa


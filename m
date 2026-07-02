Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F85C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 05:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ue1H+BLKABoDe6VgVMvCvutxW1pO9iEMPAXKG6w2LFY=; b=wWEKbHMas0zuRf0OCgX0MVHAP0
	EaEq6Jd+APT7G29IH8oPD5QBDnywPZHPeg5yXyfE5NOEYXNOtWJFPNXdDPH3OyFffYO61z6bzSd0I
	rAF4mvNhU2lJSnzbnyAO3Yo44vWX0bYxk9DDbBz82q+sbcRyjDgFqviqFFf+BvpuSjUcfiosChE76
	g7C1CXpENdCxzFgLUiIkJT9Gm/7TSv26BlcsBVl4itO8xrRuqFFJNH9hCb4E5wTt6l6bulzdCUuqJ
	mCLvw/gnmEIQwieI3jFmICb8tIbwcRv+q6SfMQI4dRieJ9f4Now+Ihvq9FHL0jXxM6SMXV2HsTghk
	lg9B2pxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfARZ-00000003cDs-1uxr;
	Thu, 02 Jul 2026 05:58:37 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfARW-00000003cDL-2XXS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 05:58:36 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 823581400126;
	Thu,  2 Jul 2026 01:58:33 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 02 Jul 2026 01:58:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782971913;
	 x=1783058313; bh=Ue1H+BLKABoDe6VgVMvCvutxW1pO9iEMPAXKG6w2LFY=; b=
	IsSAlRAoPWzxOp4lYzdo3kXlOeu4lEvriWXOpdguUUntYTNnZXpC2kJYb3qysfbW
	7Y0kgg8SbP2/0DXDM1/VDP6Qzx/XwJIQgWU04int70pTvfYhluHP81ogJH/XS2rV
	7Vtra7mFxQJGW1nhMn0Qx7cbf2bt0pO9INcWDYB2SSVJxy7Rz2UvCFVzpAILOc1h
	xIxz5YwMhXKRQEtOeF2AETy3Sh9wyiKmQcftlr/k5gWv08EIaAHSZX4gV0UFe/su
	a/yjZM2F24eeidQK45aWbcAEdtPCCupBTy+ik1KaIpMVJzMVybTtZlof0eFYyXxu
	WWGq0LGB8bbrVZP6BapKfw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1782971913; x=
	1783058313; bh=Ue1H+BLKABoDe6VgVMvCvutxW1pO9iEMPAXKG6w2LFY=; b=c
	lmrcCHCGAVgpmJ3/F/mhLmN8esOt4x4I0Ol9Ll6bp0b3bY9A/V4Rb1SNG8zl8CQ0
	DFXsmO+YFRAtVJrx7yBlKoG9al/5RCqRCO4wFzjSV4n+wHfRgqIwLa2kEGHwJlsC
	BQV+UfBeEKsfSiZN1onrx9BPj4BgrPIbHIA8IRPg8W0UKbJ1m6giPnYzcdUInu6D
	IAPILeEzPM/wDJgA0V5soN42etPuK1EUamQaa2eNgP9wT8E9xJlkcsnBX19iDIrF
	I7vfSDvubfaOSkX7zuMCB5NYSO2HR/CzzbKq46uyrXQucoXbIsUUEQ3p/L8xvLn+
	SxWOwff1K+shsGaRM4tkw==
X-ME-Sender: <xms:CP5FavGcjw5DqePI1HLPieIrg_oPiUkccK7lyATs556nPMJ1Sp6izQ>
    <xme:CP5FanIs4cFcNX4v_hHbfT8E1rTNg1Sq5_oCCL2eSvjqTYnKMBjt_v4YX6vTBHlFT
    UkvzYPL6fedOfFvMcGQqPW9k_YsIm0DshXkYbpRPt6OySmAw3ZSS5Q>
X-ME-Proxy-Cause: dmFkZTGVwzJwf+aSbOjo8k3zWUarJE5bsc3Q9Mww5DaenVDShKu+fD/ai1CSh6mTrMwp3y
    dZdOE0xPD68AyAwLB9wLG/c1kbnLMxrrI4Ix4qIVDC4LxJwDeaaODIVBhEI0wQOkBCHziw
    lP3hst6lAf9YF6/HFQI4KwoBiu3Sh0vFagoaDjzyDkaxZp6K5rgEeB/WXtL65ZI6+V5YSt
    PzFCPhgvtHZfTmzBt3Utz/yeRH3y4K9KS0RKJLb5piPdi+Kp5YTqGeIJTXReEMnxv4f1Cl
    U5cRINA6ripo8mhUlVZ7QPGRBgcQPyAIcjDdlER1v7R6RGQGd/hwbOzNaPngZ1ZPHFOvho
    GDYYEcK+MYWl3sySszi+IJXMzyBeao9TxEKDAlIuRLitZb5MbfzHxxf602mXCdjoi72s0u
    LSvG782pokJBNtj3z+qpY9jdM6IKojHwpWLKB7Lo+ljLShYlf9luCevnIJWMfyTY3kcicO
    X5zqBmAMcdK3uqEkl9nNfXMuqkC6cBPCN8Iy26dlpfqtUDkhzotT73C7ZOJqVwVShWK59v
    /pGJzNw9EO0/HrpmjA6HiAM71L4OZ/6E3OtQvLm5X1jWNxJnjD23zKTfo1cvgF0bTMgaqV
    mtdBo3UYhBHQH9zXfn+4WIlr0kwSPUoQb3m5H2hgAcIiw2RhUxcNUUQXlXcg
X-ME-Proxy: <xmx:CP5FarAeXDXQlBLWA9viihqHqjGa9XbsAW-slfzvXXe7ZygvHCJB3Q>
    <xmx:CP5FaoCml1dCeyub3RvzLYgo9mIzzIalXGDrTqMxwV_XIlyT_WWk4g>
    <xmx:CP5FapyFJWizbSucEzSqMpoKwcy4x8kczeEf9HtY98EQFVEHaeGATg>
    <xmx:CP5FanygNMD4rjqqBGq6ljc5A0GVhCcl54WMX4wRxTy-lktwLfDGaw>
    <xmx:Cf5Far3kQTlxjYJJ8xt8t7wS-Nw3JiHQbMxh6lAEYbkd--W_d1DF0vvI>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 74945182007E; Thu,  2 Jul 2026 01:58:32 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A1B0ZmlIHSuo
Date: Thu, 02 Jul 2026 07:57:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-kernel@vger.kernel.org, "Aaro Koskinen" <aaro.koskinen@iki.fi>,
 "A. Sverdlin" <alexander.sverdlin@siemens.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
 "Andrew Lunn" <andrew@lunn.ch>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Daniel Mack" <daniel@zonque.org>, "Frank Li" <Frank.Li@nxp.com>,
 "Gregory Clement" <gregory.clement@bootlin.com>,
 "Haojian Zhuang" <haojian.zhuang@gmail.com>,
 "Jeremy J. Peper" <jeremy@jeremypeper.com>,
 "Kristoffer Ericson" <kristoffer.ericson@gmail.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Linus Walleij" <linusw@kernel.org>, "Mark Brown" <broonie@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Mike Rapoport" <rppt@kernel.org>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Patrice Chotard" <patrice.chotard@foss.st.com>,
 "Ralph Siemsen" <ralph.siemsen@linaro.org>,
 "Robert Jarzmik" <robert.jarzmik@free.fr>,
 "Russell King" <linux@armlinux.org.uk>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
 "Stefan Agner" <stefan@agner.ch>,
 "Stefan Wiehler" <stefan.wiehler@nokia.com>,
 "Tony Lindgren" <tony@atomide.com>, "Vladimir Zapolskiy" <vz@mleia.com>,
 "Will Deacon" <will@kernel.org>,
 "Andre Przywara" <andre.przywara@arm.com>
Message-Id: <b4bb0dbf-50ad-4678-aa5c-0c6f457c09f0@app.fastmail.com>
In-Reply-To: <CADkSEUhWe9aLuM7AURDKjMkrpEKOog9X59fWuZXvUVjkT9BuBw@mail.gmail.com>
References: <20260701212353.2196041-1-arnd@kernel.org>
 <20260701212353.2196041-19-arnd@kernel.org>
 <CADkSEUhWe9aLuM7AURDKjMkrpEKOog9X59fWuZXvUVjkT9BuBw@mail.gmail.com>
Subject: Re: [PATCH v2 18/19] ARM: mark axxia platform as deprecated
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_225834_716541_4C2707A6 
X-CRM114-Status: GOOD (  20.99  )
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

On Thu, Jul 2, 2026, at 00:41, Ethan Nelson-Moore wrote:
> Hi, Arnd,
>
> On Wed, Jul 1, 2026 at 2:26=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>
> All of these patches have this line at the beginning but were sent
> from your kernel.org email - did something go wrong with git
> send-email?

I should fix this, but it's been like this for a while after
I had patch emails get rejected too much for coming from my
arndb.de domain.

>>  config ARCH_AXXIA
>> -       bool "LSI Axxia platforms"
>> +       bool "LSI Axxia platforms (DEPRECATED)"
>>         depends on ARCH_MULTI_V7 && ARM_LPAE
>
> The dependency on LPAE reminded me of two other 32-bit ARM platforms
> with lots of memory: Calxeda Midway and Highbank. Is anyone still
> using those? Maybe they could be removed, since people seem to want to
> remove highmem:
> https://lwn.net/Articles/813201/
> https://static.linaro.org/connect/lvc20/presentations/LVC20-106-0.pdf

Andre Przywara used to use those for testing, I don't think anyone
else has powered them on for a while, see

https://lore.kernel.org/all/9723b5df-e218-1ea9-e8eb-9e781b23af49@arm.com/

If it gets in the way, or Andre gets tired of maintaining it,
we can remove it, until then I would keep it. Axxia is different
because it's neither maintained nor functional.

There are a few more platforms that need highmem for the time
being:

 - TI keystone2 has users and is well maintained, so this will
   stay as long as we can justify holding up highmem removal
   for it. This one has a unique way of dealing with coherent
   DMA that requires LPAE and possibly highmem.

 - Renesas R-Car M1 need lpae support for (IIRC) >1GB
   configurations, and I have a prototype patch
   to make that one work with a modified virt_to_phys()
   implementation.

 - Amazon/Annapurna Alpine is similar to Axxia in the=20
   current state of upstream support, but has someone
   working on an OpenWRT port using the downstream
   patches. The OpenWRT supported devices all have 2GB
   or less.

A few others need highmem for large memory configs
with more than 2GB of RAM but would stay working for
the common configurations with 2GB or less, using
CONFIG_VMSPLIT_2G_OPT.

     Arnd


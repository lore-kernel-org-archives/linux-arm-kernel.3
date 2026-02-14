Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EA8EF48C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 10:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnRP19hiGW2EOW6F6Xb4s8Mr1BOvl4pRlTPUo+1yLhk=; b=GHSW1Ov8AsIvAE/vNRggmaD/b0
	kjvmOeDg2ryi560K0o5qUUHasI+owF1nobbLeYe7fBn7gsBRy8zjxJ9y0UruviKfvRT77EV/fswBC
	gpMEGxcrSbjfvUwfEE6FqCWj5Mosnwcqeez7F0Lxsdav3BfwSxCI/EHxmdukENw3t/FGikg3UZXgY
	8Hawqi7z+zdsj2AzhTbxFeNpxwKkt9rnK+m6LrXh0ycqfcQpvC86jmddckr/3pt1qHbmTJrPuRx3I
	anJf7YLHxwAhesw+xUlCcOQLuf35lBw1GOQtLNDKCQR6P02lcTXy2JHJn8iOknAaBj72Z4fIC3xTc
	lWJhp7dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrCj2-00000004SOB-1BBw;
	Sat, 14 Feb 2026 10:18:08 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrCiz-00000004SNR-0AGl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 10:18:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1771064284;
 bh=UnRP19hiGW2EOW6F6Xb4s8Mr1BOvl4pRlTPUo+1yLhk=;
 b=OzAfW2r3K459QwSfKdrdrZkKFlUuFUwxMG1mTUzodWcFmn1t/FVDAWAhRYjdECei+lMX3AaJM
 ++37EaU+bNjpiebj0ZksEnp+YY+IVRi1fkcI8XjktOuZiSImt6GRCBLrtwbnJUGLJHF5qPKKiWm
 YH9PiOIvvBvqjjzvkRLTUqQBuyQUs1ZlfhF9hUut/65pQ/Hjf0j2XEJ6MRdEFrCZ54BmMUHDRcL
 cldgs9hbVTK3gBTktILJecKM+RL9Z7d/la5NX74LgvF+4fcepdL/6Hqz2q1krZ1gSsXTDBxzzAJ
 LYZ0gc/mzIHy3ftyJn4a5S4FYJ7DUCGF9LR6o8DZYkfg==
X-Forward-Email-ID: 69904bd531a6a6d7c5f99d43
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <64285bcf-7cbe-4732-bd45-44797846be23@kwiboo.se>
Date: Sat, 14 Feb 2026 11:17:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] ARM: dts: rockchip: Add Onion Omega4 Evaluation
 Board
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
References: <20260210144845.317048-1-festevam@gmail.com>
 <20260210144845.317048-4-festevam@gmail.com>
 <a8c1bac7-9f67-4476-81ad-5271ff239b91@kwiboo.se>
 <CAOMZO5DJGQVOL4D4WWopduodedExMG-O65E1AzdXDQDWMP8A1Q@mail.gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <CAOMZO5DJGQVOL4D4WWopduodedExMG-O65E1AzdXDQDWMP8A1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_021805_391786_8C4DEA14 
X-CRM114-Status: GOOD (  13.22  )
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

Hi Fabio,

On 2/11/2026 12:03 PM, Fabio Estevam wrote:
> Hi Jonas,
> 
> On Tue, Feb 10, 2026 at 1:53 PM Jonas Karlman <jonas@kwiboo.se> wrote:
> 
>> nit: Is rv1103b needed in all three compatible strings? The last one is
>> already pointing out that this is the rv1103b soc, also the other Onion
>> Omega boards in-tree use onion,omega and onion,omega2+.
> 
> All the boards inside arch/arm/boot/dts/rockchip/Makefile start with
> the SoC name, so I prefer to be consistent.

I do not follow, the .dts-filename typically do not fully follow the
topmost compatible for the board on Rockchip platform.

The typical convention for Rockchip platform is:

 compatible: "<vendor>,<board model>[-<revision>]",
             ["<vendor>,<som model>",]
             "rockchip,<soc>"

and the filename is typically:

 board dts: <soc>-[<vendor>-]<board model>[-<revision>].dts
 som dtsi:  <soc>-[<vendor>-]<som model>.dtsi
 soc dtsi:  <soc>.dtsi

The board model typically only include <soc> if there are multiple
versions/revisions sharing same/similar model name.

And in mainline U-Boot we try to follow this convention for Rockchip
defconfig naming:

 defconfig: [<vendor>-]<board model>-<soc>_defconfig

So my question remains, why do the soc (rv1103b) name need to be
repeated in all compatible parts? Is there expected to be another Onion
Omega4 version/revision using a different Rockchip SoC?

And if that is the case, then probably only the SOM part would need
the soc part, not the topmost part of the compatible.

Regards,
Jonas

> I have addressed all of the other feedback you gave me and sent a v4.
> 
> Thanks



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BF4C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jul 2026 09:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwSOPRwPe16md58gxuRwvnrh/zOt3EcNn/2KFaD5eL4=; b=Aw0nIpIN9ZRYMK9m0DzZQebclX
	bgmbu6BAGTf1KxzSoyRvW0reWVZSqZNJpfYrhKqJthGbmoPgLjf27Dv+j1B9Ym+S/DmEcqea8DHi5
	x1uCLBTfP0HU/qgJd6r3NqqxzjiGKL6OnojGRyAXAlirwDF0TmZl9fxEW6DerYwkN955yojbCyoEm
	RYXyEwx96hg62EK/ssuQmIfV60R7wb+suEnfph+mQLzohr4EeZ8qU8KBRddg7Z53CTJUBSmIomSUk
	izVGXsGbBfUPfhJzz2JLdejgw6Y3Dc9uJptMp1S2y/P38nJdFVP7WU+KcJbfAqHeiNr4ceo0Y2SOI
	ceQW3tOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfx5N-00000008Ksd-24cD;
	Sat, 04 Jul 2026 09:54:57 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfx5L-00000008Krg-1x5i
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Jul 2026 09:54:56 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1783158883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gwSOPRwPe16md58gxuRwvnrh/zOt3EcNn/2KFaD5eL4=;
	b=Kas5S/+E5faZ6tGsC3Od6zFmgPLB0QI5dwtnD9T+vrUTRkUxkwYhbQX09vex7b+YyLFpso
	DCLLST39THRf9qOm/obiooOuvpjt15Nh7bjLPsWaU5YIB/ZfS+5SyuYWGxvHGC7LgoGfG6
	t+tpHKTDTc14LXDhr2HqkVKUW9v6YHYjhTMaGyGVDXIjuHqAXxg3K5SM7d4BcUFUXfVMA8
	bA4+/yA/oEYLPdJRDOcIMeVAxOG4ZssKcQH4q0sxvvEQ4eXvUtb5l+YmnTR39o4cnFD7xz
	WQYmrM7B0zG345JVEKb4D1zPKr+JufARpjpcvprEfbweF2HqmF6gmR1eESoT/g==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Jul 2026 11:54:36 +0200
Message-Id: <DJPP2F4YRQGN.1CR6HUGTXDYKK@cknow-tech.com>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Heiko
 Stuebner" <heiko@sntech.de>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>
Subject: Re: [PATCH 00/12] arm64: dts: rockchip: Add NanoPi M6 board
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Joachim Eastwood" <joachim.eastwood@gmail.com>, "Diederik de Haas"
 <diederik@cknow-tech.com>
References: <20260703-nanopi-m6-v1-0-8344a1559519@gmail.com>
 <DJOWHH5K7P76.3JPJVO47K1SZE@cknow-tech.com>
 <CAPSPb=tZ1FenNfEM5P+DWcksKvpQjyQQjAWTRdyxb7=YYxY_rw@mail.gmail.com>
In-Reply-To: <CAPSPb=tZ1FenNfEM5P+DWcksKvpQjyQQjAWTRdyxb7=YYxY_rw@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260704_025455_674653_80FEF61F 
X-CRM114-Status: GOOD (  23.64  )
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

Hi Joachim,

On Fri Jul 3, 2026 at 10:23 PM CEST, Joachim Eastwood wrote:
> On Fri, 3 Jul 2026 at 13:30, Diederik de Haas <diederik@cknow-tech.com> w=
rote:
>> On Fri Jul 3, 2026 at 12:07 AM CEST, Joachim Eastwood via B4 Relay wrote=
:
>> > This patch series add support for the NanoPi M6. This board is very
>> > similar to the NanoPi R6C and R6S boards which are already supported.
>> >
>> > Main differences:
>> > * M.2 M-key slot with PCIe (Also present on R6C)
>> > * M.2 E-key slot with PCIe and USB (from hub)
>> > * 1 additional USB 2.0 port from an on-board USB hub
>> > * RT5616 audio CODEC
>>
>> This seems to be the M6 (2405 aka 'V1')?
> Yes, correct. This patch set is for the original M6 board. V1 if you like=
.
>
>> Because there is now also a M6V2 (2603), which uses an ES8389 CODEC:
>> https://www.friendlyelec.com/index.php?route=3Dproduct/product&path=3D69=
&product_id=3D319
> I did notice there was a new version, but I hadn't given it much thought.
>
>> Is it useful to already take the 2 M6 variants into account with this pa=
tch set?
> Yes, I think you are right.
>
> How about this setup:
> rk3588s-nanopi-m6.dtsi
> rk3588s-nanopi-m6v1.dts
> rk3588s-nanopi-m6v2.dts
> This mimics the setup for the R6 series boards with rk3588s-nanopi-r6.dts=
i
> and rk3588s-nanopi-r6[cs].dts.

Seems fine. You could drop the 'v1' as I only used that to differentiate wi=
th
the V2. OTOH, I'm always 'struggling' how to identify the original NanoPC-T=
6.
I do like consistency, so mimicing the setup for R6 is nice :-)

> Note that I will not make the v2 board part of this patchset since I
> am unable to test it. But as you said we can take it into account now.

Agreed. My concern was about trying to prevent another complete reorganizat=
ion
once someone decides to upstream support for V2 (2603).

>> https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6#Schematic.2C_PCB_=
CAD_File
>> https://wiki.friendlyelec.com/wiki/index.php/NanoPi_M6V2#Schematic.2C_PC=
B_CAD_File
> I did a quick comparison of the schematics and noticed the following
> differences:
> * New CODEC; ES8389
> * A new "User" button connected to a gpio line.
> * Different USB 2.0 hub: CH334P (may not be relevant for DT)
> * Different USB PD power solution (not relevant for DT)

At the end of the M6V2 product page, there's also a comparison with 'V1':
https://www.friendlyelec.com/image/catalog/description/M6V2_en_13.jpg

It's under the heading 'Comparison', but it's part of the picture so you ca=
n't
search for it. Dunny why FriendlyElec does that, but they do it consistentl=
y.

Cheers,
  Diederik


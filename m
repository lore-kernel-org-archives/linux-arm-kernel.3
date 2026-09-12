Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85839C88E5A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 15:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zReJSMCMiuQkus9FSHYhhVP/oAXjMflxwYObfy08Jc=; b=VsPf6MbxgrHWrndzMygSmeVqP3
	wwiZvbxcz0J2LlAba0KTh+Yg2xb/sKMKFGHxdFg05ico8EjN98GpniKcjhvHxB6/tVe4d8TfjWqvq
	hK/ySVfjeYXxerQY9hZzNQRaPT9uS6kZSxjR/OK2qqd7XDaaNWnIbLDeEXElI0Hu/szVswod6V0Ep
	oOSPvaPF1v9iZnvGL/5e+J0QlFbUyFwlP73DJTDMZnok6eFPY96glXxNkzGkkwcnlwgpN3Wcoz116
	HoPTM5cWEmS/CrKEtNsskpa6VV+svA9KTeHs1a0ZLuZ+dvHzPASfRyBG34Ez5yhyy2g7wz3bejK5n
	Ltf28Aqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5PyN-0000000100W-3we7;
	Sat, 12 Sep 2026 15:48:59 +0000
Received: from out-10.mta0.migadu.com ([2001:41d0:1004:224b::a] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5PyL-00000000zzs-1yKz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 15:48:59 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=7Xxdw0BpYVeSsVYvjnUMpQGHZK67v9pQzvF+pta/r2k=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789228135; v=1; x=1789832935;
 b=jtWBlZvuvS7+BgGr4dZSQnEoaFTAqoHZWo6YPzn/vDM9GNWzVDcTl2BhEe6g+dwbTRNTvbnd
 RZavAPp0l7kVXvovMev9f/5LS9mng2aTS0kPhhWwUalRtyugeUCWTmiFF4j/jUrVECRwMS3RhSC
 iqNtBV6xanaGzUlH1blXIkHTnkAjx1T3VtQDmMusmhQR7r7WuBx769LptoJivx1UgrCNnvuNxjj
 7wtkB8dg1nsfcYiANnors7R+d8rH34krSDFUr9xX6Rf4PL3TU0O4wO/CZcJL4IOkmmKfucXjQVy
 +wY9PVMEHd9n7XRJNqAh+xxYgPqz/uxZYOAexsulVUBdg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 835f230ca6fc7137;
	Sat, 12 Sep 2026 15:48:55 +0000
X-Mizu-Trace-ID: 835f230ca6fc7137
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 17:48:52 +0200
Message-Id: <DLDGFSSZUIKQ.19CS0SRKYOKOJ@cknow-tech.com>
Cc: "Ricardo Pardini" <ricardo@pardini.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix i2c6 clock-frequency on
 NanoPC-T6
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Diederik de Haas" <diederik@cknow-tech.com>, "Heiko Stuebner"
 <heiko@sntech.de>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260911152911.2088363-1-diederik@cknow-tech.com>
 <2071782.usQuhbGJ8B@phil> <DLDEGZ68QQ19.1MJEB7QOK4G7T@cknow-tech.com>
In-Reply-To: <DLDEGZ68QQ19.1MJEB7QOK4G7T@cknow-tech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_084857_864937_8052BC9F 
X-CRM114-Status: UNSURE (   9.51  )
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

On Sat Sep 12, 2026 at 4:16 PM CEST, Diederik de Haas wrote:
> On Sat Sep 12, 2026 at 2:41 PM CEST, Heiko Stuebner wrote:
>> Am Freitag, 11. September 2026, 17:28:33 Mitteleurop=C3=A4ische Sommerze=
it schrieb Diederik de Haas:
>>> The i2c6 bus needs to run at 200kHz, because at the default frequency o=
f
>>> 100kHz it may fail to find the RTC resulting in warnings/errors like
>>>=20
>>>   rtc-hym8563 6-0051: no valid clock/calendar values available
>>>   rtc-hym8563 6-0051: hctosys: unable to read the hardware clock
>>>=20
>>> But only sometimes. This should not happen when there is a battery back=
ing
>>> the RTC, yet it does ... sometimes.
>>
>> I'm confused, shouldn't a slower clock always work?
>> Like I understand how a clock that is too fast can cause issues due
>> to hardware limitations, but running the bus slower somehow shouldn't
>> cause issues?
>
> Impeccable timing ... as I was just about to retract this patch.
>
> So please ignore/drop this and sorry for the noise.

https://github.com/rockchip-linux/kernel/commit/815c9a084e62d700ab5487974b6=
3035e772a29a4
"remove the buf[0] & HYM8563_SEC_VL, it's unsuitable for some hym8563.
set rtc init time for first power on."

I guess I have 'some hym8563' in both my NanoPC-T6 LTS & Plus :-/
The one in my NanoPi R5S works great, so I'll just use/depend on that one.


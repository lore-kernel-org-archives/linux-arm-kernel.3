Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 592CAC88E59
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 14:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yoyqd/PyzlDo4VO4X/+8itOj92JfX8j1r4PXxYzmEhw=; b=iG6niIEy+HDCi3u/LsTaINvY53
	6CvtmFVE0LHJDyIgACeOyN2riYXNRIa5wwr5bHAXKubY86CNZiC8rLqRxbECakAhUL3gyZNcnk/B0
	WG5tmzRng/32QYVxcQYG6RSY02BvaExRdh+Q/9jACgFmuJ5aHpMuqCvays12jcaUl2qX/5KiP1oUj
	oxFwtGkXAZgIpd7kTcj98Hc5MmN74YN3D4uu5JK8u/7nv8iGod8Cv4lYYx6y2rCsZ1Fudyf18jOg/
	MdDzsGW8NShEFeHD6zL5St3o/3AYoqLJC28j5kp/zPJli5Fni6Qzayqc0Yeef9y6bYIsoSfdIL4Rk
	BGUDJDFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5OWt-00000000vrf-1UHg;
	Sat, 12 Sep 2026 14:16:31 +0000
Received: from out-214.mta0.migadu.com ([2001:41d0:1004:224b::d6] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5OWq-00000000vqT-09nY
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 14:16:30 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=gWTv9m159o9tqPhsbO31jxi6b8U5wx9tbWutAlj+Ycc=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789222584; v=1; x=1789827384;
 b=Pf/FMT+szYm1C4slkIL1AF2TsUmqIYizkP1pOg5AzF9KLVjHmE53rDd5eygW2NYJLrvEyKpD
 S3afT/SP68ZH3YxA1LdSwrKLFEoVt5L4rTVTEtEt4TDTf5t6g1KuC9SxxhjdusU4HuIn87MGWxs
 pK7W/gzv8yFWrmLE2+m8kBqcNsJzTw7x0oR9xO1QEZAxA5WMsPYhumtrKtG38eNnEcsOGbWCn9Z
 NFszoRXJnx5n7aFkj+7NRDldtr2GxSCe1zBFFPLak1YbmlsiGz6ifWHr88tlb8JOEhnWfQybrUh
 ZgKR5VJKFwJhlDTxmNXarAdveD8147OvllSxL/VvDqLbQ==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 771c737939bb75a4;
	Sat, 12 Sep 2026 14:16:24 +0000
X-Mizu-Trace-ID: 771c737939bb75a4
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 12 Sep 2026 16:16:22 +0200
Message-Id: <DLDEGZ68QQ19.1MJEB7QOK4G7T@cknow-tech.com>
Cc: "Ricardo Pardini" <ricardo@pardini.net>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix i2c6 clock-frequency on
 NanoPC-T6
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Heiko Stuebner" <heiko@sntech.de>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Diederik de Haas" <diederik@cknow-tech.com>
X-Mailer: aerc 0.22.0-9-ge948bb7230f4
References: <20260911152911.2088363-1-diederik@cknow-tech.com>
 <2071782.usQuhbGJ8B@phil>
In-Reply-To: <2071782.usQuhbGJ8B@phil>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_071628_725482_036989FA 
X-CRM114-Status: GOOD (  11.37  )
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

On Sat Sep 12, 2026 at 2:41 PM CEST, Heiko Stuebner wrote:
> Am Freitag, 11. September 2026, 17:28:33 Mitteleurop=C3=A4ische Sommerzei=
t schrieb Diederik de Haas:
>> The i2c6 bus needs to run at 200kHz, because at the default frequency of
>> 100kHz it may fail to find the RTC resulting in warnings/errors like
>>=20
>>   rtc-hym8563 6-0051: no valid clock/calendar values available
>>   rtc-hym8563 6-0051: hctosys: unable to read the hardware clock
>>=20
>> But only sometimes. This should not happen when there is a battery backi=
ng
>> the RTC, yet it does ... sometimes.
>
> I'm confused, shouldn't a slower clock always work?
> Like I understand how a clock that is too fast can cause issues due
> to hardware limitations, but running the bus slower somehow shouldn't
> cause issues?

Impeccable timing ... as I was just about to retract this patch.

In all my testing I regularly got those error/warning on 100kHz and not
once with 200kHz ... until just now.
My reasoning was that it was too slow to respond making the system/driver
think it wasn't there and thus causing those error/warning.

In the downstream kernel it is set to 200kHz and in my testing the downstre=
am
image (with that kernel), I have not once seen those error/warning.
So I figured that the 100kHz was the problem.

But that's all null and void as I now did get the error/warning with 200kHz=
.

So please ignore/drop this and sorry for the noise.

Diederik


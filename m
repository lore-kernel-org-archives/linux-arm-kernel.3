Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B213C79FB6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 12:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vcYxdHFVaT3A3UhEJHDH4JKBcMrG+Bk4FHzp8MJW9wI=; b=OPEGek72zgGXUu3/nHIsk4ssur
	K23l9QgXAnegJc5GXH2SUgXC9vUEmM/EhDLn+fQFBObT6rN20GrcZuw83oFtNwyei9jUh2MufFwKK
	hOSSnJyjFfX3iQhKzCC+RgRygyRu0Q6ilMpSxpr0Lez6hSb/SZ9S7iBbOuzToxDR+5wHez4q7oWMu
	pzcfKMzK9BNCuqGMc2u99E3B8CNH9XZFgMOiNAYq5C6mPOj2YUmsT8qPQn9mFuGHlRWCdtjBNUlwc
	dSYFn3lYxgoH+yDTBWII8JT02agAU0sqxpVbch40bLRAUj5vp93k62xuA4+qK9l+fgedwNWMfatvw
	/DKcSQkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5N35-00000000sNF-0Vlh;
	Sat, 12 Sep 2026 12:41:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5N32-00000000sMb-0ZQZ;
	Sat, 12 Sep 2026 12:41:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=vcYxdHFVaT3A3UhEJHDH4JKBcMrG+Bk4FHzp8MJW9wI=; b=YUi0DHbq1FTxQjpS3c8/wRf/Xv
	HZHktQqIgqe3hnLAURzxfaJnJY9kgm4aE4fWVmP23VbsnkdwErBetYiisLpdDTZVsCXR4ZqyIJL+5
	5R9UE5xmokeGp9rX62xphcRPYBjgjjlJ+Hl+CBzQjJTh+N92yprp/PZ8XG1fv0sTo3PSwVKjOruUe
	wvzYtJ3b9w5HlL48Z5EKWY8jbwDJcl79+sPEW722V5Lz6tUyG9oU3XmDkL4XtZP2xJWcXPXHljn63
	P0A4trSTeWklI64l+GCLIUbRuPeXhk0/wP1KLXRtYzPmNfPEovNbbzpQ1bQRair6imQp8KVqQQGWZ
	z3CsikYA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <diederik@cknow-tech.com>
Cc: Ricardo Pardini <ricardo@pardini.net>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>
Subject: Re: [PATCH] arm64: dts: rockchip: Fix i2c6 clock-frequency on NanoPC-T6
Date: Sat, 12 Sep 2026 14:41:32 +0200
Message-ID: <2071782.usQuhbGJ8B@phil>
In-Reply-To: <20260911152911.2088363-1-diederik@cknow-tech.com>
References: <20260911152911.2088363-1-diederik@cknow-tech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260912_054136_849897_6D2C0CC7 
X-CRM114-Status: GOOD (  10.45  )
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

Am Freitag, 11. September 2026, 17:28:33 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Diederik de Haas:
> The i2c6 bus needs to run at 200kHz, because at the default frequency of
> 100kHz it may fail to find the RTC resulting in warnings/errors like
>=20
>   rtc-hym8563 6-0051: no valid clock/calendar values available
>   rtc-hym8563 6-0051: hctosys: unable to read the hardware clock
>=20
> But only sometimes. This should not happen when there is a battery backing
> the RTC, yet it does ... sometimes.

I'm confused, shouldn't a slower clock always work?
Like I understand how a clock that is too fast can cause issues due
to hardware limitations, but running the bus slower somehow shouldn't
cause issues?


Heiko




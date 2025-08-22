Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0B8CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqNbHZRcfPtenRRmClNSaYPPGu0G5xAMA+3q9ZY42u4=; b=A1ppOqJBPsyTh8MxSBVXZGjYbC
	GHZMRUw+wyNDZgHF3uLpLG5GFR5yrdtUd38VXNMgc5gBVTH8DaOEVJvuSezaKC85fSGiBFMUgrqsF
	eJC+RdhL1/z/OYNkGwORQ++R7NITb1tIKwtEd3zjQed+x+NH2eIMtPHIvDN5WkBJ/WTTdvqU/F+mM
	+to3lZDjHxFxF8crBgaKiWAiSGiCauX1ibJl4KEoruFmeHhbo99Wm2t+1upPxA2qQjYWkjksjXzSY
	xajhb2V8G6I/lggO3kdymKST29tU0oF5Pye3BiS+5Eu6/k1di6SPst5ZCgsjfz9P1WhcQ5kJAX2iU
	RTGK+9UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphll-00000003yk7-1lXn;
	Sat, 23 Aug 2025 06:30:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upRVT-00000002aEV-0BJR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 13:08:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9E2644E40BA8;
	Fri, 22 Aug 2025 13:08:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 59FFF604AD;
	Fri, 22 Aug 2025 13:08:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FDCD1C22D316;
	Fri, 22 Aug 2025 15:08:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755868110; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=TqNbHZRcfPtenRRmClNSaYPPGu0G5xAMA+3q9ZY42u4=;
	b=ReiU5eCrKGWkEjja6xxkaTwPoRvb7IVY0ojhE7MBOmIAMAe0jRB8jF7uadLQ4vVaBIqu3R
	J5eeeEDBa0ZJfrPrQZ3TbzN3xPInorEsLyz1M5N9w5lD2wr3pxtQieJTwjEa9lGKfwVuPp
	DQcf73EDIYm8OpWrTRmS1IJYA+7XzaHNV4c3pzCAO2GenFFcTZJx/JKYstO/bw4yozpYsS
	0azze71VcN24gvOTme/q1KZuh5/jpv6ynZIxsEl5BO3OHGLhwrom6oKBa2WVEIUSbXc0up
	HlN3CP0R1dwC+iSTchpcBUEiXlrOEl/u/faXfEGeLKc1SRo+agPRwhAJ08ol/Q==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Jihed Chaibi <jihed.chaibi.dev@gmail.com>, andrew@lunn.ch,
 sebastian.hesselbarth@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jihed.chaibi.dev@gmail.com
Subject: Re: [PATCH] ARM: dts: armada-370-db: Fix stereo audio input routing
 on Armada 370
In-Reply-To: <20250723224504.70862-1-jihed.chaibi.dev@gmail.com>
References: <20250723224504.70862-1-jihed.chaibi.dev@gmail.com>
Date: Fri, 22 Aug 2025 15:08:25 +0200
Message-ID: <87v7mf5ws6.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_060835_218989_A6910FDF 
X-CRM114-Status: GOOD (  13.76  )
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

Jihed Chaibi <jihed.chaibi.dev@gmail.com> writes:

> The simple-audio-card configuration for the Armada 370 development
> board incorrectly routed the left channel signal ("AIN1L") to both
> sides of the stereo "In Jack".
>
> This commit corrects the typo for the right channel, changing the
> second "AIN1L" entry to "AIN1R" to enable proper stereo input
> recording.
>
> Signed-off-by: Jihed Chaibi <jihed.chaibi.dev@gmail.com>

Applied on mvebu/fixes

Thanks,

Gregory

> ---
>  arch/arm/boot/dts/marvell/armada-370-db.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-370-db.dts b/arch/arm/boot/=
dts/marvell/armada-370-db.dts
> index a7dc4c04d..a9a05d826 100644
> --- a/arch/arm/boot/dts/marvell/armada-370-db.dts
> +++ b/arch/arm/boot/dts/marvell/armada-370-db.dts
> @@ -119,7 +119,7 @@ sound {
>  			"Out Jack", "HPL",
>  			"Out Jack", "HPR",
>  			"AIN1L", "In Jack",
> -			"AIN1L", "In Jack";
> +			"AIN1R", "In Jack";
>  		status =3D "okay";
>=20=20
>  		simple-audio-card,dai-link@0 {
> --=20
> 2.39.5
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAD6CA5FAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 06:35:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJJ9SrQwpuXWcRwz3yjNOMuLRuftyz1Ef6SkpejQHYo=; b=g2hOkeUU2suM/Lic3VRoT5DhTV
	FT8VkTwYX7cy1ei/InrD+nnRVL3+hvuxb4YYjU14FMIviGg6CKY/vk5kDumghpxm23LJxxvXLOF7C
	ksT1wOfl3kSBihjkSjGNJd0crPGnrjzVq2n+Nv1/if7lSNBwdGRYrtIQNyT1JvpLsn2jJ7NVmcbkF
	5oGL4nnsvC/yNdROjoCCcn9RxjyjqGRCdlmB3oDOJ6vN26r/UcKo6caoCH01leAjwLJxa3Ds3973z
	ivc/9coe0xJbX6pKyZ5jZVKBcGZkguF/zRW1vm8OrBII7IqHZbr5+a5CQbRPRSuvedtTTggwR+gJk
	SjMRilMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnu5-000000059X5-0PwK;
	Wed, 30 Sep 2026 06:34:57 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBnu0-000000059WL-3dzi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 06:34:55 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DEBBD1A104B;
	Wed, 30 Sep 2026 06:34:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B244760749;
	Wed, 30 Sep 2026 06:34:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6E6BD103297F7;
	Wed, 30 Sep 2026 08:34:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790750086; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FJJ9SrQwpuXWcRwz3yjNOMuLRuftyz1Ef6SkpejQHYo=;
	b=zJbJ7M+XPdz6b7Q7TAOCZC9GbFLS9/imghm00KF1PCVoCubPo+DEBfw3ezU0ca5eOHkciT
	XSDs8z1Zu24yj4uxh9Iw5iCCgKl4k8U6GdsHQKC9o0PaAOVPPERAHKA6wmJ7robeIDayGX
	Rh+Vs6QzyxVFm4fPvoUYbb6lRC0afGzo/qcuay2WkeYqVZ+tt1qArjIgcsiq9N0P3z+nhg
	qKurDL+yiZZrSvVvlDjlPUZsMYxlxwJBrMcVhZR+zbGwyE80eoou8SXKjOT4uhfMIO5zDg
	v//WLqffHFHtx3JEBsm3Tixw1lb3KVsIDw7SZOIawCUJxQqSQ+BOytlkKYx5JA==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Rosen Penev <rosenp@gmail.com>, devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth
 <sebastian.hesselbarth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "moderated list:ARM/Marvell Kirkwood and Armada
 370, 375, 38x,..." <linux-arm-kernel@lists.infradead.org>, open list
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: helios4: use national,lm75 compatible
In-Reply-To: <20260831233607.13729-1-rosenp@gmail.com>
References: <20260831233607.13729-1-rosenp@gmail.com>
Date: Wed, 30 Sep 2026 08:34:42 +0200
Message-ID: <87ik3n8cxp.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_233453_210507_9D528C54 
X-CRM114-Status: GOOD (  14.26  )
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

Rosen Penev <rosenp@gmail.com> writes:

> The temp@4c node uses "ti,lm75", which no binding covers and which
> dtbs_check rejects:
>
>   temp@4c: failed to match any schema with compatible: ['ti,lm75']
>
> The LM75 was originally a National Semiconductor part (now owned by
> TI) and the lm75 driver binds it via the matching "national,lm75"
> entry. Use the documented compatible; no functional change. The i2c name
> fallback ends up binding it.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Applied on mvebu/dt

Thanks,

Gregory
> ---
>  arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/=
boot/dts/marvell/armada-388-helios4.dts
> index 548fb92ca811..39b2d4fa742c 100644
> --- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> +++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
> @@ -200,7 +200,7 @@ usb3-ilimit-hog {
>  				};
>=20=20
>  				temp_sensor: temp@4c {
> -					compatible =3D "ti,lm75";
> +					compatible =3D "national,lm75";
>  					reg =3D <0x4c>;
>  					vs-supply =3D <&reg_3p3v>;
>  				};
> --=20
> 2.55.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


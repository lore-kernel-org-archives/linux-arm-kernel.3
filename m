Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69285D132C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hFfsYeWISI74+0WFkQ5nAHVNqJLzFSJg/QJqqX0deMI=; b=3XKU9sWxxSipWL6fGVAK6Ks2NR
	cJPQOAK3WktMC8LI5FdRJgwD0r93PBBO6VDBi7p+185HC8wXfL389UAldgoH0yNk/wCHiWXMxLMVT
	t/hHhv4JMl/NJ4SEjPne1Ezbm8gFVRv2b97Lixn2f6l/3m8s7J31vP9+RnDrHGTif/3Yogqmm4Obw
	YeNbh55lco/BwQSqbhalManLbV+y15wdYo4yKlTRfTD+H9U2bTvNk6GMU92mbF95oyUFj2r9cLT5x
	DJWQHTvQVeDpECzQacUUinQhDhuOBbOBbyCM3rI+/gttecfv/RUOr944FByjG0ih5TLgLHHdxTEmc
	fZSrLqdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x7n-0000000DrV5-05SW;
	Mon, 04 Nov 2024 13:28:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7x4p-0000000DqV6-06bG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 95CCA5C553E
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 13:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16759C4CED4
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 13:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730726702;
	bh=Doo9m3wIIEWg5JXjG0Xv9k7ZyZpGgwIIe+URnSMqyQo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=JxiNDfJiSa8dfcOdfPG0HHovIxGuUgLAAno0QrHlR+zmLKPUfBbsMK0UjEiZvaTHX
	 YPzYJm/jHpZDY0FjzTYvvpn5adJF0fc5ZuLrjUvSApzNF6v/GO56Uy/7ZTzKzDifJ/
	 RTAo/AtzQVM7d4jsN2assliYHV9sE3dK4qWZGyNee3pOSG2dpgzCJMG+1+LmLyJBOV
	 GoZZ3G7eYpYl+3kfdDjS8XfmtWoRfevO38wFlo4gbzXcd9G2SN2lAY24OJD+AibfRx
	 nr9SpSJAVIZWO2Lji9V0vdg0+jhZs8RMzIOzKE+/1MnzGPQQIsZFMP91i4mr1bkcER
	 BEKGTYX6q0I9w==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6e9ba45d67fso38301947b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:25:02 -0800 (PST)
X-Gm-Message-State: AOJu0YziR9OG+BfYeibfaohdhCFKUFikwdCxaJZDUupZmiCt3lC1KDWe
	LNF/Q1y9dKLBUA3G5sFTJVFg2rkqamW+WElxk7igulgFS+jWwSFv8CtMAMZFrXPE/g8rDYyaf2m
	nrItzslhtbhpvE0uNcd6e4dphng==
X-Google-Smtp-Source: AGHT+IHqhOLaFSEhC7cXDIrTPrOUvp3w8WrjGzCLWXFyxkMPyvR6fmuxJjHNxXEZ1kqfJwMzHIU7K2dw1YakhAPFgWo=
X-Received: by 2002:a05:690c:304:b0:6ea:98d8:a55 with SMTP id
 00721157ae682-6ea98d80b01mr28133297b3.14.1730726701300; Mon, 04 Nov 2024
 05:25:01 -0800 (PST)
MIME-Version: 1.0
References: <20240910215914.823546-1-robh@kernel.org>
In-Reply-To: <20240910215914.823546-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 4 Nov 2024 07:24:50 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLLRSEaDv=Zm_LQH9cpgH2prh21+cmovgSR=pzQTuRtZQ@mail.gmail.com>
Message-ID: <CAL_JsqLLRSEaDv=Zm_LQH9cpgH2prh21+cmovgSR=pzQTuRtZQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: marvell: kirkwood: Fix at24 EEPROM node name
To: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_052503_143472_732F15EF 
X-CRM114-Status: GOOD (  15.37  )
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

On Tue, Sep 10, 2024 at 4:59=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> at24.yaml defines the node name for at24 EEPROMs as 'eeprom'.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Ping!

Are Marvell platforms still maintained?

>
> diff --git a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts b/arch/=
arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
> index 9c438f10f737..2bc4b68bd723 100644
> --- a/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
> +++ b/arch/arm/boot/dts/marvell/kirkwood-openblocks_a7.dts
> @@ -44,7 +44,7 @@ sata@80000 {
>                 i2c@11100 {
>                         status =3D "okay";
>
> -                       s24c02: s24c02@50 {
> +                       s24c02: eeprom@50 {
>                                 compatible =3D "atmel,24c02";
>                                 reg =3D <0x50>;
>                         };
> --
> 2.45.2
>


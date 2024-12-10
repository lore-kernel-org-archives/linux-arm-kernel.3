Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEA58E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 20:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgKU23big2iA/4lgJjztR5Vr5E09reP3/HgJodbz0+Y=; b=tFx/V/kP7CKlxYFhfJynDQ5UeR
	bJSpwTgwxj1GPMy+8B996qe7fhz2eziBE8V21YA9q4YGnWuLSYRNOV8bLoHqwvxvlpIGl7Z2NnrL9
	EJr+05xXgSAxiPV9HTO1atOwcXvs9FvUJEyuB0QY7qOZopD9DJ1vOYw3PbZBfAEyvychNC3DXo/Ud
	IncKxhfi/JCR1vmUcfl1t80bauD2dlFmaP3IZtM9gEt2zvA5Pv9ezsd9FCI4Nd/JmBKzxoK1huZzL
	qFW6WCvkck11R+8PDo2/fFDsAXSrjuA6rjj4xq89eoYUSpkCQhx9gR0fSGn8wZC3rKaDJKZ5vtkm5
	1pbhHh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6dF-0000000Cdd7-3dqs;
	Tue, 10 Dec 2024 20:14:57 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL6c3-0000000CdP4-1nyY;
	Tue, 10 Dec 2024 20:13:44 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso4325993a12.0;
        Tue, 10 Dec 2024 12:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733861621; x=1734466421; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QgKU23big2iA/4lgJjztR5Vr5E09reP3/HgJodbz0+Y=;
        b=H40yMZbH2JTWyF9dk+ZfefleQrjTv4RrsAzh6BAQ4rZoeZfVLlAQJmGpE1Y2pc5d0k
         PIdsVzIwQpT1rEk/eWDC+eonu1wvoV+L1kdBqYY956FiCnANvO+MzblVj99Iu+A2aBer
         KoI2C55RXCBmTOKVoxRm8YhOrdc3EGvUO3pZj3VVEmSdv0NqqY7vONamQsszie+qhdmi
         WsL7jVCPi1OCI+ADGq6Wsa58NeJ1gCkWNhRE2f+/GnHRU3Iu6Xd7PCS34UvubdN93O6J
         wMOf0191dQ4MelaTJm35X072O7XwUF0/SFw7Z/UGVx7DBjzlY+dMCIioyxqydfUlIfD7
         dyNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733861621; x=1734466421;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QgKU23big2iA/4lgJjztR5Vr5E09reP3/HgJodbz0+Y=;
        b=MmsRJ3AqWpbqwu3kv7X03/7NOySuPwMszEv/qkNlK/ZEskamSClFGgGiyNbuYXV+DB
         UMvyNi6tHyJWzvo4lJN7REK9oCdlGaCTKgUOmFQsrhCNfzwxETinePMN4jj22/N8xejV
         tAIOT78GKCM05CEi5s4v25BqxG/kEdfultLRrw33bfQRb6ivaDi4bu8m7giSmxr5w2h/
         eeK8tERvZ/J/iZePoHqzlCCg+HfIf2Ua3fEyYt1JzDxGGCCB8EF9HtKJZmQIz4HORJ6E
         1f68EUOmhjsh0FMMCN9vuAdT6XHj9voMJ8GCbLazkiu8LDm5HPntQTVyZJHJ2IJM25Qg
         0IiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBX2lED/CpmYH2nvj/3muLHjwKyo11t5LTmCAXxMnSzSnXTTD/D1u9oQH6iNYxa/SCZZ178C6ordFSswNwmLo=@lists.infradead.org, AJvYcCXJqfQfqKFMwNzYs2YYBFlOf8e40zBbJmSNw11wJyLEewFlihntiwlf7A3WwUg7F1khy8P2CIJxwauY6hGvp2RE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzoe3pMjN59zUI078DbQ58tGl4+R+l9ks8lXrf1Uz8RQ8esTRxC
	LG61hZuoWO083Xf6f4AJO/5uuhNy6nk50tmeUj+geQVRx6uQIIPRWB8RQrQTxG+ebDNSzCVH6VK
	vIYuGCDBu1qBM/Hoi3tTYh+ZNOI0=
X-Gm-Gg: ASbGncvCERGBmxu6GvLdwIZ0XVp9um2v4iqCtOGUisfRWcMOQIQBtm2x4xrm0b7iVpg
	HIXPK08RnEmWK4NTWcNVUKfNpbR5IGRTpSOKH
X-Google-Smtp-Source: AGHT+IHT1KsOnBSj6/Zb1BhVvcEFV7dOkovEkS80li9AoqSjDy646pb5zs7A/JETWOAV235CrH6wQHRXekgMqdfvQeU=
X-Received: by 2002:a05:6402:4583:b0:5d2:2768:4f10 with SMTP id
 4fb4d7f45d1cf-5d4330ada8dmr127736a12.17.1733861621325; Tue, 10 Dec 2024
 12:13:41 -0800 (PST)
MIME-Version: 1.0
References: <20241210013010.81257-1-pgwipeout@gmail.com> <20241210013010.81257-4-pgwipeout@gmail.com>
 <20693a7b7cb1aaed2c21b84fd57c4b72@manjaro.org>
In-Reply-To: <20693a7b7cb1aaed2c21b84fd57c4b72@manjaro.org>
From: Peter Geis <pgwipeout@gmail.com>
Date: Tue, 10 Dec 2024 15:13:29 -0500
Message-ID: <CAMdYzYr-4mA703ZWGZnCoRtmmkS689XHk854j73M4pgJceeJcQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] arm64: dts: rockchip: remove ethernet alias from rk3328-roc
To: Dragan Simic <dsimic@manjaro.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>, 
	Diederik de Haas <didi.debian@cknow.org>, Johan Jonker <jbx6244@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_121343_467884_7E6CA86F 
X-CRM114-Status: GOOD (  21.11  )
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

On Tue, Dec 10, 2024 at 3:01=E2=80=AFAM Dragan Simic <dsimic@manjaro.org> w=
rote:
>
> Hello Peter,
>
> On 2024-12-10 02:30, Peter Geis wrote:
> > Remove the ethernet alias added back in during the rk3328-roc dtsi
> > conversion.
>
> I just checked again the dtsi parent conversion I performed in
> the commit f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files
> used as parents to dtsi files"), and both rk3328-roc-cc.dts and
> rk3328-roc-pc.dts had the ethernet0 alias defined before the
> conversion.  Thus, the alias wasn't added back by mistake during
> the conversion, it was there before.
>
> Moreover, I don't see why would we want to delete the ethernet0
> alias(es) in the first place?  It's usual for Rockchip board dts
> files to have ethernetX aliases defined, and both ROC-RK3328-CC
> and ROC-RK3328-PC have their gmac2io DT nodes enabled, and the
> boards have wired Ethernet ports, so they should also have the
> ethernet0 alias(es) defined.
>
> Am I missing something?

You aren't missing something, I just misunderstood what was happening
with your patch. I can safely drop this.

Thanks!
Peter

>
> > Fixes: f3c6526d6fb2 ("arm64: dts: rockchip: Convert dts files used as
> > parents to dtsi files")
> > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> > ---
> >
> >  arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > index b5bd5e7d5748..f782c8220dd3 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi
> > @@ -9,7 +9,6 @@
> >
> >  / {
> >       aliases {
> > -             ethernet0 =3D &gmac2io;
> >               mmc0 =3D &sdmmc;
> >               mmc1 =3D &emmc;
> >       };


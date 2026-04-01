Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAD3D3517E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 13:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VddJqdW/ivYdJwKAv4x/MZN1YGeGSQIg3wJqceIORIA=; b=fMoKp/OQSLhzPuaKM43FnLivSY
	1lPub99MMvKDF1nEZeJg4ZTXioU6FXacISQKfNe3UpCjL5YRdRAr8t8ng1cCmsKFZpM3XvIIyILhZ
	Uee4ohoEdbr7IRAB/5uu+MGs0/ghfQrvxfTTPLX8Aw80dl1KLWUcRaFbfpKy1WCpcT0tyMLuotl3E
	jJ+Os6VUuas1Gm718nJJcMHrtiiJuUYXQYmXBP0jxH3s2cLkfDV2h9lYLQco28tVx01ruG97W3Jxt
	NsfYXH0hlfckWvf52KQ20aGvaMp47za7y5gt/oam3b7Mixe3Pt/LclKID3jiewBNLoSV7VsOtqu09
	bJb4MeHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vdl-0000000FJRL-12Gm;
	Wed, 01 Apr 2026 13:29:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vdj-0000000FJR3-3In6
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 01 Apr 2026 13:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=VddJqdW/ivYdJwKAv4x/MZN1YGeGSQIg3wJqceIORIA=; b=C1kjtqpJqoV5e+3XeGFWDWgpOY
	ZlFgv806ogcGKLMwCjnKNeaYFaeMDmK3Dc1ALqZRLe4M/bq/i4cuji6kt0h+vL0+Y7IybXox5KZGe
	PyKdJ+fL9T/cmJKw+FQ4UwxAnQ6nhdkjKPGoF/zIFmwp0Ps8YzUoj+a7vsS7xopLCCllclou9rj27
	2grwT9l4MCCjoMb35mcacSyUxBZtyOceHGcyLHU0ij2BuMrmbOeBn0A7OXFgaQk4NUiboJaq8kYPT
	6tZ7Z/3pB82FGesT4wLpBQ+FcBE8jw7k8Ef1VcARfEy0uO7xYLCrIECETVoKv70O1N3Gs6T+DVoLr
	wGshjxqQ==;
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vdg-00000000Sod-3MBw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 13:29:46 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8a093c784b0so7652806d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 06:29:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050183; cv=none;
        d=google.com; s=arc-20240605;
        b=Kh9zDL3qbyO8SLD8U8HdD0Twy8z0Az6kdXklBB9Cg+w+XmlPFQrFSaikSfgfE2dWif
         oS8d8ixlBvdmH9M0Lpeu7nTi33+AG4OHgx2y2EVH+qWss8hqCKan5KP7qKZL2bsFqRKb
         45JycKOglT6bcxk6C8QhrssslMjLJYviXVej+IpndkYdME6jHvW9nxfVZ6HIH6AXnJ6G
         5ORPUXbpUY/fn+dlYHeGZDwXuP2ztlpILBurxg/xZOkZD7QpYtRjlaWzbhlQ3m5EdusF
         75E9K5c6NXEQQNiv4prUgTvX4COnppY2oW35I3YR9mJ2VszTCsYOAS+sMiSa1LXV6hgo
         jrgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VddJqdW/ivYdJwKAv4x/MZN1YGeGSQIg3wJqceIORIA=;
        fh=Gy0ZJRXlK9cHMlRDi3Cew5/i5W93QEUEhBOhwDFSfRw=;
        b=QbeET60Pkw0x3gfU597WS1XAHh6xcM0i0lT3a+jRx4oBBESnfDrJhY/oPhUTRht8l5
         +6XGa88HR4QoG59cByQvPkCkxJ9XC7N3Ih7gvfubLoXjprVUkJCg3+0H3r+rL25KosnI
         uqtBHqtHEil9uLhvTl5oP14L5jL+VRPl8ssp94IxA6JlTb/et1qlfBeR8om/r59/T+SR
         +0YBKco32WLluAcKtgWfOaohbx5ENP8/OGw9cYSkbZmxl9MejwHd+PqPuaNXF0RDL4N6
         W6sf/bXlTTsM0NN0OoHBMb76o/Rh3soskg4+Fy+dWIXyBCrW2MM+XtrYhHUrEw7d4Lyx
         H6EA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ausil.us; s=google; t=1775050183; x=1775654983; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VddJqdW/ivYdJwKAv4x/MZN1YGeGSQIg3wJqceIORIA=;
        b=ho72NLrgbW+dBMLbPpl6pRC58LV7+bvnd791F2QfbHDEeu8QW+R9ae0Ap9z93S1zRA
         GGfNxtxGllECOnrtfDTdMy8lB7GaOx0rPEJL7vlM+F2v4auTTYHsef5xS/ysaWHAfO/V
         hxUEcZEM6EBdNE3wdJSksHy2H8xwy9gA/SsJ/rYqsmDPgYgiBRbCxfuqaR9X+EDnsaxC
         J5Amrahi/SOtK0F2mh4Dted6BNXU3cPZqrbYkIKXIaJV9ZZciY5fsMwU3ivqKFMiCR34
         d4Gro6nrTf+1MQUPQ4DKThsg4a9chjSCf+77x9HMpJ9IN/U8+uwtNK3WRwjLxf2idZmd
         j4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050183; x=1775654983;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VddJqdW/ivYdJwKAv4x/MZN1YGeGSQIg3wJqceIORIA=;
        b=dR1UGfynCqbNq2WFnxqCW9yEFmyRKiW7mnKcHhPV+Vvm3YPwVgonlGD/Qmvo4ghPlM
         f8C1npT1RHz5Bfyw279Kf983eAveOqEBMKeEyt9rwCaTCl4noViEnlw/y5VKKnuUggxD
         usAV4EinJQw0NVoctvi8G1NtwHSCusrh2bv9u65In9sLccO8aYCTrL0SoHqB9A+IuLYa
         kRF+Y0tmPzIv1Y3rJ5gp2feqazNa3piZfQPeTuwf770wJnfkApctkbS9AC5RJfoUqugu
         fvRASozbRnFJBgKMcbc8hBbhdLLi9161EVGwFJMDAxM79tM2aQS49ilQ5MlU5ybzh74m
         xbMg==
X-Forwarded-Encrypted: i=1; AJvYcCX6IKkuC66ImMda9i12DpnO5UjCOwyy4q2mgMFW4pxXxZuUzztUJnIimWf8YDcOJ3qW+nYgFSRMJ3rXoBtUoHsj@lists.infradead.org
X-Gm-Message-State: AOJu0YxwtmNr7ELG5GMISpLxrRR/jumiCYSjIgJYsQXF93M9PYf1GEV3
	Vyipc2JGGyRpNiete1dBcjMZnwzN8ewLc0GB+JnJt3DwfYcarLQAakzwXOhHC38gkFfr3oUGfgW
	K7pP9gYLz8CDU6JlIOhmXPcB2sXrJryAdi3bf/oD40w==
X-Gm-Gg: ATEYQzz7zZoTakEIPkIkhhOSxyXQBXg/H1Y6enyd9gFgdXOSu7VXh1AFAUp6h3xoXvK
	ZOqQLuXybSXh961dtAx/117Q4JiriIrcZwptnxemErDGMEKpYX/rMzkasdAS0EaMdUoWmJmWPHO
	UtxZn1Pd7bqAtEooovs4aBDOBH0gOA+7svunl01pvlZxx8ewTJcTucryPqY49wrrEzvDGx6qSNU
	1jwBcR7qMP0tq9/ECKjdA40RsN9IFBj8AFzDWLCiV0GHt71Qy3EHrigAZLmAsPgBpy6ISdri2YQ
	iTsO3sf7a952fJaaIWWR0PqDBNrLp0PyiIAAEyMpRZ6ZJRn2kjbjHMIMwKoX9p5M8+DLoxA=
X-Received: by 2002:a05:6214:1304:b0:89a:14c5:f4e with SMTP id
 6a1803df08f44-8a43a273786mr51708376d6.52.1775050182430; Wed, 01 Apr 2026
 06:29:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260401010707.2584962-1-dennis@ausil.us> <20260401010707.2584962-4-dennis@ausil.us>
 <7c4791e9-6621-4afb-a166-55211b18fb08@lunn.ch>
In-Reply-To: <7c4791e9-6621-4afb-a166-55211b18fb08@lunn.ch>
From: Dennis Gilmore <dennis@ausil.us>
Date: Wed, 1 Apr 2026 08:29:31 -0500
X-Gm-Features: AQROBzAu4N-C5ikXx_bUWzY21o8WyoQ0kn_i1gnmUiRPmbCXX-sUt6a9jBTZs-8
Message-ID: <CAABkxwvfCYqN1y+aVUPVP05uzoGNEitC-BVjvAXL8ZPgRHav1g@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] arm64: dts: rockchip: Add Orange Pi 5 Pro board support
To: Andrew Lunn <andrew@lunn.ch>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, 
	Hsun Lai <i@chainsx.cn>, Jonas Karlman <jonas@kwiboo.se>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	John Clark <inindev@gmail.com>, Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, Chukun Pan <amadeus@jmu.edu.cn>, 
	Alexey Charkov <alchark@gmail.com>, Peter Robinson <pbrobinson@gmail.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Mykola Kvach <xakep.amatop@gmail.com>, 
	Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_142945_124636_7CF27EA6 
X-CRM114-Status: GOOD (  15.68  )
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

Hi Andrew,

On Wed, Apr 1, 2026 at 6:56=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, Mar 31, 2026 at 08:07:07PM -0500, dennis@ausil.us wrote:
> > From: Dennis Gilmore <dennis@ausil.us>
> >
> > Add device tree for the Xunlong Orange Pi 5 Pro (RK3588S).
> >
> > - eMMC module, you can optionally solder a SPI NOR in place and turn
> >  off the eMMC
> > - PCIe-attached NIC (pcie2x1l1)
> > - PCIe NVMe slot (pcie2x1l2)
> > - AP6256 WiFi (BCM43456) via SDIO with mmc-pwrseq
> > - BCM4345C5 Bluetooth
> > - es8388 audio
> > - USB 2.0 and USB 3.0
>
> You said in patch 0/X that the Ethernet driver had just been
> accepted. So i was expecting a node for it here?
>
>           Andrew

On the Orange Pi 5 Pro, Ethernet is connected to PCIe; there is no
need to define anything

Dennis


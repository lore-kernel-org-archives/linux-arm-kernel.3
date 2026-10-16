Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F727CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 09:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=; b=qK1HJuePuCxD96YK49M0DEekS1
	TXWpjR5a4jQD2rO8eYSxlPqQ8Mmcev2mOlpSQZ3U21b0hXp1aG5/HpMnsBEhOJYRK+fL3jrGhjFq3
	mU5/brU1GWDbaexqzyOyFW5/26F3rBoG+NR2L8lHAkHs4vw/YSPG2BoC1lawsuvsnhzvVgNajkYML
	xXuNXWwSwGIPDKTKZD2fyeQoFeOLzrx27ckACXkaKOPaLLStFioq4i2Lc5/AvZM1sCN4fYki6xEAr
	MIT6tkJUVONdiXtny4BF5fuhDc1AiLVqhYY7LfKIes63XWSQDi+u0tTDIRp/+lqeonylA4axl55Ls
	TtExm5yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdo3-00000002Ppk-2kpt;
	Fri, 16 Oct 2026 09:00:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHdo2-00000002PpO-44mP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 09:00:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=; b=eOXqnk8DW+V/2kTOR2QRlX2wk4
	We8We4MHfS1Ws7IXWJ0yZ/nf6BkynaYQOmaBhTPebzpowJ+NVAC8sUIAe6o7cxPsvqF7vW7rqzu3r
	i9O60TB8HA9ITdYVd+PjwnLzrXACSMqltQEZRxDrJuIEwIimgTH6pdU+6NiR6xpCUZx/QqmjQ/kZS
	8TT8pE7/lee/B5vMx7Kp8sYqZaSoXtHPDCREHs8A2mzIq+zKvNYI754XjqJAox+LPY7y4Os1GW1z6
	2RflZhOejhIh/ErZNaZs0l5vEMsuuZD6G73LCIUIkrSkpJh71IVcEQvfCQuSYGs3EFcapbwd4VxQm
	2hWvDt2w==;
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHdnz-00000001IHN-3IEP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 09:00:49 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3a75f960be3so33614331fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Oct 2026 02:00:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792141245; cv=none;
        d=google.com; s=arc-20260327;
        b=RfraAGmvVVIMpMSTgNJ2mCu05zbZXB5Y58zpIfsbofF4lI/k+LEs71xTeo3xNeDk5Q
         eyFp1OHVwH7J+tWQOJFKfFP5B3FNTVYnF2Ru4mOzHFT+CI8DfCHj67fidg9tRCZJ6vU8
         zxon0x6GYcFFPrMKo79X/Sq9wXTdB5q3V0LRUaBH4dp9jZ/2o+cIaEdlar7z7kUrCfPC
         ek1dJdsFinGeIMv8qfXrIfZNRqEuU16ASkXb5wQEXgDKrZcM69QDscblsAkg/1Gr7gLY
         9mnEDyBIHBnqT46CpIvUdsm3p9z02D1Jfw+CcNb0x1/dEwGXZToq7CvbfsKou59AEvbx
         NtQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        fh=ikI5LIl2YWDaNYiZnLHT0DdfV/Xa8luQ7bt+dfTGOfI=;
        b=UzP01934RTl416Ulz9hMIPbW1IJ3kQSfTbgVZ8iOmXvgzNgnX/VnN8GSbB2ecHglSl
         FwKXze3ScaWenGzPgV1WdylPfzLW0Q2D0Szz0zj2gB7bOcT+Uu6hxViNI9SkunXc9YmS
         ENFTUYdRi9lpHp8/+z2itidklnffUsphg6CL9THE/dkBuXBDlnXo5hkLlbZ+x7Uy7iyH
         Iq7h48dLBGEQFnhkRpgsMZwgVtW1+KcV2BjUhihQxXSoqExAJN7I1Y0Q+1KHHhF7YIOR
         611Vnt7LKM67ZiFUoUHclm1Wv2+I53qPS2k9Dc9uDt50EDWQP3WPZEIGVIMiiVjPtOgN
         +pDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wetterwald.eu; s=wetter; t=1792141245; x=1792746045; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        b=aq99aqWyoTfrFC7mRaW63Fl8buTJb+qARHJyBXGdHOG758aKpeJV657JfMl7RZO2c6
         FnKX6AcaXp5C3I5unRfLKIeD2Fl23qWRMHqc0L+66RUBp4Svv/YHp0efiT4FZP9c7EjW
         9G+UST6JL813DoCnAZzelmLKEq9FKt/J5FLrP/biaB+lR55mS9x3SspLKcki4MyOq7HU
         X+BgYaf/sw2Sl8Y/0RrbnTsDir1VRQyxgMfiT+rOZqQJxA0Adl5Rdoki6AESvXSU3QfN
         7CSEA3pqL3jwcSk0p6wBOSVWHMhETri/5OpwY5jX0PTwCQ4qbe014qFhTgzaEzjm9mXQ
         Sd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792141245; x=1792746045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YybyPuhgsnKy9RSuW90vvdft3eNm7NMwNdUR8p+bdAY=;
        b=JuHU/+YY1cxin0mPwVHZfbUKixaX5dIRS9PQ+oWDPKjmiSgftY9n0YdLgpIXr/4KCu
         KtKHNIC5ZG+By/4m9qWlLLno7vnyceLL4jxRLLWgbNJ1kck7zGctGf5pGdNm+/w0r9+F
         3JC9InHBa8Crw3jtJy7CPiIy+AxrlDjJZh+V+g+dt3ON+i9Ks7sXKGn0Ep/OdQj01GAw
         wN3KhuH3x8tHSOR2gzyd1LcL/8k/eMDJ+eT0Mw+Dwfjz0ZKzHdWCysnF4ApSygqf9i/2
         JZSirTHOJmH5mbnNgtmtVZGBN+sJ37wYdkFVL53IZiZcsKGcKAhPL4dyKWGl1PxHOT4m
         YdpA==
X-Forwarded-Encrypted: i=1; AKwUvBycuJNDj5p/vbMhWxoSVR3ji0AMdyaEDSr4Ygk42nZEAhMeiUJNYPuzFH0Ng3PRxrfmAgSx/UNqOXa5qITepBUE@lists.infradead.org
X-Gm-Message-State: AFq9FYK0KY6didf7/f5M0S70cp/vovQpLneFyyk7qHG1OpVHidd+VbRM
	hGL64cMC1uUb1mMHm/5r05PAZSMYDj8ObPF6IjbXjBT+TUvnk0Q9BPeQN/he74ew17hnbOYN/zO
	QxQ1P24KnXNktgucu59kAaSaJdOalN+JDNPbfAeu2LA==
X-Gm-Gg: AYBFou3n64/vu+izdaHPV1FuhSukVWaRm2eqs4255pHsLc13uPktW0ljjUnYBZiehuM
	63YjO2B+mk9leBKyAdo4UlwLxhM1/KKESScNQt/v9U7XxUSz69Oc+Fl25yT3LlWjDGGiOSfQe2x
	YoRrLjS9f8ziJj7S7o3Ig1bpViP96IZmvDA/CySPxMH6F2WV7FA3eTA46gGRkranTYoOj4pHaKv
	du+CfaSVQ6OH0xuO1YYoN8ZTfzxfhvNOl1pKqUoybHAL3ezicQEquAikHajJ+j32XF1RzM9rcwX
	+TN5Ku0AfBa5LgUByGULxZdSriDoFKWC0Tc8Ak7tsxWZDbdVJKqdY6+NP294dxQxcteMhUDmpe9
	q/i/Yu+21Fm0=
X-Received: by 2002:a05:651c:19a4:b0:3a9:c1de:852a with SMTP id
 38308e7fff4ca-3a9c4ebaaa7mr54573451fa.3.1792141244894; Fri, 16 Oct 2026
 02:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAFERDQ0FpdVvA5VJxOyRAE_pgxnPVmFx1tkZio5R272j6Bs4tg@mail.gmail.com>
 <20261013131435.1454019-1-martin@wetterwald.eu> <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
In-Reply-To: <DM5Q9NKRO89O.22R04QM8YBKWM@gmail.com>
From: Martin Wetterwald <martin@wetterwald.eu>
Date: Fri, 16 Oct 2026 11:00:33 +0200
X-Gm-Features: AclHuK-lXXEn4ydNCXPutfEMfjozHKlcvNq9MgkrJnOYo8wz6ecB5WmDos1rbFE
Message-ID: <CAFERDQ12QwtC6cCVWQGU1b5KCv988kAvahNKwosxG2z8Mzm4sw@mail.gmail.com>
Subject: Re: [PATCH] platform/raspberrypi: vchiq: register bus at subsys_initcall
To: Gaston Gonzalez <gascoar@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Jai Luthra <jai.luthra@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stefan Wahren <wahrenst@gmx.net>, 
	Phil Elwell <phil@raspberrypi.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Umang Jain <uajain@igalia.com>, Kees Cook <kees@kernel.org>, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_100048_032000_AE8E6353 
X-CRM114-Status: GOOD (  21.80  )
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

On Thu, Oct 15, 2026 at 11:25=E2=80=AFPM Gaston Gonzalez <gascoar@gmail.com=
> wrote:
> Hi,
>
> For Raspberry Pi Zero v1.3:
>
> Tested-by: Gaston Gonzalez <gascoar@gmail.com>
>
> Test setup:
>
> - Branch: patch manually applied in staging-next over commit ec1ecf4f23c5
> - Setup: RPi Zero v1.3 connected to a HDMI monitor
> - OS: standard raspbian with the desktop environment enabled
> - Driver built both as a module and built-in.
> - The following command was run to test the sound: 'speaker-test -t wav -=
c 2'
> - Result: Both HDMI audio channels worked correctly

Hello Gaston,
Thanks very much for your test!
It's great to have variety in tests because I don't have the Pi Zero, and I
didn't test it through HDMI, I tested through the Headphones jack (which
doesn't exist on the Pi Zero).

Did you also also reproduce the bug without adding my patch?
If the bug is present, cat /proc/asound/cards should reveal bcm2835_hdmi an=
d
bcm2835_headphones are both not present. And you should see this in the dme=
sg:
> Driver 'bcm2835-audio' was unable to register with bus_type 'vchiq-bus' b=
ecause the bus was not initialized.

Regarding your test: there are two ways for the sound to go through the HDM=
I
port:
- One is through the bcm2835-audio driver (using VCHIQ)
- The other way is through the vc4-hdmi (bypassing VCHIQ)

  # cat /proc/asound/cards
   0 [vc4hdmi        ]: vc4-hdmi - vc4-hdmi
                        vc4-hdmi
   1 [HDMI           ]: bcm2835_hdmi - bcm2835 HDMI
                        bcm2835 HDMI
   2 [Headphones     ]: bcm2835_headpho - bcm2835 Headphones
                        bcm2835 Headphones

Can you make sure that your HDMI sound is really using bcm2835_hdmi ?
If your sound happens to actually go through vc4-hdmi, then you are not tes=
ting
my patch. If you can't see the bcm2835_hdmi, you just need to add:

  snd_bcm2835.enable_hdmi=3D1

to your kernel command line if the driver is built in, or to the modprobe
command as module parameter.

> I=E2=80=99d be happy to run any additional tests if needed.

It would be interesting to test other "clients" of the VCHIQ bus (because I
only tested bcm2835-audio).
But I've just noticed that bcm2835-camera doesn't exist anymore (it was usi=
ng
VCHIQ via VCHIQ_MMAL).
If I understand correctly, if VCHIQ_MMAL is still there, it's because the
bcm2835-isp and bcm2835-codec drivers will be upstreamed in the future, but
there is not current "client" in the kernel as far as I understand.

The only remaining thing I can think of is /dev/vchiq (CONFIG_VCHIQ_CDEV).

Thanks again for the tests!
Martin


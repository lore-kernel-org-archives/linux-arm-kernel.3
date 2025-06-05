Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285A8C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 13:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Of4vTHHo0c3fLH3Y13EMcDavOhIYjcqdwDcNmNcqIeM=; b=HQOvSLtWMSiLKnGoYv7GJHGH+6
	706X7JOgN081L6ySyXYQTNkvmn+iL3/MYqh6XFx+LU9ooeCade2iVFJ+U3q4tFeJx/4WZ0R1oshYv
	E+haP2cOlmGt8f1ui0nyKnfk0KvXJivONXcxGAq7y14QFFW/Woju1f/7oj/b+Q200VqU3lePVQgG/
	Bv4BDbB73pi+BmMYuiaOswG+1ggj4/KPrh3gdB/pH8FaPoJJmwUmYpPXcbn/vV1sYANeKIREYx9Rt
	6CqU2rWtaOkB36qEMdzdtsII0SiueP63XguA9+69VviudPiTV6gBFTXLszTcZGE3/ccLpS6xBbQZW
	C0Ubyiiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAiX-0000000FelH-0uoO;
	Thu, 05 Jun 2025 13:33:13 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNAYZ-0000000FcK4-2ygh;
	Thu, 05 Jun 2025 13:22:57 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6049431b409so1533798a12.3;
        Thu, 05 Jun 2025 06:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749129774; x=1749734574; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Of4vTHHo0c3fLH3Y13EMcDavOhIYjcqdwDcNmNcqIeM=;
        b=JP1iQrH4FBdJJsGWtgyf10Qu/As5c4P7QUjwTlZmpjW/7AKXXBI5HCzAYRotZ/zHrd
         VZspK4lyKeZeUk7Eo+2m4gbIKw+DHi+9qKujPjUSfmGRiDWmoCrukBrbWWZYVcwQEyVX
         I58dNHJnZHcgtndAlcE5IdsPBdnH6zbPh/hUBoZqlB0TMFsdjHA27YtdSy8VSBFBgFWH
         BUg4sus68bkyEI0IQ3KTHlLcQ7xzUqC3dhgI42pabitGBud/HV4M/7GYPPxoQSOTLioO
         YWRszvKM9R+xZHX/1cDx++2HCPQM/MJrPSzFN7AmQoej8zVLfideH2VZO3muf8JQzjWL
         J9KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129774; x=1749734574;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Of4vTHHo0c3fLH3Y13EMcDavOhIYjcqdwDcNmNcqIeM=;
        b=UOpzbl2YXt1vq1cEr7Mxu9eA+oed3wgbgYaZHruf+v94cfsCM7wSNemyBSTL88FSpm
         XdJy2XU6gmSyObVp75vV5jiQYy5vvXG4OJoeR01iEmLgXj4DpW7muXZ50xu2zXJK5G+O
         IiWqQnvGzGyKbMcjdOnl1GhISfbx6SeptIC0my6eqKeUnFXOG+Ke9i2AhrJVGJ0yVtfj
         UNAXj4tGr8bIwPl7rxefD4odYit+Yqq52ZknIlL99/gGPat7++pTm+q8R0H2MyePVyYE
         HtnjUwG0LxPoSp42/YPP2vuNDuAjgxN2vZRdJFVR6ynwXbOD1LVCCY+HzRG+0zNzkAG2
         hqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxSEVZ3YDWVEy/EZD7nlb3D3IteHJ+ldShKxkY5EWQt/rpU4kW9eKyX0XYdLboao51jBfBkj802es6Bxn8lnNq@lists.infradead.org, AJvYcCXHmDOTioW3J7pu4vQADMka6/dgNlFyRYZtSG3srmlsfD7aUhOjC6lUM0dWKt8eWxUOXlaUbwpaWiUI8jiFq+M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzAQMNqnR+nujaeUOp82oNH/ftZR2dGOQRC8XQgBYS3cfkAJu29
	XEzZtOIdKj6j6gzpb479tI/U+bYPusq0Hd4a8by2jzTteMh+KK366AMFti2DOw==
X-Gm-Gg: ASbGncuVk/7z3xA3Qg6hI8vVpQ9i8zy5MMrOEmMRIBha38zl3f2frHLkJ4e0HwkoaWv
	9fjL8QAEtOswUokFmLg17GqjnjUX+sWPEeucPW8vYhGAi12MsgHidAAl8Z1SdCh5J2cvQ/s2Hpf
	LwxgBj124x1CUCLN9BPJQnq/tjAOcuTXSRE7lHevs3k+dVM2d0VncUS+fJYdKES2pOxCZMHiG+0
	S7niltnNa13vBRPB5P1rssxkQKPCZ0vKu5kfWx6zUc/Yhbwnb1ZEkUPHETG02MpofjRLP2pDGJn
	mFlXuLTBPXX6GRMgiSQuT+zMC3CNgOYeSyIY9VD4XlN2AP1QbwhBBVB2WN4XpXwg25cu6/A81RU
	=
X-Google-Smtp-Source: AGHT+IFzTwW0TcXzPL/9HV49c8h7szVsDRMxjGRBWs1/HHxFZV/8F9GvGOd1FZ+sNDL/yaa7WrK/WA==
X-Received: by 2002:a05:6402:358a:b0:5f8:36b2:dc1a with SMTP id 4fb4d7f45d1cf-606ea17a74amr6862983a12.16.1749129773399;
        Thu, 05 Jun 2025 06:22:53 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6073d367974sm313209a12.70.2025.06.05.06.22.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:22:53 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
Date: Thu, 5 Jun 2025 15:22:41 +0200
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
 <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
To: Alexey Charkov <alchark@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_062255_749269_03944730 
X-CRM114-Status: GOOD (  22.36  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Alexey Charkov <alchark@gmail.com> =
w dniu 4 cze 2025, o godz. 21:12:
>=20
> On Wed, Jun 4, 2025 at 10:38=E2=80=AFPM Nicolas Frattaroli
> <nicolas.frattaroli@collabora.com> wrote:
>>=20
>>=20
>=20
> Frequencies are fine, but I don't think the more power hungry big CPU
> cluster gets any voltage scaling without it. Once I try to load the
> system enough that the governor decides to bump the big cluster
> frequency up, the regulator stays at 850000 microvolts, causing random
> reboots when the whole cluster starts starving. With the patch,
> voltage oscillates between 700000-737000 microvolts in idle and jumps
> up to 950000 under load, and the system seems stable.
>=20
> Here's what I used to monitor the voltage (there must be a better way
> to do it, but it works):
> sige5 ~ # watch cat `grep -r . /sys/class/regulator/*/name | grep
> vdd_cpu_big_s0 | sed -e 's/name.*//'`/microvolts
>=20
> And in another terminal:
> sige5 ~ # stress-ng -c8

Alexey,
I see you are using rk3576 board like me (nanopi-m5)
Have you on your board correctly working cpu dvfs?
I mean: [1][desired clocks reported by kernel sysfs are in pair with =
[2[]cur clocks?
In my case i see mine cpu lives totally on it=E2=80=99s own with dvfs:

Requested is [1]
Running is [2]
Measured is [3]

random read 1:
Requested CPU4: 408 MHz=20
Requested CPU0: 408 MHz=20
Running CPU4: 1800 MHz=20
Running CPU0: 1416 MHz=20
Measured on HW: 1579.03 MHz

random read 2:
Requested CPU4: 1608 MHz=20
Requested CPU0: 408 MHz=20
Running CPU4: 2016 MHz=20
Running CPU0: 1800 MHz=20
Measured on HW: 410.33 MHz

random read 3:
Requested CPU4: 600 MHz=20
Requested CPU0: 1800 MHz=20
Running CPU4: 816 MHz=20
Running CPU0: 1008 MHz=20
Measured on HW: 2275.07 MHz

random read 4:
Requested CPU4: 1608 MHz=20
Requested CPU0: 1200 MHz=20
Running CPU4: 816 MHz=20
Running CPU0: 816 MHz=20
Measured on HW: 2114.58 MHz

this is on rk3576
on i.e allwinner h618 or rk3588 all looks quite normal - [1] and [2] are =
equal... =20

my scaling governor is on_demand - so for sure clocks are dynamic - but =
i.e. on 3588 with the same binaries - i can't catch -at any random read =
- that requested is not equal to running while on 3576 almost any random =
read gives significant differences.
=20
[1] scaling_cur_freq in sysfs
[2] cpuinfo_cur_freq in sysfs
[3] code to estimate arm cpu clock from =
http://uob-hpc.github.io/2017/11/22/arm-clock-freq.html
 =20
=20

>=20
> This might warrant a note in the commit message I guess :)
>=20
> Thanks for your review and testing!
>=20
> Best regards,
> Alexey
>=20
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip



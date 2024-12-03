Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5825ED4979A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kv/bDXDpLX0h9bWxvgUWTMNx/ULHSEzO6+v37eKmhD8=; b=XPrg+ar08IJgiNyN8Jb8jSk7Yr
	dZk0gotc/SdTweQppeIkfeocXoUMWtoZghwtX7NTg+03r79UAVJ6omfrr4MGJ+XQrXM90tVONPy7i
	tuDc4wdcS5hDmNrd0Zje8uT2NBboNHbq9t2pcIQMoihsP3qxA6OBeCRJEGaxQILsYlgSvWHHWsA+E
	vOYO1yXmmRt50jR20ts5fIzkToRuXvt4KX6iDucSaXoY0DhH5OVIP7AOjR+kYWu4RL8fzXvCSh5jG
	rJFNbvsl4YMgIo83ZTo0+QrHL77XC0hiIkacbZVmFbWgNI/rWemVcM6uL+LSvXAx17ZiGBw0lGH7r
	WLQ5GoTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPIe-00000008u52-2com;
	Tue, 03 Dec 2024 09:34:32 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPGD-00000008tKU-3f5t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:32:03 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-434a45f05feso65488885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 01:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733218320; x=1733823120; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Kv/bDXDpLX0h9bWxvgUWTMNx/ULHSEzO6+v37eKmhD8=;
        b=iVlKVgzIYvZaYdQYs/zeUnc3hIOUtQOs7kTakVVa45FqVF0dxbGMo6IeGBSbZeBDNd
         Lhq70W/YYqvjPoG3K5nVtYvmu8C4s8bRS4xEYvWUq1tN1WvsFndukSqtLvAs9nkMWcNq
         nTn0/zAHb/BHm3UR7Xm7NN2sLpiMWboQ9bpDOmJ4xs7lDPnqZvwCqSGWN1Gc3ek+eN33
         qU26IN9I4reWPAlt1p/y+uRyNzEUrveEg6bB4w4MMtoxaHVkofwrWY6r3U/E1DffrBT2
         aWvds0PMgtayO0vQVyr9YjF/ZWqzy6Z3IVIAHpzid/Ms1iwPyQalUsFSRBM2SgP+nc+B
         bYDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733218320; x=1733823120;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Kv/bDXDpLX0h9bWxvgUWTMNx/ULHSEzO6+v37eKmhD8=;
        b=mIx6zJ0rx1dAhxMOLYWNLpudQGAl0a7QTfhkGoX4a3MF2BbFvfplsDe8xXEX0ea57n
         QZDHQDNZhW/0WDnRE2IdBYrM1Sv8KgsIWZ82zAQaS338w5ERkm/n0r/bQCGr4eLT566T
         TlvX2sRKwn3++/rCxSzyjE3g7AbjCsGD5Agw2HXZiVvKRd8LdftlUvhpWO087XRSf6tk
         QHQ1D/gU+QlnZY6etsNjWFsSqzE5YP8eJufDlvXXNDFS/F3Kal6c+kvSN3GES5xzL9Bu
         pglvVU9g0oqH7UMTT6r7vIn3waf6ARct1qcjfGbkILrkPzZAsNgEeAYBqZ4PgiLxcBg2
         37gg==
X-Forwarded-Encrypted: i=1; AJvYcCV21LcfZx2pHPsBZyVquSxFDSO+YlL352cE+IpfFr0TFUxVyoO/fagBkDMOeE0cnZudEtOY72Q/ajHuTS1En23p@lists.infradead.org
X-Gm-Message-State: AOJu0Yyc7nj8b3lbxB90T2xEKcbTaLu+zt11fXg0a1PQSxvh3rfS92c6
	7C6nNAA1DeXHXEm+88m+SpRs2WfB1gz4+ihzWM4o4BHXWR+nyMd/Aaq1bhtwTLI=
X-Gm-Gg: ASbGncvu6BB9c2X7iQrz4tjQMbeXMAjG+p+JPUHV6TDIQYQ/UhVsAiiJe1mJxjYsTcn
	nxzyi+oTJmPGfaRSninMfCDOtf5bu3BDLlwC3LzvsZKrCdJWqVd1vjgJuITRN0k4pF4i0VygHbx
	awDJhwqu9J1x3s+7SOpynxF9Gw5zQWPXSjvtbBneQbGMjzbD/VWm1MCVe8CEDYJcRC2o98qxJqC
	IomY1Y0sWQKdrBuKEfSHc3AmGrb1FgNUrPHO5w+eYPfEVrApEgfNWw=
X-Google-Smtp-Source: AGHT+IFK/C18Dsfxx4kwzaYYJOtx8zRjw5Mg8Ta/YqGYVWUqOTuIRgGuf9GpFBBUxIcPs2ZZtod4mg==
X-Received: by 2002:a05:600c:5106:b0:434:a8ef:442e with SMTP id 5b1f17b1804b1-434d0a2864cmr17075505e9.31.1733218320000;
        Tue, 03 Dec 2024 01:32:00 -0800 (PST)
Received: from [10.1.1.109] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434aa7d22d4sm212974605e9.27.2024.12.03.01.31.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:31:59 -0800 (PST)
Message-ID: <2883fb0dd22312d5da9039d4fef869276a0bd430.camel@linaro.org>
Subject: Re: [PATCH 1/4] power: supply: add support for max77759 fuel gauge
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Thomas Antoine <t.antoine@uclouvain.be>, Sebastian Reichel
 <sre@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Dimitri Fedrau
 <dima.fedrau@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>,  Peter Griffin <peter.griffin@linaro.org>, Alim
 Akhtar <alim.akhtar@samsung.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Date: Tue, 03 Dec 2024 09:31:58 +0000
In-Reply-To: <9387c0cf-d291-485a-8cd1-1aced7eba14e@uclouvain.be>
References: <20241202-b4-gs101_max77759_fg-v1-0-98d2fa7bfe30@uclouvain.be>
	 <20241202-b4-gs101_max77759_fg-v1-1-98d2fa7bfe30@uclouvain.be>
	 <c377f3302c6c282ad826211c859e2b65bb1222cb.camel@linaro.org>
	 <9387c0cf-d291-485a-8cd1-1aced7eba14e@uclouvain.be>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1-4 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_013201_909369_BEA3264E 
X-CRM114-Status: GOOD (  38.11  )
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

On Tue, 2024-12-03 at 10:08 +0100, Thomas Antoine wrote:
> On 12/3/24 07:47, Andr=C3=A9 Draszik wrote:
> > Hi Thomas,
> >=20
> > Thanks for looking into this!
>=20
> Hi,
>=20
> With pleasure! This is my first time trying to contribute to the kernel
> so sorry for any beginner mistakes I might do.

No worries :-)

> =C2=A0
> > > From: Thomas Antoine <t.antoine@uclouvain.be>
> > >=20
> > > The Maxim max77759 fuel gauge has the same interface as the Maxim max=
1720x
> > > except for the non-volatile memory slave address which is not availab=
le.
> >=20
> > It is not fully compatible, and it also has a lot more registers.
> >=20
> > For example, the voltage now is not in register 0xda as this driver ass=
umes.
> > With these changes, POWER_SUPPLY_PROP_VOLTAGE_NOW just reads as 0. 0xda
> > doesn't exist in max77759
> >=20
> > I haven't compared in depth yet, though.
>=20
> Is the voltage necessary for the driver? If so, we could just not
> read the voltage. If it is necessary, I can try to kook into it and try
> to find in which register it is located (if there is one).

Downstream reports it in
https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads/and=
roid-gs-raviole-mainline/max1720x_battery.c#2400

so upstream should do, too.

> > > =C2=A0static const char *const max17205_model =3D "MAX17205";
> > > +static const char *const max77759_model =3D "MAX77759";
> > >=20
> > > =C2=A0struct max1720x_device_info {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct regmap *regmap;
> > > @@ -54,6 +57,21 @@ struct max1720x_device_info {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rsense;
> > > =C2=A0};
> > >=20
> > > +struct chip_data {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 u16 default_nrsense; /* in regs in 10^-5 */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 u8 has_nvmem;
> > > +};
> > > +
> > > +static const struct chip_data max1720x_data=C2=A0 =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .default_nrsense =3D 1000,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .has_nvmem =3D 1,
> > > +};
> > > +
> > > +static const struct chip_data max77759_data =3D {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .default_nrsense =3D 500,
> > > +=C2=A0=C2=A0=C2=A0=C2=A0 .has_nvmem =3D 0,
> > > +};
> >=20
> > This should be made a required devicetree property instead, at least fo=
r
> > max77759, as it's completely board dependent, 'shunt-resistor-micro-ohm=
s'
> > is widely used.
> >=20
> > I also don't think there should be a default. The driver should just fa=
il
> > to probe if not specified in DT (for max77759).
>=20
> I hesitated to do this but I didn't know what would be better. Will chang=
e
> for v2.

Just to clarify, has_nvmem can stay here in the driver, just rsense should
go into DT is what I mean.

> > > +
> > > =C2=A0/*
> > > =C2=A0 * Model Gauge M5 Algorithm output register
> > > =C2=A0 * Volatile data (must not be cached)
> > > @@ -369,6 +387,8 @@ static int max1720x_battery_get_property(struct
> > > power_supply *psy,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval =3D m=
ax17201_model;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX17205)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval =3D m=
ax17205_model;
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 else if (reg_val =3D=3D MAX172XX_DEV_NAME_TYPE_MAX77759)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val->strval =3D max7=
7759_model;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 else
> >=20
> > This is a 16 bit register, and while yes, MAX172XX_DEV_NAME_TYPE_MASK o=
nly
> > cares about the bottom 4 bits, the register is described as 'Firmware
> > Version Information'.
> >=20
> > But maybe it's ok to do it like that, at least for now.
>=20
> I thought this method would be ok as long as there is no collision on
> values. I hesitated to change the model evaluation method based on chip
> model, where the max77759 would thus have an hard-coded value and the
> max1720x would still evaluate the register value. I did not do it because
> it led to a lot more changes for no difference.

Downstream uses the upper bits for max77759:
https://android.googlesource.com/kernel/google-modules/bms/+/refs/heads/and=
roid-gs-raviole-mainline/max_m5.h#135

I don't know what the original max17201/5 report in this register
for those bits, though. Given for max77759 this register returns
the firmware version, I assume the lower bits can change.

Cheers,
Andre'



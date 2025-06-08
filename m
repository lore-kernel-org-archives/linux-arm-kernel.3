Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8877C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Jun 2025 07:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eME8R9QRUtbMs6yNjgukeDUBZeLszNLIRLLaAcTHowg=; b=IAKDiFfNIe+pfF6Ppzm/c7IUp5
	4pvqTrZzydgVCSN2czsubYGI1m4Lvti0ug3o+h6+2Z5own2V1FqFDu0YEX7dgiOzeXV2+hOfa8tjT
	0m0PQahIi1Fs4rEvV8IuAuGuANHI6gZzeSitIv7oySDDu02dXGzOlg9pFaPG9NT4jOxl4NOXhtIXh
	2u7YT923i0+y0Yjjao19xJLaB6tkZ/q+kMl+m6U8IO9NLRrg8ZJ4DYml5+irRIjSW0UaSre9+74/z
	sa5iTLWXZlR1JHBLO4flFEAXeHQLps6iQYAQ6FFxUBhghRftEcCMUMXRxJHHH+hduujh0BDBpspr/
	29Cmbx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOAQO-00000002QN4-22l9;
	Sun, 08 Jun 2025 07:26:36 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOAOG-00000002QCi-2GAC;
	Sun, 08 Jun 2025 07:24:25 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad891bb0957so529041666b.3;
        Sun, 08 Jun 2025 00:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749367463; x=1749972263; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eME8R9QRUtbMs6yNjgukeDUBZeLszNLIRLLaAcTHowg=;
        b=QyvB6jpqOFIT+01t75/Js4hlTyxCr0gbYNOpRdOkskxgPpnnThVRaXuuvjopzUnzky
         lRxX268N8OtI0nnrPE7IAjXhuI9/Hccy2lc10Tnrf30tOdg5MnthaS5ohcIJ+/fB5PMn
         CNPGC6UHVRE5go62UV/JOHu9A44xcdLEilKIEfZk3MCt3tRRozGT83OR6jfRVgaBtdxL
         DgGLNEV4xKKF1HVJ43YevvfhlDnyCAnY6Wv+ZaC+y3etwMFe8J3NvslhKlvscch1eYZJ
         wMy6vbW6Ljljb93MuI/K0X4dWWbC8Btbg29toTBj8g1JqmfErUoJEcNSQ4XjxIy2ciKz
         q6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749367463; x=1749972263;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eME8R9QRUtbMs6yNjgukeDUBZeLszNLIRLLaAcTHowg=;
        b=neO4OWAi8gVZ187LW+oc/MQ5Xwm0auZ7zMpmgnEZ5QJusHkedlU7nSjhT6TV1B3eCB
         nztW3EjRX4N2FY5vmrcTTPeDf5FHIgQoE3Tau/tTX29AunULUUW3PpKRYD3C5X/BM0nT
         oDEAi/cNzTa8/FuHmsBFsm0hzh6fsk1ThbU1aDmfvdpLPEw+Fffc5dMC8x11opURAqDd
         Yz49kI1JZIjJ6a4xHUrm80vcQnmXR55aWxoZVpZkIxwmSLzeevp2BOTk5cNErgB5fcln
         KAG7cTuVJXRm2VzDt19ceWPUjobHWafg9JeCAoHeaFLkDskYPD7SLnbT9LJFIeEZ2ZMT
         bpZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJbSOvJd3jO3Jh+q6Vsq2GDtN++Kv0J3qYQMYeeYAQiZeHiksNPzC6YWzy+9OMVH985sSeqt33kfItKSirQ4nH@lists.infradead.org, AJvYcCWyyDSjh6xMPuK85DHX98bF93FRlo7pZE+6iIOZTR1SAUcJzdkWsQXBpnMiZ73d2cOgGGfMbYkNuQPwW5yweuM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz875QEEoC54elwF8mwrgW7XdK8r5i4MefPn+BZm3b2gSmxPnC8
	Ldx87Hs2PVlINhAMoI/JAslMeDSKe2iLJSWabMgG1H7daciCf9ltq49z
X-Gm-Gg: ASbGnctgFIyVNofCaPB5rsKQOa+zRZOG6Ru2iK1Hd7bb+8dob424JVmE7fHODxKJBW8
	tGbg6g1ODCJc1O77f9msrEIl9VLXvkmkKrx5inynGE6IOOYQLlbLp7rFm2913fc5jS6tEoP04CD
	fxexqe9AooVTkSG/+ILluFXPDDP0MhfWduqzHNGKuhL1zZnD1GWy1jWcnLpqpW9+uCgO6wkKYAq
	SsilaJqThlOWzGn6gvAIQm26M6ovzm2g+iLdIDwMyO2Z0KIpJFmWxOgtLW/EsXIVSsNZlb4v8U3
	0fVfYYqMMCHsvd4peYX19qVw+A/1M/LeoQC2vWf6sZJBZEDxTTjniLjoeYiKwhvE879sVHeG+fv
	mEeCcG2YY+A==
X-Google-Smtp-Source: AGHT+IHs2Im8ufOJ5O1PoZh7we14S+ZSLXjoRhkB7jNicHTv/HzPCNoDXtBRaSPrY7thT1gbcil+tA==
X-Received: by 2002:a17:907:6d0e:b0:ad8:8efe:3201 with SMTP id a640c23a62f3a-ade1aaba1cemr833053066b.43.1749367462288;
        Sun, 08 Jun 2025 00:24:22 -0700 (PDT)
Received: from smtpclient.apple ([89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade44af8215sm180104366b.15.2025.06.08.00.24.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Jun 2025 00:24:21 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.600.51.1.1\))
Subject: Re: [PATCH 1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM
 Sige5
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
Date: Sun, 8 Jun 2025 09:24:09 +0200
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
Message-Id: <90218D7B-0CF5-4F5D-969A-909A44E6044F@gmail.com>
References: <20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com>
 <20250603-sige5-updates-v1-1-717e8ce4ab77@gmail.com>
 <6656934.DvuYhMxLoT@workhorse>
 <CABjd4Yx05SCm+03jWbsEP-A5AuhL14wLj=+VdKyQgqMbnxi3xQ@mail.gmail.com>
 <512E950E-E8CB-443B-8E47-79F073D217E8@gmail.com>
 <CABjd4YxGQP=rH15EX12w36b7+82Dedf+rVH3v5V6gBwNv3V3iw@mail.gmail.com>
To: Alexey Charkov <alchark@gmail.com>
X-Mailer: Apple Mail (2.3826.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_002424_582034_53FF06DB 
X-CRM114-Status: GOOD (  16.00  )
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
w dniu 5 cze 2025, o godz. 15:42:
>>=20
>>>=20
>>>=20
>>=20
>> Alexey,
>> I see you are using rk3576 board like me (nanopi-m5)
>> Have you on your board correctly working cpu dvfs?
>> I mean: [1][desired clocks reported by kernel sysfs are in pair with =
[2[]cur clocks?
>> In my case i see mine cpu lives totally on it=E2=80=99s own with =
dvfs:
>=20
> Hi Piotr,
>=20
> I haven't tried to validate actual running frequencies vs. requested
> frequencies, but subjective performance and power consumption seem to
> be in line with what I expect.

well - my subjective l&f is that  - currently - my rk3576 seems =
=E2=80=9Eslower" than i.e. 4xA53 h618.=20
This directed me to investigate this issue.
Test run was media player (mythtv) where ui has gl effects and ui gl =
transitions =E2=80=9Espeed=E2=80=9D are quite proportional to cpu speed =
(and gpu).
My overall feeling is: ux is comparable to slow socs 4xA53@1.4GHz/G31. =
This is with mainline atf + collabora uboot [1] and on-demand gov.
I done test with replacing uboot from mainline atf + collabora uboot to =
bin. dump of vendor uboot (2017.09) and with this ux become almost as =
expected (i mean comparable with i.e. rk3399).

I done test with perf gov. and

1.collabora uboot[1] + mainline atf 2.13
2.collabora uboot[1] + rockchip rkbin bl31 blob [2]
3.vendor uboot (bin dump from friendlyelec ubuntu image)  =20

[a] on vendor uboot:
Requested CPU4: 2304 MHz=20
Requested CPU0: 2208 MHz=20
Running CPU4: 1008 MHz=20
Running CPU0: 1008 MHz=20
Measured on HW: 1580.11 MHz=20

[b] on collabora uboot + mainline atf:
Requested CPU4: 2304 MHz
Requested CPU0: 2208 MHz
Running CPU4: 816 MHz
Running CPU0: 816 MHz
Measured on HW: 808.72 MHz  =20

[c] on collabora uboot + rockchip rkbin bl31 blob:
Requested CPU4: 2304 MHz
Requested CPU0: 2208 MHz
Running CPU4: 816 MHz
Running CPU0: 816 MHz
Measured on HW: 812.49 MHz

in all cases all clocks are constant as they should
Interesting that on collabora uboot [b][c] measured clock is 808 vs 1580 =
on vendor uboot [a]...
sw video decode conforms this diff: hd h264 gets cpu load: 172%[b][c] vs =
87%[a]

=E2=80=A6.

>=20
>=20
> Are these taken on the mainline kernel or Rockchip one?

I tested:

6.15 mainline + some collabora patches

1.collabora uboot[1] + mainline atf 2.13
2.collabora uboot[1] + rockchip rkbin bl31 blob [2]
3.vendor uboot (bin dump from friendlyelec ubuntu image)  =20


> Binary BL31
> from Rockchip or opensource TF-A? With big-core CPUs linked up to
> their supply regulator (as per this patch)

yes

So summarising:

1. i see kind of issue with clock values (e.g. perf gov gives 800MHz on =
mainline atf).=20
imho rot cause seems to be in collabora uboot

2. on-demand gov. seems behave much more like powersave.
this seems to be 3576 specific:=20
-on 3588 change from perf to on_demand is hardly noticeable in ux
-on 3576 such change makes ux feeling noticeable slow (like 4xA53 soc)
i think this is more related to diff between scmi mcu gov algo in 3576 =
vs. 3588
(imho 3576 algo has high latency in clock increases when demand happens =
+ too short delay for  clocks decreases to save power)
    =20


[1] =
https://gitlab.collabora.com/hardware-enablement/rockchip-3588/u-boot
[2] =
https://github.com/rockchip-linux/rkbin/blob/master/bin/rk35/rk3576_bl31_v=
1.15.elf



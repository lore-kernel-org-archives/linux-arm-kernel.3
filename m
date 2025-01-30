Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7768EC02190
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=; b=4GRZZjbGW6IFoRkWLfIhM8rk2v
	dkCH/IwrKB7/jeNPm5Z6QV79frsVsg6/MAv9HIq47hboLF7113TyABvs4bK35nq7o7N2Eyr7CBuzA
	oXFo27kC9NoR+jHKnOPpAtkKh7+lqrz4DiAUdhbFkA8sITsTck2cNaM89AQzY4pNqIyu3lij3mK3i
	FNVVaUprNroWFoTh5AKDiCa9BLpwau9+0/yWFQ3Uux1BDKcAO5f+HhLH8yGGSy5P3Ee3sqcFhF6jf
	1A/EQKkHPVNqRNkoPM9yOiC0qTJCmjBWk2FeIT2koracn92DcvxvLM7exx/9eviaSkeBYlw6B6LW/
	4WVSj+Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRiO-00000008cO5-0F9B;
	Thu, 30 Jan 2025 10:24:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRh3-00000008bsl-0ECX;
	Thu, 30 Jan 2025 10:22:42 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-ab2b29dfc65so106186566b.1;
        Thu, 30 Jan 2025 02:22:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738232559; x=1738837359; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=;
        b=dD0MDZOoC+RfgtWAUADT/fAust/DmlAOx0XchBxMiWdStVU6+UX0tYzZvPpPHXoLtO
         SG83C1SpYbFD1issiP1tHW0DIe9+c7fA7j9Emn7BDYwpRp8hCzFUMdOZAnjgrqiuQwx1
         sD6biQMLok+qY/iEd7kxeh2mPdHD4eJUSlzD9dNWsuFgdfqWLv/TpRmxHgGw7DFBAOHU
         KevxzKtuSnRUgl9Acfm9kiVqjAQIWAWH+j/GwX3RGRNDC0Zqrdr3ujodOHRnq5ETRANM
         oVxlCi/t424XCx1gTmm0ouH/qQZYRIGooaaGkx5l6zbmvd+0KKVAyPhVZ2RAvBNhu/ih
         n5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738232559; x=1738837359;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B4+bp2b1ViozWo8E/9w0GJxuWnjNWQF/PE+csQWrg+E=;
        b=Pk8yDyxayfY0sqWHzQoW6x9h37A/o1T3AG6RtX4y7aZrBXo78jq57qIG9OZ2j2e9JO
         snT43v/WYSC08RTfDDPM5LInZVuPEnIq7k1lZqG8gZxbLm8lj0nA+Kfic24uR87o70SF
         mlRjArweUklLtRulhcTECpBS+NPQQAQFcxvBADyZgc3xFKlRumi60n27INE5G5kMN8Ya
         WyIdPdYVNsR92fmnyxEh0daMDNh6W323mZye0TZJteLaJV7QIkQ4WirNiJtDAhJgwj0H
         Wx+pim248bzT7iFruegX4Ag3IgDGbnnOYkf7ybt8bZHvBMIKHk/xl0L6u706iX0S3WmB
         UkNw==
X-Forwarded-Encrypted: i=1; AJvYcCUC1ydL4/2Pw4ornm8rpj9ntqPe/h8kMndQMQXvJ0Z8dqE1m+V2rNEDMatMSlkrYbw7ceGx/oXmrEtqVqJsV2gE@lists.infradead.org, AJvYcCW3tjJR545gl0ylRUDl7SXZrG6H/aDUxVm9sI9L+1N7CN4mAr454fXfD9z7p63EIDb6jiU3VQLOMWOhOOXUKvg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+5vN/w8bVuLQy1pCgvaI8jBTHQw1lnwbXF7ePiRkIjeI96Uc2
	c2jJzXV5n/2McpwlAjPV0+PV0mikTXGjH3ufEfDGgnBGBpMl9Dpc
X-Gm-Gg: ASbGncvlmlK3j+5PUmbjo/Vz077rgfuKs4WaDEgob9+D7l73JpGLVnKwB7QQcjbQPjI
	94/aV0PNUtjRF1sRksw2kxnqS++pvXe+w0KuyVl4ZSBYfC1Vq265N++cCrFdpQ4IUWAYI18OLEd
	Ps/os2wWoy9Iv42g0LoTjQRECmULFSE7zkqS3ZzMDt6Nk+j4jGiE6nqZdbNRhOWyEPwdisGlMIJ
	U+T4XSP9IaftfBV4c8iyVqiqsb7bU1EjgVTuLg94Dsa/YQDRg9+/Xn2SK0pAMroEnXj8ennaSaz
	4+eZ2g9/vgA3vrhRehcBaFdCY6QPjxVMnAfjB2D06OOJ/tFYG+D8poONWvZhXIrveTRSoy0N
X-Google-Smtp-Source: AGHT+IH6fi2JsJCdV1ZJxiNR7fFgOilQuJF8BsN86Z3dOweQ3P5ERklBaSx+eh4geAQyzNLMc51j1Q==
X-Received: by 2002:a17:907:9704:b0:aae:bd4c:2683 with SMTP id a640c23a62f3a-ab6cfe12da4mr678404366b.49.1738232558971;
        Thu, 30 Jan 2025 02:22:38 -0800 (PST)
Received: from smtpclient.apple (89-66-237-154.dynamic.chello.pl. [89.66.237.154])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7ffasm96854766b.7.2025.01.30.02.22.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:22:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.300.87.4.3\))
Subject: Re: [PATCH 1/3] media: rockchip: Introduce the rkvdec2 driver
From: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
In-Reply-To: <bd5abd7f1e29853729c1c9b57b62e2e4a9524e6d.camel@ndufresne.ca>
Date: Thu, 30 Jan 2025 11:22:26 +0100
Cc: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org,
 Diederik de Haas <didi.debian@cknow.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Dragan Simic <dsimic@manjaro.org>,
 Alexey Charkov <alchark@gmail.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 linux-media@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-staging@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <171D4C9F-AA88-4DC5-87F2-142D642ECACE@gmail.com>
References: <20240615015734.1612108-1-detlev.casanova@collabora.com>
 <20240615015734.1612108-2-detlev.casanova@collabora.com>
 <3333233.eAoTOS8U2s@bagend> <5969581.LvFx2qVVIh@arisu>
 <CE4343FE-94AA-4F84-8C43-8366013AED84@gmail.com>
 <bd5abd7f1e29853729c1c9b57b62e2e4a9524e6d.camel@ndufresne.ca>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
X-Mailer: Apple Mail (2.3826.300.87.4.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_022241_094867_1C0724B0 
X-CRM114-Status: GOOD (  12.68  )
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



> Wiadomo=C5=9B=C4=87 napisana przez Nicolas Dufresne =
<nicolas@ndufresne.ca> w dniu 29 sty 2025, o godz. 17:20:
>=20
> Hi Piotr,
>=20
> Le mercredi 29 janvier 2025 =C3=A0 15:48 +0100, Piotr Oniszczuk a =
=C3=A9crit :
>>=20
>=20
> As for most codec, when working with larger group of developpers, its =
better to
> start with getting the ITU conformance tests passing. Once we reach an =
excellant
> score then we can start looking at specific streams. The benefit is =
that ITU
> conformance can be run with fluster which removes a lot of possible =
human
> errors.
>=20

Ah indeed.
ITU conformance approach is for sure best one.

By asking for way/tool to analyse of playing/failing samples I was just =
curious: is there any pattern here (e.g. specific encoding mode; etc).
I assumed - it there is - this might be good pointer in narrowing =
decoder code which needs fixing.=20




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF32CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 17:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PbL/EGQbhxJhOitVzc5HwwJYAZFXLJWkRn1NxA9OrZc=; b=tgD7tarJs0U7IPEiUobKiw4R+Y
	60rds4qJKTPceDs8lSC2yamp/DySnId2sZvemaz/AlCMFJOScYI6PBVsl2bU5wQULEGcLMR7wJGAY
	krSevYwhlEEw1GUOiT1dOSUgnajGZiut7rHRBLZo1UtKPdgYaD4lyvYrgWg5yOlO1ZSQLivaCcWnL
	H2FbMYPPbyqWhEXZFCnjtg8VgYjRycaZFXZrMRmzgA19NPURpwMcHlFeMF6mzl/J9H5DYWFzq7LXV
	Gk9nrviby8UTWXHp+sdR08qLxEhAr83imxLXn4Ec74DWxJxyRZ3Vh6GXKuhMD2v8UlTlNQfrG+p1B
	QuQVmzWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utrDQ-00000007BOT-0hml;
	Wed, 03 Sep 2025 17:24:12 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utng3-00000006cYE-1jJE;
	Wed, 03 Sep 2025 13:37:32 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-61e8fdfd9b4so2051754a12.1;
        Wed, 03 Sep 2025 06:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756906650; x=1757511450; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PbL/EGQbhxJhOitVzc5HwwJYAZFXLJWkRn1NxA9OrZc=;
        b=KIo/pYVWeuNL/d7N3BAkUf8PAEgwmqRz9Pokd2Yb1VHBYg0ncvbImS7A9Lr/dd0mxV
         4ooguxEMmudczldpUjXnCgir6SbYgAxUBOqFbXvZh0y1hh+BIcQijXsmA88ZBRiJXox7
         giuSCEosOh63miFUQPKvgK+rGk2h/IpszzrvobGjEQUYCL79F69R3jM/5vMJ8WkbdjQf
         VSwfL+UScwdeTFQ0pF+FDSLfrGYM9vs+mefoCRU2klWbgx4YG7i4CKdFBMbeExDCPppk
         nH36P4B6aZYO9s/+XACP+x540ijTthmc0DcQkmd7EoXpyZ010abmI8D0oQ/0R9Ctwh6K
         kG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756906650; x=1757511450;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbL/EGQbhxJhOitVzc5HwwJYAZFXLJWkRn1NxA9OrZc=;
        b=CW7tWvsKsr7QMzIjl5+zyqkmWHXaqaSHiktPaespUjr5Oht+kekDZGrkkCVr4f0C7o
         ly+HSnHS7dAteepAmP/Sjk93iJd5/z12jew6Sedrc4zXLUHJgk2+CWzDVLnIbX6IUOfP
         KqFJj+zZq5/JJ0vI4/mFTsn8HFdGz2h41NW560hB2jvqJZL5uS9AZ4Hm3+Qow5c4FLW9
         N3U/9Wtn5xG04FRFL2dtthbn9nkNI2zv0AcioPB0ygU50pTVINUwmptlDDVHd7a8rNv8
         MWYtJ4wU7zdfC3lJ0HIVvCEXhvvUEVIDPYtE/olIdRPwgrRFqlZS8AyiLnDkr00QrEYy
         tddQ==
X-Forwarded-Encrypted: i=1; AJvYcCVvbw6DtnrkwLqaw2gCC+EO4ZPF1qgnRuc60Pa9s8vwURqreXbEBczxQjM74h+yk8Pney52y2hgALYqR0+D5j8=@lists.infradead.org, AJvYcCXLksKz847TTsF30P3OJrMwd3ODbiepoY5ErcuJ3bttm0fxA1UAq2Ixbskp585oodkPec8sL66njZmnODQ04EiB@lists.infradead.org
X-Gm-Message-State: AOJu0YxVvx6ptH3uyl+RMnr1gJxu5Q99lEuj8Djut3hhqJ9XmtNXIB8C
	G0dyN/PNQc7O1boFaYorznSDm+GdUDN1zFS58ybWq8WEG3NkxfBb86sdfe30nWLMrZA1GFr+pUS
	eXlOAJVX1mW3KWFpF9m1UMPGS6kDoU2w=
X-Gm-Gg: ASbGnct4VAg1kAnwQLpInMry4QH2FYqoDm4XYMmhZL9wflFG71coe1AbSm5ulyUtYsT
	gMsGs8Wz4etoqY4xMl7ijR/lePfq3MoR4gblaGjNHwk/v6Fb1GGceucCwmagPTygMnbmGoxPm9E
	Rwy9aZbjTAFlzyzDqs0Ds02WR9JfLseFp5rkiCRqKbwdytrPaJOvKglJ/2TM5sBhCB2b5hl7BWP
	g2S+QTtGp5yfPllVb+Q7u2qVejEVqnMVTbS
X-Google-Smtp-Source: AGHT+IHvQXQHTKEMoyFaTqaFVMbln/qgY7S7KV3L7ZG8Nf/m54vluMUEQq7iKiQYNXvspMMnhgUINllpQJ2XVCLCUPs=
X-Received: by 2002:a05:6402:3494:b0:61d:9a4c:d03 with SMTP id
 4fb4d7f45d1cf-61d9a4c0e7cmr11965634a12.13.1756906649669; Wed, 03 Sep 2025
 06:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250831104855.45883-1-cn.liweihao@gmail.com> <20250831104855.45883-2-cn.liweihao@gmail.com>
 <42028191.XM6RcZxFsP@phil>
In-Reply-To: <42028191.XM6RcZxFsP@phil>
From: =?UTF-8?B?5p2O57u06LGq?= <cn.liweihao@gmail.com>
Date: Wed, 3 Sep 2025 21:37:25 +0800
X-Gm-Features: Ac12FXx8u4DAg0EdT2iuAXVd9emM64ORc15VdHEwcPQcLyGaOTv-5kYx7yMGYWo
Message-ID: <CAPEOAkTjVN4auBj_CLrt0XN6SqU2=ogLjZDecEwGx00pixJNAw@mail.gmail.com>
Subject: Re: [PATCH v1 1/7] drm/rockchip: dsi: Add support for RK3368
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, hjc@rock-chips.com, andy.yan@rock-chips.com, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_063731_454650_66B2A4B4 
X-CRM114-Status: GOOD (  12.28  )
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

Hi,

Heiko Stuebner <heiko@sntech.de> =E4=BA=8E2025=E5=B9=B49=E6=9C=883=E6=97=A5=
=E5=91=A8=E4=B8=89 20:07=E5=86=99=E9=81=93=EF=BC=9A
>
> as a general remark, this patch will likely need to wait for 6.18-rc1,
> because a big update of the HIWORD_MASK macros was merged [0].
>
> So introducing a new user now would cause havok :-) .
>
> Also when sending a v2, please base it on top of that changeset, or
> just take linux-next [1] as a base.
>
> Also in a separate patch, please add the needed rk3368 entry to the
> devicetree binding [2], this will pacify the bot that checked your
> devicetree changes :-) .
>
> Please also make sure that relevant additions to the lists below
> are made (the binding contains specific settings for some controllers
> furter below) .
>

Got it. I'll rebase my patch serial to linux-next tree and test it
before sending v2, and I will also add the necessary commit
description and device tree binding information.

Yours,
Weihao


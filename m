Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16878C71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yhJ28lUu4tutQ9PFgn6HlLDINbOKz5/YrrzszsyspMw=; b=STQvzmYsbzWC6sydv1A+10Venx
	a3N1v/jEXhdxjYuVrGuqPeLeNasCMTZmJgT/Gphbmh9RP696cR6ppErh/zXqoYEs61/OZ7aJs+b+2
	jcNOwcC6+u6ubIQiMOcC/KN87jGUJNyjyqD1FB/Vz8/x9AwEtgQvtT0sQmTRcTY5CP31K5cMhgaOY
	hMh1klV3MvadhP2vuTS31lfanrLUbWzV95l6lnQGrCztxoWmYm0FBmFAGpjm73DYNK2mUouvJkux8
	/x329qy4NxwHDF7Hcp9+zXBtRLwdsXrBd3cMPWeEvAMsvMjis48pVEqySfHKcGvstyc/UzkX7tZfL
	973FfOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYV1-0000000FH7k-0mPC;
	Fri, 20 Jun 2025 09:57:31 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXIx-0000000F5tO-3bnE;
	Fri, 20 Jun 2025 08:41:01 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4a774209cf0so15808891cf.0;
        Fri, 20 Jun 2025 01:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750408858; x=1751013658; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhJ28lUu4tutQ9PFgn6HlLDINbOKz5/YrrzszsyspMw=;
        b=c5KnR2pwWs3P6ihvIYeh1dulGW0lIkzYx858il49JTY0BCWVfdSlRJaHhmX8Q4xiuw
         T1+Rmxp3yUaGayCerizqYCyLjoM3dQ2zJ2wdKk6Cs2Mi5jPz3pbBeTkPZfkLJYp+44tT
         9BFYMP415sZvI6DLDr+4v6BJDQkkMAWGlIY+aDwGaGu0E48c+yMlTbv+hlDuVE+eBFWv
         eo3AlxYKqUchFpfeiuEzpCx8kI4U6eUXESQLrijFvn4rouOWGOpoeWjDoduXFK54HLa8
         Oh+robdc+r4rzVWY1A6IZa1c2V8gREeML0mpueHr8pE/JCtII7rXJ0Sr9vAMhZrDT6wr
         Vptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750408858; x=1751013658;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yhJ28lUu4tutQ9PFgn6HlLDINbOKz5/YrrzszsyspMw=;
        b=Fjd2RgafiQgVJkaDVGYcRLDzw5xKY99LPLRQp9oIsJShj2rBjK9fjJFGzbkiBIhUbR
         n8fZdsQPB6WEvMThuqcib4yDwYp+voW/i9fMuhe7I1a7o1nOfcaQ9TzS3hlReHm/dm/o
         zGzlJCLR542GDY2f8rXO8YkHXgj8iLyJHp+1NaqVkLcvk7f++KwN7YwnEHGF5w4cNoWF
         +u2oDqN6nJ4rGtrvlhZcqpDbZ1p2tEoxa+OU0T3kqUb8nHOBVcn4jBkzca7aWSkPd+4z
         T8fLuWEZ0I+BymiwRr9NcxxS80oYaYclCKHKyFuZhzW89OsoFBkE5Wz5eIuyy2oO02We
         iupQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX33EeNDV8Zc+aq2+OtAL78B8tTffS7IsAhuuEHpJDiDDluAsR8J7FT+5JAUdhrFMSyh8EckNwidmP64eOphs8@lists.infradead.org, AJvYcCXrW2mOVBfdxPvGuspDv8R126K5MEL3UK3YxKuXVo2goVWC4EihRFNXuqIxjn5EwWHMRIcjU02vyOffIdoA2gs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAlEhMKmDQSBUHuGq5y/ngf9ZbTWOHFb8BSlIOE02/vd7ZuDn1
	Lq9KiULrcu7oNrVHodu4n2u4GIKYqbVimU9Fz9hPZInxca9qcGALGInZfU2nMifR6qM8t4B5D7j
	69NQIlx8XDbM7t1ZALYU/hglHay3RzT8=
X-Gm-Gg: ASbGncuVTZ0TZBIVDCRIqACrQBnk8xwL2uPU+hReWReawhmKsSyWvxpb89ZX1cB2qag
	GwVjCRVBYpdSlrY02f5OWcbM+pQqipPAYNQYCaX15ncLAfqADlskT4lWhFSqRhA5moCr4oY2TQa
	6qhJaiIMHnXsD51yjm4yXCCVJ1AgdqBewIcAg9SaEXPjq2
X-Google-Smtp-Source: AGHT+IEk9QAe1bgLQ65TsS0eFYzhtXpG1Dw6rWlKdy3d7hwrH5nqqmF5IjgTeOnwx7f0dHroCwGo1uFKO/+rc8rs2tU=
X-Received: by 2002:ac8:57ce:0:b0:4a7:74ed:cd49 with SMTP id
 d75a77b69052e-4a77a1c4b80mr30180401cf.19.1750408858127; Fri, 20 Jun 2025
 01:40:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com> <175036770856.1520003.17823147228060153634.b4-ty@sntech.de>
In-Reply-To: <175036770856.1520003.17823147228060153634.b4-ty@sntech.de>
From: Alexey Charkov <alchark@gmail.com>
Date: Fri, 20 Jun 2025 12:40:49 +0400
X-Gm-Features: AX0GCFvyM96QmV7htM0KHUFL5y6LOg8SAG7kA6gR9Sm54nshs6x8Ht0AaNoM6u4
Message-ID: <CABjd4Yzz9mh0G5BhpPOGAoadD-A5eX4kdsF8rGrWk82hAE-MYQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] arm64: dts: rockchip: enable further peripherals
 on ArmSoM Sige5
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Detlev Casanova <detlev.casanova@collabora.com>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_014059_899463_CDF08BD6 
X-CRM114-Status: GOOD (  12.31  )
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

On Fri, Jun 20, 2025 at 1:17=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wr=
ote:
>
>
> On Sat, 14 Jun 2025 22:14:32 +0400, Alexey Charkov wrote:
> > Link up the CPU regulators for DVFS, enable WiFi and Bluetooth.
> >
> > Different board versions use different incompatible WiFi/Bluetooth modu=
les
> > so split the version-specific bits out into an overlay. Basic WiFi
> > functionality works even without an overlay, but OOB interrupts and
> > all Bluetooth stuff requires one.
> >
> > [...]
>
> Applied, thanks!
>
> [1/4] arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
>       commit: c76bcc7d1f24e90a2d7b98d1e523d7524269fc56
> [2/4] arm64: dts: rockchip: add SDIO controller on RK3576
>       commit: e490f854b46369b096f3d09c0c6a00f340425136
> [3/4] arm64: dts: rockchip: add version-independent WiFi/BT nodes on Sige=
5
>       commit: 358ccc1d8b242b8c659e5e177caef174624e8cb6
> [4/4] arm64: dts: rockchip: add overlay for the WiFi/BT module on Sige5 v=
1.2
>       commit: a8cdcbe6a9f64f56ee24c9e8325fb89cf41a5d63
>
> Patch 1 as fix for v6.16
>
> I've also fixed the wifi@1 node in the overlay - which was using
> spaces instead of tabs.

Thanks Heiko! It's annoying that YAML doesn't like tabs, so copying
from binding examples is not a universally good idea :)

By the way, is there any tool that helps catch those?

Best regards,
Alexey


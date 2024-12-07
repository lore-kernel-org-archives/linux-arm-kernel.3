Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA66EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 21:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMhgNfIpxqQDNYdGeuQohUR1HujC9RmLTbgdOuARmEk=; b=aDPlj4cK6nBZtCEPgdSQUbUrrO
	7k4jsqT19n5H4y9KgvQhv51s1w7tJ1A8dn3f5wCUlej0AbWs/lx7okyRqtY+6ncDKVB359ZN56ZW/
	sNWJrJOApfz4+gKOSwbxwJa9fwgL2T9hDEuRBLTBpXm4cRZInWHZ0RMr1reAQqsczxkI4ADiHnkNj
	y7twehchRMWB1pEF3fssgl2T+e+6mrPM1Y7aCeoghNcPhnFcM/3XYa7rkCemu9F5wjZ2wPH2YhOfJ
	KGRhsMRxekVxivOUqZvEXJdx/mGY1VNA8LCQ1AwJpgQ+6mxrRO4X1ClJEqbTuMz9MY54yYkjwk9yy
	4oJ3qXFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tK2c6-00000004Sgd-3Sjg;
	Sat, 07 Dec 2024 21:45:22 +0000
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tK2b5-00000004SdP-02i3;
	Sat, 07 Dec 2024 21:44:20 +0000
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5ee8eaa1694so1498086eaf.0;
        Sat, 07 Dec 2024 13:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733607857; x=1734212657; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMhgNfIpxqQDNYdGeuQohUR1HujC9RmLTbgdOuARmEk=;
        b=cjL/jxXmZDGjbW5mEbG64VJiaVsuIG7ZK27Bd+V3oSZjkU88NRt3L3ssYYfD4CV+Id
         DZdKzLqAHMqhJ3lsdZ195YMqJo1QArwka3gWYxr0ApYu9M+zoTcaaYEOasMykPodkApy
         4UADyOazPMSj3Hk77Ead59QIB7sXNXWHh2gcApd6yMFgpWKiJYHZecwmNMGx+fzcZsA4
         FI+XWJaNujA9ZP/2+uMNhUiUDhqrYu8XpZGk70XXixyDeUcPuH89QFMRMg5JAKnhwDmq
         zadijiiPo0BKRttKo0TWRzUhIcfpCoPZ3LNHaeQsCiOndSBfQduDRMn57ilag6Qst30d
         fG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733607857; x=1734212657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QMhgNfIpxqQDNYdGeuQohUR1HujC9RmLTbgdOuARmEk=;
        b=LjnOVeUaECdi0zjLS+An4qLUd/AZQ7J+Kord0TU3mqfFqhY1z2tw5XIlLbIutWg/xN
         sRE3awOgJmAS2XU1sJek+CILvN2M+lf8Eli+Ii507pqtNxcjRRzyMIp6ad97z2M0vrRU
         WZH9734Gv9xUz6q8WA5cC9v6TMve7cOzH65mdF/J1HF1MdqZcvecnlfMToka0qw9pfXC
         5znGt2JRyhc83txbOSX46hsaA5HpKI54PCXs2pLZP3NFFMIz91KtWC3ML7898vwnte0R
         XWYYHsz1x2/ZnRVRv1hAmjTXpmWCnzqjK4iwj2XWkmgClu0aj0Rlz/zGl74Ub8qINQD+
         Oxew==
X-Forwarded-Encrypted: i=1; AJvYcCUUMxRxou11CgU/f1UrGpzCjXk1qx7JoyqMTcBKPiRSzM5PHBqj1xDIDxMhdd44i6DfPQymiD8JJm6dLZSOd4TR@lists.infradead.org, AJvYcCXOT375jdL+ez/z/bDHrxw3NAW9HYCuIYDPjSVKZaOXxYwHmH9U2wQFgcyvzVtkR1VyUGnKllFaXH91+NInEL8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzDLM0nENxm7zuf4tMP2wbqIXbrBcQ3VDI2XQVHe4t9sviciwbR
	xLOD8Vcn2hVsfs3G1PG9ILoQaqPrMing4ohkBkXtQ1J4Fra2wzyQOrcafGBjSzv+DHG55bLq/2+
	4vt5ZBH4Z6TDrkv1Epy22Ti+Ep3A=
X-Gm-Gg: ASbGncumefjHaNuay67Pq5feQJLvgUFvIv4n8O01wNe1mPOplzwx6co1lVokujZNG1Q
	VXdPXrBGafOqxEmBq/qaaTkDEssisMYJDWiySpmQ2nQmvZXolrvNrMMbvbjdiAQ==
X-Google-Smtp-Source: AGHT+IG8ZycjJP/pPsbMbfgV+YwZuxy2dOx7QSYHn9/CySk4CHpxsuBci2qFQrdfOORTWwrBTmMFl/OjRx4jAcP/4rg=
X-Received: by 2002:a05:6870:280d:b0:29e:5ffa:b769 with SMTP id
 586e51a60fabf-29f73860fe0mr4694069fac.29.1733607857405; Sat, 07 Dec 2024
 13:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20241111045408.1922-1-honyuenkwun@gmail.com> <20241111045408.1922-7-honyuenkwun@gmail.com>
 <CAGJh8eDdj5zwENGWHHdZt8ejdVZ=d4GTNzW57rohyL2rvEA_hg@mail.gmail.com> <CALWfF7+7KSZ2UJUXgS_Pr3=xzMEyjKgZ4BPL47zkmfnM03HUqg@mail.gmail.com>
In-Reply-To: <CALWfF7+7KSZ2UJUXgS_Pr3=xzMEyjKgZ4BPL47zkmfnM03HUqg@mail.gmail.com>
From: Marco Schirrmeister <mschirrmeister@gmail.com>
Date: Sat, 7 Dec 2024 22:44:06 +0100
Message-ID: <CAGJh8eDJMXnjsZgdgsCj+jFp=0iK9kmrH88fFSXxYLevV8aV5A@mail.gmail.com>
Subject: Re: [PATCH 3/3 v3] arm64: dts: rockchip: Add Orange Pi 5 Max board
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Ondrej Jirman <megi@xff.cz>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_134419_049924_3B3470D9 
X-CRM114-Status: GOOD (  15.41  )
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

Hello Jimmy,

sorry for my late reply.

On Fri, Nov 15, 2024 at 5:56=E2=80=AFPM Jimmy Hon <honyuenkwun@gmail.com> w=
rote:

> If your primary focus is to only test eMMC support for the Orange Pi 5
> Max, then apply the patches on top linux-rockchip for-next.
> https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git/=
log/?h=3Dfor-next
> That generated DTB should be able to run against an older kernel since
> the Orange Pi 5 Plus already works.

applying v2 patches was working fine with this kernel. But I still had
the same problem when booting, where it is stuck during hardware
initialization.
Need to check more on this and retry with the latest version.

> Also, regarding v3, I rebased on top of linux-rockchip for-next to
> include the updates for HDMI and GPU on the Orange Pi 5 Plus.
>
> For my development testing, I used Collabora's rk3588-test development
> branch, so all the needed patches were already in one place (since
> they test on a Radxa Rock 5B with the RK3588).
> https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/co=
mmits/rk3588-test/?ref_type=3Dheads
>
> So for v3, I had to first cherry-pick the Orange Pi 5 Plus changes
> from linux-rockchip for-next.

I was not successful with applying the patches yet with the Collabora
branch you mentioned. I guess I did not cherry pick the right ones,
yet.
I will do some more testing to see if I can figure it out. Otherwise I
will wait until the first version is merged and test then.


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CD6CD597A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 21:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/CvDHNQkFyG+LMIK7/fleVlgZZt4uzRHNtjY9nOElHs=; b=NHBM8p6f++SAuKS1AKQHZfnzzZ
	SW50zyGz2G5/fhWCWNjlyGFMjZViDromalNxKKBGWzrBExqqBk43VAwK6aZrNMylZZiPhahQ9c0aK
	65M8TdzybGzoKtPoIEM/K5nDDCVSGx3ArQITg9xETV8PKxeTUyvnHXsdaJXyO/7l0Bnjqh0+KtMSV
	XKgp/VTMqb/MyXLk1v/d7KimR47PXIEmk09IL+22xMUaGSG6pbHZ+uO23c21kkIvT/PdgZy5mSstG
	UvUxJbA+pXYepRT8M7JSIskaEJzl/zy02LnAJrwf6RFjr22mgnLAL+cRtAW3Ri4DQl9gLu0HoedV8
	uTo6ELhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAy65-00000004xPr-3jzD;
	Tue, 12 Nov 2024 21:06:49 +0000
Received: from mail-pf1-f176.google.com ([209.85.210.176])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAy4I-00000004x9P-0rKS;
	Tue, 12 Nov 2024 21:04:59 +0000
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720d14c8dbfso5879721b3a.0;
        Tue, 12 Nov 2024 13:04:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731445496; x=1732050296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/CvDHNQkFyG+LMIK7/fleVlgZZt4uzRHNtjY9nOElHs=;
        b=OwTApPvR26O+8Q8g2hJhgrDyXm63WUIjhRraX+iehKt76n3WWujoU9XxHrUW1Ft2K0
         XC64/e7Wsui+u0dCOPzKtYMg6ITi790Kg7wBFp3aMRr5DeC5TtPe0/PPaAC90fiwCD0d
         rjGyz/DFexBzxckBS5pLxrbdPFmhWf1Z6CywBiV23bPFxgvc4wHOC1Xhpkl+f7g0h3A3
         LTphR7lEId7XdYpJgkw0ydAk4arXR6OBZ+noY51rrbSu6r9bCzJe91l0DpZYeGZhUhRh
         9NUnhCF/MRt9y7PONPsQb8zZveI1/2joskws0svD7FUqNFZGyj9OrmGtBb5p2l9L1Rwt
         g9hA==
X-Forwarded-Encrypted: i=1; AJvYcCU4kFgNnzd+atWfJG51cyl48oiYnzvWRt2TIgimQvf1q6muMoYlimgtx7IvrnIms+caZdhJHLice9+2N/7bN/+j@lists.infradead.org, AJvYcCX1u5pqd/WZcTy4739P8bxHtELnEhNOddDFuP0SUPphQ84IAdtMjSQOGP0e12QtrzBSf6ZuwT9XR0GicWLYFPw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyReteWU5mNLqgd9I2Ooi//Bpw9Z3nH9qQCqj+q5w07VMYatEdE
	2rCQr/SsHRQfH9b+r6OzcfQUAffMZf8xv6Y3aQMHSy9T9UbXAi4Aw5cYXPYr
X-Google-Smtp-Source: AGHT+IFOuU/TQlMio4yVrADj0Xo6GL6esFiLgxG17xv4+8pItPCYSkpLx245g8m7kGunK3GyRHnLPg==
X-Received: by 2002:a05:6a00:22c6:b0:71e:67e7:1a4c with SMTP id d2e1a72fcca58-724579bced5mr795729b3a.12.1731445495024;
        Tue, 12 Nov 2024 13:04:55 -0800 (PST)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com. [209.85.214.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a18d8csm12139132b3a.149.2024.11.12.13.04.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 13:04:54 -0800 (PST)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-20e576dbc42so65537295ad.0;
        Tue, 12 Nov 2024 13:04:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVVJTfP458cxd7mcaTilfYkPBKukUbHNJHhIXZiU1iDFnDdS38Au+BERWwRqNkv4K4ZSPx79CFh6FqffX3zcuB1@lists.infradead.org, AJvYcCWqxyAS8jlqbR6Qifb93AB4G8txxhXB1yn2Cp0g6kxhMgpaYBy8jBXMAOBrBD7ZI+mVvrom7qYZ/8jOLvqu2dQ=@lists.infradead.org
X-Received: by 2002:a17:90b:524e:b0:2e2:d859:1603 with SMTP id
 98e67ed59e1d1-2e9f2d5c5a7mr421987a91.25.1731445494243; Tue, 12 Nov 2024
 13:04:54 -0800 (PST)
MIME-Version: 1.0
References: <20241111181807.13211-1-tszucs@linux.com> <20241111181807.13211-4-tszucs@linux.com>
 <4ba81dfa-f276-4e05-b46b-92f50dbcfcc4@kwiboo.se> <CA+GksrJLpeU8x-kjR1Ng3ySf+giiufCsJuBssng9qoX1PjAunA@mail.gmail.com>
 <9330ebb370780c001fd2aaee49aec9e8@manjaro.org>
In-Reply-To: <9330ebb370780c001fd2aaee49aec9e8@manjaro.org>
From: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Date: Tue, 12 Nov 2024 22:04:43 +0100
X-Gmail-Original-Message-ID: <CA+GksrJjDPve29Vh7ZFhM+JFp058xmXZAPeuLuFth7v=JeiH2w@mail.gmail.com>
Message-ID: <CA+GksrJjDPve29Vh7ZFhM+JFp058xmXZAPeuLuFth7v=JeiH2w@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable UART8 on rock-3b
To: Dragan Simic <dsimic@manjaro.org>
Cc: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Chukun Pan <amadeus@jmu.edu.cn>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_130458_266630_1DC7C33A 
X-CRM114-Status: GOOD (  14.88  )
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

Hi Dragan,

On Tue, Nov 12, 2024 at 4:07=E2=80=AFPM Dragan Simic <dsimic@manjaro.org> w=
rote:
> Please correct me if I'm wrong, but isn't this UART supposed to be
> used for the Bluetooth part of an SDIO WiFi + Bluetooth module, in
> form of a non-standard M.2 module that Radxa sells?

UART8 is supposed to be used for any radio module connected to the M2E
connector.
It will typically be responsible for Bluetooth or BLE but it could be
802.15.4 or whatever. In any case, all wanting to use it will need the
uart8 node enabled.

>
> With that in mind, I see very little sense in just enabling the UART,
> without defining the entire Bluetooth interface, which AFAIK produces

Defining a bluetooth node would hardwire idiosyncrasies of a given
radio module's Bluetooth core. Sure you could add a sleep clock, all
kind of sideband signals for wakeups, reset, power down, etc. But hey,
some will use them, some won't. I think it's undesirable and
unnecessary. You can hciattach from here and most will work just like
that. Tighter integration or anything special, module specific on top
should be handled individially, on a case-by-case basis. This is a dev
board after all. I say trick of all trades.

> nasty looking error messages in the kernel log when there's actually
> nothing connected to the UART.

My dmesg is clean as a whistle
root@rock-3b:~# dmesg | grep -E 'fe6c0000|ttyS0'
[    0.344818] fe6c0000.serial: ttyS0 at MMIO 0xfe6c0000 (irq =3D 26,
base_baud =3D 1500000) is a 16550A
What kind of nasty errors do you recall?

Kind regards,
Tamas


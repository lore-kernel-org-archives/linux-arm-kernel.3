Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C67C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 21:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m557/Jpvp5pp4+T1xIHiZmJOAkIv767CgIPPPqCBZEw=; b=i0QN8a+w9cU2kS+D6kn6AP5Iq7
	KDKTCcC06MEFRCNCP5r4/QahTMTaXyhcOgPRqNWmjas/iD/3MC8WSa2aa039NqLZGjwVtl8xcZ3Gm
	QNlAAbFzb2x8pFAV/EUH7K1jrRoXu3rAz9DMLfmxFSEU4GdoAEf66sZyA7vNEjWBVUgmIdm8wtnU9
	BicJ8zWJDoDCRfwafWhU84rFz6UypaW8VHFNDpwJFTls4DafRmFtRyXEO2tEWRtxLDevbgqyzapGg
	wJy0entsIa63ELcWflnGrNHX/rIM27Pk35PeV03RDT+Wd1i55FAzrUt2uEQGM2bKL6gGsuT/QQ4qo
	Nnfnrf2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thbWR-00000001Wpq-26s2;
	Mon, 10 Feb 2025 21:40:55 +0000
Received: from mail-wr1-f43.google.com ([209.85.221.43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thaQj-00000001M1a-3U7R;
	Mon, 10 Feb 2025 20:30:59 +0000
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-38dc5764fc0so3522935f8f.3;
        Mon, 10 Feb 2025 12:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739219456; x=1739824256; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=m557/Jpvp5pp4+T1xIHiZmJOAkIv767CgIPPPqCBZEw=;
        b=JJIlPxsm4VaD5AucE52idAQzYAz7j9iJDD99SU9YmJ77X6Jlxi9CzbpreV2K9OTvWi
         90KL9mVXt0XCyjDTnDL3Es8CyjcNDzFpfJbOpcLiq1QlOf4hZlEDGCV0+YJ5m9exzYrc
         vGJi+Rt5R8MRA1scUulRM7+yuxax99RVEmuMtreq/0aeHG1uCacqSf5y3+3KgiOf4MHf
         B/lsPzcPYnluGYJptRWu1vp853h9+G79YEqVKioKYuhxuKAX1+CFjt0FRQIerv91mfxn
         VpevnkjtVwvwbMiu3tAeCXCg6orbOPbpnGt7oooDcKaoKth6swyobuv6+BlkJij99zQr
         xpbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739219456; x=1739824256;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m557/Jpvp5pp4+T1xIHiZmJOAkIv767CgIPPPqCBZEw=;
        b=IBQ8VEoBIat33rTwiWeCgN+cztCnWigUuvzADvR5j2sCP4jirNuPuXSZtDQ8IDaT6P
         N1+K/MY4Mpx1PziDS1e5NTpqHqR+/L/YISz5nmm49ve9XHRsCY3/SL0BuVsigmGeyWUl
         E6lIWyt71uFWHWmVJkfmky2EBSVkZAql5KA+ZfBVK+dwFsRruipBhVjE238wSgH+lRfD
         B89xQUXI6JC+HgasA5UYlqGcIu+M6FMqxxOCTWsATPC/7HzboK4UqsTYSyKogXa3sFc2
         yw30tka+ytdxvmO/uhlBNhIYgDxnR83v9r+aDDEvjvMc0i0SbRdLQEjOEg6SDkkGoPLo
         nAkw==
X-Forwarded-Encrypted: i=1; AJvYcCUj320HIYAD5Z2j/I9LXYotjdlU16Ty0xA0Ftwz0idyTc/QgIoszuypZy6XmKScmJA7THvj9kRlAPrgJrQ=@lists.infradead.org, AJvYcCWdB/9XaY5oRx4K5sAmHb0stEx3EYkkSCNNZREj9U6Tcs6MVO1qhj75FwhQJT5IyaFam3ElPEPVZ8TlzO1AbIol@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm8Onr1ggJehVmki8qSUTZasi+tv1hDvx7FEZ+x7B3hMG0Uu6V
	xiAx8u8alkVk3o/z6zqNLoEr82Ir/E2OU4cpXim54ry+8j6s644a
X-Gm-Gg: ASbGncu0DXbbUNJtyiHMK+EfPmFJZ152ZZ/Yk2tGm5zzorkNBYg04YY2XoATmWgA935
	h5xj8DG4UmXFJpWmJ4gUDq8LysR6b1ofujU/UhQaKcOHZzyQ9gzC1u2VZn/0ZlyOJIYOFmFMCcZ
	VL6oGPboayraHLLpvJXC4iKeoSKJgZHZ/hJ8eSLMiZqK8gWqrawkOIX7/2lNB5m7yFmu1vBO8oQ
	PTlpigjQjSlwV3mxWr38SCpATezv7TrLOOqMhGo1Y2u25a3bUgIg0Nys7EpINOacrfTNgqayHZ/
	pXiK6LEIuLgk22vIZzmA37+vGXx0PUo2
X-Google-Smtp-Source: AGHT+IFvurPoS9MTaLS3PpCWAsYOJF7NzTYw7+2Z56lUplq4lRolzdbvYN3eBpQHiYgZPARX6B6e0g==
X-Received: by 2002:a5d:64eb:0:b0:386:32ca:aa12 with SMTP id ffacd0b85a97d-38dc93745famr11388110f8f.49.1739219455327;
        Mon, 10 Feb 2025 12:30:55 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd9c48173sm5389541f8f.37.2025.02.10.12.30.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 12:30:54 -0800 (PST)
Message-ID: <e76da2aff03e9c788bc322d84d83b0e6c28f44b0.camel@gmail.com>
Subject: Re: [PATCH 06/10] dt-bindings: mfd: syscon: Add Cvitek CV18xx
 rtcsys core and ctrl compatible
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@outlook.com>, 	linux-pm@vger.kernel.org,
 linux-riscv@lists.infradead.org, 	devicetree@vger.kernel.org, Haylen Chu
 <heylenay@outlook.com>, 	linux-arm-kernel@lists.infradead.org, Sebastian
 Reichel <sre@kernel.org>,  Arnd Bergmann	 <arnd@arndb.de>, Philipp Zabel
 <p.zabel@pengutronix.de>, Rob Herring	 <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley	 <conor+dt@kernel.org>, Lee
 Jones <lee@kernel.org>
Date: Mon, 10 Feb 2025 21:30:51 +0100
In-Reply-To: <fe1fb66d-285d-41b6-af71-89f6f93d1cf0@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-7-alexander.sverdlin@gmail.com>
	 <fe1fb66d-285d-41b6-af71-89f6f93d1cf0@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_123057_866088_679EB25F 
X-CRM114-Status: GOOD (  10.47  )
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

Hi Krzysztof!

On Mon, 2025-02-10 at 09:48 +0100, Krzysztof Kozlowski wrote:
> On 09/02/2025 23:06, Alexander Sverdlin wrote:
> > These syscon blocks will be used for CV18xx reset driver.
>=20
>=20
> No, implement proper reset block instead of abusing syscon.

I don't think it's an abuse... You need to look into the corresponding TRM =
[1].

4 bits I need to tweak (and one magic number into unlock register) are rand=
omly
placed at random memory adresses and otherwise adjacent bits have random
unrelated functions from random unrelated subsystems.
If it's not syscon, I don't know what it is.

It has a reset HW block, as you and Inochi have correctly pointed out, for =
other
purposes, for resetting the SoC IP blocks. The overall SoC reset is complet=
e
mamba jamba.

I was thinking now about a syscon driver, which will register_restart_handl=
er()...

Inochi, do you have more insights into it? You've mentioned RTC and 8051...
Looking into TRM I don't get it, why a thing blessed to do all the housekee=
ping
(and called "System Controller" in imx8, for instance) happen to have RTC_ =
prefix...
Would RTC subsystem maintainer be happy with a monster driver which has tie=
s
to all other subsystems?

[1] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01=
/sg2000_trm_en.pdf
("rtc_ctrl_unlockkey", "rtc_ctrl0", "RTC_EN_WARM_RST_REQ", "RTC_EN_PWR_CYC_=
REQ").

--=20
Alexander Sverdlin.



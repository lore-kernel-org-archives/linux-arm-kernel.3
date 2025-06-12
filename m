Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED7CC71151
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 20:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBSJcOpXxu8Nk2XaqOIUz/lrKkb5r1l+pE4x8iGOPKo=; b=dma7wK94VXRbharhfEv5H65ivK
	EEpRd5prPvkjXw1wOLKXp2WWrWp4enAND/6tnuwvIwVYOPdQdrZBcoZ7kmo2iOC2pCz3orx6AASkX
	XYE627H5+dKtkl8OYuQvrUodjwItY/Uwg+a2kz1n1UsrwPEeMfcgzFVKdFkD/VoBttL+yjgYV7ZoF
	j/d6plM13pcqT2wzknBXg2V4/FUlQqRisfTQp4CtzvAO+yCEA0zUScpaLaGfhANzEN1CHC3gYZsRm
	PgWMAXZXWnytQfutcSWOmwRHSVDVzwd3sE9UD7fq82yQDsnVCG4us1BlQz66UeGBbw4f7cZxZTH8v
	FPIRr0bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPowP-0000000EXGV-2cmq;
	Thu, 12 Jun 2025 20:54:29 +0000
Received: from mail-ua1-f49.google.com ([209.85.222.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPiC8-0000000DUoA-2pj2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 13:42:17 +0000
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-87ee848a74bso248481241.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:42:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749735734; x=1750340534;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PBSJcOpXxu8Nk2XaqOIUz/lrKkb5r1l+pE4x8iGOPKo=;
        b=WErsFnEDAC8XNr4bQI5cIR/pi1jhfgANIb2h9Lo5GmoiOhJXCal3PdNAU79yoW5gvb
         g7ZEUTQ2LNP03fecN4YQ0lrYX4+hAJA0MGGBq9gSw553IBM28QHN0q9ReBECpr6SSYCe
         z3LEBHPn/4L8FuawAjKIpgV/CL4EkmC4G06LUZvVYCYerqz0MwtKBJ4jEvL8jPGdydKs
         zgeZVZN5RFxdgxdqv+eW+Z+3a2OiLxREk/5nqA7A9WRYbHY9Awau5GtpSI9NSHZniOH0
         XHHyPn5tcAclnEpE0my83JnznYXyzPOATcpEQMTOZwK728eG5J4KXIlJxJaT9rvhvo+Q
         aH5A==
X-Gm-Message-State: AOJu0Yy/siSyXVySS5RScZKcKY2InQipJZzj8kpvpgMRLQgFryASfabf
	5ibtDsM9iTDC6HRCZv47g/Fm7E6rnbpbN59cpVFJnUWsPK1k4DPh+JvWxfKmX7Nr
X-Gm-Gg: ASbGncsyIBmxp1cY7s14mDfTnNdMjkBl2CGgQqcxuRCUYzKQLHk9yl9B0KGV6fyq4T5
	CHDyHajWGfl8f1oRPdGhNVy1lT8RJmQHAaMt9ZEpV5H5PE2X1/5ETCeJG3pkTb+wzndG9JdwSGG
	8TMEeGwL8eDc35nS4uvfDcuHmFcMw5D07OD++afVjBFQ2vb2UUQtryiRQztY58dxdz89CLpBymt
	+EcxaLzDYEkeefbyRNu2bySXVOSch3o3C4CCstsKrmJfcnICU364oD5xeNr5hDGx1HejF2njxS6
	eJ03uUB50K/U/7KYE7t6QtWDMDKe5Z70GhFV6HdhXreu88MwkN9w4ccbo7/mgBKkm/uHvn1plQG
	ECYZjCmX4VyN2vjagB94OHuF1
X-Google-Smtp-Source: AGHT+IFh73e7003c0/8zCIrc5ZR+n2lfWSMILknah2AlnaHnrR44/7PbGKLVUw1lhGBnTxoZ74boAA==
X-Received: by 2002:a05:6102:3e1f:b0:4e2:a29d:ecb6 with SMTP id ada2fe7eead31-4e7bae7360bmr7349940137.1.1749735734123;
        Thu, 12 Jun 2025 06:42:14 -0700 (PDT)
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com. [209.85.217.46])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7d07b6caasm229422137.6.2025.06.12.06.42.13
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 06:42:13 -0700 (PDT)
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-4e7c7b6e5b6so272107137.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Jun 2025 06:42:13 -0700 (PDT)
X-Received: by 2002:a05:6102:8003:b0:4e2:a5b9:df1d with SMTP id
 ada2fe7eead31-4e7baec76a6mr7321614137.8.1749735733720; Thu, 12 Jun 2025
 06:42:13 -0700 (PDT)
MIME-Version: 1.0
References: <20250608215212.1619182-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250608215212.1619182-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 15:42:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWM=KazUzpaPvUDdJ-5qcgG-7ZD5BJPuKhNktBevZ--NQ@mail.gmail.com>
X-Gm-Features: AX0GCFveIMZ5PUkBzPLlVATe778amDQDvOgnEVFgoe_6ipYROtU2cjeE9uVnk5E
Message-ID: <CAMuHMdWM=KazUzpaPvUDdJ-5qcgG-7ZD5BJPuKhNktBevZ--NQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: Add bootph-all to sysinfo EEPROM on
 R-Car Gen3
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_064216_710924_56BE843D 
X-CRM114-Status: GOOD (  19.21  )
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

On Sun, 8 Jun 2025 at 23:52, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Add bootph-all property to sysinfo EEPROM on Renesas R-Car Gen3
> Salvator-X(S), ULCB, Condor, Ebisu, Draak boards. The sysinfo
> EEPROM is used by U-Boot early on, mark it using the bootph-all
> property. No functional change for the Linux kernel, this only
> reduces the divergence of DTs between U-Boot and Linux.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


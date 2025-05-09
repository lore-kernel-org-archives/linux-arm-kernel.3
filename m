Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E237FC3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6qh1kpnXLhGMK5fFZMLx3nG4DbkRsQh2PkGfLRM08jc=; b=YQ3dPXqKzA01G8vdjrPFXtfnXF
	2o20mZljtkzUg/VxCPXY/tDJpOXzRaphEGTvAYcf7pR5sl13r6nmWHmmmdLJYdNlqNujCG+PNB9wF
	t7QVe3FphCMyxHJw8exqXuzLA7BlQ02PAPDVba1Jd2Ae0k9S83A8DVMVgnMhuFo1P++hrKWYEs+2I
	HKFiJxIyGNz0WPZO3GDwpvRfORIt9QQhw99XEGLmFSwcq0/fXRllNc+ylU83YEx1EkVuUg/a/pNys
	uVLBGVuussKdq8MNY2C633OfNsrd+OxSsKc/PBQg/CFyIbaxOSPu6YBWiq+FjG8vE0gqFD2SUJcZ5
	2EwX4leg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJf-00000004oXV-3q4V;
	Fri, 09 May 2025 20:27:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDRuA-00000004V1d-12fY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 17:53:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64F066111F
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 17:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1508EC4CEEE
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 17:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746813181;
	bh=6qh1kpnXLhGMK5fFZMLx3nG4DbkRsQh2PkGfLRM08jc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KYPeF2e0gaLptqc4TD5jJFiiJApK2N29J/F9skd2/lbr9V/xtudvVuAtBvZwMZEsR
	 epdEd0Z3cvVwQjZ4ibniWOqrqlMMI1IBcJVNL66bzS3REij573mONEd80UkJj/UgEr
	 Q/MyJV66SUD/Fv0tr35XuNnEKpWINS/TJlM4db1LF7d81J78SgTBueme7A4bjLobFc
	 K1buvIaWFUeeUdCKeheCUflx47ZXaqX8rTS3M0HIEh3qqsu/ToMV2fl9O0guWAAsgR
	 VWWlLcnKhlWoajmnX2EpiOC7GemMQs0SC3LA3eHsf0GXcaek9ClBk373s8xABFcFeV
	 l2Mhsm+b7jfZw==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-605f7d3215cso1254483eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 10:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVbt8nxNBlsuazdT1KEBv8i4l3G5IE/kcVosh6+ba9R474RvIUSAUoBnywOXtNUmqddeqOnTyKNJqW+X72dDJ6Q@lists.infradead.org
X-Gm-Message-State: AOJu0YzUOaZP3N9bwGhtc0n4p4DSKFyDOxbY60HUg6GBgYUxF/BmMW97
	Zybe0zzvaFaePsadYkhpjPdYgQ6HHMmxEGkQTSXBidOqVpnq8ulvCmH5RiCgn6hxD9EVe//4C/p
	G6j1u3ckBCf5/ZlCSTzC+tKLZYmg=
X-Google-Smtp-Source: AGHT+IGqAO1NwmX9K8B2d4bnSZvF3kh1DOuKLKUj/nnztQbKYPB12Z3r1lDGWnb1JX+dVefpvJ5WcHa5xsOcVI9pvtU=
X-Received: by 2002:a4a:e849:0:b0:606:42b7:2b02 with SMTP id
 006d021491bc7-6084b648663mr2808550eaf.3.1746813180338; Fri, 09 May 2025
 10:53:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250327195928.680771-2-csokas.bence@prolan.hu>
 <20250327195928.680771-3-csokas.bence@prolan.hu> <CAJZ5v0jmuzvo-xzGBDhGVBbY7svbrqEdi-SeJrx5BG=qtN6ZiQ@mail.gmail.com>
 <b38b27d4-c3d3-450c-8634-2e07f393a76c@prolan.hu> <CAJZ5v0hRsXw45utNMEhLB=i56tsJDz8AvYfV2stPbtRHh09HUg@mail.gmail.com>
 <8dadb7ae-1a7d-48d4-8dbd-40f6d9f35a6d@prolan.hu>
In-Reply-To: <8dadb7ae-1a7d-48d4-8dbd-40f6d9f35a6d@prolan.hu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 9 May 2025 19:52:49 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hNb8eB2tAig1BiUMHLQ3JRak3EXFid9qmHz6iWvh5q6g@mail.gmail.com>
X-Gm-Features: ATxdqUHjSbCmShDsuftLa5CYrYbxG7uxRqBhgdr3aU8tmqrjuRy1EMqjspyvarY
Message-ID: <CAJZ5v0hNb8eB2tAig1BiUMHLQ3JRak3EXFid9qmHz6iWvh5q6g@mail.gmail.com>
Subject: [GIT TAG] Power management (runtime PM) change for 6.16
To: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>, 
	Mark Brown <broonie@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Varshini Rajendran <varshini.rajendran@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	linux-spi <linux-spi@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, Len Brown <len.brown@intel.com>, 
	Pavel Machek <pavel@ucw.cz>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexander Dahl <ada@thorsis.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Pavel Machek <pavel@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

The tag

git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
pm-runtime-devm-6.16

with top-most commit 73db799bf5efc5a04654bb3ff6c9bf63a0dfa473

 PM: runtime: Add new devm functions

on top of commit b4432656b36e5cc1d50a1f2dc15357543add530e

 Linux 6.15-rc4

is available to pull from to receive a power management (runtime PM)
change for 6.16.

It adds new devm functions for setting runtime PM status to "active"
and incrementing runtime PM usage counter (Bence Cs=C3=B3k=C3=A1s).

Thanks!


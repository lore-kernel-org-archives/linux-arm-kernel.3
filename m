Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FD9C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 07:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wb5qvTnPUM1Ol9JNA2tWO/vRefXXoUSqF58bo/+ZxNQ=; b=UzADCICEL9LfbLxtSPkGubU037
	KfN/mhHMzlJ/8iDden7h2e4utUTmN0YwmKZ2xXzJFsSPMfnluw3IC3bmQseDT8ZF/GufvTgl9DCmG
	8CqJkqNstApueIQqHiCiCFKUb0UlUnf/CXR8ezLOZm1doA66QFS+r0traOtkGDTo8TvNNMe852MLE
	2knTx+A1YyIDLntoYxvKXPwmsbcL76FMmb1pk8z2rBoMajADczYfkOFUXKCwhOAve8eDKTc+0+0uV
	wb5lNGkwu+tL2skwlUwSeKBtyKhVk6YFYD2NAi1XcmSZ/ErH/5tchaIu1C8lgtemEiPZtnBhWUw6X
	dz6lbPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqEF-00000006eBD-1hgd;
	Mon, 05 May 2025 07:27:07 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBqCE-00000006dxE-36TM;
	Mon, 05 May 2025 07:25:04 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-af51596da56so2915270a12.0;
        Mon, 05 May 2025 00:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746429901; x=1747034701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wb5qvTnPUM1Ol9JNA2tWO/vRefXXoUSqF58bo/+ZxNQ=;
        b=QS9ubLeBYB1kCNmp6JdEOoL6tAjoUEgozXPrev2ZW6kspIOgyNlFv+li7YI7GFEC49
         CH/nWpEKgauJB1xM+9kvEKZhgHb4ZAyo2NcCocMt4/ZQWM0KAczdYohNtYAvTQB+Atlt
         K6NabEtl5/kYU174ksYKLwAfeBtq6kjIire8Rr3NgjUMkO5qj5AIM48jwLg2/tJ8atRC
         3iPuN2CIQtOBfhTHP2Qe7upKT/5XX8vDuhkokAnitzgwl7h1oAeclT9Y4d1x+lMJmC2/
         5Qz7cyLff5ibEmffUxJf8FId0JwYlBH34b5HNXOnZVygGHxw9ohYFV/qKXCA+X9Gergt
         xaiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746429901; x=1747034701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wb5qvTnPUM1Ol9JNA2tWO/vRefXXoUSqF58bo/+ZxNQ=;
        b=CY80Nf7dnG1572wYMbrPA7hh/2gZvm6ZvtUyEQy4eDG8O5Bq2lLLZu6daREr+g48Ja
         ar7hN/7r6PRZqYwmRPr0+vxWPCaUcDRkVQJtI1bLqHQ2nTSjKe+fqm5P7M34SCl6Wpd7
         62O2FDgEMOMHm2vCgh3WlhyUefogKO1lp9m+xOYnJyfhV93Iu9X/ttSpndwCwSezeX1h
         m+rfbfGKaAxcF+Yuh3ejK9rxnignIsK5OLTxIUY+YzNE0rDQ9YxsrHeeI5Ak/iAZ/nZ+
         BrflohWiyO5Ytgc8yNZw8vFi8j6dgKDIH0X3ct5Ggo112MWGzOBPTZ9eoAjbTex8IzTk
         hkcw==
X-Forwarded-Encrypted: i=1; AJvYcCVtB1MSWMhJQ9S6WPwrFpeGMflbxnjbjdu7Wuw0ssALA1cFTNy0qQGCs6/EsBRLtQ43e2k8LTXDxAkTIxx0cTjv@lists.infradead.org, AJvYcCWC5xJLV7dfT2fpag41fuCzgpOyMOiANgWz4LerMbDiQhfP4ovD4G9oestmY/wyCMtnD4+akAyfYihwKk5qpGOmzw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTJalrRTK3gBq6cPgrk1aLKm5MrvsZ/LnivFM5HlDFFlmZao6U
	T2U+lYHoo391evQ4mT+yXDc8ifvtASiUS3TQRNnUnMYZVHefJatQ
X-Gm-Gg: ASbGncs47kkJ1Fao3zAuFYn1Evqh3NR5h2zq4wkN+9EiEenjRdpOvzb+ADUrFlGZ+ci
	vBwPFxSIJ7Dp/rqGD7p+RtWGbX9g9E1yfgESqb7HxvLyYzgqJKosbWnbCOd2e1CtsHvSDBlkOE/
	eJE3SOfscf4JYq3XR+QzmuRp4Tqf8lgu8Zd85JoLvZZDoMqKOgdIBeLdKXexiS4J7V/pf76vyfM
	4COxOKYZV4rvy4yyf5Vb+dunvXtN2TxmkaJ5DiTKaapLnbz2oEBDvXHsy8eO+fb9MF+Xbx1O/84
	pdu7inzljCYDhm0OgyZv3/sRwI7SeDWurFGT5IDEPyUqjE6q3Iaoqg==
X-Google-Smtp-Source: AGHT+IGVG1kAkM03dHDBqgAZ17yvSfG8Lf8Gc6OKwsCxPxmUgPj69TVFM70BIdzaECoV/A7XImgaQw==
X-Received: by 2002:a17:90b:4c84:b0:2ee:b875:6d30 with SMTP id 98e67ed59e1d1-30a6197c311mr10473328a91.9.1746429901311;
        Mon, 05 May 2025 00:25:01 -0700 (PDT)
Received: from localhost.localdomain ([27.67.185.150])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522fa58sm48014325ad.242.2025.05.05.00.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 00:25:00 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: pavel@ucw.cz
Cc: andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix LED driver
Date: Mon,  5 May 2025 14:24:33 +0700
Message-Id: <20250505072433.8193-1-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <aBHN+395kaIdbBEm@duo.ucw.cz>
References: <aBHN+395kaIdbBEm@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_002502_780752_3DC8D29F 
X-CRM114-Status: GOOD (  18.69  )
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

On Wed, 30 Apr 2025 Pavel Machek wrote:

> > > > > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > > > > wiring detail, and should it be exposed as 12 individual LEDs instead?
> > > > 
> > > > The 4×3 matrix is a real and fundamental aspect of the LP5812’s operation.
> > > > It is not just an internal wiring detail.
> > > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 output
> > > > pins control 12 LED dots individually through scanning. Each pin includes
> > > > both high-side and low-side drive circuits, meaning matrix multiplexing is
> > > > required for proper operation — it cannot be treated as 12 completely
> > > > independent LEDs.
> > > 
> > > Scanning is really a detail.
> > > 
> > > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> > > 
> > > If this is used as a power LED, SD activity LED, capslock and numlock
> > > ... placed randomly all around the device, then it goes LED subsystem.
> > 
> > The LP5812 is used for LED status indication in devices like smart speakers,
> > wearables, and routers, not as a structured rectangular display.
> 
> Well, IIRC it also supports automated animations, and that does not
> make sense on LED indicators. So... what device do _you_ have and how
> exactly is it used there?

We’re using the LP5812 in a battery-powered smart speaker as a status indicator
with visually enhanced lighting — for example, breathing effects during standby
and fading effects during voice processing.

While the LP5812 supports autonomous animations, they’re used here to offload
real-time brightness control from the main controller. Each LED’s animation engine
enables smooth transitions like fade-in/fade-out and breathing effects.
These patterns are configured once and run autonomously, saving MCU load and power,
while still serving traditional indicator roles.

Best regards,
Nam Tran


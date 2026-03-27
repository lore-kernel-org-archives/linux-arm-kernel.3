Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7000510ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=; b=mhU4Z63MQITAWPrO895IGZ1i+z
	GFjAsMjb5TypTEC3l0sEZkmdwhPrloKIo86pBI+PfucoiYiWn2TAN9GGno+g6xuAcGylJK7ZLjGg/
	vM3RbCQPTwNz4EOoFMWJCMgdoBubF7IY3vdOtKvImxyyrtxEYK2vn9DAjvIAWvR/UpSEDbrXigC+q
	ST4zwBwrWL13Bka1pC7UPvpSguYov2addHi8Evhl19W1uB/nSpz/TeY2J2ACZoRmUgryHntlpBHEK
	aeOsabPEICJoknscQqUWmqcDzfjlFnwHIJdmgQku9dOAi9HPp6VnDTyvLtr/3eATfOSWG2yty63Ql
	j74r+DaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bV-00000007ID9-0Ht5;
	Fri, 27 Mar 2026 11:43:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bT-00000007ICV-3aXE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 11:43:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=; b=byF7XZ9SSBtH27Qgsp8NhrdzMh
	CVpNnbM5w1W8j3XAbWF9FRCUDhZ1/fMIAsYW5PFfK/D5J8eVfVQzQT8AZ9CEOahRerrFD73gJAhRm
	iIIkrOUrNTM8VZIUEss5bkGmTqQUfpLTh9z7ajG6L9Y/QWI4spATbyF6FgNrjGESNhhgMFz/I6ha/
	Al+pB1ggeuRXuTnYMv0lkTZGHaLU5qb7IaIccGmglhJNqX3B1UYLvfxPBpKD+uI5QGFmP5Y7q9wGh
	WtlP4t05/MfeMASk2KlihB1TI28B5mM2uws7PePYh2jLua3hhbDDc1+3qbSpcObUSnNJAz8AMx9SB
	kC1exJdg==;
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bQ-0000000AK1K-3eNU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:43:50 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-487012ce896so12433355e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 04:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774611827; x=1775216627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=;
        b=nUap3tS1MaflU32uKv3opwTcH5X3RHHJXAV7VIfdYBNeAd/O3OS6TmUd/n5Hc6ZHVn
         CsQi81y/qhXt1p8Hi7CqYCkrSCsiv/2niFGk08kiYeN1W1Copb+vVPh6RP1L7DyE5K5l
         wwF/jtj9sBSLL+PgJrZkfWNQ0DnAZUve93z4oZmsHT7dgXslrmzpmJUP6zQ71otmYoKw
         uQtHPQzi9nr/MTg9t4ir71fYpl+R8/JepbUn526tZ7PvU3b7RnQ9IdSCw8FE4vYoGyeD
         cwBnJISkIC2HcngkLQvj4D2OIydG3NcxBBmVz3TfcfX8QpCsmlKCu+W2d1apr5IRVoPM
         Aw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774611827; x=1775216627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DYgRiTpgVxM1HUd8k6yAnxBm1+eeXn001TUDzFfO7D4=;
        b=p7QvNEyozcUD2psu3vViUuRBogevmHqe3OP7MszBFTJqNAk8R4/8VT/q9pkH1GsjQm
         uq8cz2iB+9HRG6SpmqKZixpunOHImCbysTCDey96G/yHHY61knOC1gRnAbhhNp7bZWGI
         wJbeN5xlgFjDSU1n20sssO4mQVxFUn9yFi92/UwqvWlQqP611UPXhVxHYAxwUhHf7jvU
         iflod7pryS1EdsmFz4SOI1OBtlExIelxAgHjahhluGp1vdgzoeb9DHY3qedoQT/NrWDk
         uyZvroY54nf7eQFtKr7MgfJGAzshuwngDcewInboj4rmo9e19tt8AuQ2I+8ZH9oh5NVZ
         K2Bg==
X-Forwarded-Encrypted: i=1; AJvYcCUUbnhb6lYz5TjpwPMTcjVKGYs6lV9f5slJBYbINIQLSlffYDG9P02Xvki/SNtR9cqTmF3u/yjr3f0KxjVodRcI@lists.infradead.org
X-Gm-Message-State: AOJu0YxcjQeLOQGX3+qbjWUC8Q/+G2JumlAanjwb6Swwl/XGEelJnPU0
	hdWkCPrZtB8hXgKsvx7i+bfa/UrzL0ClNDI5wItBvWx9GtIpJ3J6xE23
X-Gm-Gg: ATEYQzw33rrBEJhPld3qR3a09VFnya3misXk/KU+TlxMoQQNWeJil6Caml3o1fiOWPI
	I/4irJ1QSdkNnqnMP5boM1Cju/dHsSh+5NZBbSwpdybFaEz3dKwhppIKSBFFu4pyDWyA8tvuzSM
	yzhpITjjkvQbfJ6Ut+KckPJxw2QdgmPwNsDhggpSw7gUyLwkl30jchQjCcLBfOlTRO3VbA3AA7N
	bGoegezSo9ScxOggwOggVBt40IhZWpPteYExEO/kDoi3oy6zJcrEgBjIA6AeBikEtSEBb2nLABY
	tIrRxSUVfSL4uJRq87VQL8k/DSQSjan8I+4xIFmhhf0Fmb+5+jsr6zufUk3roYNJlVYwDGeSBu/
	vMl+cxgBixsxrZU0FibOyIf+EcWpIZ5/ja3JJXaxQuwvQqZfUikzBYKw6/iKsyXweRrgYGPapIH
	DicKDEW0FJ3m9bAdadsD+fvtrPM5s3Sp5SoKwmAB4PdjfqD8UQPmaaeyNHfKsD3Bag0rS7XxnVI
	I9dcBlq5BhBKP6V0w==
X-Received: by 2002:a05:600c:8b6e:b0:487:716:2fa9 with SMTP id 5b1f17b1804b1-48727e883c4mr35679575e9.13.1774611826618;
        Fri, 27 Mar 2026 04:43:46 -0700 (PDT)
Received: from jernej-laptop.localnet (118.red-213-98-130.staticip.rima-tde.net. [213.98.130.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919e265csm15142518f8f.32.2026.03.27.04.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 04:43:46 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: a523: Add missing GPIO interrupt
Date: Fri, 27 Mar 2026 12:42:18 +0100
Message-ID: <5086436.31r3eYUQgx@jernej-laptop>
In-Reply-To: <20260327113006.3135663-4-andre.przywara@arm.com>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114349_075640_3984A4C7 
X-CRM114-Status: GOOD (  10.11  )
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

Dne petek, 27. marec 2026 ob 12:30:06 Srednjeevropski standardni =C4=8Das j=
e Andre Przywara napisal(a):
> Even though the Allwinner A523 SoC implements 10 GPIO banks, it has
> actually registers for 11 IRQ banks, and even an interrupt assigned to
> the first, non-implemented IRQ bank.
> Add that first interrupt to the list of GPIO interrupts, to correct the
> association between IRQs and GPIO banks.
>=20
> This fixes GPIO IRQ operation on boards with A523 SoCs, as seen by
> broken SD card detect functionality, for instance.
>=20
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Fixes: 35ac96f79664 ("arm64: dts: allwinner: Add Allwinner A523 .dtsi fil=
e")
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej




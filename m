Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72BACA1010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 03:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTMZ51CLrVMw82swKEmpSkZ08JOWyuDnIwmJ5JE3KQw=; b=yoFE7HEvy2LCgJWvCdmoVSgTs/
	TXCWkJ+ImH9fSmbAt455nn/MIVvTQ6O47VMyXK/Lg1iZXzDqVgyWHLHY8iEshRbqcX6ch6R6tsXhh
	JNMcvrLHGKCzpVOjaImk0uLPvJ7Aomt+w1bW0rx61+KEVl/rd5USjOMvRia7TrDH1Fx0mimU5e08H
	NGJi+vONUd87qXIW94l0j34CvEBmfbshjye4VT9V/b/pe5P0pkRVnrzXHooH5E47334UKmi/4xHhm
	E7qgDjYJfUIKGLIEItUUd1qpgYuSpL5zyRTmcCkNEdJ6xaEFNecW3XgRx+NTyGJH8MTeO51/GmzKR
	kmhHJm0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNba-0000000GagG-1YbD;
	Fri, 05 Sep 2025 03:59:18 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuNUF-0000000GYNA-1Wxc;
	Fri, 05 Sep 2025 03:51:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-afec5651966so340610166b.2;
        Thu, 04 Sep 2025 20:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757044301; x=1757649101; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTMZ51CLrVMw82swKEmpSkZ08JOWyuDnIwmJ5JE3KQw=;
        b=FRhfdQkNwQJVoBE8MGoDrdoXfUL+ZeZoT4X1TthoCtmHgibTiPEsK0em9bBHTvXAUL
         8C1JLrF7v8sbS14Jqda0j/kHhiXAGuBhwh71vFOd75EJEe4Q6JwN4zG7tWoeZA7T/mQI
         eC1RGQn9jknxGnYKnxLlgMhjNd9Pd0RUuGsi106vX1xtWvn9Dn+9USFastbrMX1dKgSI
         XVW/0St0tIWhEZijyXLc5WWg1YtECEa0MpR3Shs3/cdBhPQXAy5WgKgn0dgFTPxqeajt
         x+3eUbZNOjGkY74gSErD9BGJoLX98se/zzXNmFfEGqkxT07fLk2x0oVzt6eG+hol4ZNk
         Atrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757044301; x=1757649101;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTMZ51CLrVMw82swKEmpSkZ08JOWyuDnIwmJ5JE3KQw=;
        b=i0RIFzDvuzd46oCflPl1yHWjv07ElNefmrfXIZ1SacWvWD4d4reISCWBJY8j+b/b1X
         M4gIQAZcfRoTCprDyuZqSUI4AbZJiJrA5UjO4ajUD/zxbPAH4b/Vw1e271isPsHPZvGt
         HCDhe5p5OFVI/yTodDKoH6db6o3Cokwm54LBoPSFrRHVnJlOdXZsbJilJG7WKz9ZKS8C
         J5/N2I5okMK2ZW84pJke1i+4WNptN2+XE9mhqhKhenjC1EcW3OhnAui5gI9dJeQDqL1B
         AusFYcnTrNnbM7hOkN42WKB/qb8cXD4AykWYGBHCDg8ON0nbLiulZ3tw9GdpkPbGwMAt
         fEvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV8VbEFExzZpgAZHrLpANzRs8B3lw245GIZCqubgilhjKhER/CpQvc8TFtVHjQ8GJDu3ArvsvMS2YeEFlBqnSq6A==@lists.infradead.org, AJvYcCWUbzzVjwCUSRawsRqM5Mh6Izty9d/RqFLFQkuFKQ4QaclhW4ngmsPVHbzrYgxBvI7012/fto+E/5ndrlP7@lists.infradead.org
X-Gm-Message-State: AOJu0YxyuGEPCR5A2SJdd3rzmaAt72ThgBITxzF2ZsKxH2YUGkfGK13v
	SHpGAniyOBB8Zng5leuGxy5C2AuL40fb1ljfkbPJkwwSm4Q7hSU3z+PG6vpRrInq+vxiwanbhIA
	y6OL8Tebyd9Uh7dl2cybtN1WAu60zzJM=
X-Gm-Gg: ASbGncvhmljDW3Q8YqmcaWXfzN89FSa5TMFZeO4zX8GVHBPuZ++W/77ns6tXoEeeSAO
	hGH3RinMdsPJs+66iz4cQcL9LZ+wKYRkQJdbfaooN1qpE4DgN5Nab9/1HpCoFd8FU75TgjkpbgN
	YboqOti2D/LaOV2WUNpN0gVwR+Djh8HGB1TJcEYN0iDbTPrTwWeVk3Jk/Ex+BVDxPccEWbgzVqY
	pjnua0D1E6slVuS
X-Google-Smtp-Source: AGHT+IHcVn7No3ANoqx5woQ67BZrl62KReMCA2T36hJckpRBJtNeq23+uG18xwyotgKBGRTvHgmGlRKcK8i0ImMDvRc=
X-Received: by 2002:a17:907:3f12:b0:afe:ea46:e808 with SMTP id
 a640c23a62f3a-b01d9793846mr1869389666b.47.1757044301283; Thu, 04 Sep 2025
 20:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250825065240.22577-1-linux.amoon@gmail.com> <20250825065240.22577-3-linux.amoon@gmail.com>
 <e31d35c8-b2b2-4301-a13c-e18ad83a21d6@kernel.org>
In-Reply-To: <e31d35c8-b2b2-4301-a13c-e18ad83a21d6@kernel.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 5 Sep 2025 09:21:25 +0530
X-Gm-Features: Ac12FXxyDiiV3g7LkqGtc1SDoPuFAN0OeFKgOY8PLCoMNfr5vTocBW2CQHpvMww
Message-ID: <CANAwSgQOcqYdMjxN+ZmTDMj31VrCgCvACvkNpErJExvR0kiw4Q@mail.gmail.com>
Subject: Re: [PATCH v2 02/11] arm64: dts: amlogic: Add cache information to
 the Amlogic SM1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_205143_403486_5D5B1666 
X-CRM114-Status: GOOD (  13.22  )
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

Hi Krzysztof,

Thanks for your review comments.

On Thu, 4 Sept 2025 at 19:07, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 25/08/2025 08:51, Anand Moon wrote:
> > As per S905X3 datasheet add missing cache information to the Amlogic
> > SM1 SoC. ARM Cortex-A55 CPU uses unified L3 cache instead of L2 cache.
> >
> > - Each Cortex-A55 core has 32KB of L1 instruction cache available and
> >       32KB of L1 data cache available.
> > - Along with 256KB Unified L2 cache.
> >
> > Cache memory significantly reduces the time it takes for the CPU
> > to access data and instructions, leading to faster program execution
> > and overall system responsiveness.
>
>
> This statement is obvious and completely redundant. Drop it from all of
> the commits.
>
Pending additional feedback, I=E2=80=99ll revise and drop them in the next =
release.
> Best regards,
> Krzysztof

Thanks
-Anand


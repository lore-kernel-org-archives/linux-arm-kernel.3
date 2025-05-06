Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D3C9C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 06:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SzOZk3IAQIFbUw4Ne76D3ImIMW3ziYe4M2KihJqGVRI=; b=18o/m0whnxlv27L8uhXX1My4oG
	i25BxNjMaktiOS6C3VcnO0XSCsLos9r2Apnyxls8Aai+8Wfvom3OEMiDLsEBSjO2KsU0dEsxl2PRY
	zOFqeiMdWvKXkAUubJbbXqq56q+H1fCtefI1Xp72sNUGY1B04elMbgu1CiO9R25kSmy+qR71RU+61
	C0Y2m9nNvCeOJ9iTa7tnmGs0c0IRJQbkiqyWjUtad0Bv3yUC9B0TRipStPWr9OdFquJwlsQ4qF1HR
	qT1XpLYiSqMK0OCrvSBysDZ3quBl1PY3sgFxYboYmwHoKO4J3p1g/znMc9hNZhIO9CK9+XhBNo8iX
	4FfpY3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCBqI-0000000AhA2-3kSo;
	Tue, 06 May 2025 06:31:50 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCB7M-0000000AVur-2COx;
	Tue, 06 May 2025 05:45:25 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so4735121a12.0;
        Mon, 05 May 2025 22:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1746510323; x=1747115123; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzOZk3IAQIFbUw4Ne76D3ImIMW3ziYe4M2KihJqGVRI=;
        b=hO3B+TAJUeM4C+QGPJ2+Ao4m2JNz1lPiswFGbeuLAOjrmjNBq9jWXuUEYgWd6cJjDn
         n3CYTy522lH03KY8kFRcN9+IGFobSaB/nCHnwykm5U2O5s0fubHgVOR8KDkE2Oe+5OR8
         AfH0nEuz4UoP3yLDcjRWr+PccoS4tKaxsB9QyZVR5NOlx2oc22lUY5XpqulS+f7NBlkh
         mdA9+DKeh1jJjHuuva8hcf9qxKRyBtAYR5OlfMWxpmKYu+A71+XtfhQSdjIaBIcmOA54
         uw5YuhcB94viUzPIxp8VLtzwvqObkxsRevXBp5JDR95F9/B08sKCBCspcTj6fSIi2wg9
         rvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746510323; x=1747115123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzOZk3IAQIFbUw4Ne76D3ImIMW3ziYe4M2KihJqGVRI=;
        b=DE6RyUXna4JRhnxO913wkbBO/K4gejz2GMv/myuP99Rvys+n4i6riin14f4bdgH1Uq
         zovzNP5w5ItX6RkBvVvo80aOOHO+suJQYey8NjwDdanB4/OUM70xRf8NDgonQlphfqhm
         oNr63mRxswAghhREKfsAlKQ98LmPKHWwd6NBDuAreHWvlRofCEYwLzlCUVamTb6GpJJO
         ZPr295hpRthASJuDHpTw9sRtLayQ0v1Jq5+C3KpprWhGYnaiZyB4TrOmYZLmggM7dlCz
         0G/xcwOmjxvahS59AKT5YjLmVJ5n79Or9ij/5zxinDVdgievE+c4Wkq60ur34cCDTdjr
         F/zg==
X-Forwarded-Encrypted: i=1; AJvYcCUGNqAQLmsFXFkA5FBcYlSSgma5sc7sv3bSSKbtXAHA6MME2un0e2ByJQeDtcZg3I6k+EE4MAcduILQXG+eZ9rbHg==@lists.infradead.org, AJvYcCVGmLOsXdHZqF2pWpAzexTRhai6pDZOzxBhEtPPff4cfr4p9pZUbPxmZIZDkWDxhjmA4p4wGGtk0+qmIGOK@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4hifOspRAZVWPHAE82m8CMc029fgAONkPuDhoIArmp3kHx7dT
	CNlzS0X7q+UM/UEhskOWKm5s013MmAnLI4P5GAj8MhC66d580QLy1qcyvzVSFs2c0NZ9WU6JJhg
	KADJezcZiKfoGXctaLOYv3yYf9YY=
X-Gm-Gg: ASbGncuabNfTWq0UAAghWhmKYg5YS3CYOBLxAieOijgHAU9Z9BJvc7TeDTgiy2vo3hV
	pO7noDNpdHVVRd+LfL2WOndgJVmK/A3CHta0v65ZArlv+49U1fQg6oHwGijfL2qM5ootWu5QpDH
	ZoXJr+KRoWmhFxfbaB+Hled4zyMH+kno5WNH2g
X-Google-Smtp-Source: AGHT+IG9+XTY5gsqEu/5VO21buM3ao3qt5hN1Shgf6am5MZstz3wz0os2aGjV9duIeZ0pFO63t5UT9LAAOodm+H5DxI=
X-Received: by 2002:a17:902:fc8d:b0:216:3d72:1712 with SMTP id
 d9443c01a7336-22e365af0demr27207085ad.48.1746510323601; Mon, 05 May 2025
 22:45:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250428-fernsehfee-v2-0-293b98a43a91@posteo.net> <20250428-fernsehfee-v2-4-293b98a43a91@posteo.net>
In-Reply-To: <20250428-fernsehfee-v2-4-293b98a43a91@posteo.net>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 6 May 2025 07:45:12 +0200
X-Gm-Features: ATxdqUHExb0y3TB0sGh-a9qJlHSjuGqizCi_ElK5QBzZ7JwOhNsd0f26AUxqkpg
Message-ID: <CAFBinCBLvy=jBBZY2XKnmWJAxhne=8VCMJnWjmA=nUBWM4p2fg@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] ARM: dts: amlogic: meson8-fernsehfee3: Describe regulators
To: j.ne@posteo.net
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_224524_562068_0271D6CB 
X-CRM114-Status: GOOD (  16.46  )
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

On Mon, Apr 28, 2025 at 12:44=E2=80=AFPM J. Neusch=C3=A4fer via B4 Relay
<devnull+j.ne.posteo.net@kernel.org> wrote:
>
> From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
>
> The fernsehfee3 board uses a Ricoh RN5T618 PMIC to generate various
> voltages. Board schematics are not available, but the regulator voltages
> found in /sys/kernel/debug/regulator/regulator_summary match those in
> meson8m2-mxiii-plus.dts:
>
>  DCDC1               0    0      0 unknown  1100mV     0mA     0mV     0m=
V
>  DCDC2               0    0      0 unknown  1150mV     0mA     0mV     0m=
V
>  DCDC3               0    0      0 unknown  1500mV     0mA     0mV     0m=
V
>  LDO1                0    0      0 unknown  2900mV     0mA     0mV     0m=
V
>  LDO2                0    0      0 unknown  1800mV     0mA     0mV     0m=
V
>  LDO3                0    0      0 unknown  1800mV     0mA     0mV     0m=
V
>  LDO4                0    0      0 unknown  2850mV     0mA     0mV     0m=
V
>  LDO5                0    0      0 unknown  1800mV     0mA     0mV     0m=
V
>  LDORTC1             0    0      0 unknown  2700mV     0mA     0mV     0m=
V
>  LDORTC2             0    0      0 unknown   900mV     0mA     0mV     0m=
V
>
> This patch takes the following approach:
>
>  - Copy RN5T618 regulator nodes from meson8m2-mxiii-plus.dts
>  - Remove some of the regulator names, which do not seem to apply
>  - Verify regulator supply relations by starting without any relations
>    (and without regulator-always-on) and seeing what breaks when the
>    kernel turns off "unused" regulators.
>
> This results in the following observations:
>
>  - When LDO1 is turned off, the board resets
>  - When DCDC1, DCDC2, DCDC3, LDO2, or LDO5 are turned off, the board (as
>    observed through the serial port) stops running, so these must stay on
>    at all times.
>  - LDO4 (VCC2V8) appears to be unused on this board.
>  - LDO3 (VCC1V8_USB) must stay on in order for USB to work, both the
>    external USB ports and the internal USB wifi module.
>
> The cpu-supply and mali-supply relations are also copied from
> meson8m2-mxiii-plus.dts
>
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thanks for the detailed summary!


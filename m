Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B28C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 14:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VgraRHso95F81B4DXSSaBLV0feh+tpXbSVAWbEyzHv4=; b=OVIQAHa3l5Hm3U6pIOLN/BkDcF
	zrNH6doC2I4Q0Hhm2g5+MkrRSsCGgII5akvqZWkCZhbfemS47SyShYFAFPfyz16uZYIm6xE0dQIjH
	cPJ6Am16R1EBVCuH3NvdTeZ69H2FAEGAQVQomOCaHaGjlv8vVLm0WgijLhrKp/Ja3phxu8u6OHT8G
	E0t3xLkwbiK+9JeKxo3NHN2NgMuS+awjn+97ysvLApsSMrIR1sQJZ8XmQTcqZKNhEUtM7cmdQLsle
	DRXaMdNJ/3WI1NZAatdSkBRN8CQPn0SHZkXsbNNaTb2it1yHiT8t6RCmONjgFlXgF1wT+HWCPuuqy
	jEtmkaAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thUn6-000000008BK-3CoY;
	Mon, 10 Feb 2025 14:29:40 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thUkS-000000007ii-0Fn8;
	Mon, 10 Feb 2025 14:26:57 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-439350f1a0bso10979585e9.0;
        Mon, 10 Feb 2025 06:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739197614; x=1739802414; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VgraRHso95F81B4DXSSaBLV0feh+tpXbSVAWbEyzHv4=;
        b=I+Sm/CE4J3XzeV/53sZaKGk6fa8xcc/tqpwCmz+4mni1+0QLnTxnBT4J/n48UWw7SG
         enNKgYSMv2Ga0rShUQ/8wycWADJNPkp+se4/YvLOdAvICmhOK/rfVZdPeasrhaoZx5v2
         PgUhd+giIcbkycTaGoIWNG4xAVLaFwxKW03bD661iPndjeuQM5VOQk1QJhka3f/WKZVs
         Nyme/UM3ibQLUJS9S+t9JCA00wn0t3IPvxWctqJyED8l4+Aia0JbtKHkGTFQjH+/f3Xb
         ZrgKvrKoWCcaGEc/LfKktLfdTu9P6VfhT+nFosMEUKiGc3M9ZaujMvShoYSUev+xHkhD
         hAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197614; x=1739802414;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VgraRHso95F81B4DXSSaBLV0feh+tpXbSVAWbEyzHv4=;
        b=D2khYyly1inB7W3KX/FEmUmzxGXvNTV/SJwDVTGTNPNVmII/jx0PVQbckR+MQ0dTxW
         O6oNyhjEGWIOQGYTD88x/Yz/T0vaVJq71EP1ObgsajO0gwQUR1wB6ez1JrBywm5quVb5
         yWZKx4BSNcbABkWmdq/520BXjx+OYU9siGBR1f7afZsWmf+2IFSZmtS9h02X9wipMWdt
         +cAayzawoF6XsQ0iwQ3MhmNH/BvRovzsVeyCGt/VlAgRQc0f+EogDhR6OC4F5RX2Z/R8
         oAm6/lkfR4Kj+ZXeMCe4JcSq5jBXFlaA1377XTdGjkwkaUadeaMPt8Z93pnF2bFZEY6H
         bmsg==
X-Forwarded-Encrypted: i=1; AJvYcCU6zFG1OobImiWmHfa5AJ8MiOswkdaeBUUdiAZ4ajeQ1O95hCv80/eg+VVy6FHsL3pNEfuwqitIVBcTTEk=@lists.infradead.org, AJvYcCVcgCap/1zyplyWejAy4ITgEL9Na9WyzvkUsa++4liemGbPr1llBS9/v/d/4ztz5RoTiaeddNzbGoHROh+VXtRZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0YwjQ4NYtUXuvaotgI0Pf/HKM5ZSBMoyZOryKbxcV8r/oIxM1
	htaoymvIInn8q8OYja8VcZVKzeAEtafV6A7sKUwgWzDoxo6MUNvu
X-Gm-Gg: ASbGncuuyzEtcKMcGSB32eqvQDRml0eTCDPcXHxAYAgAvm5eUGjexOwyMoOxBzAKRfU
	r7O3w1bbxWHXl5Jw1lvxlVn479wsEKwzsHrpJmPVF58LXmOXA8WVnJdEdHmkagiUDMuL/6T6Rvm
	bN6aVze3UiZiJSGt0JIoCEtEgvn16OzkpkuY96VwuMN+x7XPX7FkyQqaRquuUDB1/DE1JKfUWt2
	wnr3ZhE4YyOMq4TmM2YbD20J/P+mqUfgGEdxMilCbtoejXrFycx5fxfCfxZAEeui7iIuTLbSLoJ
	7vDBa77t2XTrd90Nxm5hxn8ejWSlxrBV
X-Google-Smtp-Source: AGHT+IEYNgbdZHkRJU1UDHCBy9QezY1XmzJ1vuM2419I++2sRPB2lMGddbBAfie6JehAjN/mVPK+vg==
X-Received: by 2002:a05:600c:5351:b0:439:3159:c33d with SMTP id 5b1f17b1804b1-4393159c5abmr70934525e9.13.1739197614251;
        Mon, 10 Feb 2025 06:26:54 -0800 (PST)
Received: from giga-mm.home ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4393f202721sm49032005e9.21.2025.02.10.06.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:26:53 -0800 (PST)
Message-ID: <4d171a4fdf7ce9bfbe6352b36d6b6791584f86c4.camel@gmail.com>
Subject: Re: [PATCH 02/10] riscv: dts: sophgo: cv18xx: Split into CPU core
 and peripheral parts
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, soc@lists.linux.dev
Cc: Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Mon, 10 Feb 2025 15:26:52 +0100
In-Reply-To: <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
References: <20250209220646.1090868-1-alexander.sverdlin@gmail.com>
	 <20250209220646.1090868-3-alexander.sverdlin@gmail.com>
	 <dda5297c-fdf3-494f-854f-71a5000729e5@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_062656_101776_0719E282 
X-CRM114-Status: GOOD (  13.56  )
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

On Mon, 2025-02-10 at 09:43 +0100, Krzysztof Kozlowski wrote:
> > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi b/arch/riscv=
/boot/dts/sophgo/cv18xx-periph.dtsi
> > new file mode 100644
> > index 000000000000..53834b0658b2
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-periph.dtsi
> > @@ -0,0 +1,313 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > + */
> > +
> > +#include <dt-bindings/clock/sophgo,cv1800.h>
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/interrupt-controller/irq.h>
> > +
> > +/ {
> > +	osc: oscillator {
> > +		compatible =3D "fixed-clock";
>=20
> I really doubt that external oscillator is a peripheral. This is either
> part of board or the SoC.
>=20
>=20
> > +		clock-output-names =3D "osc_25m";
> > +		#clock-cells =3D <0>;
> > +	};
> > +
> > +	soc {
> > +		compatible =3D "simple-bus";
> > +		#address-cells =3D <1>;
> > +		#size-cells =3D <1>;
>=20
> No, override by phandle/label instead of duplicating SoC.

Is this one critical? Otherwise I struggle in v2 to both keep
SOC_PERIPHERAL_IRQ() in [a new] cv18xx-cpu.dtsi and reference &soc
from cv18xx-cpu.dtsi. It's kind of circular-dependency.

--=20
Alexander Sverdlin.



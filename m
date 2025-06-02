Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 423E2C5B559
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 19:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPw9tHv+YFqDOgHItgDh6WWYcZqPEA6GRstSGC7FvMw=; b=PgV2mEdD8ffXfubwFSj9bCuHzp
	hbY71yBUK7OWx4c9ZZQ92AmrUrd2Xjy/BK5QFw6MaIFGBLuIN1sDhpohQ420haOj870B2TGtWtKMZ
	c8FMNJ2d6iJtrWUYpP9RyfFrooK5AC0QBsVzKogEv/25lFFKMGf1BmDgAoAWAR9mqSE+8NhuHCytv
	9YLHeec/h/fioVEa7kyCPkkLyzPyKSMSwa+qPo6XfnnM+ik0kuGI8R80++fyIAB4izOIkvkbKBeSz
	Eb+2xOv9IuSsj/LPrV8NMsBiz9a9sdfL7yJq//mJ0FqZElgy5pa8wdvZvJ1mDpM5ApQ0pIUyIEazr
	z3sI6DcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMASX-00000008OyZ-3PRT;
	Mon, 02 Jun 2025 19:04:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMAPy-00000008OP2-1jbg;
	Mon, 02 Jun 2025 19:01:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=SPw9tHv+YFqDOgHItgDh6WWYcZqPEA6GRstSGC7FvMw=; b=ZbiIOWWrqz4Xo+xhj4MkrCq550
	Ab4dft5PIpkhNivF6xz0iT41AGSWYazCmEw52oUzY7yke177u5Jn17ClfKLKgG86ri9LUrUqJfOno
	Pn8EjwT7yFIYPwULfA5k8jmbuEcqPmanrMBT6HWnehBEexpPbTctIyfSzqURX979tYqk8d8ZxaeAD
	jl7R9E9YJwLs5A++pG9KovRDmiemI6nsgopOBXLBY6wp5Qz1gt6cS9JxgKLJ/+G7HdDvCllOuAHm5
	DiccjOKDXbLRNQCJsqtSXDCl/3Kw+ALRxQJGiewJj2UNSwAU0dVdGWerCn7sT4gW0/MUXsK05vjRb
	UIfpB2rw==;
Received: from i53875a2b.versanet.de ([83.135.90.43] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uMAPg-0001RE-Cy; Mon, 02 Jun 2025 21:01:36 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <ukleinek@kernel.org>,
 William Breathitt Gray <wbg@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Kever Yang <kever.yang@rock-chips.com>, Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Lee Jones <lee@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-iio@vger.kernel.org, kernel@collabora.com,
 Jonas Karlman <jonas@kwiboo.se>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v2 3/7] bitfield: introduce HI16_WE bitfield prep macros
Date: Mon, 02 Jun 2025 21:01:35 +0200
Message-ID: <6139278.alqRGMn8q6@diego>
In-Reply-To: <20250602-rk3576-pwm-v2-3-a6434b0ce60c@collabora.com>
References: <20250602-rk3576-pwm-v2-0-a6434b0ce60c@collabora.com>
 <20250602-rk3576-pwm-v2-3-a6434b0ce60c@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_120154_476632_C6221AFF 
X-CRM114-Status: GOOD (  24.44  )
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

Am Montag, 2. Juni 2025, 18:19:14 Mitteleurop=C3=A4ische Sommerzeit schrieb=
 Nicolas Frattaroli:
> Hardware of various vendors, but very notably Rockchip, often uses
> 32-bit registers where the upper 16-bit half of the register is a
> write-enable mask for the lower half.
>=20
> This type of hardware setup allows for more granular concurrent register
> write access.
>=20
> Over the years, many drivers have hand-rolled their own version of this
> macro, usually without any checks, often called something like
> HIWORD_UPDATE or FIELD_PREP_HIWORD, commonly with slightly different
> semantics between them.
>=20
> Clearly there is a demand for such a macro, and thus the demand should
> be satisfied in a common header file.
>=20
> Add two macros: FIELD_PREP_HI16_WE, and FIELD_PREP_HI16_WE_CONST. The
> latter is a version that can be used in initializers, like
> FIELD_PREP_CONST. The macro names are chosen to explicitly reference the
> assumed half-register width, and its function, while not clashing with
> any potential other macros that drivers may already have implemented
> themselves.
>=20
> Future drivers should use these macros instead of handrolling their own,
> and old drivers can be ported to the new macros as time and opportunity
> allows.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  include/linux/bitfield.h | 47 ++++++++++++++++++++++++++++++++++++++++++=
+++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/include/linux/bitfield.h b/include/linux/bitfield.h
> index 6d9a53db54b66c0833973c880444bd289d9667b1..2b3e7cb90ccb5d48f510104f6=
1443b06748bb7eb 100644
> --- a/include/linux/bitfield.h
> +++ b/include/linux/bitfield.h
> @@ -8,6 +8,7 @@
>  #define _LINUX_BITFIELD_H
> =20
>  #include <linux/build_bug.h>
> +#include <linux/limits.h>
>  #include <linux/typecheck.h>
>  #include <asm/byteorder.h>
> =20
> @@ -142,6 +143,52 @@
>  		(((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask))	\
>  	)
> =20
> +/**
> + * FIELD_PREP_HI16_WE() - prepare a bitfield element with a write-enable=
 mask
> + * @_mask: shifted mask defining the field's length and position
> + * @_val:  value to put in the field
> + *
> + * FIELD_PREP_HI16_WE() masks and shifts up the value, as well as bitwis=
e ORs
> + * the result with the mask shifted up by 16.
> + *
> + * This is useful for a common design of hardware registers where the up=
per
> + * 16-bit half of a 32-bit register is used as a write-enable mask. In s=
uch a
> + * register, a bit in the lower half is only updated if the correspondin=
g bit
> + * in the upper half is high.
> + */
> +#define FIELD_PREP_HI16_WE(_mask, _val)					\
> +	({								\
> +		__BF_FIELD_CHECK(_mask, ((u16) 0U), _val,		\
> +				 "FIELD_PREP_HI16_WE: ");		\
> +		((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask) |	\

gcc is quite adamant about suggesting more parentheses here:

=2E./include/linux/bitfield.h:163:70: warning: suggest parentheses around a=
rithmetic in operand of =E2=80=98|=E2=80=99 [-Wparentheses]
  163 |                 ((typeof(_mask))(_val) << __bf_shf(_mask)) & (_mask=
) |  \
      |                                                                    =
  ^
=2E./include/soc/rockchip/mfpwm.h:225:41: note: in expansion of macro =E2=
=80=98FIELD_PREP_HI16_WE=E2=80=99
  225 | #define PWMV4_MODE(v)                   FIELD_PREP_HI16_WE(PWMV4_MO=
DE_MASK, (v))
      |                                         ^~~~~~~~~~~~~~~~~~
=2E./include/soc/rockchip/mfpwm.h:230:34: note: in expansion of macro =E2=
=80=98PWMV4_MODE=E2=80=99
  230 | #define PWMV4_CTRL_CONT_FLAGS   (PWMV4_MODE(PWMV4_MODE_CONT) | \
      |                                  ^~~~~~~~~~
=2E./drivers/pwm/pwm-rockchip-v4.c:237:57: note: in expansion of macro =E2=
=80=98PWMV4_CTRL_CONT_FLAGS=E2=80=99
  237 |         mfpwm_reg_write(pc->pwmf->base, PWMV4_REG_CTRL, PWMV4_CTRL_=
CONT_FLAGS);
      |                                                         ^~~~~~~~~~~=
~~~~~~~~~~


Heiko




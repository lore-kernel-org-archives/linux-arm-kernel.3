Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA4AF36C39
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 07:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Cc:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hB2A8Esel4sRN2yu0BbSPtSGiw4lRIZUzXIhjNnCO5Q=; b=NUMLIjyyBdBNcJRlhPljbeaNTP
	mPu8Z4yJt7RIek43+eLYyNo+OmUFraTVruqnElAozjAPHinUhcZWCNeccUuZy71T1ZefTSTxmKwzM
	qtS+OseAx+VeIiUtffR0uqJ7hs9ul10gBD3cEgZWVCj46+pInR/imh8zLIm/F4ynYlyfA8FY2PmFp
	zzqKd7+1ht6J0mvB7b1dF/Dauxlye4BFlXLKNlJAIL5srRYnrB1CuN9m7xpRCU1MRsI0HzmC+HC8i
	lBasxNeGvGMzK2cejJKonCrVBxNQALPbR4YVKLYjNxWg9gDutRbpeCLlqblAHQxLtVuJc9zv3IyUN
	+tLtF6vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEixY-00000006XpO-3mNW;
	Mon, 20 Apr 2026 07:22:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEixW-00000006Xow-3iy2;
	Mon, 20 Apr 2026 07:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 004DD418EF;
	Mon, 20 Apr 2026 07:22:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 805D0C19425;
	Mon, 20 Apr 2026 07:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776669737;
	bh=OfvTvpLPvCOhEfrZP20Fdwx6Oml0HCemcKq7lCtxkyE=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=IMey3crYn7faai6rgUGWKlY+8hRpsd9v7aeDXyOpQyfZoHGJbsfz6R50DB40aPfGA
	 scmZDevIY5KrT+Xtm5F1Q5W7GkcKH3TlcudlihDzXyEZfC4uJ+ID9uoHTpOITXJddl
	 kPx9P7oi2FNemZrjdUBG2macvC/BHf5ra7cx++oyuddBTo2iO556nLVT08mYazZN8b
	 kq8Y2FBt/k3RZKnO/cCH2ywt+sead2cswjBkqqCIbMaGQuWEMezh9nYE6zLs2AS0ig
	 MkwDgIBIrtcF0tjJEpppzUi+REL0BbYUsRRA2xXYQ+DadjTO2xLi/VT7fa+E54lIGL
	 OczJRz0NsD0+Q==
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=90b98803b27b5277d55f5c028db99ddc444d61087c0fc38a687673f1b0fc;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Mon, 20 Apr 2026 09:22:13 +0200
Message-Id: <DHXSUW3NJU22.1RUYUHQZSZ53S@kernel.org>
Subject: Re: [PATCH v2 3/4] gpio: realtek: Add driver for Realtek DHC
 RTD1625 SoC
Cc: "Bartosz Golaszewski" <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
 <linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-realtek-soc@lists.infradead.org"
 <linux-realtek-soc@lists.infradead.org>,
 =?utf-8?b?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
 =?utf-8?b?U3RhbmxleSBDaGFuZ1vmmIzogrLlvrdd?= <stanley_chang@realtek.com>,
 =?utf-8?b?SmFtZXMgVGFpIFvmiLTlv5fls7Bd?= <james.tai@realtek.com>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "afaerber@suse.com" <afaerber@suse.com>,
 =?utf-8?b?VFlfQ2hhbmdb5by15a2Q6YC4XQ==?= <tychang@realtek.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Linus Walleij" <linusw@kernel.org>,
 =?utf-8?b?WXUtQ2h1biBMaW4gW+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
X-Mailer: aerc 0.20.0
References: <20260408025243.1155482-1-eleanor.lin@realtek.com>
 <20260408025243.1155482-4-eleanor.lin@realtek.com>
 <CAMRc=MfUh_OuxS4SC6QzSOg_PMNc9i9crGYgBASrbVUgHDHSCw@mail.gmail.com>
 <52bf9ce2b7754af8af69b0afee0d07b2@realtek.com>
 <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
In-Reply-To: <CAD++jLkpS-T9yK=ctSwpLvXkj7s7ivmwu1KKwzy4KS40LVYeyA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_002218_967121_5CC7D133 
X-CRM114-Status: GOOD (  30.41  )
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

--90b98803b27b5277d55f5c028db99ddc444d61087c0fc38a687673f1b0fc
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Sun Apr 19, 2026 at 11:19 PM CEST, Linus Walleij wrote:
> Hi Yu-Chun,
>
> On Fri, Apr 10, 2026 at 11:39=E2=80=AFAM Yu-Chun Lin [=E6=9E=97=E7=A5=90=
=E5=90=9B]
> <eleanor.lin@realtek.com> wrote:
>
>> We did look into gpio-mmio and gpio-regmap, but they are not quite suita=
ble for
>> our platform due to the specific hardware design:
>>
>> 1. Per-GPIO Dedicated Registers: Unlike typical GPIO controllers that pa=
ck 32 pins
>> into a single 32-bit register (1 bit per pin), our hardware uses a dedic=
ated 32-bit
>> register for each individual GPIO. This single register controls the
>> input/output state, direction, and interrupt trigger type for that speci=
fic pin.
>
> Isn't that attainable by:
>
> - setting .ngpio_per_reg to 1 in struct gpio_regmap_config

Which is just used by the gpio_regmap_simple_xlate() anyway. So it
doesn't really matter. But yeah, 1 would be the correct value here,
assuming that the registers are consecutive.

> - extend .reg_mask_xlate callback with an enum for each operation
>   (need to change all users of the .reg_mask_xlate callback but
>   who cares, they are not many):
>
> e.g.
>
> enum gpio_regmap_operation {
>     GPIO_REGMAP_GET_OP,
>     GPIO_REGMAP_SET_OP,
>     GPIO_REGMAP_SET_WITH_CLEAR_OP,
>     GPIO_REGMAP_GET_DIR_OP,
>     GPIO_REGMAP_SET_DIR_OP,
> };
>
>  int (*reg_mask_xlate)(struct gpio_regmap *gpio,
>                               enum_gpio_regmap_operation op,
>                               unsigned int base,
>                               unsigned int offset, unsigned int *reg,
>                               unsigned int *mask);
>
> This way .reg_mask_xlate() can hit different bits in the returned
> *mask depending on operation and it will be find to pack all of
> the bits into one 32bit register.
>
> Added Michael Walle to the the thread, he will know if this is a
> good idea.

Nice idea, though the information is then redundant in the usual
case, i.e. drivers which need to translate specific registers
will do a "switch (base)" at the moment. These should be converted
to "switch (op)" just to keep all the drivers aligned and prevent
new drivers from using the old method. You'd need to touch them
anyway.

I was briefly thinking about making it somewhat possible to embed
the op into the base, if it would otherwise be all the same. That
way, you could gpio-regmap as is. A special case like
GPIO_REGMAP_ADDR_ZERO, that could be used by these kind of drivers,
but that is probably too hacky.

I'm fine with either way.

>> 2. Write-Enable (WREN) Mask Mechanism: Our hardware requires a specific =
Write-Enable
>> mask to be written simultaneously when updating the register values.
>
> Which is to just set bit 31.
>
> With the above scheme your .reg_mask_xlate callback can just set bit 31
> no matter what operating you're doing. Piece of cake.

Keep in mind, that this will make reading and writing somewhat
different. reading assumes there is only one bit set in mask,
because of the "!!(val & mask)" op, which is hardcoded. I'm not
against using the write like that though.

-michael

>> 3. Hardware Debounce: We also need to support hardware debounce settings=
 per pin,
>> which requires custom configuration via set_config mapped to these speci=
fic per-pin
>> registers.
>
> Just add a version of an optional .set_config() call to gpio-regmap.c
> to handle this using .reg_mask_xlate() per above and add a new
> GPIO_REGMAP_CONFIG_OP to the above enum, problem solved.
>
> If it seems too hard I can write patch 1 & 2 adding this infrastructure
> but I bet you can easily see what can be done with gpio-regmap.c
> here provided Michael W approves the idea.
>
> Yours,
> Linus Walleij


--90b98803b27b5277d55f5c028db99ddc444d61087c0fc38a687673f1b0fc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaeXUJhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gYPAGA38kF6k0QPnHqbuf0F8snMjubpa3TOjs3
G9onuKDYzjTIsUAnEIkP2OGyzFeQDyiSAX9GSJK/SNrLRYFKwB25HIvNQffrfllE
mYvy1Hm1NFWYVTeAs8zKhOWZ1siJfgpLSHg=
=VBJf
-----END PGP SIGNATURE-----

--90b98803b27b5277d55f5c028db99ddc444d61087c0fc38a687673f1b0fc--


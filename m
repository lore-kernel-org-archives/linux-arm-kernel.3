Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C0DC83F10
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 22:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIrfiZ2BvOoCvUQBun7pn9xaoeAsHVtLpdKutL1I700=; b=ni8stJ2mhXyjzjpCZF5BwS13I8
	QECLPa89b2EE1IOPptodQqvSuHFUGzz6H55TxR1PpiHp6nLpBgXbRELUEGe9x7uap+T7EXSQgVms8
	4A907iIqXmh0rSUvsNMW7fF2ugNMh3e0VIgBDU1Rv4UwwOlsm58M/REkw5S6tFakqe5Ljvpbyc0t3
	pAg1BZHaUqUlOKzfwFIkyFEq27ZnmRiGFfJdhR3rLspClC5psFIhLb27OUqJa/7HADaNhb7H8x9wV
	w5jnZ+uuoZHEEmGyWJteE5ux7tnUwaTIu8j9msgZh+bWLv62KjKVZ3aKkELpu1pufq3t04zSblsBm
	ynoChVhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZdiB-0000000A7uD-2wwK;
	Wed, 09 Jul 2025 22:56:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZanK-00000009ju5-18SS;
	Wed, 09 Jul 2025 19:49:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=JIrfiZ2BvOoCvUQBun7pn9xaoeAsHVtLpdKutL1I700=; b=CYaOezZ2zf79ThbGUEfeCg/ZYK
	fyz1Q/S7whHftG34Ca7W6SmF0aaoMjP4uPegf8BVthOr/hy7RVIUy/m70HQJfxYWFv9XXIw/RkUAk
	YEw4yM0kldmAjkumF7qsOoir9y8WqDkJedWcUApj+A6caFajlTWsJNr50zBoPGrI3WTvmdKvYFy4q
	NLxnvmcC0eXCmz5ahWpQL1a9Rj+chKfU/DLRmhv4GNcdZrXHjHF6BSvfL5Gak9539f2BF69lpzTcK
	gwupUSokTidAC8Gd+AaqFl+ZGoq6TazEJSPspX2fd/TBLsrIkstZtjbUL1Xa6lJir+qDMiI+B6TQV
	NNpTO15Q==;
Received: from i53875a79.versanet.de ([83.135.90.121] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZan1-0006Vl-RU; Wed, 09 Jul 2025 21:49:11 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Diederik de Haas <didi.debian@cknow.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Add reset button to NanoPi R5S
Date: Wed, 09 Jul 2025 21:49:11 +0200
Message-ID: <11937120.2WqB4rESCP@diego>
In-Reply-To: <DB7OENOUTHGM.2JPD73SZQ9P0P@cknow.org>
References: <20250709105715.119771-1-didi.debian@cknow.org>
 <ea6f2815-5882-4fab-8372-1c252a87e09a@kernel.org>
 <DB7OENOUTHGM.2JPD73SZQ9P0P@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_124930_308962_319A93FE 
X-CRM114-Status: GOOD (  28.38  )
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

Am Mittwoch, 9. Juli 2025, 18:47:47 Mitteleurop=C3=A4ische Sommerzeit schri=
eb Diederik de Haas:
> On Wed Jul 9, 2025 at 4:18 PM CEST, Krzysztof Kozlowski wrote:
> > On 09/07/2025 13:17, Diederik de Haas wrote:
> >>>>  		compatible =3D "gpio-leds";
> >>>>  		pinctrl-names =3D "default";
> >>>> @@ -127,6 +140,12 @@ eth_phy0_reset_pin: eth-phy0-reset-pin {
> >>>>  		};
> >>>>  	};
> >>>> =20
> >>>> +	gpio-keys {
> >>>> +		gpio4_a0_k1: gpio4-a0-k1 {
> >>>
> >>> Are you sure that this passes checks?
> >>=20
> >> If it's about the 'weird' name/label, it is what is used in the
> >> schematic document I have and I asked Heiko (on IRC) if using
> >> ``reset_button_pin: gpio4-a0-k1`` would not be better. That would make
> >> it more descriptive while also having the schematic traceability in it.
> >> The answer was no, use the form I used in this patch.
> >>=20
> >> Am I missing checks I should've done as well?
> > I meant that usually nodes, including pin controller mux/config nodes,
> > have specific prefixes or suffixes. Other cases have here as well. Your
> > does not.
>=20
> I agree I've done it inconsistent with how I did the other pinctrl
> nodes, so I should've added the '-pin' suffix. For consistency.

Also fine by me :-) .


> I've been wondering whether there are rules for naming [1], both for the
> grouping and the node names. Some DTS files use a '-pin' suffix, others
> don't. And it's not uncommon to see both variants in the same dts file.
>=20
> One of the examples I looked at was ``rk3568-qnap-ts433.dts``. While it
> uses 'keys' as grouping node, I went with 'gpio-keys' as that was used
> more often (in other files). While the gmac0/keys/leds subnodes under
> ``&pinctrl`` use the '-pin' suffix, the pmic/usb subnodes do not.
> (and I just noticed 'hdd4_led-pin' should be 'hdd4-led-pin')

The TS433 suffers from that "no schematics" thing I mentioned in the
other mail, so the device-specific pins are named after their functon.
As I was assuming the TS433 will follow the reference design, those
pins are named after how other boards do it

But I think I'm just making sense of my subconscious choices
retrocactively right now and all the above sort of happened without
me thinking to much about that.


> I'd love to know/learn if there are actual rules for these things, but
> I don't know them.

=46rom looking at pinctrl bindings, it seems patterns are set per controller
with no global rules. Which makes sense in a way, because they do
represent pin(-groups) differently each.






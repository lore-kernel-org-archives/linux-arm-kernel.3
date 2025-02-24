Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C667C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rkbvCWKWFbcG3pKLozXS5DJoywVzuOsRiaQ4nyhFRLo=; b=XaaYE1+WMhq0KbfwNg4ahJ08mJ
	A4wh/IJbftiboYuBbISJYGBmN4JLSUnxQZ7eUD5HumLeYhNM53O9GaJ+n2zasAZvS8uUsNdDVGJ62
	Eb+zk0QpfcZ+d4W4ESTmR69OHcaiwkRSZtXMrwLKO8w3p6QtjwtZKUKzCcGPv/Qi1RrDFm0XgLJHT
	OPkIXReOu0wtzI6Jkv1BX7aFunDTn64N2kaexW8NasuSh4ka+K8P8CbJtbkvj6DqtRWYOsQq1VNMz
	iAjYpyT55+pAqXVbcJCDqDkgSPzU65TU6Dn9xs5dbyazz0CzqOLy793/fJCdl3ByfMeTgq6ZV/exK
	WC8b0/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUk1-0000000CubG-0XMA;
	Mon, 24 Feb 2025 09:27:09 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUPJ-0000000CocH-3OQ7;
	Mon, 24 Feb 2025 09:05:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rkbvCWKWFbcG3pKLozXS5DJoywVzuOsRiaQ4nyhFRLo=; b=Lyo6wIGSbY/t2pPYdG119NxFo9
	jgXiEoRaMKSwyG5QqIKvPl+sbotacyhcv41fpqXMsawCPvSP150BlMPWpy5oQBCAGO6QDPir1LDkk
	MZJ08PqZRVjdYQnLgtL2n6QYLg8yioK0JccWRGSsTcT5qq7gi7LfEIsAaYHBV77iSRzTDJi/vEeFB
	f696Y+rAoZtcPw9yJCUvAUsaNOrJHSoUVsHXMpLhAQ5t+fH5eh8quSB674NDWn7oHKvVtJxDUGEkG
	RC1gyr0f7ATUW6EXlHraLe8vDkkxcOxFb2671ouru+ZhxS2J9d0fDu119nBR2r8TgajBv4fxgi+Kv
	YYNbJXPw==;
Received: from i53875a0d.versanet.de ([83.135.90.13] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tmUP0-0006rE-Mm; Mon, 24 Feb 2025 10:05:26 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add rk3562 cru bindings
Date: Mon, 24 Feb 2025 10:05:25 +0100
Message-ID: <3234236.fEcJ0Lxnt5@diego>
In-Reply-To: <23c84fd5-83f4-46b3-a247-56e4a2c06d1d@rock-chips.com>
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
 <krrqtjllx6akrurefbtuhgxw6bwmkiro5rtvdexoevjyufm2uz@r5biw7kbttyr>
 <23c84fd5-83f4-46b3-a247-56e4a2c06d1d@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_010545_870139_F0D59964 
X-CRM114-Status: GOOD (  18.55  )
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

Am Montag, 24. Februar 2025, 09:52:12 MEZ schrieb Kever Yang:
> Hi Krzysztof,
> 
> On 2024/12/27 16:25, Krzysztof Kozlowski wrote:
> > On Tue, Dec 24, 2024 at 05:23:08PM +0800, Kever Yang wrote:
> >> Document the device tree bindings of the rockchip rk3562 SoC
> >> clock and reset unit.
> >>
> >> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> >> ---
> > A nit, subject: drop second/last, redundant "bindings". The
> > "dt-bindings" prefix is already stating that these are bindings.
> > See also:
> > https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> >
> >
> > s/rk3562/Rocchip RK3562/
> > or whatever your proper name is (and use proper capitalized parts of
> > products)
> Will update.
> >
> >> +properties:
> >> +  compatible:
> >> +    const: rockchip,rk3562-cru
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  "#clock-cells":
> >> +    const: 1
> >> +
> >> +  "#reset-cells":
> >> +    const: 1
> >> +
> >> +  clocks:
> >> +    maxItems: 2
> >
> > Why clocks are not required?
> The cru is the clock-controller, which is always on module in SoC,
> so we don't need to enable "clock" for this clock-controller.

hmm, shouldn't clocks be

  clocks:
    minItems: 1
    maxItems: 2

The CRU _needs_ the xin24m because that is the main oscillator
supplying everything, but _can_ work work without xin32k .

Sidenote: itseems we're doing this wrong on rk3588

Heiko




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E6DFF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1rUgiNEja4VdnawWmpKJXAeTor1kPOFVIqJ3p24fzq4=; b=OjS4MMJqng4OOs270QsPU/7S0x
	SAxYNodsqIUZ2vRNlMXfN8P/dGWGHz/X1jFaYRcISu15fmwxrFS33T09AdrtGg+a695QDwiFNy5oc
	2/W54224gFXA7TCMcJMqlXJKePoKnl0Q43LX84a/crJ2coZMCH2lh+bM8OSPK+qydfvM9s+wbuW/H
	9wK190RX4bUVISdtN11tHUaz8nMV/Urr6fiqiszsSX85xWTwanrQOre6sadyjYGipCanB3pm6zh37
	Pj1CR5knirNiYytZX3fI+Ygoddbe5nqpgfkuIAjIDtRejXFaEjdMQKnCkRU9IgVqWQ0AsZHMxDKxY
	lW1vJ3DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJgk-0000000H4Pi-0qFo;
	Tue, 05 May 2026 17:36:06 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJgh-0000000H4PA-0knf;
	Tue, 05 May 2026 17:36:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=1rUgiNEja4VdnawWmpKJXAeTor1kPOFVIqJ3p24fzq4=; b=fVEUiBs9iFuCVeDxw3tyYpZCZN
	jC+6HulUNzAiOGjHz2qhVODEf63QJMSAPNI2fHQ1KRosjxwS6PPNUjir0GnJvKMDUMgycEH/6eWwg
	znmbMa0bTyr6CYOvDiwnVPyPb0YmdB+0CcBjnVKyS9OLqKRWJs6FNjlAFWzDjHcFUE7oaRQLTuDHD
	qJ2apECTu8bun55BfPEQtEJH4AepL+0Czk4U5svUtviKuVYEZqwR8nRlTW8/h1LGe8XBN3yu9DYz1
	ZZZaPxkVoU7Pgq28H+NGNKOaiRuNewyWKd7HF8BxdNO6X4l2qhHF5Xi2ogr5ZbMygrURu9DeV6O7Y
	iCPWlZ3w==;
From: Heiko Stuebner <heiko@sntech.de>
To: Dennis Gilmore <dennis@ausil.us>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>,
 Quentin Schulz <quentin.schulz@cherry.de>, FUKAUMI Naoki <naoki@radxa.com>,
 Peter Robinson <pbrobinson@gmail.com>, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Dennis Gilmore <dennis@ausil.us>
Subject: Re: [PATCH v9 3/4] arm64: dts: rockchip: refactor items from Orange Pi 5/b to
 prep for Pro
Date: Tue, 05 May 2026 19:35:52 +0200
Message-ID: <26834823.ouqheUzb2q@phil>
In-Reply-To: <20260429024737.544813-4-dennis@ausil.us>
References: <20260429024737.544813-1-dennis@ausil.us>
 <20260429024737.544813-4-dennis@ausil.us>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_103603_241648_66AE9C35 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
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

Hi Dennis,

Am Mittwoch, 29. April 2026, 04:47:34 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Dennis Gilmore:
> The RK806 PLDO1 and PLDO2 outputs are wired differently between the
> 5/5B and the Pro (PLDO1/PLDO2 are swapped), so label the PMIC node
> rk806_single in the base dtsi, drop pldo-reg1/pldo-reg2 from it, and
> define them via a &rk806_single regulators augmentation in
> rk3588s-orangepi-5-5b.dtsi. The Pro will supply its own mapping.

I guess my only question is, where did that "single" come from and what
is it supposed to mean? ... I would've assumed "&rk806" as label would've
been enough? But maybe that "_single" has some special meaning?

Thanks
Heiko




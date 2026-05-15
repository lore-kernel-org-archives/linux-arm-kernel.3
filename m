Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C5BCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 08:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFOxLwuKLJqHFVUAa7d0vs339f2pCox0FPD1LrAAnQo=; b=qYZrFS8U90JPYQXGjD076Fj5QT
	RJKXbGAzLm9+pf/byn9ejdGkEXoa+HJxo2kJ1as0BxUtlZMz9bShebcgeJ/PmAuDY9sa6L0dzyIsX
	o8E1bOdMa/TeqQgtGcvXvu1bOpbESDdhLgvIIZZrXZaPTQ57rfNkf7vuZtXzNJtAKOiLoukTFDu36
	lF0n1na56dYOIvyBe2PuB+9If9RVyjLtGwpXmd914PJjfhvF2cQB/RN/902QRMYhS9HKnFxT/81Hv
	tvVJLCdGleuH84M36VBEjSdnGTpAQY0rMUQs27b97GjHXDsTOOt2VrRvogVJFwOqK8QITQR4ys0y/
	D0pTmVkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNo4W-00000007l6s-3KMs;
	Fri, 15 May 2026 08:39:04 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNo4T-00000007l5c-3KlC;
	Fri, 15 May 2026 08:39:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1778834336; x=1779093536;
	bh=gFOxLwuKLJqHFVUAa7d0vs339f2pCox0FPD1LrAAnQo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=StoV+jzpjxbhAoP9HPjGBy18gotqnhuHTjD+iqdspaDUwbrDbH6brBTfXAV4CvsYz
	 MURN8g9kejR0W/sMHRBcxXm1xygP975hAQVs7Ttj/oQnIdRytg14FAnV2KFK3XMPJW
	 LlTErOdFlezTlVv4Z0+EoqYWQOKubCCVlGMzMtykSJpPLyYaSfR9HrmhTIIv87u8EZ
	 /IwnqSmDGRKBOHtQYlT2dR5j2HDY0ywcg6Qmf+IkEKko1Tk1uhuclFF9utA42IukFI
	 S1jeQ331cIsWIyejiICOu403zxKKC/fEe9yfLCaOidtkhSVbLnIlZ2wOrlBn8kZDeC
	 7WPe05ky813jQ==
Date: Fri, 15 May 2026 08:38:46 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 16/16] MAINTAINERS: add MediaTek mt6323 PMIC thermal driver maintainer
Message-ID: <F4Z7s65enSXh9nWU9ypYTOaxyIVJX68NzxyJAH6FDNZxtJ-3JwSc0iIsK9v5rwdavG2SlwyuIp1cz-N4s2P7OwTHJ69edEjQsEG40C0_yl0=@protonmail.com>
In-Reply-To: <20260514-sweet-electric-buffalo-841c18@quoll>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-16-3efcba579e88@protonmail.com> <20260514-sweet-electric-buffalo-841c18@quoll>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: d8c14f9fad7e94425200fd560e52fcb3d8ec6e2b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_013901_987979_D1EE2761 
X-CRM114-Status: GOOD (  14.82  )
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

On Thursday, May 14th, 2026 at 4:03 PM, Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> On Tue, May 12, 2026 at 08:18:30AM +0300, Roman Vivchar wrote:

...

> >
> > +MEDIATEK PMIC THERMAL DRIVER
> > +M:=09Roman Vivchar <rva333@protonmail.com>
> > +S:=09Odd Fixes
>=20
> Odd Fixes means driver is half-abandonded, so please explain in the
> commit msg why you add yourself as maintainer but not really committed.
> Such entry makes more sense for subsystems, but if individual driver has
> odd-fixes stage, shouldn't we just remove this maintainer entry? If so,
> why adding it in the first place?

That is a fair point. As an individual contributor, I'm hesitant to use
"Maintained" indefinitely, but I understand that "Odd Fixes" for a new
driver is not the best idea either.

If no one else can take it, I'll change the status to "Maintained" for
v3, but I want to see if there's a more sustainable long-term home for
the drivers first.

Angelo, Matthias:
Since the patch series is about MediaTek PMIC drivers, would you be
open for taking drivers under "ARM/Mediatek SoC support" entry?
Or is there someone at MediaTek who might be interested in this?

Best regards,
Roman


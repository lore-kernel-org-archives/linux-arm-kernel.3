Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 093EFCD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 14:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bjvlgt0Lgrc9OBikw5UYF113Dh9R7321VRJTyU1aRkA=; b=1lYCi97KiBd4XgDCbSsLcv5i+6
	f3QL3KXsFBA36w03a8pniG3NwLabuEK/iRllYggRNyfT21I4KPdQv42c3wjzi72xjEABrXPD/FyAV
	0EoHs8t4x8KqFf9BWu8AmuoNGpsKQDbnC42BhSJPaS8Zbgxm7e4fs2dkNkPaiyY5jebiYANDkFY1Y
	mTRJDv8/4866SXdLqJV91qSgPSo7H9/F9NEN1SY+TmkX2Bpr71lqShDQPXTwcBmvJxpr34x/LDXlq
	7UTG/Q1d5HEws49QBH7arhza8lOvI1q9wO4F15awzccWkTFkAWI1oIntq9Cxzkzs2oZhhB8Artclt
	faZ1RaUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoCQ-0000000H33k-28GP;
	Tue, 12 May 2026 14:35:07 +0000
Received: from mail-43166.protonmail.ch ([185.70.43.166])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMoCN-0000000H32d-1VhL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 14:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1778596500; x=1778855700;
	bh=Bjvlgt0Lgrc9OBikw5UYF113Dh9R7321VRJTyU1aRkA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=zPZD/p4SRQgqRukzsZL8bfeuoUSZlow8uaSZj8HdWMiT1ef1HN/ZIXaLy/0KCPInP
	 SASaTb2/Z2Uf/M+XrpexvbSgYgxVF/Mo8BmlCpluMJAqcvhtKAIFImoy2WbaFWLjjR
	 mAcTx4LqulUTmRWkPwhTE+WUSYzmuYsHUV2BtrdscD2iE9Tiv96KiUci86fVA3WieJ
	 a9LmYG3HqnRq5QRH23n2Q9BRY8Agl2SQuRYPYs7xYnw3h3ii3aRjv33L/Oy9WvEDSt
	 YV8KUgbSgbOfzSFuTvKXm7h4SYjEPN7IgvnCzrFq4yKc8S2ITo0KzlsG/AkD49NtuH
	 xs/29bVL96M2A==
Date: Tue, 12 May 2026 14:34:55 +0000
To: Jonathan Cameron <jic23@kernel.org>, Andy Shevchenko <andy@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: David Lechner <dlechner@baylibre.com>, =?utf-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, Ben Grisdale <bengris32@protonmail.ch>
Subject: Re: [PATCH v2 05/16] iio: adc: mediatek: add mt6323 PMIC AUXADC driver
Message-ID: <gWxamwTKyUeOF4QCsiIsrnh7DSWzIKFaY0h83qKq_0vg786xv1uFYhypix7BVO_ruG_vw3DrIsRhIKv5NAzl8hK72rjzPAjwAGU-rhkMgeA=@protonmail.com>
In-Reply-To: <20260512142932.5c6801d1@jic23-huawei>
References: <20260512-mt6323-v2-0-3efcba579e88@protonmail.com> <20260512-mt6323-v2-5-3efcba579e88@protonmail.com> <20260512142932.5c6801d1@jic23-huawei>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: f3a0f1c1dc4818e265ee79b323d08552aaf3f4e5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_073503_538652_BDC2C272 
X-CRM114-Status: GOOD (  10.22  )
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

On Tuesday, May 12th, 2026 at 4:29 PM, Jonathan Cameron <jic23@kernel.org> =
wrote:

> On Tue, 12 May 2026 08:18:19 +0300
> Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wro=
te:

...

> > +#define VOLTAGE_FULL_RANGE=091800
> Probably better to have this inline - however if you do keep it
> prefix t he define  VOLTAGE_FULL_RANGE sounds too generic!
>=20
> > +#define AUXADC_PRECISE=09=0932768
> I'd put that inline.  Little benefit it in having it up here...

There was a mention about magic values in the v1 for the thermal patch [1].
Andy, would it be better to use an inline style or a #define here?
If the former, I'll rename the first constant to something like
AUXADC_VOLTAGE_FULL_RANGE.

[1]: https://lore.kernel.org/linux-mediatek/afmnUG8dG0N0HpV6@ashevche-desk.=
local/

Best regards,
Roman


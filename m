Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8840EC531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 16:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHj2JaKn6I/rJijt+vIp+5NEvZ+qxwlBgSIZwX/C1FU=; b=MctWa9IaEsv33br4X0T/ie14ox
	GKxDWdd4syE4rAh5W4tzi55TGe2ttBB3+AM6SlgsK0G2oxAIqlQdGrDChcTRJadJ5Wp59m3yUQjjJ
	q1asSeaW712BeHEk0L9jF7L/R8Ykb4KRQ3Xnk6+o8BvdRKvRO36SNpU8fgSmRQX9VjjcEouGQpWAe
	LWN4/rdfDZQP4F9kA1hAEs23B24X4IriJIZzrbTOjvrpJYMd8l8+GRqiV+Jxr4qYMXbUWoxP7SoM3
	uwDtP0jN96seEdos9I4X8PYCfIUYX4w5Foci0rwyUpgymz4LmVxQruVhp4YGhqXAIkG69nNS+5los
	qIbB5rJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw6A-0000000EhNb-0rF7;
	Thu, 23 Jul 2026 16:16:38 +0000
Received: from mail-10697.protonmail.ch ([79.135.106.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmw67-0000000EhMr-3okN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 16:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784823392; x=1785082592;
	bh=lHj2JaKn6I/rJijt+vIp+5NEvZ+qxwlBgSIZwX/C1FU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=xlNYzpBieqQuUSccbe6VE+8q6ZS1yleTG5agbdXP6hhaIWGPxJ07RGkAQukayfpiv
	 BEGrE/J0I5mpcDeDRYHa56Dc3m6URjULGPV+4K6pZMM9xUC22iSZ00c1ZFmJ1JwF/x
	 xUNisBiFtg1WIUiLbsixtqWYBGpu3eyC3tnWqRzQONnTMG/Rp8T5wbq9oRlntbGFn/
	 bYkBwh8RwRAKffdSITgRtvSxrVvY3bmdLZtPnmQ2gnP/VMCqCrfyRqh/syYaVjmHK3
	 QuxUf453uyasa4YaClzO1aoC4i4UlBpqD17MJEyrsC2EyY47Vy/lR3+vlDdwRqzxxf
	 Cv28wlJOzyiNw==
Date: Thu, 23 Jul 2026 16:16:24 +0000
To: Lee Jones <lee@kernel.org>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Srinivas Kandagatla <srini@kernel.org>, Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
Message-ID: <ZNHaOI0ufFpvkyR3fCOd7I-CO8x9-adM0bJfk2U_TGsQrUGvhUV_8oXVnGWaS3bt9AuhxjXfcJGVtFFFg2X7FOWVcMf1sLK6OpRbtYe9BlQ=@protonmail.com>
In-Reply-To: <20260723160059.GB3526803@google.com>
References: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com> <20260713-mt6323-nvmem-v3-1-205c39267a24@protonmail.com> <20260723160059.GB3526803@google.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: e13033346bb107811f977e1b6967b3e0e4fc03a8
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_091636_124749_681CF0D0 
X-CRM114-Status: UNSURE (   7.50  )
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

Hi Lee,

On Thursday, July 23rd, 2026 at 7:01 PM, Lee Jones <lee@kernel.org> wrote:

> On Mon, 13 Jul 2026, Roman Vivchar via B4 Relay wrote:

...

> > +        efuse {
> > +          compatible =3D "mediatek,mt6323-efuse";
>=20
> Nit: This tabbing looks off to me.
>=20
> The example below uses 4-spaces, this uses 2.

Oops, you're right... Good catch :)

We had some troubles with driver merge, so it was dropped from the nvmem
tree for now. I will resend it with fixes (and spacing) when dependencies
arrive.

Best regards,
Roman


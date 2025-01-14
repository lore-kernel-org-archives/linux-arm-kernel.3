Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D488C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 15:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aa7NdIF/RsOjWlxdLoQ1fr760uFjUhbc7xZg2HditVM=; b=d7PymQlI5tBvFzNf8XNuNJzgTC
	BZ325KgBbP2JxMkdh/u8I1lV1KBvwoQmZwQ4xI3JrSyoXwoOZyaKvQ9C7jUQP5cc1s8Yd5anziUSH
	Ka0M+FneptK4RVLzlANYsXZLZdlA/dE+xsAtflEiFlr29fKsfs38IEE4MrqSdcdSqpAqxx6vG28aT
	GXiXhvRUwDS3F0/m4wvOJIuHcShlmXC92Eu7vxgjbScPqJW3TEjkVDcD9/H2OxQr+3kbeYolQp5rr
	YR8f4fQIIihxF49M7qi9OlweOqMSFTIDqehb4f3I1i6n55bxnj4vqNI2igyEjq85VYoul4DRsxzVf
	/ZjBM7vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXj8y-00000008vK2-0j2N;
	Tue, 14 Jan 2025 15:47:52 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXj7i-00000008uvG-1k7o;
	Tue, 14 Jan 2025 15:46:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C884E11FB;
	Tue, 14 Jan 2025 07:47:01 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81B6E3F673;
	Tue, 14 Jan 2025 07:46:28 -0800 (PST)
Date: Tue, 14 Jan 2025 15:46:25 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Parthiban Nallathambi <parthiban@linumiz.com>, Joerg Roedel
 <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 iommu@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: Re: [PATCH 10/22] pinctrl: sunxi: add missed lvds pins for
 a100/a133
Message-ID: <20250114154625.7d82c858@donnerap.manchester.arm.com>
In-Reply-To: <CACRpkdY29s6Cz3zvtksLO8sESwxhkVdmGUipVAqiEtix3E1=Vw@mail.gmail.com>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
	<20241227-a133-display-support-v1-10-13b52f71fb14@linumiz.com>
	<CACRpkdY29s6Cz3zvtksLO8sESwxhkVdmGUipVAqiEtix3E1=Vw@mail.gmail.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_074634_497604_5B66FC00 
X-CRM114-Status: GOOD (  10.90  )
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

On Mon, 13 Jan 2025 15:30:24 +0100
Linus Walleij <linus.walleij@linaro.org> wrote:

> On Fri, Dec 27, 2024 at 12:09=E2=80=AFPM Parthiban Nallathambi
> <parthiban@linumiz.com> wrote:
>=20
> > lvds, lcd, dsi all shares the same GPIO D bank and lvds0
> > data 3 lines and lvds1 pins are missed, add them.
> >
> > Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com> =20
>=20
> Nobody seems to have any objections about this patch and it seems
> technically correct so I just applied it to the pin control tree.

I think Parthiban had troubles with his email server, so not the whole
series was sent out:
https://lore.kernel.org/linux-sunxi/314b6bbe-613e-41a6-955e-50db6e11ef8e@li=
numiz.com/T/#u
At least that put me off from reviewing it in anger.

I do have a comment on this, will reply in another mail. So can you hold
this patch back still, for now?

Cheers,
Andre


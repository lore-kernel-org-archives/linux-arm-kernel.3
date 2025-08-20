Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14E5CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xoMCU8Hclk9pQcShf2e7pCFyLlcJYafcaHzntjO6HTU=; b=WnjUNNvVNJhLQ/HZ9ODeMlWRvJ
	0U6Uy3R0IO88MG9wlgnMz1nIuUXPz1hmJDZA80sONfkRRxAC6Om4sEe74Domv/6cdbIH7n5mvUkJq
	xlJlou+zZ6B2yoKFJ4yv48Oni82s/DAS8Ef3BdRs3ZgEaL3tjsmDRWSYCq3sUYk3m9LZ0WMDpY9SL
	tAVhStyZTP0Tn3tGuKniZG3bUEZqhzAiOloIdajRzqBjniUQuabHfCtN4+tVVR3JfkBoYildfAbFe
	UN/b+LekFrtMqixSbJPEFce+k9y1aCKWcVJDz8eye0W7GBLZ17vdCk2GgfuQfq/9HgSvzw6zuah36
	w7jMMCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojlh-0000000E2kH-0ucw;
	Wed, 20 Aug 2025 14:26:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoivE-0000000DnjN-2lRa;
	Wed, 20 Aug 2025 13:32:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696731;
	bh=xoMCU8Hclk9pQcShf2e7pCFyLlcJYafcaHzntjO6HTU=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Lfj2HXzeHIsmYD7rf/UNXlZlzTAuvZ7f+sCaCRuYF/Gb1w2F1j1MYuFXsbGDIfU3p
	 w2/yNSY42ePNPmXRDbYu4tHcg+ho5ugQh0teIZwu43GS4q+CQeuOqy3I7f6OsYYBli
	 D2ArhoUvxXX9sHfgj0drPeVwm4ln9F+s9myHFclfgb953ayoQgwaBCfClOKeHJA42N
	 L+6h5GwzRsMhWUyZQSiX+DkLZmEB+0IyXYmx2GehA1PxXstHP6hLcy5hnSA+yTB6lG
	 42C2eyCZ41vBymwNKzzY5jjtI1DFR4gT9mf4ywH1ELcbI9eiSh7ZrKe/PhkyEmMX6B
	 CkT3sqDqgVHGg==
Received: from localhost-live.home (2a01cb0892f2D600C8f85cf092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECCF017E02B0;
	Wed, 20 Aug 2025 15:32:09 +0200 (CEST)
Message-ID: <c8cbfdc79b5832d3640141a5ec5a47aacf94b57f.camel@collabora.com>
Subject: Re: [PATCH 4/9] ASoc: dt-binding: Convert mt8183-afe-pcm binding to
 YAML
From: Julien Massot <julien.massot@collabora.com>
To: Rob Herring <robh@kernel.org>
Cc: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ikjoon Jang
 <ikjn@chromium.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, Chen-Yu
 Tsai	 <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, Eugen Hristev
	 <eugen.hristev@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown	 <broonie@kernel.org>, Julien Massot <jmassot@collabora.com>, Sean
 Wang	 <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Date: Wed, 20 Aug 2025 15:32:09 +0200
In-Reply-To: <20250801172600.GA3107067-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-4-6ba4e432427b@collabora.com>
	 <20250801172600.GA3107067-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_063212_848067_3147CBF0 
X-CRM114-Status: GOOD (  15.55  )
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

Hi Rob,
On Fri, 2025-08-01 at 12:26 -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 01:18:06PM +0200, Julien Massot wrote:
> > Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
> > .txt format to YAML schema format to improve validation.
> >=20
> > While converting, also document all clock inputs used by the AFE block.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../devicetree/bindings/sound/mt8183-afe-pcm.txt=C2=A0=C2=A0 |=C2=
=A0 42 ----
> > =C2=A0.../devicetree/bindings/sound/mt8183-afe-pcm.yaml=C2=A0 | 225 +++=
++++++++++++++++++
> > =C2=A02 files changed, 225 insertions(+), 42 deletions(-)
>=20
> This should come before patch 2 since it is referenced there.
>=20
> Yes, I will swap the patches in the v2.
>=20
> Use the compatible string for the filename.
>=20
Ok
>=20
> Otherwise, looks good to me.
Thank you,
Julien


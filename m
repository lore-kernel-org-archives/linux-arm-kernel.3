Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE9ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 14:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SaNvr16XH7ej2OcXCQ1iRpF9atHKPorFp7MQLGCnfjs=; b=ftpQlgkQCWLv9p1+1NPAjnu2xl
	Jrx7h1UcsHmJZCa/TjxNQYdKFqZmjMX8wj+4mhIgwj940CWpfZj8WqGIsTkgTvvdPKgmq8m3Yzms1
	9OlOch2PgrReQuK+Y55OQHmI2MYIpjurneGqxVsdCWrOuIZ35XkCklo36OZ5mtx+nC/wxgbuDJSI2
	ckYjsFwCNaRFbaUC/rQaDySvmm2wQIWoC0O9TLpuwdLRIeEriVRl/Mx3OYXbUKJ+yTugVjDzqUyuv
	lcoQADmROZd1rHmQRW1K6w5W9Boze1TXG0PgvuoXdZ4D5Mtp6XBuRpZQiLceJUtIdwPXbYgxpPVSf
	LjwfNLvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojqq-0000000E4JE-3BHY;
	Wed, 20 Aug 2025 14:31:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiwj-0000000DoBJ-1bfB;
	Wed, 20 Aug 2025 13:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755696823;
	bh=SaNvr16XH7ej2OcXCQ1iRpF9atHKPorFp7MQLGCnfjs=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Lxm4LncNaa+hg66D90Mv8uIt9ZS7bBKPXRKwixPiMamgBj+MlLq+GKRCnrEYXF9Zv
	 K4O8DdzbWKptMKtRuyiZ7EjsNS+tf+n0ANEkVcr48rZMtt9G2/ZUuyMAODBbMVdyBw
	 9bzbx38MYoYqDzZapd6D4Ah7dii3KOWJuwKjEUI3aMzYlk25d25qqAE1IrG9Ul4qH5
	 TXn6ihImAU13F73fbOTBpViQKDeYQ4FPOQnMtp/BplzrTCOV6E3whfMybGMIr7MfJf
	 gq8sWrk4z7VK/CpH34VO45pG1rc5YU/B4oCTJxS9gCfQwCIAY3vykR2iEeXME3lepv
	 5LhB/otf/pKvQ==
Received: from localhost-live.home (2a01cb0892f2d600C8F85CF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99DDF17E02B0;
	Wed, 20 Aug 2025 15:33:42 +0200 (CEST)
Message-ID: <ff583d9675181e2e6f39169a55da8958014f0ea5.camel@collabora.com>
Subject: Re: [PATCH 5/9] dt-bindings: sound: Convert MT8183 DA7219 sound
 card bindings to YAML
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
Date: Wed, 20 Aug 2025 15:33:41 +0200
In-Reply-To: <20250801172821.GA3111733-robh@kernel.org>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
	 <20250801-mtk-dtb-warnings-v1-5-6ba4e432427b@collabora.com>
	 <20250801172821.GA3111733-robh@kernel.org>
Organization: Collabora Ltd.
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_063345_595486_5DA79A37 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, 2025-08-01 at 12:28 -0500, Rob Herring wrote:
> On Fri, Aug 01, 2025 at 01:18:07PM +0200, Julien Massot wrote:
> > Convert the Device Tree binding for MT8183-based boards using the
> > DA7219 headset codec and optional MAX98357, RT1015 or RT1015P speaker
> > amplifiers from the legacy .txt format to YAML schema.
> >=20
> > This improves binding validation and removes DT schema warnings
> > for boards using these audio components.
> >=20
> > Signed-off-by: Julien Massot <julien.massot@collabora.com>
> > ---
> > =C2=A0.../bindings/sound/mt8183-da7219-max98357.txt=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 21 ----------
> > =C2=A0.../devicetree/bindings/sound/mt8183-da7219.yaml=C2=A0=C2=A0 | 49=
 ++++++++++++++++++++++
>=20
> mediatek,mt8183_da7219.yaml
>=20
Ok, Fixed in v2.

Thanks,
Julien


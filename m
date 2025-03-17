Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07AAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 10:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHLKtqKokb5/ORaPjnoa21RvlOzXzzI+TwJQN4jKmm8=; b=3ilzrjO/sPzzdpiCzCpqLFHb3w
	rKzNrSaO41kDnDz07zdvmEYLvN4SjqzXPOfrSFl5jqW2CfeaiMRgbEZ5qqvpcEeTMbh3OEm0jj+BI
	PexXeOb+PJtAeTYvztk7RSAx41g6dLlSJdD2CTfS2QFyMfJWOCsDUEusCEbgsNEGbk/K5hhgGxgKO
	5qjrxr+1MJOE/TR42F0S1C65cEIzAcprnhRvQA2u3GkUPwyyseVe/wUq6ttC5l5tjsiRsmm+TCVo9
	N4bUUwQrmNGHF8aWpL9VQlLB5KeP74dDBeoe9rXJIW8NiQKEswefdG2Z0Qlzc+EUTjASyR596opHv
	+1I9+0lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu85V-00000002GC9-3m2q;
	Mon, 17 Mar 2025 10:52:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu82E-00000002FPF-1KE8;
	Mon, 17 Mar 2025 10:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B01E75C54E5;
	Mon, 17 Mar 2025 10:47:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62BD1C4CEE3;
	Mon, 17 Mar 2025 10:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742208569;
	bh=DHLKtqKokb5/ORaPjnoa21RvlOzXzzI+TwJQN4jKmm8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FTMTEiayCOljtv8GLrylo8HGHweUsQRLbmaUiKxoofC4/CYB8N2vxqCoTaE1F5Z6D
	 A2k5slyoogC1NQGauUeuQTMSB4yYKO+KrpsOJqfiHJLQDZBfQdlJJCwcGRiwGzMuN/
	 Hy3m/rCrQPwnptuswFLkxHEzWN2b4U+hha7f8aEn9/uT4elbWZYqcjGej2yWiDPskr
	 WfJuU8/qfKryhJoH3KcgN5y2dWHwn7x02FTiz6DXznKfslnJBwlQwxCEw2mWVWmMT9
	 7dF9xr3GXqRs+0Na8zNmlP5ny5KLkY+VRdQ5fHl0TaTdbRdRI3msX75tfZo8dahRl7
	 bM+FkVf599Q3Q==
Date: Mon, 17 Mar 2025 11:49:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lu Tang =?utf-8?B?KOaxpOeSkCk=?= <Lu.Tang@mediatek.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Chen Zhong =?utf-8?B?KOmSn+i+sCk=?= <Chen.Zhong@mediatek.com>, Sen Chu =?utf-8?B?KOWCqOajrik=?= <Sen.Chu@mediatek.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?= [PATCH 5/5] dt-bindings:
 pmic: mediatek: Add pmic documents
Message-ID: <20250317-mighty-dolphin-of-downpour-e7a9f5@krzk-bin>
References: <20250314073307.25092-1-Lu.Tang@mediatek.com>
 <20250314073307.25092-6-Lu.Tang@mediatek.com>
 <SEZPR03MB6891E21CD04880AB1AC91BFC80D22@SEZPR03MB6891.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SEZPR03MB6891E21CD04880AB1AC91BFC80D22@SEZPR03MB6891.apcprd03.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_034930_472078_D09D5E15 
X-CRM114-Status: UNSURE (   6.76  )
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

On Fri, Mar 14, 2025 at 09:01:11AM +0000, Lu Tang (=E6=B1=A4=E7=92=90) wrot=
e:
> Update email
>=20
> -----=E9=82=AE=E4=BB=B6=E5=8E=9F=E4=BB=B6-----
> =E5=8F=91=E4=BB=B6=E4=BA=BA: Lu.Tang <Lu.Tang@mediatek.com>=20
> =E5=8F=91=E9=80=81=E6=97=B6=E9=97=B4: 2025=E5=B9=B43=E6=9C=8814=E6=97=A5 =
15:33
> =E6=94=B6=E4=BB=B6=E4=BA=BA: Jonathan Cameron <jic23@kernel.org>; Lars-Pe=
ter Clausen <lars@metafoo.de>; Rob Herring <robh@kernel.org>; Krzysztof Koz=
lowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Dmitry Tor=
okhov <dmitry.torokhov@gmail.com>; Lee Jones <lee@kernel.org>; Matthias Bru=
gger <matthias.bgg@gmail.com>; AngeloGioacchino Del Regno <angelogioacchino=
=2Edelregno@collabora.com>; Sean Wang <sean.wang@kernel.org>; Linus Walleij=
 <linus.walleij@linaro.org>; Liam Girdwood <lgirdwood@gmail.com>; Mark Brow=
n <broonie@kernel.org>; Stephen Boyd <sboyd@kernel.org>; Chen Zhong (=E9=92=
=9F=E8=BE=B0) <Chen.Zhong@mediatek.com>; Sen Chu <shen.chu@mediatek.com>
> =E6=8A=84=E9=80=81: linux-iio@vger.kernel.org; devicetree@vger.kernel.org=
; linux-kernel@vger.kernel.org; linux-input@vger.kernel.org; linux-arm-kern=
el@lists.infradead.org; linux-mediatek@lists.infradead.org; linux-gpio@vger=
=2Ekernel.org; Project_Global_Chrome_Upstream_Group <Project_Global_Chrome_=
Upstream_Group@mediatek.com>; Lu Tang (=E6=B1=A4=E7=92=90) <Lu.Tang@mediate=
k.com>
> =E4=B8=BB=E9=A2=98: [PATCH 5/5] dt-bindings: pmic: mediatek: Add pmic doc=
uments

The amount of errors shown by checkpatch on this is just shocking.

Best regards,
Krzysztof



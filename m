Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E26CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=onWJ6ONltn94K0nYjjsvbs8zBVxp2RtNkWHz5Qqtqr0=; b=dRuScSMEASY/EeSOOnzYqnZUR0
	ylG2J5Pjhy7Gm4P95RSnwCgyLG3AFqRpBv1lfLFoePKi3R7vQEMPQAMCLoctQN64KLxq21gzICYyx
	6/gFVd+OZyPOJwmrfqDy39oqUk/+m8nzVK57IUh2E2n04oXt+2Tj2YL4MIJKXKxmJPqoEN0MRvbtL
	Ky/Q5F8+OaRzYn02fLFuhZME9mZaRd4z0IolUQZ3F/E6rS0kgVtZQySl2BWxYV8RTDgP+XAyRK4Dg
	cWsvOm8/Rwx7c//lC18XtvJhTP3okvKeRRmtmTPRyUtn1KyrsBQ06daQxiW9nNw4hx0hvKZN/TL4V
	WhvK11YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCWx-0000000A5Zl-0Qsl;
	Mon, 12 Oct 2026 09:41:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCWu-0000000A5ZL-3M0R;
	Mon, 12 Oct 2026 09:41:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E80B600E2;
	Mon, 12 Oct 2026 09:41:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1091F0089B;
	Mon, 12 Oct 2026 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798072;
	bh=onWJ6ONltn94K0nYjjsvbs8zBVxp2RtNkWHz5Qqtqr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HNvG2Hdz9LqP3HuiblCNkrZDD3gYnj021ugBuK5zLthlyi/HJsV2SvQbppMUxum2Q
	 TaPYv+DPuIqAPnc43QMtP0l1cISjDlIMEomSHV5Zn0J984X2fS+YG+XYCAIXsH1ZTt
	 Ba7bTc+/K01AyMCyoZ0JapPT5SQ1XZJQarXiZcQm6V3lnPTXF9hlesm2eUm8DIaqzl
	 eo/nH/jWCxxKJ2EFoUp5C9zj27jWw+jySu/iZ3+1vtnEo3r4Q27C6MUmuTawuvoK/N
	 T/Fg0Yp5va8TGtdxs6eKzTwbBqZ8Nuy94CPEZwWPdhhrf+Zz2UlbBBvcVc6by/MNpe
	 J/TeqwjLhjHIw==
Date: Mon, 12 Oct 2026 11:41:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"l.scorcia@gmail.com" <l.scorcia@gmail.com>, "fparent@baylibre.com" <fparent@baylibre.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>, 
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, 
	"wenst@chromium.org" <wenst@chromium.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"mani@kernel.org" <mani@kernel.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for
 mt8167
Message-ID: <20261012-eager-agile-pegasus-7aacd2@quoll>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
 <20261010115539.9237-2-l.scorcia@gmail.com>
 <ecdf765641209f3d0f27fe8ae77fe9145884d932.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ecdf765641209f3d0f27fe8ae77fe9145884d932.camel@mediatek.com>
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

On Mon, Oct 12, 2026 at 09:19:59AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89) wrote:
> On Sat, 2026-10-10 at 13:54 +0200, Luca Leonardo Scorcia wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >=20
> >=20
> > The hdmi-phy for the MediaTek mt8167 SoC is not compatible with any of
> > the existing hdmi-phy. Add a separate compatible to describe it.
>=20
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

If you are going to review this, then review entire code, not just piece
visible here while leaving the rest obviously incomplete.

Best regards,
Krzysztof



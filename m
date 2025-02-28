Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19339C282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 07:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zhxHmTPzF8VZpjhHrZd+V7oG1wQpfMoIenBhZcYR4SY=; b=3apjJdmUnnhdJXexBe8UVziDHL
	/69hl7DypOL8cNY2Ew7vjt+dsOHQ7KKdvLPJ2BdyoFEJ4HK1XFmxhQQ9NJgEfjKFks8z7w9O4LdZ9
	m+4Jj5glPOxej/fmgFTuVsm0EZKD1Qr/YIi8vyF+ITNRiYK7kovoj5Bv7OmNkbphumQ4vYbQfP6t1
	wU1IStdlmrDj+NDEwBBo7Kl4wX5Ba+kqz0ZGfFZuVOCz/4COP7oHG28oqsLg/iZWa63Qc21kbq+um
	/kVdVOZnoIXGJJKRKKtCUnQ+svorb2wh4PYCe2qulPexUHEAgcNJHeoLWmMXOcT/xA3viYunQZJbq
	5a52dCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnudC-00000009xhV-1Q8K;
	Fri, 28 Feb 2025 07:17:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnubd-00000009xUR-38aJ;
	Fri, 28 Feb 2025 07:16:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5B5AC5C657C;
	Fri, 28 Feb 2025 07:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF080C4CED6;
	Fri, 28 Feb 2025 07:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740726980;
	bh=yTAonuXu9g+7b403MqlF70eqbtyFbgQ9pVocq4PQpQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dKIUnSu8RkmgEFcxIbrDi1ImE6coM4nmXEmlshwXl48ohFX4lvxDySibsdIBx/9oS
	 6r/ncceId1/ytctKFr2W/xnLgijpF1aJ6n06etKCjsTNnZty/elmZodbyNIqhoO47T
	 X23+3V+pvJvuFiibc01fXeZpgc0XZAiqWYhURcjqi9JjEj1SSXCnDm1lZCdMg7Jbbp
	 MZVPO3y2paINJUQt+6YyZYDqLuFBf+Xp3BMNAzYS39dSCz6YZxCa9H6ZMeAccrnsVg
	 BcL00bHf3qFwXKIbs0oEJatJSZ4n18N55MOuCIzI9qFFc273m8Hwz0wRdhY3bLaLnm
	 gvReSNISlgd2g==
Date: Fri, 28 Feb 2025 08:16:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu =?utf-8?B?KOiuuOWNjuWptyk=?= <ot_cathy.xu@mediatek.com>
Cc: "robh@kernel.org" <robh@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Lei Xue =?utf-8?B?KOiWm+ejiik=?= <Lei.Xue@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	Wenbin Mei =?utf-8?B?KOaiheaWh+W9rCk=?= <Wenbin.Mei@mediatek.com>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>, 
	Guodong Liu =?utf-8?B?KOWImOWbveagiyk=?= <Guodong.Liu@mediatek.com>, Yong Mao =?utf-8?B?KOavm+WLhyk=?= <yong.mao@mediatek.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"sean.wang@kernel.org" <sean.wang@kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, Axe Yang =?utf-8?B?KOadqOejiik=?= <Axe.Yang@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8196
Message-ID: <20250228-encouraging-trout-of-action-cfcd5a@krzk-bin>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
 <20250228011702.16493-2-ot_cathy.xu@mediatek.com>
 <174070957527.867625.13463640154036333781.robh@kernel.org>
 <d5bf6e1b6c277e6431cffeef66a4766f59f94fe5.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <d5bf6e1b6c277e6431cffeef66a4766f59f94fe5.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_231621_832654_3D00CF88 
X-CRM114-Status: GOOD (  14.97  )
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

On Fri, Feb 28, 2025 at 03:11:41AM +0000, Cathy Xu (=E8=AE=B8=E5=8D=8E=E5=
=A9=B7) wrote:
> On Thu, 2025-02-27 at 20:26 -0600, Rob Herring (Arm) wrote:
> > External email : Please do not click links or open attachments until
> > you have verified the sender or the content.
> >=20
> >=20
> > On Fri, 28 Feb 2025 09:16:25 +0800, Cathy Xu wrote:
> > > Add the new binding document for pinctrl on MediaTek mt8196.
> > >=20
> > > Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> > > Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> > > ---
> > >  .../pinctrl/mediatek,mt8196-pinctrl.yaml      | 241
> > > ++++++++++++++++++
> > >  1 file changed, 241 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-
> > > pinctrl.yaml
> > >=20
> >=20
> > My bot found errors running 'make dt_binding_check' on your patch:
>=20
>   Sorry, this patch depond on another patch:
>  =20
> https://patchwork.kernel.org/project/linux-mediatek/patch/20250228011702.=
16493-3-ot_cathy.xu@mediatek.com/
>   In this case, does the dt-binding still need go first? If so, I=20

This means your series are non-bisectable but even re-ordering will nto
fix it. You understand you target different trees?

> will include the dependency information in the commit message of=20
> the next version. Thank you~

No, decouple from dependencies.

Best regards,
Krzysztof



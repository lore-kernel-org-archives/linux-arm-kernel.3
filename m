Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64B9C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MVVLvE90fQ7WmoELEjqp4sHIFe3nRrj87JvQ3rAea0k=; b=yeZ04xDJcrQz62v9KEolhK/cco
	51WUcezWEa1cJDISxe0r+YqAyIF5Zt9tezLDI5bc0HnfVhCqixAlLxvPMe3iWFOx9QvxQCCJo71Mf
	ByJyDqVK7y/V+xCBHQ6JzUyWJXZct4SFjOMQxiJlE3oltDP6mkrU0Z/7TkqcFHjRG7Bh5G+5Tm1+n
	wyMByUzVrEDg8XUJ0XNO/1IIG+BWZPHxhZrkyqtQbPV+lzaaKtu1iDIRMmkE+tPxAixB2c7YV0mGs
	w1Tpjwd7Myh+wgAlJpu114LBwEa5eQ1BhYNOvHUPA3bE4A6B+MkzJhj2EMQILYArqyT36SDoMqJx1
	7Z9TJPgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlo7y-00000006okz-3gBl;
	Mon, 20 Jul 2026 13:33:50 +0000
Received: from mail-24426.protonmail.ch ([109.224.244.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlo7v-00000006ojT-3I4A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 13:33:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1784554422; x=1784813622;
	bh=MVVLvE90fQ7WmoELEjqp4sHIFe3nRrj87JvQ3rAea0k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=r8sHuiwmmwgjaayUilvtsFIMfdeUlI09w2ctFtoG5E29SALjpYYgHvQrMPHMwD4Zo
	 mWh3MXVoclvO9WUqjZunx55+knaivwf3GuHO1GiuK84Xqkb6Drz0mBEfxjGzWc6byc
	 DFltL3byxRQXRd4Kp2yg3ZnCQnMUzRWgzxPXxIkwkR6/Oxl6E2QXDrdXzhepCcFDiW
	 kysVZq4BGraWN3k/Y0a/L3CtOhIf9fGVManvMX28kyvejLMs4XxTrkTtWTlKGCSdH/
	 xLrRzKghqvSlDluxOgwXMaTd47VoXaKwKmoDKmA2fVwFeLjsEUl1bOLQ9prY/735Aw
	 96rheXJVrVpLQ==
Date: Mon, 20 Jul 2026 13:33:36 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lala Lin <lala.lin@mediatek.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] nvmem: mtk-efuse: add mt6572 support
Message-ID: <LQrjqkJAVzl-TSaOAypAQdfM8rR4F59aSX5yJIw8S3neOhFlPmTeFrW1PBK4JDos7v7VvL8nTblX22lK78U0FlVE_bwuOJYR36CK3eDE5RM=@protonmail.com>
In-Reply-To: <2aa16ed7-5d36-4e78-929e-84b9d6befe77@collabora.com>
References: <20260715-6572-nvmem-v1-0-9c13be99d077@protonmail.com> <20260715-6572-nvmem-v1-3-9c13be99d077@protonmail.com> <2aa16ed7-5d36-4e78-929e-84b9d6befe77@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 0ec302920432415fdca89990ad31f8fe4c975042
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_063347_970254_A411E7B5 
X-CRM114-Status: GOOD (  17.63  )
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

Hi Angelo,

On Monday, July 20th, 2026 at 3:48 PM, AngeloGioacchino Del Regno <angelogi=
oacchino.delregno@collabora.com> wrote:

> On 7/15/26 16:27, Roman Vivchar via B4 Relay wrote:
> > From: Roman Vivchar <rva333@protonmail.com>
> >
> > Add a platform data struct for the efuse controller.
> >
> > Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> > ---
> >   drivers/nvmem/mtk-efuse.c | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/drivers/nvmem/mtk-efuse.c b/drivers/nvmem/mtk-efuse.c
> > index 1462f2760818..a79434608465 100644
> > --- a/drivers/nvmem/mtk-efuse.c
> > +++ b/drivers/nvmem/mtk-efuse.c
> > @@ -124,6 +124,11 @@ static int mtk_efuse_probe(struct platform_device =
*pdev)
> >   =09return 0;
> >   }
> >
> > +static const struct mtk_efuse_pdata mtk_mt6572_efuse_pdata =3D {
> > +=09.uses_post_processing =3D false,
>
> Are you sure this SoC (or any other compatible with it) doesn't have any =
GPU speed
> binning?
>
> If you're really sure
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

It does, but we can't really rely on it. The GPU is complicated here...

Something like this:
- mfgcfg
  ^- mfg_pre ('safe' UNIVPLL div or 'unsafe' mfg mux)
     ^- mfg (if you're here and your chip is NOT mt6572w then be prepared
=09         for crashes)
        ^- whpll (or any other parent, but downstream uses WHPLL as GPU
                  clock source)

There is GPU speedbin, but it means either GPU scaling is fine and mfg
mux is safe (0, unfused) or that the GPU must stay at UNIVPLL divider
(1, fused off).

My current solution is using assigned-clocks and assigned-clock-parents
in the each board which we've tested manually.
&gpu {
        /* Switch to WHPLL */
        assigned-clocks =3D <&topckgen CLK_TOP_MFG_SEL>,
                          <&topckgen CLK_TOP_MFG_PRE_SEL>;
        assigned-clock-parents =3D <&topckgen CLK_TOP_MFG_PRE_500M>,
                                 <&topckgen CLK_TOP_MFG_SEL>;

        operating-points-v2 =3D <&gpu_opp_table>;
        nvmem-cells =3D <&gpu_speedbin>;
        nvmem-cell-names =3D "speedbin";
=09=09status =3D "okay";
};

On boards with GPU frequency fused off the entire setup is omitted
except status =3D "okay";

Let me know if you have some other idea how this should be handled.

Best regards,
Roman


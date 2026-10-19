Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED76606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 21:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3CDCdVI2;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jr27XPWF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2/oTajujBgQv2lM0tHVLlqdb7xrNZwTMKNXeSsiaOWc=; b=3CDCdVI28oDC1IBCAo+fLXMbS3
	/WfvTmbjvS48zlLhQHTqQ8MVl8KSMYIkw2dLkzy+PuCwC7sgKey7XHf9CItcTkOUqPPfNAq7Ot76o
	X7ukM7X8EIHwx4KWR2jS3UDm4wa7VSu2D8KdI5sHPQq0euydQKNl4hAQoIToXsvU4wV/TDmbohPVU
	e55wa74g0yhcIoBnDnO7h6gQrZ+ZXjFPaWdEr2N2y7WpSZHOX0qi4eeqZry4wH2ZjpoSYbGqLokGJ
	9q/XuwPSEKqagGOx+Cxu5eS9qurld2e1sqTzSRW+sazSexQA7VTsRIZQ8JshoYFZ2ng7br3mzge86
	ZMvtnrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIusk-00000008NOd-1Ej0;
	Mon, 19 Oct 2026 21:26:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIusj-00000008NO6-0Fcx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 21:26:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BB2F437AC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EE141F000CF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 21:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792445216;
	bh=2/oTajujBgQv2lM0tHVLlqdb7xrNZwTMKNXeSsiaOWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jr27XPWFooKKoEeXO0QG8u/hyF5wNO0Ouh7l74J4PhTBsLJpZBMh4KqS1y/0+kL4z
	 dtCdVOkZ8syA1Wc2nIspEhfWs4nm2M6Hauz0nnMHIgje7yBkdm+Efy5EaG+3CRB94Z
	 0KvnE5E9XoS537a1MkzfHucZcLsWI0b5qrw36Jszl6bXn/AdH+2wvG++t6xKhHpVqH
	 QLxR0H8CiJcL9O0fHHo6TAlqdENzs2hdaXvP9tL8zQ6UJyUobsaBrh5sHgOyF9JVs7
	 KM5C5SHyEppfUi9jKgfr552Bd6vEU3YHHchlRM+S2qRcTbW+d5HsfZ3yZP9yztQWnc
	 ZCCX5r8tmsWcg==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c263415982eso318535466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 14:26:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzFuR8pq4vLaVOyZ5CQhe8UePwVBfEat02P6a5QetAiPehNpKop5TYB48XWqHMP/1mLOuiGnFGUOY1jiCnYI5EV@lists.infradead.org
X-Gm-Message-State: AFq9FYI7r2LqudqancNq6UsfrM3v7gNFaFxUTBYGmGfAoJYCvKjWaPEW
	7rFg08ZIIWq9XWc0oH+bSOhOtk1IwhYt8VEYGx6JjUMxzvI6xthseizII9rhSOT7KCM9ASd2awt
	+zvnTwXuAasgD0Ws4bJGH0YGvUBLyHw==
X-Received: by 2002:a17:907:b046:20b0:c42:102f:15d3 with SMTP id
 a640c23a62f3a-c42102f35damr377191666b.34.1792445215032; Mon, 19 Oct 2026
 14:26:55 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <cover.1791623422.git.kyrie.wu@mediatek.com> <951691c0a3d4ccf1cdfbeaead6d576145c731520.1791623422.git.kyrie.wu@mediatek.com>
In-Reply-To: <951691c0a3d4ccf1cdfbeaead6d576145c731520.1791623422.git.kyrie.wu@mediatek.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 19 Oct 2026 16:26:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqL3+ySM=XEt3SfT_ukXm_x0i5_Qa3p_2Etu+SMiA3mMew@mail.gmail.com>
X-Gm-Features: AclHuK8cez5FtL6SKEsML9LRxKLTKpwdtokleLqyHyBFJ3_4ydfzJsav_z0NLA0
Message-ID: <CAL_JsqL3+ySM=XEt3SfT_ukXm_x0i5_Qa3p_2Etu+SMiA3mMew@mail.gmail.com>
Subject: Re: [PATCH v11 01/10] dt-bindings: media: mediatek: decoder: Add
 MT8189 mediatek,vcodec-decoder
To: Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
	Arnd Bergmann <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>, 
	George Sun <george.sun@mediatek.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>, 
	Yilong Zhou <yilong.zhou@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 10, 2026 at 4:24=E2=80=AFAM Kyrie Wu <kyrie.wu@mediatek.com> wr=
ote:
>
> Add compatible for video decoder on MT8189 platform. Compared with
> former ICs, the MT8189 decoder use iommu to instead of smmu, and
> use scp architecture, the frequency is only 406MHZ, and cannot reach
> more than 700MHZ. It uses only one clock. At the same time, the decoder
> supports the vp9 decoding protocol for the first time in single IC.
>
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Withdrawn. You need to define the clock names. But that is a mess and
I just sent a fix for it:

https://lore.kernel.org/all/20261019212431.4109371-1-robh@kernel.org/

> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  .../bindings/media/mediatek,vcodec-subdev-decoder.yaml       | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)


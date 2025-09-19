Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDDD5CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 08:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vCBrNiEKTyi9Q3k3Ml4hn7pfySJO9AiRtZz93HFOeM=; b=hsWq1Ql1cFq/B+mYMg4FLOzFSq
	A0VsFR2YN7dCLizxUZDV9Dy8sdGCWmf+CqUUtWHjSf5esbABAUaU4mtp9zzLpyrltFsg3rLTH1NG3
	HR6cRrU0YWwt45NoPm4mEofSLQ/4cTyFIXKe/MkVvt3R1WeiAuJnuXa1BNYMtpZwVuclGqxe1eh+/
	fOATe40fEEWhp3NRL+xMKYzgYYXQZ2cSkl+D60KPpJFNU6EPIgdUjK2QDlWZso9GDTDJQFH2hfdZj
	FgcFGeuENVsF8putzIw++F+vJRuLzGXYgN/X4PIyfLK6rRInRpOrCzDYMC/CW2Bwm8fym8uQIE8LZ
	SWyazfsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWXC-00000002GG9-3NNm;
	Fri, 19 Sep 2025 08:32:02 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzWX9-00000002GEo-1FbI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 08:32:00 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-570d0c280e4so2141276e87.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 01:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758270717; x=1758875517; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1vCBrNiEKTyi9Q3k3Ml4hn7pfySJO9AiRtZz93HFOeM=;
        b=kjrtdlQVsnyLtJrU0yt2qq5+FFiaSFFOkfLMQJZBao0xYwwwGUybdmL7sl90S5hm/N
         QJzGMnoHmwFAxFsUNkUj7Z7v2s716l9Em5XGxGjtlsBrn7D1FWmopxLilxiH/4xNxqbE
         4Kg+lx8/nfXHwa1L092j5YGh+Iz7kIvCIcw10=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758270717; x=1758875517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1vCBrNiEKTyi9Q3k3Ml4hn7pfySJO9AiRtZz93HFOeM=;
        b=qm3GMdpEmngOmqNHSQJsU/EviPu7j5WkoonVXUbs25BdpE/i4DAcv+u37VzIHSaq4o
         QyWRzbpMR5EKhJXAK+pHGFE171yoNUn93OlsmI5/5+r8rkdI6cOTI/kymFspKVhHiCHW
         OXj0vvFS1k7/I1lkKTWPy1qyiM3SQtG9n2LLzq8NhelKiXbrK59+MNGJxQdxwjDbyFst
         9R7+nh1j/JHxn4TF410Rz4JBQuTbnuf8bBek0nq6jyfqigZeoFYLgJQm3Z5xw56cfgdn
         HHHNFsget9A0PU5RvKzozcOnuRNwE9foHe3LphNl0WWjE0vvQr1y50LSDwNa4B2FaqhJ
         YNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTT7rBMsprfOrXrv+5ae+y59o1TE87AUm2AgOY+3MCVJGwSQiJfwrz19NayOc2aXHvJLXDijKlERtgPS24VaO0@lists.infradead.org
X-Gm-Message-State: AOJu0Ywe4P7j/mhfi7NCDA31wC5lI9FgGsSm49Y+xXL5IBUVarxs6TTE
	EERGfB8/47vMLnOu+6Hp2ecLemBLWqEn86Qc0KzE0oSDe4bQkBeFpch8izmR1w+VZ03eZf5ZR+U
	ghpWejstQeduH+8EtFeZcp6LSP5YGoRnQTxIUhdPW
X-Gm-Gg: ASbGncsKAVcxQQSecT2Ge3tlQxl5vsQmBkcNXtSD7Y/u6eDs/0QZOBwnUikGqeESiXo
	wqQ2VFnRZNLHA4mEtTX3YpG8Cc8HGfy157WwMVTwJk2LJW1JRi2P+2c0XgQ2IcXWfxk8eYK+v3v
	hkinR3Me0SlqZ+IxrttJ5zD11DL9dCpc7CbwaLpua1fkY7EO8BVOc23KXt+huTpjD0r0CTghVyU
	4vaz3Pf7RTyttTaaKvQtTeuQgHo6Htx5XM=
X-Google-Smtp-Source: AGHT+IGJyLApucLYoiVvLVyhVW2X95UA+hKEnkJWRx68Jso5l2IUFZ6Lp0yp/otlrkifX0mDYXdbFrB33I4Cq4SdXuY=
X-Received: by 2002:a05:6512:308c:b0:55f:536f:e8a2 with SMTP id
 2adb3069b0e04-579e3d2d463mr792114e87.53.1758270716503; Fri, 19 Sep 2025
 01:31:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250822021217.1598-1-jjian.zhou@mediatek.com>
 <20250822021217.1598-3-jjian.zhou@mediatek.com> <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
In-Reply-To: <CABb+yY16DPJwVTHap4F6n5YJoOJzQLtqKiCQ-2MUm67pzF8uXg@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 19 Sep 2025 16:31:44 +0800
X-Gm-Features: AS18NWCHPPCOGpgOPgYhcar-Bfyg0XTAKO-xFCzjeyIm7xmJf4PNr7KosKW0NG8
Message-ID: <CAGXv+5F-L2+4PGixx7OG2+vp2yXc_2885yMzqWtkQDwhxVAPxw@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Jjian Zhou <jjian.zhou@mediatek.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_013159_381083_DF54FA4B 
X-CRM114-Status: GOOD (  18.15  )
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

On Fri, Sep 19, 2025 at 7:50=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.co=
m> wrote:
>
> On Thu, Aug 21, 2025 at 9:12=E2=80=AFPM Jjian Zhou <jjian.zhou@mediatek.c=
om> wrote:
>
> .....
>
> > +#include <linux/module.h>
> > +#include <linux/of.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/slab.h>
> > +
> > +struct mtk_vcp_mbox_priv {
> Maybe 'mtk_vcp_mbox' is a more appropriate name ?
>
> > +       void __iomem *base;
> > +       struct device *dev;
> > +       struct mbox_controller mbox;
> > +       const struct mtk_vcp_mbox_cfg *cfg;
> > +       struct mtk_ipi_info ipi_recv;
>
> Maybe also have "struct mbox_chan chan[1]; " so that you don't have to
> allocate one during the probe.

> Also if you have  "struct mbox_controller mbox;" as the first member,
> you could simply typecast that to get this structure.
> Something like "struct mpfs_mbox" in mailbox-mpfs.c

I read somewhere that this way of subclassing is not recommended.
Instead the base class should explicitly not be the first member.
And then container_of() should be used.

I don't remember where I read this though. But I think the explicit
container_of() is easier for understanding the intent.

ChenYu

> ....
> > +
> > +static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mb=
ox,
> > +                                           const struct of_phandle_arg=
s *sp)
> > +{
> > +       if (sp->args_count)
> > +               return NULL;
> > +
> > +       return mbox->chans;
>
> return &mbox->chans[0]   seems better.
>
> thnx


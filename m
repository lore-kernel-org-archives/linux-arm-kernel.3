Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B43C021B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6XTzpe0dvPkb56/2C4infeIOzW79ECT/46k3G7K0Ygo=; b=rK/vWzIBKzauddtykdSJhSPxp5
	7jBk2B+ZuR+L0/2/Y9w6JzFlkmGlFFFTEi+/rxVm/Lqvn9Grh5Qmbze8xTUaQWRRtjr2LWBouPSwF
	S5G/y93lpLAv1XD3s7Y8IASkkg+LQgk6FqYQBCa7XfMIsLlo+IUAhcdf9QwkjfVy1iO5WWXf/d/Lx
	FMiVtEe9MZ3r/MYx8z0uy+5L1DYPeevo3tjforUvu1k/PjTum9wZSTuSOsfb5fk2fvkbzKC13IwT/
	+uBNUZA8PR0Yg7J6Ehs0NgKyjtJa80U7N+ryoiIFMe95bq0wqYfyqtarOq+6+T9OE47D6vm/qtQT/
	HXiNfE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7lF-00000001NWs-1pY5;
	Thu, 20 Feb 2025 14:42:45 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl7at-00000001KOq-46hy;
	Thu, 20 Feb 2025 14:32:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 97A71614AF;
	Thu, 20 Feb 2025 14:32:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1277C4CEE3;
	Thu, 20 Feb 2025 14:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740061922;
	bh=GoGvedSskUunt8JR0ab0OKe1KhMr9oaefFluEv4FAqY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MRVxiU7o67O3FIKBBl1kglyQ70mhNufEgyvsPm24+MnObiKppxwPDeGetnAbCnP1n
	 bfInsRGRgTuWHoen6CmytTuo2OvSOwJkMnUVHwEAYef1ogM2pcoPjbZp9qkDolEEE/
	 u1rCUshyBtkb2WhY4Fprtqm4fqT9yxPdzLw8GQYznAH270ttdYmBHAoMsZs3Cdtl27
	 mvQalAbMWwa3ZBAgbfU6IFNCoEdpzh9zPOY61wFYG8WgLUxBAVq5vAVFkY04sC2d/X
	 Rxms8YbodBco+uhh1HvvpwiA1sDRIv+8EGRX7e6oLC1f1kG5xbmMIX5PqelXRlDidB
	 D+BXbBZHlHsQQ==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fa8ada6662so2072305a91.1;
        Thu, 20 Feb 2025 06:32:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWV6huQg6MVkR/xb5NtLy6zCJZFFCCNtwnnobxZLINu0P0BrNxl1A3bbZAiQbFgeyJwQRyKGnyvq5M2DHr+Prr@lists.infradead.org, AJvYcCXFwmqvx8m7y1xxBqxk98hGI3IDUXQp6lpZ2004EB4a3up4ymjGe90hkrNyf62v5xPAwOwmiUpa8Ln9OYnaOhc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwzXF72w8+fDi9tkXkpXrctrx3y1gHssHNs3UmdpJkAD0LDKHt6
	C4Bwv9EWCrmS3yhktSId4QL29iKFRBy09PMM6b4KhnPq3O/TjxiQZzrgCoVizxvjeu3YCsB6ZmE
	2dgFeSbYIEyFAhoxTgIZLtnC40w==
X-Google-Smtp-Source: AGHT+IEEvVnA4H81470tv1H4G5h0w0yEGHELm51+9xXj/GLBqX14Y9VHjS4nUzKS5Ntqk6uBqNxa9Lc6bKjwcl3wf1E=
X-Received: by 2002:a17:90b:3809:b0:2ee:d024:e4fc with SMTP id
 98e67ed59e1d1-2fc411509b7mr38299734a91.33.1740061922487; Thu, 20 Feb 2025
 06:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20250217154836.108895-1-angelogioacchino.delregno@collabora.com> <20250217154836.108895-34-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250217154836.108895-34-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 20 Feb 2025 22:32:47 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8a+oV_XwBACyy09bKdwKVy+iEPxbfZBkkdYm2jYD_k2w@mail.gmail.com>
X-Gm-Features: AWEUYZnj0eBVMJFGwcqYWEal64YwZLRUffmMdq4xRpXkJqA2A3_JsPYTIk5oAgc
Message-ID: <CAAOTY_8a+oV_XwBACyy09bKdwKVy+iEPxbfZBkkdYm2jYD_k2w@mail.gmail.com>
Subject: Re: [PATCH v7 33/43] drm/mediatek: mtk_hdmi: Cleanup function mtk_hdmi_resume()
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com, 
	jie.qiu@mediatek.com, junzhi.zhao@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com, 
	dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com, 
	ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com, 
	jason-jh.lin@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_063204_126423_0AF89564 
X-CRM114-Status: GOOD (  13.68  )
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

Hi, Angelo:

AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com> =E6=96=
=BC
2025=E5=B9=B42=E6=9C=8817=E6=97=A5 =E9=80=B1=E4=B8=80 =E4=B8=8B=E5=8D=8811:=
50=E5=AF=AB=E9=81=93=EF=BC=9A
>
> Remove the error print in case of mtk_hdmi_clk_enable_audio()
> failures: since the APIs will already print on their own, having
> one in there is redundant.

Applied to mediatek-drm-next [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index 50f9ab48cbf9..2614561e2634 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1704,15 +1704,8 @@ static __maybe_unused int mtk_hdmi_suspend(struct =
device *dev)
>  static __maybe_unused int mtk_hdmi_resume(struct device *dev)
>  {
>         struct mtk_hdmi *hdmi =3D dev_get_drvdata(dev);
> -       int ret =3D 0;
>
> -       ret =3D mtk_hdmi_clk_enable_audio(hdmi);
> -       if (ret) {
> -               dev_err(dev, "hdmi resume failed!\n");
> -               return ret;
> -       }
> -
> -       return 0;
> +       return mtk_hdmi_clk_enable_audio(hdmi);
>  }
>
>  static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_res=
ume);
> --
> 2.48.1
>


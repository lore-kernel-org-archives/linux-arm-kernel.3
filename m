Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF788C282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 13:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xymxijNAB4kPnYy2+51xfQ78DYkQAFFvh1BybSjX8uM=; b=kGRw6tbLiadD5Y4jHc+9lFAeWU
	ijU1fHzVL+wjPpi3QGHPZ+8BloMrB4EbSXjDNCFZLZdDOK/ndzrJ6AuUx9+YuwtqolBBUDu00Oh4E
	3UimFVf7I1OP1uGTngoYT7dBTp1aAh3A5tDADypXuOqEU8DeCS98shDIHOCEIAjWrv9fyUHGCX/qF
	R7+7ttw6SvrMVBxxYspf4OdcYdlvZlEUl22WbNnUbUWvg0gfv1qZUmEDQ9pnvnaoddZObOXKvX+zl
	TXVPeqKOJn8tUT5MKGNYd1ed2H4RmohggZ7SJY6ivueZhDWXkoTMgF96k65H1q6D+ZFe3AmDUZwDn
	lE2jARVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp6CE-00000000z60-0C7D;
	Mon, 03 Mar 2025 13:51:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp5qr-00000000v0f-2ZKH;
	Mon, 03 Mar 2025 13:28:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 352145C598E;
	Mon,  3 Mar 2025 13:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8F0FC4CEE8;
	Mon,  3 Mar 2025 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741008536;
	bh=pU75ZWR55ytSqTfFyBXoZ15CdXjjZybmf3hZAq7hNZA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=fvovLgDuT8SSv3WCPvLaVtJ0pBNwyRk6mFp31yKWnf+m8GRu7OhSOpELYlOpzrLNN
	 sqdAotELtlVNYxz7k6QnZtcBAlyXprLJPPsSicGaETkDSeNYREsV4LGPuE+zQwUzJU
	 vJeo0lTRXJn33MqW9GSE1LA10t2CBcSeWWF/JJxdzVejirlmdmXYvnfYsJ3fudmtQ9
	 7K9jdg92q+5e6jsT3P3a5357wIHHlB6QY+ZKso/Q1+ndSWBnoPz83uRD/qG8ERufGH
	 tPdnoGpo5d5sWXgFI4mByp/QiN7oufWU1SvpUPzn8zcBQhD/Ssc50B2bSIWu3/5php
	 wpKCziGZrfnaw==
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2fee4d9c2efso2362168a91.3;
        Mon, 03 Mar 2025 05:28:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWVg1Jx91o0O0dsYjXKxyLA3B2N+JonbCleGOKcysWmy/P/fh+u1RTSc403NWp9maagvbj3VQ7Neb6XsKuvlzs=@lists.infradead.org, AJvYcCX5if5HAK28tCKfkW/FQP33dnJLnE1wJ8IJ5JXA0bj3kcEzGK5jIYRNfV4gwS0DbhlOjycPANtQIj4Daxqb+ht5@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvam2+tIA6Oid3S6XtGx0i3AAmxs2dOjhOoFQ7L5SZpOL+K+s3
	s80zbml4ATPO6ZUpGf3T2X82tt+aUmSw1wf9k8GPtYD2wqbpsphYFR3PTOTbuX5vW38BUR2XfrL
	Vgrof6H1RK9CIazUIMY3D+GaEOg==
X-Google-Smtp-Source: AGHT+IHEdNW1OchHMbLS1cCfwrEs+3MwI78VEpSMNYRCH8bFSj4YHOZdW6AmaLLo8nvW04MvVqNc2fV4NRzXAOPbwh8=
X-Received: by 2002:a17:90b:3d4e:b0:2fe:b9a2:fd3b with SMTP id
 98e67ed59e1d1-2febabf8336mr20713936a91.30.1741008536294; Mon, 03 Mar 2025
 05:28:56 -0800 (PST)
MIME-Version: 1.0
References: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
In-Reply-To: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 21:29:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY__KF=9Pp=3PAnXG5WCPX4Hxkfd391eBu0dfhO-wz9dWqw@mail.gmail.com>
X-Gm-Features: AQ5f1JoEyaQUFZqrdcQEIsbOBWMKKKZ_mrsKmQyi0xWBpqur_M_EISNLxHKjU88
Message-ID: <CAAOTY__KF=9Pp=3PAnXG5WCPX4Hxkfd391eBu0dfhO-wz9dWqw@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Julien STEPHAN <jstephan@baylibre.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Mattijs Korpershoek <mkorpershoek@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_052857_764832_72A82BD7 
X-CRM114-Status: GOOD (  21.25  )
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

Hi, Dan:

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2025=E5=B9=B41=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:36=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> There is a type bug because the return statement:
>
>         return ret < 0 ? ret : recv_cnt;
>
> The issue is that ret is an int, recv_cnt is a u32 and the function
> returns ssize_t, which is a signed long.  The way that the type promotion
> works is that the negative error codes are first cast to u32 and then
> to signed long.  The error codes end up being positive instead of
> negative and the callers treat them as success.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during vide=
o mode")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202412210801.iADw0oIH-lkp@intel.com/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> I sent this patch earlier:
> https://lore.kernel.org/all/Y%2FyBC4yxTs+Po0TG@kili/
> but it wasn't applied.  I've changed the commit message a bit and added
> new tags.
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index d871b1dba083..0acfda47f002 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1015,12 +1015,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_=
dsi_host *host,
>                                      const struct mipi_dsi_msg *msg)
>  {
>         struct mtk_dsi *dsi =3D host_to_dsi(host);
> -       u32 recv_cnt, i;
> +       ssize_t recv_cnt;
>         u8 read_data[16];
>         void *src_addr;
>         u8 irq_flag =3D CMD_DONE_INT_FLAG;
>         u32 dsi_mode;
> -       int ret;
> +       int ret, i;
>
>         dsi_mode =3D readl(dsi->regs + DSI_MODE_CTRL);
>         if (dsi_mode & MODE) {
> @@ -1069,7 +1069,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_ds=
i_host *host,
>         if (recv_cnt)
>                 memcpy(msg->rx_buf, src_addr, recv_cnt);
>
> -       DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
> +       DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
>                  recv_cnt, *((u8 *)(msg->tx_buf)));
>
>  restore_dsi_mode:
> --
> 2.45.2
>


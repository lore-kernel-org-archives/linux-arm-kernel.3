Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1122E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 14:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBLtMIWCzGEXzdx5eI9g0TlrkqOFWxRBYuShffyy1lg=; b=PNd4C3soQ2cDtvrHWbXpsNJvPW
	vCudyoIBtnVAt8xj6HcuQyi+UmojTH1/BBd7ev9v9l8ycc1nE7hbKZL9NdtC48XQftFxQV1PlQyGh
	45+giWp4F5qQOTssNh+BQFdhXjMYNxMFiPhMq13gEcCVH2OmtppUIfJUb35tMklY9rx0v9J8wxRP4
	NmyKWHU0s9KCpENZ1dKMPPYZeZJi97pwNHifTzX2o8c03xtXOQEEW+jH+mCKBgsGrhnxk5BdmyN3e
	8JZvDgK5ks7gVi8Hx2ev+s/2yRKPyJVSSaJY2TjkFGQq7sbsvGc3qHCmqaoXL5YEWtpsanfCZtKaS
	JcsDOyRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLuV-0000000AZMu-0ge5;
	Thu, 02 Jan 2025 14:10:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTLtJ-0000000AZAl-1uoh;
	Thu, 02 Jan 2025 14:09:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9ED035C5F52;
	Thu,  2 Jan 2025 14:08:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE10C4CED0;
	Thu,  2 Jan 2025 14:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735826976;
	bh=PnfUdqriKM0fSfAEgGEyzxBSHRDzsPuhyp22VEzJ+zE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=tTFk1NXgn9EDZKfXF5BDaSQc8HhbOAu8ZruvzIuIuCUlR4fUnlVw5TR2WE9iW5aV7
	 Zd/xOpRCFJ3ZYigX3p30GKw61oNjrZQv6UzaaL9IFcnrlkkJ7TRdAPgHZjg/QAPkwG
	 rItz6XSzx4gdkC33RxMcKTIw1BZv2XAIbhBvFUtrSuOgaaCS0MTAgnCqMkmMCahNkM
	 3AyBSv5vyQgaKPXC0m9PyY6asR1UGyDEin8bK4sKtkOXfKg/1cW36oBa2rIP9z9lCH
	 E9EdOU9hDUB1jePNSnQNDN6AdmFHXp3iuT/2mdzmVCwGxCw1xAIc5XrV1ry6txbcFp
	 fUa8UukIdbmsw==
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ef748105deso12081096a91.1;
        Thu, 02 Jan 2025 06:09:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXOhzNIPihrlSAwBt5Hu2PIj/yHavbUDZzDS9SUJP/EQ2q34W/zalBlYT34jGwumGXdMcdu9GnQzi3Sefwz8Jpp@lists.infradead.org, AJvYcCXy2cjmBIW7ZO64XUeJY6VS+vWT/h1XowrDoQRVFrF9bZbpZ4Et9DoduG0Yp3agnrZcxxqY2ISXCvKzvH6+DNU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzCDyLTeKg2Mzp9+s4L0r/S7ek778E36GSKgHYs/uCKontWytJA
	8giicQuMCMfxozMXjIN86C6qWHY+VhuWbjhVymuNe3hd753zuddkf1IBEaKRDOLAmBYA9bHLmiy
	fnRuDkDJx4eUEL86P4roSB7JrIQ==
X-Google-Smtp-Source: AGHT+IEzcCxeAv7vqklDx1+zkkQeCdgFDrbxA+g+5yLSP75q6XuPDjVTFmZURNL7tgRYY48Ut4xg8mgh0ofdN4VVFek=
X-Received: by 2002:a17:90a:d448:b0:2f4:43ce:dcea with SMTP id
 98e67ed59e1d1-2f452ee5e95mr61497972a91.25.1735826976248; Thu, 02 Jan 2025
 06:09:36 -0800 (PST)
MIME-Version: 1.0
References: <20241218113448.2992-1-liankun.yang@mediatek.com>
In-Reply-To: <20241218113448.2992-1-liankun.yang@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 2 Jan 2025 22:10:10 +0800
X-Gmail-Original-Message-ID: <CAAOTY__JXYfCRTBh_TYWCNy1d0hcNXOzeR8Czk=KiauEs6xcXQ@mail.gmail.com>
Message-ID: <CAAOTY__JXYfCRTBh_TYWCNy1d0hcNXOzeR8Czk=KiauEs6xcXQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] drm/mediatek: Add return value check when reading DPCD
To: Liankun Yang <liankun.yang@mediatek.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, ck.hu@mediatek.com, 
	granquet@baylibre.com, dmitry.osipenko@collabora.com, 
	rex-bc.chen@mediatek.com, jitao.shi@mediatek.com, mac.shen@mediatek.com, 
	peng.liu@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_060937_582746_09CEF429 
X-CRM114-Status: GOOD (  20.54  )
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

Hi, Liankun:

Liankun Yang <liankun.yang@mediatek.com> =E6=96=BC 2024=E5=B9=B412=E6=9C=88=
18=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=887:35=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> Returns the number of bytes transferred (1) on success.
> Check the return value to confirm that AUX communication is successful.
>
> Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort drive=
r")
>
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>
> ---
> Changes in V3:
> - Using drm_dp_read_sink_count() to improve patch.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20241128030940.=
25657-1-liankun.yang@mediatek.com/
>
> Changes in V2:
> - Modify Fixes in Commit Message.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/20240930092000.=
5385-1-liankun.yang@mediatek.com/
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 36713c176cfc..b26dad8783be 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -2100,7 +2100,6 @@ static enum drm_connector_status mtk_dp_bdg_detect(=
struct drm_bridge *bridge)
>         struct mtk_dp *mtk_dp =3D mtk_dp_from_bridge(bridge);
>         enum drm_connector_status ret =3D connector_status_disconnected;
>         bool enabled =3D mtk_dp->enabled;
> -       u8 sink_count =3D 0;
>
>         if (!mtk_dp->train_info.cable_plugged_in)
>                 return ret;
> @@ -2115,8 +2114,8 @@ static enum drm_connector_status mtk_dp_bdg_detect(=
struct drm_bridge *bridge)
>          * function, we just need to check the HPD connection to check
>          * whether we connect to a sink device.
>          */
> -       drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count);
> -       if (DP_GET_SINK_COUNT(sink_count))
> +
> +       if (drm_dp_read_sink_count(&mtk_dp->aux))

if (drm_dp_read_sink_count(&mtk_dp->aux) > 0)

With this fix-up, applied to mediatek-drm-fixes [1], thanks.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/=
log/?h=3Dmediatek-drm-fixes

Regards,
Chun-Kuang.

>                 ret =3D connector_status_connected;
>
>         if (!enabled)
> --
> 2.45.2
>


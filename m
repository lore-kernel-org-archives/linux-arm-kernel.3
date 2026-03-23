Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E23A8F4613C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ElJJRngS4oul6QvfUaEwS3ay9qvA+cCk2pKKulBFxDs=; b=QfBlUmZX5Iv7KTg2+3ItF5Pnt7
	JoV1yPg6pz2avoP7/UeIB/ayBTYN4ayS1GK7I3hcpFIQ9QTPoJxAuS+ZidssyPt8IswFWoFvfBTF6
	GFGRGx+AJ0biI1gkdZoa69rpJI2kWyNPE1N6zNUvVaFoFA31O+1ZcGSI60TVknBfm9mXAV2n+fvSL
	n+ExLahpb9lW3+1r8h0Z52yPl+gG0rU4fEza/yjsWTp1ejax7mnqK0T31O8/8Zgfg81XuSMyvdDdk
	aeWfgRmogx5XD2FvvGrpsOSwQi7gAyCN+/Xs+wH+BRXgboT32M6GM0RSYlRPXGBmeQlCB4VsUtHgu
	/UN/zd4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hDQ-0000000H1zp-39Ao;
	Mon, 23 Mar 2026 15:29:16 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hDO-0000000H1yr-3Kut
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:29:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1774279750; x=1774538950;
	bh=ElJJRngS4oul6QvfUaEwS3ay9qvA+cCk2pKKulBFxDs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WHUlp5EkQyNS+aIpB9qWTxKtaXqdErK1Gi+Y8Azlc4NqeNvC+ogSuKJ4QHvnb7Iun
	 zDKws6ZAOzlKDHAsOXdLgfDM0TLePG+vJhxjf7LwPOtwItDGwOANvxXOYiHwdcXFum
	 d3nMNlkvaqEuO+nhElAsGvwIN962uQgNfItHaXLB6EGmy9PcoqwG31SsnvDnoOJZHT
	 ezW5/Wcnvo9PZ4OaSzpFVL6S9Jgz/W9eTdNcsjeQilUao2eS8HuPuuHmNK+b5Sd0El
	 UbIlfCFLxlvdoKaic5CB178nZ+uebxxjQc+yutzHP+NVnWOzpPIJecRxesMkJy4D0k
	 Lsw6xAJlkDaLw==
Date: Mon, 23 Mar 2026 15:28:59 +0000
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>
From: Alexander Koskovich <akoskovich@pm.me>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Alexander Koskovich <akoskovich@pm.me>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 5/5] drm/msm/dsi: Add support for RGB101010 pixel format
Message-ID: <nmC5g-yqiyxWusbu6f0dZ0s7W-bqYdVUT0fIX9h1MsvYrAE521869Ei9NAKzwxbz30rvdYJCVjEWexnaUrAx_63G2DtM2mVUZthU1VRUbrg=@pm.me>
In-Reply-To: <20260321-dsi-rgb101010-support-v4-5-eb28ecebbfe8@pm.me>
References: <20260321-dsi-rgb101010-support-v4-0-eb28ecebbfe8@pm.me> <20260321-dsi-rgb101010-support-v4-5-eb28ecebbfe8@pm.me>
Feedback-ID: 37836894:user:proton
X-Pm-Message-ID: 327602c420a395c5a4d2f5d47513c5fff064faf7
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_082914_980987_3A39F7FE 
X-CRM114-Status: UNSURE (   6.44  )
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

On Saturday, March 21st, 2026 at 3:52 AM, Alexander Koskovich <akoskovich@p=
m.me> wrote:

> =20
> +=09if (dsi->format =3D=3D MIPI_DSI_FMT_RGB101010 &&
> +=09    !msm_dsi_host_version_geq(msm_host, MSM_DSI_VER_MAJOR_6G,
> +=09=09=09=09     MSM_DSI_6G_VER_MINOR_V2_1_0)) {
> +=09=09DRM_DEV_ERROR(&msm_host->pdev->dev,
> +=09=09=09      "RGB101010 not supported on this DSI controller\n");
> +=09=09return -EINVAL;
> +=09}
> +
>

Was tipped off to this bit downstream where if DSC is enabled and panel use=
s
RGB101010, it overrides back to RGB888:
https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-driver=
s/-/blob/DISPLAY.LA.4.0.r2-10000-lanai.0/msm/dsi/dsi_display.c?ref_type=3Dt=
ags#L7209

Only does this if widebus isn't also enabled though. Should we do this as w=
ell
upstream?

Thanks,
Alex


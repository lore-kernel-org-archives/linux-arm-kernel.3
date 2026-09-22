Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C49C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 18:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n5HyrHRHMUPgDMqv1KVZnpMlmGdKQC0PfTuvh3T02yM=; b=3xJGH1kkqyKNqpNUtw4JB2qjK3
	Tc/j3r7PNXNO7dAlhI0fi2NleWX89SXyIKheKN2MdAC4QWtIxEBp7Aom4xS+4WZEllWexiSTN7jBz
	rRVfplT0w04CNBkZHsDnL8fU0v3OLmeMr3BveoXMfgN/E21UC01iUDHIXEAkyd1sS2H6QM/HkdkDG
	nL8clu6dQ9EGSEyWbidX9FqMkqXx/qy+SOQRPM6vGspGZtuvr6h7KlBVrHk60XSWjCi4UMWRdJ3Ig
	vVwF0fXjxDmeTBP9LU8H3RVnyy7fpLF2HmnBiB26Q7KtXklkBkehintAqEXYW9R6Y4IE8rKFTHxbB
	c8F31XMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94xq-00000006GqB-1Rph;
	Tue, 22 Sep 2026 18:11:34 +0000
Received: from out-31.mta0.migadu.com ([2001:41d0:1004:224b::1f] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x94xn-00000006Gp8-0hFM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 18:11:33 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2yklJXh1jDhjZosVDlDIrp4aXiVIg5PtSRAofTMK6Zo=;
 c=simple/simple; d=cknow-tech.com;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790100688; v=1; x=1790705488;
 b=Ih5WkYKGRceqGE0b6Bvw0wDkK7rDAkYvMXrNr5w7HfqtLjKsuDJ6RPwgQZ6x2W1EmmPFWPGx
 4mISAuTi9S/bX3wQOxWPUYygkl+U8qNgju0JL0T82IGPNqmHkb+VH7jwJKDNLg+HRA+XH0qRsmY
 nmzw/LSllhNVthgNVlpGvMj/i6V47agMA3IdqVy7LGnpf5i3epN9c0NoZdAz26N2wyGn5tM0ERj
 PkihUeaYxlSoF6g2ChxkEBOM54F5fjipuiIptNhAziJid7NuR352T869zycUTjjA6xMomOjaCVQ
 Luh23R/bw2qwr42Kcaqq/XWkPyFpIfWhpO9k0QjsDnBYg==
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ab83d78d1a42a1f1;
	Tue, 22 Sep 2026 18:11:18 +0000
X-Mizu-Trace-ID: ab83d78d1a42a1f1
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 22 Sep 2026 20:11:13 +0200
Message-Id: <DLM1Q8SJMXVA.5DQFQM21KJ82@cknow-tech.com>
Cc: <dri-devel@lists.freedesktop.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] drm: rockchip: add
 drm_plane_create_blend_mode_property
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Johan Jonker" <jbx6244@gmail.com>, "Sandy Huang" <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, "Andy Yan"
 <andy.yan@rock-chips.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.22.0-24-g39041fd9f179
References: <20260909-blend-v2-1-37e27af4faee@gmail.com>
In-Reply-To: <20260909-blend-v2-1-37e27af4faee@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_111131_764350_1FDB8FD0 
X-CRM114-Status: GOOD (  14.63  )
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

On Wed Sep 9, 2026 at 11:20 PM CEST, Johan Jonker wrote:
> A validate_blend_mode_for_alpha_formats() function was added that
> fills the kernel log with warnings for Rockchip VOP version 1 SoCs.
> Add a drm_plane_create_blend_mode_property() function as fix.
> VOP version 1 doesn't support blending with a pixel alpha background
> layer, only with a constant alpha. Advertise blending capability with
> DRM_MODE_BLEND_PIXEL_NONE.

On a 7.3-rc1 kernel without this patch, I saw the following:

Rock64 (RK3328):
```sh
root@rock64-test:~# dmesg --level 4 | grep PLANE
[    7.567004] rockchip-drm display-subsystem: [drm] [PLANE:35:plane-0] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    7.567083] rockchip-drm display-subsystem: [drm] [PLANE:38:plane-1] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    7.567132] rockchip-drm display-subsystem: [drm] [PLANE:42:plane-2] pix=
el format with alpha exposed but blend mode not setup. Please fix.
```

RockPro64 (RK3399):
```sh
root@rockpro64:~# dmesg --level 4 | grep PLANE
[    5.695597] rockchip-drm display-subsystem: [drm] [PLANE:35:plane-0] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695636] rockchip-drm display-subsystem: [drm] [PLANE:38:plane-1] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695665] rockchip-drm display-subsystem: [drm] [PLANE:42:plane-2] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695692] rockchip-drm display-subsystem: [drm] [PLANE:45:plane-3] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695718] rockchip-drm display-subsystem: [drm] [PLANE:48:plane-4] pix=
el format with alpha exposed but blend mode not setup. Please fix.
[    5.695745] rockchip-drm display-subsystem: [drm] [PLANE:51:plane-5] pix=
el format with alpha exposed but blend mode not setup. Please fix.
```

And on a (7.3-rc4) kernel *with* this patch, those warnings were gone.
Thanks! Feel free to include

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64

Cheers,
  Diederik

> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
> ---
>
> Changed V2:
> Add comment line
> ---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/dr=
m/rockchip/rockchip_drm_vop.c
> index 0090d8ff0c79..0bc5b606f021 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
> @@ -1850,6 +1850,8 @@ static void vop_plane_add_properties(struct drm_pla=
ne *plane,
>  	if (flags)
>  		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
>  						   DRM_MODE_ROTATE_0 | flags);
> +	drm_plane_create_blend_mode_property(plane,
> +					     BIT(DRM_MODE_BLEND_PIXEL_NONE));
>  }
> =20
>  static int vop_create_crtc(struct vop *vop)
>
> ---
> base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
> change-id: 20260909-blend-c89d2c9f6984
>
> Best regards,




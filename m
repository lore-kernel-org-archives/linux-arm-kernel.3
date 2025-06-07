Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9BFEC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Jun 2025 15:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gvbxnUgRFBMWdeIANvRl8BGLckj66c+EtDmClvsMtfU=; b=fs+yx7FI5UrRhcI8rJdaIYhn2g
	/EnPv5vZaXP27/WsGnXvwDrYVuIJoh6FlkBlH2LyJ62tHrgJfv+0XT53JaP1nTeB+ldjTHavaQJO8
	p7Kw9lfOJOwDzmwqRTsHbnqjNJQLywnOlkCdkkvaBUi8sHYqOOPOoeH+BXrGkZwMst8Rc44p+BgSL
	PRUVOJp+VKDWjWtXMtdpFt5jVZm17Vg59Kd1wvYvE4AdDd738QB0FBqZzx6orEzJmctb72OcC0tPW
	8wZ45wA4zlFUISKyp1SOHw6qigovt7sJ8pIEIjekotnwfQ/tYkfivFJbRfoP6Q5gqD4u90Qo+v/yk
	GlNPvr/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNvZE-00000001oWC-3gyJ;
	Sat, 07 Jun 2025 15:34:44 +0000
Received: from mail-24418.protonmail.ch ([109.224.244.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNvWs-00000001oIo-3dz4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Jun 2025 15:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1749310333; x=1749569533;
	bh=gvbxnUgRFBMWdeIANvRl8BGLckj66c+EtDmClvsMtfU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=BdhtvZMVRJQEFBsaQIeeUMjlWEDt/rtSZs19jXDkD9EPgtm7gExe4UQHnESUmwq5B
	 VjikVewQf+brgldPU7fHlppj/aotNxznUHAE6VqGGpVk0Oz2DM24Jws8W9eAi/gtnL
	 3JPbO/xC30AAqiAQTN6tDtt8+cAxJBSbWKqFGxmAj96GlHKjY+f9onEQSZcdGvxaFt
	 duTjYhRLqVFmlj/8MJHWBqq/uekhJH6jRke199b+RzbFiJJVXGw1bAfS42zAP20k7w
	 NcQXN+hVVwPXqIngyrmeFoKBDCJW0Uzz3iVYHvN6e9YsYKAAMSRsamROauO0GM/t2Q
	 na1NozBdCZXdA==
Date: Sat, 07 Jun 2025 15:32:07 +0000
To: Diederik de Haas <didi.debian@cknow.org>
From: Piotr Zalewski <pZ010001011111@proton.me>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, Dang Huynh <danct12@riseup.net>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check color_mgmt_changed in atomic_enable
Message-ID: <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me>
In-Reply-To: <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
References: <20241206192013.342692-3-pZ010001011111@proton.me> <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
Feedback-ID: 53478694:user:proton
X-Pm-Message-ID: 352bfcde3cb3dc6da16c674e8ab61db239ac70f4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250607_083219_657899_65181195 
X-CRM114-Status: GOOD (  19.04  )
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

On Thursday, June 5th, 2025 at 10:13 PM, Diederik de Haas <didi.debian@ckno=
w.org> wrote:

> Hi Piotr,
>=20
> Since kernel 6.14-rc1 I have the problem that visual output is no longer
> shown on my PineTab2 and a `git bisect` pointed to this patch/commit
> as the culprit. What is important to note is that `CONFIG_DRM=3Dm` seems
> to be required as the problem does not occur with `CONFIG_DRM=3Dy`.
>=20
> Near the end of my bisect session, something interesting occurred.
> I was booted into a 'bad' kernel (ie no visual output) and when I
> started to build my final kernel, I closed the lid of the PineTab2 which
> made it go into suspend. When my final kernel was built, I opened the
> lid again, which made it resume, to transfer my final kernel to it.
> And much to my surprise, I then did have visual output.
> When I read the (below) commit message of the 'offending' commit, it may
> not be such a surprise after all.
>=20
> When I build a (new) 6.14-rc1 kernel with a revert of this commit on
> top, then I did not have the above mentioned problem, confirming this
> commit was the 'bad' commit.
>=20
> I did try it on a Quartz64-B (also rk3566) and it did not have any issue
> (output via HDMI).
> I don't know what the cause for this issue is, hopefully you do.
>=20

Hi Diederik,

I tested and confirmed that this happens with drm=3Dm but also in my case=
=20
it happened when drm=3Dy. After some testing I found out that at boot modes=
et
happened twice and at short interval and since this patch allows for gamma=
=20
LUT update regardless of color_mgmt_changed state this makes DSP CTRL GAMMA=
=20
LUT EN bit to be unset twice too. It seems that VOP does not like it. I=20
patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is set only if=20
GAMMA LUT EN bit is set. I checked that this also does not break the gamma=
=20
lut functionality with emphasis on out-of/into suspend behavior.

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm=
/rockchip/rockchip_drm_vop2.c
index d0f5fea15e21..7ddf311b38c6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct vop2_video_p=
ort *vp)
 {
 =09u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
=20
+=09if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
+=09=09return;
+
 =09dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
 =09vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
 }

I will wait with sending a patch because maybe Andy has something to add=20
to this.

Best regards, Piotr Zalewski


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021F2D3EE74
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 15:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a57X3Ufhsvd1TQxvNP3ZYZFgsodRlfD0KvNOTCSzduY=; b=lhbPopWHXL15jDAqUc/LBgKmJ6
	GJ8PlTiz7AJLkdw7+LritNUiyiLGZFkzPV29CLadtvwgf44e1xiguU0PJ39Sh7XbUxeRRK8/unMLg
	w2/tbdhhWYo03F2a4okjX+JMzn9kUfSk1ZPVTy/hKUi+TWR8UVLsMitRSbP0x1aMMz3MvdJjUDGtF
	g0ACiEDcg3aplx6nZcKuCPYIfCesbGWu3C7awYywn4jZvD5B+SJJgOJCWcy62a8Sc9NfPySRLEUVx
	L0/4KoW20O+Bq0+aVyFt3VG3kbyXkVGJupBVaufmTMaI7a8augM7CCIK/YqD+zrFKot2p1X2WOuYo
	zfmMD4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwUs-00000007KDD-3ZHj;
	Thu, 22 Jan 2026 15:21:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viwUp-00000007KCo-2OUN;
	Thu, 22 Jan 2026 15:21:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5869E408F3;
	Thu, 22 Jan 2026 15:21:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1D66C116D0;
	Thu, 22 Jan 2026 15:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769095278;
	bh=a57X3Ufhsvd1TQxvNP3ZYZFgsodRlfD0KvNOTCSzduY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aLau4aEXXVJ9BNfzDqhRe5v5Rf3iMiEeJCO+t7WoE58yzRW/q4hK/F1Sa8ZHpJdAD
	 We5md7hnrPwn49kABw80qJju+mQC5OICrx9VKNlemb0l74v6uK/cDjWA0p84jpOGTn
	 OQYSwfFbDUVB8KdZhrTNgIP4s6JExmWGgSyKcb4cSiTOGk3sRbfeYxL40z7Mn8VGLa
	 TnzZd9Jxe9oiGifVA0UYsOFd30b8Orw5/HjMG0Bxd6xfRk1K9K1YPfeIm0UOv5JXST
	 lMITd0vPoWmCn1wRyx2qdTDZ2HKtaQM7mHpkwTM2tQyBpnN/+aSGji7Nfg4F4FgrfQ
	 tvvjU4BdSmUiw==
Date: Thu, 22 Jan 2026 16:21:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/6] Rockchip DRM use-after-free & null-ptr-deref fixes
Message-ID: <20260122-classic-impressive-marmoset-f4723a@houat>
References: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="br2javf3yomklohz"
Content-Disposition: inline
In-Reply-To: <20260122-drm-rk-fixes-v1-0-3942f185750e@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_072119_627407_562C11E5 
X-CRM114-Status: GOOD (  10.54  )
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


--br2javf3yomklohz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/6] Rockchip DRM use-after-free & null-ptr-deref fixes
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 01:17:33AM +0200, Cristian Ciocaltea wrote:
> The first three patches in the series are fixes for use-after-free &
> null-ptr-deref related issues found in dw_dp and inno-hdmi Rockchip DRM
> drivers.
>=20
> The remaining ones provide a few minor improvements to dw_dp and
> dw_hdmi_qp.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Just FYI, you'll also need to sprinkle the driver with
drm_dev_enter/exit to make this actually safe.

Maxime

--br2javf3yomklohz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaXJAZAAKCRAnX84Zoj2+
di78AX9GenUV8sOcDvlr+fIdWUk7lR/nWSQHmZbpG3kUXCPc5lbeaOOmVYhDJzfH
f3QDG/0BfigN4FkQKxpTyIwbPBdIP43bV7hU7d4LvzHS3PDKeFEwkYtAr4JfOiRo
rCcF/mvqzw==
=9Hz2
-----END PGP SIGNATURE-----

--br2javf3yomklohz--


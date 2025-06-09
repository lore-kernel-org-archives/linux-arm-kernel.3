Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 336F6C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 12:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qfDIcqjnduy8meygW/qBXyvij9ZurElf10c3YQHwSDs=; b=nsF15X0R9aH4SeFW8zW5Layitb
	L/43rSCNUM2yMirGx5ydW9+V4WXFv/f12vbtbVCZ05R5dwaR30WEXKo3eGEXJCa6cdzPFW1+Ym2L7
	vHsCFrd7R6G11/BVk4vX9jWazfJswPFv3u/33W+TvqdSDDcqEVt2hAoH1KK3d8Q65oyhDbQ7mQ4Nm
	cXBBtenQQS+zZU/eisvkvZZ/oBdU2T/vcyGCG5K9vCsuG1jsg/9HWWZ11xFbob9p9KPF80sXFI1ZF
	DRXBEJxoQgOsKsU7DichHO9Yn5ldI95lzHHqLBhsw8EtMmLbgFWdNqmVlm6vOUKOLhPKxKG5yueTP
	v8+2wODQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObmn-000000049ie-0Dda;
	Mon, 09 Jun 2025 12:39:33 +0000
Received: from out-189.mta0.migadu.com ([91.218.175.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uObkW-000000049Uj-05e0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 12:37:14 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1749472622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qfDIcqjnduy8meygW/qBXyvij9ZurElf10c3YQHwSDs=;
	b=h5H7+XH5IYTLHkUPARiPozDYw/I6cAKb2Bpz+unNhZLPNSYeul/J0YR7OBQCCBYK978xdf
	jTifNtlO1HTEtTgTBzZ/y3c8bQs+YvYhDcxc3hYWLcJ/geVidv3NIT0K0a8Q89EEuWDOa2
	tX26Hs2ZrydvZT6uenWAfneq4fTKThQVf3MbqUBrBppWSas0QFp/lAkbfO8g6AJ/IOo+hb
	JCBfJ3e764P5XUtEwl6FMc8giqiQWJCieiRlklbHakxZNCGrlMezxTiTWgZjpmftwFWkDz
	1KbzuynkyDDpxioQZARTt596Z2U91i/mPt/JlpqdGZ6d6oEDwUYV1F4psGAPDw==
Content-Type: multipart/signed;
 boundary=6b0ed6f6510707f841f4ccb6050918da8f6bd88272d9f966931d54f28164;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Jun 2025 14:36:41 +0200
Message-Id: <DAI0A1Y753FJ.B0NMT8L5VPEH@cknow.org>
Cc: "Piotr Zalewski" <pZ010001011111@proton.me>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>, "Dang Huynh"
 <danct12@riseup.net>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH drm-misc-next] rockchip/drm: vop2: don't check
 color_mgmt_changed in atomic_enable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Andy Yan" <andyshrk@163.com>
References: <20241206192013.342692-3-pZ010001011111@proton.me>
 <DAEVDSTMWI1E.J454VZN0R9MA@cknow.org>
 <mArHDRo5bhIAjG8sDOR-kM7DsVdbXxxcC8hfuEEPfUWIdMwNnSUy8ZFoLis66DFSuIEq8TrnAxUGkyo5IUTGw3AG4k3vuVVz0fsoI27BAms=@proton.me> <DAH3S8O66J47.3NT18EJCXWKL9@cknow.org> <47773829.1fce.1974f732545.Coremail.andyshrk@163.com> <DAH60H3HYG7M.3NFXBJ7576RH1@cknow.org> <3161fa6a.93d0.19753f8c5e0.Coremail.andyshrk@163.com>
In-Reply-To: <3161fa6a.93d0.19753f8c5e0.Coremail.andyshrk@163.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_053713_005786_AE556589 
X-CRM114-Status: GOOD (  26.80  )
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

--6b0ed6f6510707f841f4ccb6050918da8f6bd88272d9f966931d54f28164
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Andy,

On Mon Jun 9, 2025 at 11:15 AM CEST, Andy Yan wrote:
> At 2025-06-08 20:53:37, "Diederik de Haas" <didi.debian@cknow.org> wrote:
>>On Sun Jun 8, 2025 at 2:10 PM CEST, Andy Yan wrote:
>>> At 2025-06-08 19:08:50, "Diederik de Haas" <didi.debian@cknow.org> wrot=
e:
>>>>On Sat Jun 7, 2025 at 5:32 PM CEST, Piotr Zalewski wrote:
>>>>> On Thursday, June 5th, 2025 at 10:13 PM, Diederik de Haas <didi.debia=
n@cknow.org> wrote:
>>>>>> Since kernel 6.14-rc1 I have the problem that visual output is no lo=
nger
>>>>>> shown on my PineTab2 and a `git bisect` pointed to this patch/commit
>>>>>> as the culprit. What is important to note is that `CONFIG_DRM=3Dm` s=
eems
>>>>>> to be required as the problem does not occur with `CONFIG_DRM=3Dy`.
>>>>>>=20
>>>>>> Near the end of my bisect session, something interesting occurred.
>>>>>> I was booted into a 'bad' kernel (ie no visual output) and when I
>>>>>> started to build my final kernel, I closed the lid of the PineTab2 w=
hich
>>>>>> made it go into suspend. When my final kernel was built, I opened th=
e
>>>>>> lid again, which made it resume, to transfer my final kernel to it.
>>>>>> And much to my surprise, I then did have visual output.
>>>>>> When I read the (below) commit message of the 'offending' commit, it=
 may
>>>>>> not be such a surprise after all.
>>>>>>=20
>>>>>> I did try it on a Quartz64-B (also rk3566) and it did not have any i=
ssue
>>>>>> (output via HDMI).
>>>>>> I don't know what the cause for this issue is, hopefully you do.
>>>>>
>>>>> I tested and confirmed that this happens with drm=3Dm but also in my =
case=20
>>>>> it happened when drm=3Dy. After some testing I found out that at boot=
 modeset
>>>>
>>>>Interesting that it also happened with drm=3Dy.
>>>>As you're more knowledgeable then I am with this, maybe look through
>>>>https://lists.sr.ht/~diederik/pine64-discuss/<D9AM2OOLREO0.2JMAI42J06TW=
0@cknow.org>
>>>>
>>>>to see if you may spot something relevant?
>>>>
>>>>> happened twice and at short interval and since this patch allows for =
gamma=20
>>>>> LUT update regardless of color_mgmt_changed state this makes DSP CTRL=
 GAMMA=20
>>>>> LUT EN bit to be unset twice too. It seems that VOP does not like it.=
 I=20
>>>>
>>>>Happy to see you found the cause :-)
>>>>Do you happen to know why it was unset twice? That sounds suboptimal.
>>>>But (IIUC) setting a bit to a value it already has causing issues,
>>>>sounds surprising as well.
>>>
>>> I have conducted tests on both rk3566-box-demo (with drm set to y) and =
rk3568-lubancat-2 (with drm set to m),=20
>>> but I was unable to reproduce this issue. Could you two please share yo=
ur kernel defconfig and the corresponding kernel startup logs?=20
>>> Additionally, both of my two boards tested with HDMI output. What kind =
of display interface does your board use for output?
>>
>>I wasn't able to reproduce this issue on my PINE64 Quartz-B (rk3566)=20
>>with HDMI output either, but the problem is present on a PineTab2 [1]
>>(also rk3566) which uses a MIPI DSI connection to the display panel.
>>
>>Kernel config:
>>https://paste.sr.ht/~diederik/aa747ed170aa01cc759fbe1ffd9cebe8c887b10b
>>
>>dmesg kernel 6.14-rc1:
>>https://paste.sr.ht/~diederik/733fbf8bb7f6aee8b68cf5a652157d445462c24a
>>
>>dmesg kernel 6.14-rc1 with Piotr's patch:
>>https://paste.sr.ht/~diederik/db1af672cfb611acbfbdf35adb6f170e5c38febc
>>
>>Both dmesg outputs contain a suspend-resume cycle.
>>I'm using a USB Wi-Fi adapter for the wireless connection.
>>
>>[1] https://wiki.pine64.org/wiki/PineTab2
>>
>>Happy to provide more info and/or do some tests.
>
> Can you apply the patch in the attachment, reproduce this issue(without P=
iotr's patch),=20
> and then provide me with a copy of the kernel log?

Same test as above, but added ``dmesg | grep "vop2_"`` at the end as well

dmesg kernel 6.14-rc1 with Andy's print_lut_0609_1710 patch:
https://paste.sr.ht/~diederik/ac356ee8b0f7e772c7310293d99d95644f59a4ee

Thanks!

Diederik

>>>>> patched vop2_vp_dsp_lut_disable function so that dsp_ctrl is set only=
 if=20
>>>>> GAMMA LUT EN bit is set. I checked that this also does not break the =
gamma=20
>>>>> lut functionality with emphasis on out-of/into suspend behavior.
>>>>>
>>>>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/g=
pu/drm/rockchip/rockchip_drm_vop2.c
>>>>> index d0f5fea15e21..7ddf311b38c6 100644
>>>>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>>>>> @@ -897,6 +897,9 @@ static void vop2_vp_dsp_lut_disable(struct vop2_v=
ideo_port *vp)
>>>>>  {
>>>>>  	u32 dsp_ctrl =3D vop2_vp_read(vp, RK3568_VP_DSP_CTRL);
>>>>> =20
>>>>> +	if ((dsp_ctrl & RK3568_VP_DSP_CTRL__DSP_LUT_EN) =3D=3D 0)
>>>>> +		return;
>>>>> +
>>>>>  	dsp_ctrl &=3D ~RK3568_VP_DSP_CTRL__DSP_LUT_EN;
>>>>>  	vop2_vp_write(vp, RK3568_VP_DSP_CTRL, dsp_ctrl);
>>>>>  }
>>>>
>>>>I built a kernel with 6.14-rc1 + this patch and can confirm the screen
>>>>has output again :-)
>>>>
>>>>> I will wait with sending a patch because maybe Andy has something to =
add=20
>>>>> to this.
>>>>
>>>>Sounds like a plan. It could be that this issue surfaced an underlaying
>>>>issue and if so, fixing that would be even better.


--6b0ed6f6510707f841f4ccb6050918da8f6bd88272d9f966931d54f28164
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaEbVaAAKCRDXblvOeH7b
bvKPAP46B//LqOIV8RNbzsTvRucLelpO7pWfbTzd6JQlsqhY2wD9EL03RSqd484F
IA5nWPMYb5bCwkjIkD/3wVwve+UsLQk=
=vlU/
-----END PGP SIGNATURE-----

--6b0ed6f6510707f841f4ccb6050918da8f6bd88272d9f966931d54f28164--


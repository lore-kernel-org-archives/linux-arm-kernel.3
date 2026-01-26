Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973ECD19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k9edhYWA/Gj8+NhEbjd6X4Te99Jon1QzTSg1pFs841w=; b=ZMD9rwCx7niYap/vJrXWGeP4tY
	FAbYzwpp1eAtGFP2xSXS7XbjyGpLCmKzcCdmrJXqE6NgQ2APFGbFFBP5RvtiPdOun9KM2Z4Vo/+SU
	SDalM8+Imp9SUrYERP5GhKELGULe1BGKxL1T/muNWHIkaqlZuwn/oEFdyQiO0CciHubrI6LLoq3xB
	hlQBIcf/UbI8G1NTzouOR7dn5g2uiCIAnsgzYf6dwO1QTf0ujoSL2j+b8BKv8xgD6mLahYPDPkpdX
	dS441FgmuyH0U4Jtq9AH9Me03lX1NDVcpGAPfNeC6WKGUxXzEMJwZl5SZyYn6gQu2ELPdSZm1oe0R
	9WtGucvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRhj-0000000D6Ws-2R1Q;
	Mon, 26 Jan 2026 18:52:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRhg-0000000D6WO-3NgM;
	Mon, 26 Jan 2026 18:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769453565;
	bh=h8IB/J037qzfODb/AKC4Cviqt5GuYeUYBXKiOfbv9X8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iKRb7ZDXk27k1R3CpuO6ivYT4IXiFvBbnWpQX+Ad12rE11s4qMSHr1Vb6PEIQA3hK
	 SZO8+hUnkff/ndlJuoXtxPlZQvHW/3MIoo3891YyT70Py833ryXyh1358QOc8S03Te
	 occ+5JoSA/YQFwAJEvR3G/Cq/wBRQLRzKVkAuCLVrba6qmXSWlX+bYr2fS2T0OBE3e
	 v7Kn+usA8ImRxqXhe729EE5WIKH27QepcHrXH6SnViIv6HInNoOVt04WICvw3E2BGy
	 joPCGnCh8m0hw9+moQ4lVIr4pPzcQYJCKyb5IAhIZ9e3hQSYYr+3cRf+sFgFNhM79H
	 B6ZxqyoQfOnqA==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 08D3F17E0342;
	Mon, 26 Jan 2026 19:52:45 +0100 (CET)
Message-ID: <6de0071f-a442-44b3-9ba2-13271cb1f246@collabora.com>
Date: Mon, 26 Jan 2026 20:52:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
 <d85cf4b299e929770a1b7f5be7ae61d76306e7d1.camel@collabora.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <d85cf4b299e929770a1b7f5be7ae61d76306e7d1.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_105249_001234_4D87ADD5 
X-CRM114-Status: GOOD (  17.37  )
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

Hi Nícolas,

On 1/26/26 8:30 PM, Nícolas F. R. A. Prado wrote:
> On Fri, 2025-12-19 at 23:47 +0200, Cristian Ciocaltea wrote:
>> The Rockchip VOP2 display controller allows configuring the
>> background
>> color of each video output port.
>>
>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>> which defaults to solid black, make use of it when programming the
>> hardware.
>>
>> Note the maximum precision allowed by the display controller is
>> 10bpc,
>> while the alpha component is not supported, hence ignored.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |  4 ++++
>>  2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> index 498df0ce4680..3a232d0d4acb 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
>> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc
>> *crtc)
>>  	struct vop2_video_port *vp = to_vop2_video_port(crtc);
>>  	struct vop2 *vop2 = vp->vop2;
>>  	struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>> +	u64 bgcolor = crtc->state->background_color;
>>  	u16 vtotal = mode->crtc_vtotal;
>>  	u16 hdisplay = mode->crtc_hdisplay;
>>  	u16 hact_st = mode->crtc_htotal - mode->crtc_hsync_start;
>> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc
>> *crtc)
>>  		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1,
>> val);
>>  	}
>>  
>> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
>> +	/* Background color is programmed with 10 bits of precision
>> */
>> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED,
>> DRM_ARGB64_GETR(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN,
>> DRM_ARGB64_GETG(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE,
>> DRM_ARGB64_GETB(bgcolor) >> 6);
> 
> Why aren't the DRM_ARGB64_GET*_BPC() helpers used here to get the
> values with a custom precision?

That's for performance reasons, please see "Changes in v4" section in the cover
letter.  I should have probably added a comment here (noted for v5).

Thanks for the review!

Regards,
Cristian 


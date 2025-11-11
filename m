Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9482BCCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 21:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PWZSjPeTHOwQQ/fMrt+3ARQrsSB/sn9y1Zax5yNuBX4=; b=P5Fm6E9bTLdhAwlvpUAaob6KBr
	GOVNIv6FMhj7wwy1UX1r2p5OYtxEu9gPR5AIRkS1vKk2W7E9pJXypGxq2Q1goU3dvR7+LhZ+u1A7+
	7tfKPj+ViKZOmSGTmN6smo/2mxdgS0Rv2+DGNfixY4XEair1oiBJCMmghawmt3wTD2aCe24ym5tc0
	qIk0MpL0R7iJLKoyUJoXbU/+BLC9bt3p9hxGp6WJUNQ2Hd8JosNpbZdke0VdPYCz+vKzbBQRm3glY
	MD1aADuf1E+G8F1LWBk0u/ruQ+DmxywqeYH05sX0dDXw+55jdNAOlwZ1qh1mPiCuH7afDNdu7d1cN
	7ThPdOLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvcW-00000007mcl-0kkO;
	Tue, 11 Nov 2025 21:09:44 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIvcT-00000007mbY-1ydy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 21:09:42 +0000
Message-ID: <d2759f7e-23a5-4d68-b50f-4c510540bcdd@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762895371;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PWZSjPeTHOwQQ/fMrt+3ARQrsSB/sn9y1Zax5yNuBX4=;
	b=ApCSoVk/a826CZMkyfwKzQ17VO4isZTG0H6VWc/GDizbMn7q8twT5poc+r2k3fIMGrkoZ2
	Z65SBZKzL1IkVSGYJyzEvMo/hWHyJVeqz8kwRn34epuz3GSZyjoUXy4IVBOk56te2c2DTW
	lyhHBoNPeuzbqaAXC/F8BoiH8X/uHg0=
Date: Tue, 11 Nov 2025 16:09:13 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
To: Mike Looijmans <mike.looijmans@topic.nl>, dri-devel@lists.freedesktop.org
Cc: David Airlie <airlied@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1b153bce-a66a-45ee-a5c6-963ea6fb1c82.949ef384-8293-46b8-903f-40a477c056ae.fb98a918-329e-4536-a0a5-a99b22ba0120@emailsignatures365.codetwo.com>
 <20250627145058.6880-1-mike.looijmans@topic.nl>
 <a8f0de1d-07e8-4e48-8495-9cafa0febcf5@linux.dev>
Content-Language: en-US
In-Reply-To: <a8f0de1d-07e8-4e48-8495-9cafa0febcf5@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_130941_952214_AE1E8CBF 
X-CRM114-Status: GOOD (  14.13  )
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

On 11/4/25 16:53, Sean Anderson wrote:
> On 6/27/25 10:50, Mike Looijmans wrote:
>> XRGB8888 is the default mode that Xorg will want to use. Add support
>> for this to the Zynqmp DisplayPort driver, so that applications can use
>> 32-bit framebuffers. This solves that the X server would fail to start
>> unless one provided an xorg.conf that sets DefaultDepth to 16.
>> 
>> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
>> ---
>> 
>>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> index 80d1e499a18d..501428437000 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
>> @@ -312,6 +312,11 @@ static const struct zynqmp_disp_format avbuf_gfx_fmts[] = {
>>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>>  		.swap		= true,
>>  		.sf		= scaling_factors_888,
>> +	}, {
>> +		.drm_fmt	= DRM_FORMAT_XRGB8888,
>> +		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_RGBA8888,
>> +		.swap		= true,
>> +		.sf		= scaling_factors_888,
>>  	}, {
>>  		.drm_fmt	= DRM_FORMAT_RGBA8888,
>>  		.buf_fmt	= ZYNQMP_DISP_AV_BUF_FMT_NL_GFX_ABGR8888,
> 
> Tested-by: Sean Anderson <sean.anderson@linux.dev>
> 
> I can confirm that this provides a nice performance boost :)

Actually, I think a better fix would be to make the "video" plane the
primary one. That plane supports XRGB8888 natively, and then the
graphics plane can be used as an overlay for e.g. windows or cursors.

--Sean


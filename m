Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5E9C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiGOJgGIass9aVDNQ4vKCQdxgrlpbqGo3d/LNJ/Qqdk=; b=EMgdHlMM18vSHs3LHAooSpuByd
	fwpdSERJTkRalnJMivEt0w2LfgXzHJz8GZesF6jFLjp7/+1JQEjkYdWWJxf9Rx+dc0u0oQZw+D0/P
	ehzTLsElsYz7wEYbNOAtYusKMgyZDO0gWxn/F15p38CxhgzXj5z86ANCm5wcZ8fw30BiaVnPU8eFM
	TPtjWODzrxigrhBJl24bwVNx80UrEObbO6/pieMAfvTITro2NdF9+P3nfaLTuwthZGDGZlq2HA8F2
	dRxLeN3eSY67zU+ZZ9ajMgk87YV56LABBHzXajIauVn6l6fAaX3uDzUNvtItHPpG2SkN53jhe2MLz
	4PyoOSzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaGF-0000000405K-2o2O;
	Tue, 29 Sep 2026 16:00:55 +0000
Received: from mout-p-201.mailbox.org ([80.241.56.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBaGD-0000000404I-0Kml;
	Tue, 29 Sep 2026 16:00:54 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hvNFB5DQ9zMlhW;
	Tue, 29 Sep 2026 18:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790697646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IiGOJgGIass9aVDNQ4vKCQdxgrlpbqGo3d/LNJ/Qqdk=;
	b=EtznGOuuYrnwKzckU/TLZKsDDV3MsyaLoBwKUvB1oD8ljsWrN5izxLfo7svXbzGDHzcp/T
	twCGdEXz91ga6meCpQqhjcXD1zECB00a9nIQx2ZNgOyaAN9WhdVEqy/3VWTRI+W9FSaCT8
	Ef1P4f8da3ZAutQsfhch0aLU8lB23I+aEK5NRj2aMtCJLmDlOGJKnBLV7YRoQgfyVwSV/V
	C7dLIP4SW7RtH8FPJbeBbOPLW3DdPAWLSfrbowSAncdh+ZH6hIldISb61YrWaqeSimsZOK
	8nab3Vtq55aNg5VyIfCoyQN919Y0uS5Aby8yK7MWw9fuvZu+QtU4xItwAFcfMA==
Message-ID: <a9164202-bb55-40cd-b9ad-20f5be344ba1@mailbox.org>
Date: Tue, 29 Sep 2026 18:00:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 13/25] drm: Add VRR target frame rate properties
To: Leo Li <sunpeng.li@amd.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Daniel Stone <daniels@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Xaver Hugl <xaver.hugl@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 Derek Foreman <derek.foreman@collabora.com>,
 wayland-devel@lists.freedesktop.org
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-13-2fcd7d011646@collabora.com>
 <0226527e-ee38-40ab-a2a8-1ae62013b950@amd.com>
 <VERVf-aJRRKsBOI_3dpScg@collabora.com>
 <8a3b2902-3255-4dd9-82f0-75a7747b710e@amd.com>
 <3cf7143d-7013-4a3b-a831-96c3f125c2f6@mailbox.org>
 <164d00c2-e4cb-4962-8e4e-389ae77af943@amd.com>
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <164d00c2-e4cb-4962-8e4e-389ae77af943@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 11ugeqcc3bte89ybq6np5e6yubuc9mu3
X-MBO-RS-ID: ebf20fcafbe5d0a3431
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_090053_269302_83B23EDD 
X-CRM114-Status: GOOD (  18.57  )
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

On 9/29/26 16:34, Leo Li wrote:
> 
> 
> On 2026-09-28 04:10, Michel Dänzer wrote:
>>>> You can picture VRR limiting as always being active, but with a limit rational
>>>> of 0 it uses the display's limit as per the EDID, which is what unlimited game
>>>> mode is. So with how it's implemented right now in hdmi_validate_vrr(), your
>>>> example would set a maximum target, but leave the minimum at whatever the
>>>> display defaults to.
>>>>
>>>> Now that I'm thinking through this, a possible problem is that
>>>> drm_crtc_helper_vrr_is_fixed_rate() operates on the user supplied limits, but
>>>> if the display supplied lower limit is equal to the user supplied upper limit,
>>>> then we have a fixed rate scenario without recognising it as such. I think I
>>>> need to have a ponder on what the least surprising behaviour for userspace
>>>> is in that instance. The display limit stuff gets a bit complex due to
>>>> CinemaVRR and QMS TFRmin/TFRmax.
>>>>
>>>> I'll improve the documentation on the next revision to make the meanings more
>>>> explicit.
>>> Perhaps a simple way is to require simultaneous setting MIN and MAX pairs?
>>> IOW, require userspace to set MIN and MAX simultaneously to >0, or =0. For example:
>>>
>>> if ((vrr_min_n == 0 || vrr_min_d == 0 ||
>>>      vrr_max_n == 0 || vrr_max_d == 0) &&
>>>     (vrr_min_n > 0 || vrr_max_n > 0))
>>> 	return -EINVAL;
>>> That way, it's never ambiguous what userspace has requested for the range.
>>> They can copy the EDID supported range if they don't care about limiting one side, rather than leaving it at 0.
>> Determining the actual limits can be non-trivial (though I guess that might be fine as long as libdisplay-info can work them out), if user space gets them wrong, it might accidentally apply a narrower limit than intended.
>>
>>
>>> It's then also clear if they requested a static Hz.
>> I do see the benefit of your suggestion for this though.
> 
> Xaver and I were chatting about this at XDC, and yeah it'll be difficult to match KMD's monitor range, especially if KMD decides to patch it with quirks and whatnot.

That's a good point.


> Since we are handing compositors control over vrr range, does it sound sensible to expose KMD's monitor range as a read-only property pair on the drm connector?

Sounds good to me, I actually had a similar idea after sending my previous post above. :)

(I have vague recollection of something like this having been suggested before, can't remember by whom / where / when though)


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast


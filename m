Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C470CF6C04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 08:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSoaLhIuH1Zi1XVYK4RuIJm0c576Z9PwEYpKMgsWAtA=; b=znjJCuxY9mAlgRH2iKp6oaMb4E
	nyA0d5akMXTP1pBUQYnSg3m+wPB+xZrAByeQuXfNfqhqQaG5vB5hTZioUgJICANzOhz3mY3kWnozU
	bhq9GNLwGro4w6J7ke0QrKoH+UmuFPcdajHTcPa1d35dVxRvBQzz+KFm5X2AqKKTnqy3AxxZa1sdl
	k/67LxU86n4v/WUPZxOk+vjITUj0TEpWwWe5i96YkKe+MlDYjxOn3L620SJCCj9anDIlKgh+iQDr7
	rC5JLo8Wc+Yn9+cGAx3RPZj7Pt6H+fapsF6eWug3qbzBrEQ34DsZI1qW5V3qn+HX/HeykzExs3wrR
	KpdBreRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPEr-0000000ESNv-11Yr;
	Wed, 07 Jan 2026 08:49:57 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdPEn-0000000ESNN-33es
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 08:49:55 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-595910c9178so1552858e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 00:49:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767775791; x=1768380591; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSoaLhIuH1Zi1XVYK4RuIJm0c576Z9PwEYpKMgsWAtA=;
        b=HWoas72wzjE0PSgUi3E3Ih/m4i6YfHmafAFzXky0kpdpwftcO2jQW6riYNZWaX6pHX
         YMlAsuHU2dF2H2FOSibuBgM6cA9vHA69WxNJFLU1owAUQhd954PQ09jnec6tfb88Z9wx
         AuVE4PY6sUcVHn/81unEFHsHhsYRMeMP6clYgLTWK4j8n1lYz7ToVEN0oQsjTemAeQRY
         PNWHvHL+1UO7t7MG+rCG84hvlAiN+3Hn2rO1WqfwYa/5Zx3dJTocluYFJUPVEW2PajO1
         ZhzxP5gDzpBy8M5Wwm/Vn1VGJJxQOP4rLpcxVx8Fqx0OXwSMypd0oGRUVv+dqTzhc7DM
         u/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767775791; x=1768380591;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSoaLhIuH1Zi1XVYK4RuIJm0c576Z9PwEYpKMgsWAtA=;
        b=Z3AHJsu/Fgk+NF1HeIwQ0yWX32vwOIZsrszKXNHrws1WMEOgtrfP7md8Qd0gZ3bvWK
         dhGjI+yD9Rn1/FoluDO69ndBZz8NI62q0BGrBdGgA55vbYuxm5tPYnZABPlMjZOo47nq
         lTO5PbmDiYEKrKvaqOpzQ/lFXWEpuEv1s2lnCjYH6PeSnRG6cr/tgArXqmbEjEPyt9x+
         4NRmxsrgwdI9It1UCMjsbZ2nr6Cf+JQ7LegOKtNi0YsFt+2Pf3qB8YXU1vrTVCbBofvr
         958LTR9NV7sZoXPSrzDLe7Kh06qc1vKsVDEC3suYZ85HzfUXHloa3//YlB4xFVOqC+Pk
         ESaw==
X-Forwarded-Encrypted: i=1; AJvYcCVng6S0g1xaNjThwdmVnPE9F7l8wAeeUlGNTDnpkRzfeq3P2qzN4oAcpREU7Z0uQ73Pmrlu2F55mX5wpsWT3mhq@lists.infradead.org
X-Gm-Message-State: AOJu0YxScJwYf5Zxj43Yyc+FtebDI1xFnDUgEEzO87IhcMSwUhT7tcmI
	TTnix0AzdjMLnNf55CphSQMXs9USPjOsvEjIIU/2okSTkrKptThDi18t28X5zh2DNUU=
X-Gm-Gg: AY/fxX4whwPfCUE5SR2VZwHxZv1N3a/P4bSFXGMyrN/cY2Lv1eMmkRdvacLKFBArTbJ
	twI7TDeKWfoVftvvkQMiwOV3PrhMK7+1mYa2ASuvUPzGUUT7Qc61vzkEmONUrt+7WT/EVhOH6GV
	dg0drEQyotxm1MhCCmDBgsx+HxvFmNFZJm7C3r95TKc4CcY32gT+LyWwgxAcza8YfGrUR2q+P1y
	Lh6urWDliJ/nkIyt+QbN7qOV3h+uMfuzopPO+rb8h/oY7+THRV5ErT+XkBXMPfRwF0im9dxObb6
	+lJqjR7Pn3iXVJGToNSnts7Wif+yHQw9uUevbpjxY9d8Y81najC5o/vLAj+4aWNZgyTEqvqXaPK
	JivCa2kxckG/wSmupcJMLvlmbka7zE9qFG2eW2QVKLRazKiyIonIUaQigP4Uxha7GWA7vp7ONZt
	rQsvTU1rM3UskwnBpAao3sbtusbTH/Yg/8eflDShxpk0UgqstwseYyDnw=
X-Google-Smtp-Source: AGHT+IHBRlwXMZFBuxQXKLXYYbkgbRfzLpPmGOcIsytMeFZO2+c0XT3T+QaaepM7xLEpCuNQUQL4eg==
X-Received: by 2002:a05:6512:3c88:b0:598:ef90:3e87 with SMTP id 2adb3069b0e04-59b6ef0c18dmr524880e87.18.1767775791133;
        Wed, 07 Jan 2026 00:49:51 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65cea814sm1176668e87.12.2026.01.07.00.49.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 00:49:50 -0800 (PST)
Date: Wed, 7 Jan 2026 10:49:48 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	Bill Mills <bill.mills@linaro.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH 0/2] drm: xlnx: zynqmp_kms: 16 bpp fixes for Xorg startup
 on AMD KV260
Message-ID: <aV4eLJfqeNqnDVxn@nuoska>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
 <533168f1-1655-4947-9032-b08463f502d7@ideasonboard.com>
 <aUVFUx55XTjb_2nO@nuoska>
 <aUkIQjKpd3MhNHjk@nuoska>
 <5f570a3b-7bee-43e0-9a36-3d106984fec6@suse.de>
 <3d214bf3-6b52-4942-95d9-0504fa6f5877@ideasonboard.com>
 <aV4SsKZ5eiayh18n@nuoska>
 <e53eeee6-8c6a-4ab7-b62f-2491efe19aeb@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e53eeee6-8c6a-4ab7-b62f-2491efe19aeb@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_004953_824693_ED168C81 
X-CRM114-Status: GOOD (  51.40  )
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

Hi,

On Wed, Jan 07, 2026 at 09:32:28AM +0100, Thomas Zimmermann wrote:
> Am 07.01.26 um 09:00 schrieb Mikko Rapeli:
> > On Tue, Jan 06, 2026 at 10:29:37AM +0200, Tomi Valkeinen wrote:
> > > On 06/01/2026 09:41, Thomas Zimmermann wrote:
> > > > Am 22.12.25 um 09:58 schrieb Mikko Rapeli:
> > > > > On Fri, Dec 19, 2025 at 02:30:11PM +0200, Mikko Rapeli wrote:
> > > > > > On Fri, Dec 19, 2025 at 01:59:14PM +0200, Tomi Valkeinen wrote:
> > > > > > > On 05/12/2025 14:37, Mikko Rapeli wrote:
> > > > > > > > Currently on default yocto images Xorg fails to start on AMD KV260
> > > > > > > > because 24/32 color depth gets detected but does not actually work.
> > > > > > > > 
> > > > > > > > These two patches fix the issue and now 16 bpp gets detected
> > > > > > > > and Xorg starts and draws on external HDMI display using
> > > > > > > > kernel.org based linux-yocto kernel.
> > > > > > > > 
> > > > > > > > Anatoliy Klymenko (1):
> > > > > > > >     drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
> > > > > > > > 
> > > > > > > > Mikko Rapeli (1):
> > > > > > > >     drm: xlnx: zynqmp_kms: set preferred_depth to 16 bpp
> > > > > > > > 
> > > > > > > >    drivers/gpu/drm/xlnx/zynqmp_kms.c | 3 ++-
> > > > > > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > > > 
> > > > > > > Did you notice the few already sent serieses on the list where the
> > > > > > > topic
> > > > > > > has been discussed?
> > > > > > > [PATCH] drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888
> > > > > > > [PATCH 0/3] drm: zynqmp: Make the video plane primary
> > > > > > Oh I wasn't aware of these.
> > > > > > 
> > > > > > > Or is there something else on KV260 that messes up the 24 bit color?
> > > > > > These look very similar and likely fix the X11 startup. I will give them
> > > > > > a try.
> > > > > Right, now I've tested:
> > > > > 
> > > > >    * these patches from Anatoliy and me to help X11 use 16bpp mode by
> > > > > default
> > > > >      and removes the need to manually setup Xorg for 16bpp
> > > > >    * "drm: xlnx: zynqmp_dp: Support DRM_FORMAT_XRGB8888" which enables
> > > > > the X11 default
> > > > >      24bpp to work, no need to set Xorg config to 16bpp
> > > > >    * "drm: zynqmp: Make the video plane primary" which also fixes the
> > > > > X11 default
> > > > >      24bpp to work, no need to set Xorg config to 16bpp
> > > > > 
> > > > > All of these fix HDMI graphics output on AMD KV260 board with yocto
> > > > > genericarm64 machine
> > > > > and core-image-sato image which includes Xorg. The graphics rendering
> > > > > is still
> > > > > very slow but I think that is a different problem.
> > > > > 
> > > > > I guess the last series from Sean Anderson is moving forward so I'll
> > > > > reply to that thread separately.
> > > > Just want to say that the series here improves xlnx and makes it a
> > > > 'better' driver. IMHO the changes should be merged independently from
> > > > what happens with the other series.
> > > I might be missing something, but I don't think I fully agree. Yes, the
> > > userspace doesn't seem to be able to cope with the current upstream
> > > driver behavior (even if it's not wrong as such, afaics), so in that
> > > sense this series is better. But I don't think (almost) anyone really
> > > wants to use RGB565 if XRGB8888 is an option? And that's what the other
> > > series is trying to achieve, and that series conflicts with this one.
> > > 
> > > So I'd rather try to get a conclusion on Sean's series (or the other one
> > > from Mike). If that effort fails, we could go with this series as a backup.
> > I did testing of all three different patch series'es on AMD KV260 and
> > did not find any performance difference between them. The Xorg
> > rendering is still very slow to an external HDMI display.
> > 
> > I don't have an opinion on the graphics formats but just want something
> > out to a display by default. I think there is a lot more to fix to get
> > the performance into usable state.
> 
> I briefly looked through the xlnx driver and found several things to try.
> 
> * The update code in [1] appears to always update the whole buffer. Setting
> drm_plane_enable_fb_damage_clips() for the planes will enable damage
> handling. Then flushing only the damaged areas might improve performance.
> 
> * The driver could set drm_device.mode_config.prefer_shadow to make Xorg use
> a shadow buffer in user space. This often works for devices with discrete
> VRAM.  IDK if non-X compositors also benefit from this.
> 
> * If the hardware supports it, setting non-coherent DMA mappings could
> enable caching on the memory buffers. The driver would then have to enable
> damage clips and flush caches by itself where necessary.
> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.18.3/source/drivers/gpu/drm/xlnx/zynqmp_disp.c#L1109

There is also the official AMD/Xilinx kernel tree with a lot more patches
which have not been upstreamed yet:

https://github.com/Xilinx/linux-xlnx/commits/master/drivers/gpu/drm/xlnx

I wasn't sure which of these changes fix the X11 startup issues but came up
with the 16bit patches since they are so simple and avoid doing the same
in Xorg config file.

Would be nice to get these AMD patches upstreamed, for example one subsystem
at a time.

Cheers,

-Mikko


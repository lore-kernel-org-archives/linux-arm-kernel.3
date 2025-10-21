Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E478BCCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=; b=f4WIysxCU8P9EjsnVOzKiazfue
	Y9tL2OhKfBjlyMev4CLGilnKBihESgD/fEYfN3spH9NnOUu2yo5X97UdkUGLPTQMJkLCo8+LgjFgJ
	1F/fYmukuEMapddr0YnVklsM+cmQBWlA0/o3iTlu/+p+uLACtbbMUZWvdeKvhn6F7c24awUWY7WGg
	TMRi3NAFbPZ4oubQ9MMjbsZHeLXxoqsZaPYfTGZ6I+mklbIdM2Lph03jFQHoSLDbxoxH3HbpMrpXB
	3EBXUVWeBrx9NgMjE6K4CnZ/TanUuYDh9rC2g6walRwl7jVc6GTXJzXBkiRSOdD+MjFYQARa/p6Ng
	A+t+KGoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7LM-0000000GD6m-20JG;
	Tue, 21 Oct 2025 08:03:44 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB7LJ-0000000GD5F-3MDQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 08:03:43 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-b48d8deafaeso1182909166b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 01:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761033820; x=1761638620; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=;
        b=awOIbjB8q2vFbF/Awe4B46h6o7ZTTIGbw5ImZ92pOCfh3ol+LMFAwjZdJoVzeiWN2G
         Rj35lXDNdLnBrDgA40lewru1dl1QPTRUvtQiXoqM7b58tbNxjaGqcXqy2etqSSr9c4TS
         1yjhE/39A8/wKi15pi8cn3DEgdT45voasVZng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761033820; x=1761638620;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1eZOCk0G+WIeYYVlPWpiKCZVOUjneoPQzsl6dTiB4tA=;
        b=LRxPkE6yr+gbq19Vm6g3ibxuS88rn47HAq2M5bapdc+0qN330cyYokisKylVO5RopF
         MaWoojgIbvQBPsw9v8F7gdjFjsVUbrXP84SLSDS3xxjcLRPGmvhBhUuWHcDxZiQlMRC3
         ETNYFJGXoHoXjEzWAEflDYb/1vgUMnB3AXpTPiJnovO7aN6P0OEyOfZIVP4Gjz4AfMa8
         1j7Qm9Gcbtmk/HqkYRvzwDXGWXTpRrW2oRjgqTfKiPN2tw2YmKVF0pHIogUKhdfaGMXW
         pn70LxETE7KJMsUeehHUBcJUyxEGhywtXSQaDWq++O4/H9IGx8OHqu4XcFBy/sk9G1A4
         gTrQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4B2gvFL5vmjqGOYzqykb9Mp5LqogzfYZYHYtukKcEUD7pfif5PS8jYUCmfNsInHE5JdcnWt+FUDrukWuLn7w6@lists.infradead.org
X-Gm-Message-State: AOJu0YymQhAOB8RFPInlEh+jXn0GvNrxM0vmV+K0QE15KI5QejjGQqYY
	y2JyyVocSJlzx6e1FRBjrukBQNi0hZYT+Uwo5T9Q2p/jSZqzTT4hWrD1Kqp2k44i5y0=
X-Gm-Gg: ASbGnctUH3mepKAXOy4vDsFrTkFJdelvYxEosqsHQJjtNXDmL6b8yIFjvESHxB4H7FS
	eEdYXarsWuUzHPhazgCV0AlCZFghePl+pCuQ2CgnrS+sFPN7ZN1oVSndk3Au61NAoZ9t2n1jG49
	K48ZuexQ/0XM4lys46c8OBYDaHcsMBv6/9nQqcb9Fi/LPEjFqRlWsSyNTGpTW+z7hsEY9Fc//ZD
	UMUXn2CnI72yjdEAryd0iiTAWuEJ2xiGTSiRjQjProtykQ6X9eu2ibLf3Nb7y48NONsdEy/O9dG
	QlUBQ/8J/IOt+j6NJJsnFFoqBKK2RkHUoKLzKBupH2IYy4Zg5V8s8iQOUN0HGg2cWaUMH3Pl9m3
	gN45aqJ94/kqZt2YUnFnI0i1maRLPfdea1sY4/htgxJm7GFK8QFtcHaUUZsKOmSZFDnv9Pbn8Y7
	cdPodhXI6EHcs=
X-Google-Smtp-Source: AGHT+IEbmSLB+yRFZ86qxeD7wG4TxM9uG6ayZpPpFTz88clAHcJph5RIG47VQ/I34aUFg3RPcxflIg==
X-Received: by 2002:a17:906:fe41:b0:b04:aadd:b8d7 with SMTP id a640c23a62f3a-b6471d48347mr1967108166b.13.1761033819926;
        Tue, 21 Oct 2025 01:03:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65e8581780sm992513566b.31.2025.10.21.01.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 01:03:39 -0700 (PDT)
Date: Tue, 21 Oct 2025 10:03:37 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v7 2/7] ALSA: Add definitions for the bits in IEC958
 subframe
Message-ID: <aPc-Wad85lQWbqfa@phenom.ffwll.local>
Mail-Followup-To: Shengjiu Wang <shengjiu.wang@nxp.com>,
	andrzej.hajda@intel.com, neil.armstrong@linaro.org,
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com,
	jonas@kwiboo.se, jernej.skrabec@gmail.com,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	lumag@kernel.org, dianders@chromium.org,
	cristian.ciocaltea@collabora.com, luca.ceresoli@bootlin.com,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	victor.liu@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	devicetree@vger.kernel.org, l.stach@pengutronix.de,
	shengjiu.wang@gmail.com, perex@perex.cz, tiwai@suse.com,
	linux-sound@vger.kernel.org
References: <20250923053001.2678596-1-shengjiu.wang@nxp.com>
 <20250923053001.2678596-3-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923053001.2678596-3-shengjiu.wang@nxp.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_010341_852178_0F1E5869 
X-CRM114-Status: GOOD (  18.30  )
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

On Tue, Sep 23, 2025 at 01:29:56PM +0800, Shengjiu Wang wrote:
> The IEC958 subframe format SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE are used
> in HDMI and DisplayPort to describe the audio stream, but hardware device
> may need to reorder the IEC958 bits for internal transmission, so need
> these standard bits definitions for IEC958 subframe format.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Takashi Iwai <tiwai@suse.de>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>

Would be good to get a formal ack from alsa maintainers before merging
through drm, just to be sure.

Thanks, Sima

> ---
>  include/sound/asoundef.h | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/include/sound/asoundef.h b/include/sound/asoundef.h
> index 09b2c3dffb30..c4a929d4fd51 100644
> --- a/include/sound/asoundef.h
> +++ b/include/sound/asoundef.h
> @@ -12,6 +12,15 @@
>   *        Digital audio interface					    *
>   *                                                                          *
>   ****************************************************************************/
> +/* IEC958 subframe format */
> +#define IEC958_SUBFRAME_PREAMBLE_MASK	(0xfU)
> +#define IEC958_SUBFRAME_AUXILIARY_MASK	(0xfU << 4)
> +#define IEC958_SUBFRAME_SAMPLE_24_MASK	(0xffffffU << 4)
> +#define IEC958_SUBFRAME_SAMPLE_20_MASK	(0xfffffU << 8)
> +#define IEC958_SUBFRAME_VALIDITY	(0x1U << 28)
> +#define IEC958_SUBFRAME_USER_DATA	(0x1U << 29)
> +#define IEC958_SUBFRAME_CHANNEL_STATUS	(0x1U << 30)
> +#define IEC958_SUBFRAME_PARITY		(0x1U << 31)
>  
>  /* AES/IEC958 channel status bits */
>  #define IEC958_AES0_PROFESSIONAL	(1<<0)	/* 0 = consumer, 1 = professional */
> -- 
> 2.34.1
> 

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EEAE77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 17:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEAfsLVBfsGUy76+oFFFHqlf6kVm31lMCS/pgQCj+NM=; b=B88TMe56Xifs2g7n09bwsk3hug
	IsvNb0csWX6BE/K10rlXhCuC7aVt+wPxeJ3Wwy/HsJ40hwm2L6Fd0TIImNBeFt33Y+tE92e8fjOyE
	WNz83UM83GMkOB4dej/oagb6LZO4ToBZMWMX1d++RooZSCpYOYMX4a32i7ugxOljx0bRx5jAE6bDP
	y1p21HNBMctT+lkhxzh4CdFfPlMmYf99jx00aEGTf1b6ebTnIcznFlMihogQEDvxuZ3qzbzGdwuR5
	GeMX4qk5uLUaRGYmQIYQkOrikfRlVvOsrWdIex4XNBtyALQ75L8nHnatcWjHq1nlvLLsCaXIuxfow
	iNnSFFiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhFd-00000008frl-3Y6K;
	Mon, 09 Dec 2024 17:08:53 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKhD8-00000008fIJ-3LdJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 17:06:20 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6d88cb85987so36991886d6.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 09:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1733763977; x=1734368777; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CEAfsLVBfsGUy76+oFFFHqlf6kVm31lMCS/pgQCj+NM=;
        b=JQFTyLzatT7TfvNp5ypt0cl8KAVgN+lNDm6MQ9/SctCn6lv3ngT+spbsKA8maGc4HT
         viId263EWvk7pbvOCIp64jNcaMcRL1HxwyLVlOJp1YLBTad94M37GVkWhrnM5x6tsIpr
         PenWDmxF9oPLR49lNeICZCTgWqma5ETVwb6+BXQxnA4Y++mJC8DZZ4xCSCLpO0ovDvWC
         U9zUIotcub1mb36UUuGyUz29ozzH6GXY9TCiMoHw4ZwZJ4nTmHlLmS/2WMR0YMbopvbv
         S0goRUHx/ktFCsQfJ/vsRRxlwqxsr09tGYZTP5XfD8xkZ2IslTAGGiTRXNLqqihvhxhS
         7VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733763977; x=1734368777;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CEAfsLVBfsGUy76+oFFFHqlf6kVm31lMCS/pgQCj+NM=;
        b=xBh8FcUhn9lCPKuyJDj21Dm3p5+SlOON4RYPzPlaMGhTPfUeJUUIiC6nRB21CsD8yq
         c6d0MUKCGs4aKYHmZVsJXTDb3gcEtpuHhOwPKdAa6TB3e4qav1Y6dJ5JIsK0nSNLWjVy
         Z8JP9LmE+fWTQGZaMWfGWUirgl0iH1ucdxKUbu9Ywe6RlMcLIlypLA3Qu/VdvR4soJP8
         00xDR3tU3A7kPQIxNgyfYxKq6QgU5swnYuudjAWMgmm2sKBCSDMYeexv6tG5XwqPWP/8
         q1tVJgoYyCjP8BruD9AtokixaHmv4Odu6T5cg8js0lSAHDfpSK9FYIY9mMnxlLxgFE6P
         JU0g==
X-Forwarded-Encrypted: i=1; AJvYcCVsUQPKjGW0A09C97i1yD+eVuYMiExwodgjQVnEy80y0MUf0fo7nzXaqQ3vwV1UOvzJQElEJG4vwmWwOWUu6Lun@lists.infradead.org
X-Gm-Message-State: AOJu0YyxFiZercuz4GZoMW6isI/kZum9zZx0moyfSRX9IHjJOp7JaTPp
	+oSJQ42BNB+BPWgJAlDCHNNMCSUwlI/LOBAokmuH2DIsQg5EP7SFLeXXwDWnYtqDWWkVBVv3Cio
	x3GmZA13VIqvuzzNQVR5qP5p6RHJWPJ5Zmdjy5hDlmNMgzu5s
X-Gm-Gg: ASbGncuHodLFvnBgsjT7wKgWyORXkWSbqs4F6mgoWWDegmcLYbcJ6mxrhw/eSy1CS0D
	iOWG/46JXSh6w+2gcu+0VsDQPDmDU
X-Google-Smtp-Source: AGHT+IGAVS5+GIVv09oM5aUfkNYSqKqLURj0uHGDQYo0Hnrn9PDydwzeP97lSsusJEmrWZvi9Pv6yK2sFETMgjF0y6Y=
X-Received: by 2002:ad4:5f8d:0:b0:6d8:8283:4466 with SMTP id
 6a1803df08f44-6d9213835acmr1371546d6.18.1733763976815; Mon, 09 Dec 2024
 09:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20241209122943.2781431-1-andyshrk@163.com> <20241209123215.2781721-1-andyshrk@163.com>
In-Reply-To: <20241209123215.2781721-1-andyshrk@163.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Mon, 9 Dec 2024 17:06:05 +0000
Message-ID: <CAPj87rO0MG2yE_NTndbxQ77rW-p6-ht5kx5vsaOZikQfVmwrgg@mail.gmail.com>
Subject: Re: [PATCH v5 08/18] drm/rockchip: vop2: Add check for 32 bpp format
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	s.hauer@pengutronix.de, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_090618_957384_5615E2BA 
X-CRM114-Status: GOOD (  12.83  )
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

Hi Andy,

On Mon, 9 Dec 2024 at 12:32, Andy Yan <andyshrk@163.com> wrote:
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index bd8db45eeba6..1f101a3c3942 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1224,7 +1224,15 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
>                                 return -EINVAL;
>                         }
>                 }
> +       }
>
> +       if (fb->format->format == DRM_FORMAT_XRGB2101010 || fb->format->format == DRM_FORMAT_XBGR2101010) {
> +               if (vop2->data->soc_id == 3588) {
> +                       if (!rockchip_afbc(plane, fb->modifier)) {
> +                               drm_err(vop2->drm, "Unsupported linear 32 bpp for %s\n", win->data->name);
> +                               return -EINVAL;
> +                       }
> +               }

Please do this in the format_mod_supported() hook, so userspace can
see the true support of each format/modifier per plane. This will then
be checked in drm_atomic_plane_check() so you don't need to open-code
it here.

Cheers,
Daniel


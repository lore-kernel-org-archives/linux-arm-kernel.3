Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59CF8C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDkqu6YvDNrbpTEdPG+4ExbN9hMVRyVvia3ov+F/dwI=; b=SLrins6SoIkg15mVG2H3sThJgu
	swl2U8vSvUXn8G5X1I7PqItUbW2MUs+Uhie78u2Ig1+w10se65M0N0wpeLX1YZo2qaVQkrUxXEK0y
	VRYaZSM9FN3JKfXir6UHLo8RpPkc4+TLWvUxmgZX9buW/9AJiOeZaoxZHH+sp91bFIAuqD1dbClKQ
	P5nHlFYu4YlBDlbOOtGWkPZc8pZY3k42Xi/9zgmZrZzObqxqZ/+dzCqFC+TZdd8hZbV3zOfAxXFJV
	9MNNnEPGeV0vDU5WO9lA9YrRegwARHfFNXu29wQWRnloiinieiva3Os/AjLUXbVS9E6kM7Cmit3T2
	Bbd8A8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7uW-0000000FLUm-0euv;
	Tue, 07 Jul 2026 15:40:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh7uU-0000000FLUN-2uEA;
	Tue, 07 Jul 2026 15:40:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 447B443664;
	Tue,  7 Jul 2026 15:40:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB7001F000E9;
	Tue,  7 Jul 2026 15:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783438834;
	bh=xDkqu6YvDNrbpTEdPG+4ExbN9hMVRyVvia3ov+F/dwI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=HoLdaR9+KSMufwouQms5RdOT3ZscAVlkJDo03oDvFhckSnrYBvpux4ZSaa8zd+tlm
	 vAWlbjLZ/Q9RzMIX9IEr7ITojeyfBjdUUBDcDTt84fBWk0pVTbRThBZvtJMPpbppKI
	 IexUeEmkkqrzAd0o+JJ/WT5Lbcx+UjZqkbWKS53Xm5dtIhIMmp2rpiWjxwKLyGu4Sz
	 IbnyB9vpEdtwXFhJDnKF4oka5ugxJxTgve43aFlHvY5N+PI+AJMMvmD8dq0NFOMtrp
	 8wVHpLU+VmJhFjzknrjbz8nAE3CGpV5caJcWdMBeen2KQQ4z4zQeejRDon4BIijk4l
	 VqXlIm9Nb46EA==
Message-ID: <046a0d2da5026d06ac8fcb2abbf77e7d@kernel.org>
Date: Tue, 07 Jul 2026 15:40:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Cristian Ciocaltea" <cristian.ciocaltea@collabora.com>
Subject: Re: [PATCH v8 06/39] drm/display: scdc-helper: Add helper to set
 SCDC version information
In-Reply-To: <20260702-dw-hdmi-qp-scramb-v8-6-d79890d00b6a@collabora.com>
References: <20260702-dw-hdmi-qp-scramb-v8-6-d79890d00b6a@collabora.com>
Cc: dri-devel@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Daniel
 Stone" <daniels@collabora.com>, "Dave Stevenson" <dave.stevenson@raspberrypi.com>, "David
 Airlie" <airlied@gmail.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Robert Foss" <rfoss@kernel.org>, "Sandy
 Huang" <hjc@rock-chips.com>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
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

On Thu, 2 Jul 2026 17:46:19 +0300, Cristian Ciocaltea wrote:
> The HDMI 2.x specs mandate that compliant Sink devices report their SCDC
> version in the Sink Version register, which reads as 1 on any
> SCDC-capable sink.
> 
> There is also a dedicated Source Version register.  Writing it is not
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


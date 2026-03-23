Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA3BF483C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wz/qy3mOqhyoOYrk4BYNUG4XnoW1wVBR5GPWBTYta+k=; b=cispkV0unUAf4jqtfyeFcS4nda
	z2oVpIHT7/BDAGWVvURxgbC3ZjVZ25wVJsrnFzlEYv9GV+ufJ+ntwYZ7WfPX59NzkaCoin3IQVSw0
	X3pcFxsjMZTVNxj4mqofsqr3oZBS7he5qJjSLLxqeHo2h4HlYl1hkySGCMs8FkdoPdzmWcxkeCSLU
	xiKZH+JrEA4HDl6YtLvyaD0G+fcGDtNhD5gbDIc6XjL8ja09PeslKIrkBNZ1KLDCaOoH+sApCLQ03
	6Um8P05BguB7fk5S/W/SUisEIm17BmfRXHjZFSGC3XDLG0iGy0TNAbgw2Le5EQQXoWZGarHG3MPT2
	B1mSvhVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hw3-0000000H6hp-1iTi;
	Mon, 23 Mar 2026 16:15:23 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hvt-0000000H6dn-3wz7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:15:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 53191C58082;
	Mon, 23 Mar 2026 16:15:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6D9685FEF6;
	Mon, 23 Mar 2026 16:15:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8EEEA10450FE0;
	Mon, 23 Mar 2026 17:14:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774282506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wz/qy3mOqhyoOYrk4BYNUG4XnoW1wVBR5GPWBTYta+k=;
	b=X8I0za+0DuH7Uricdi22M/uTCib/0T6dlZjRnidNjg5yq5jTJSBptkLD5BFMEGHu1c1Urv
	P/GlNk2/IOpNJyvIR6JFZdujnZRu/xEZn0nCpRkF313SELDqqdkb5FCR3SVckFMYEY90M9
	18vd1rwE2UFRQ3oazskYokOSUhwBLGeV0mwfPDVnZ72AuXrT6Z658yNUKugz058xy3LsuP
	ea5Ak61T2Qprayj5sy69Bh9wCks/IfLxiWrh1wKR4kT4++lr6BqaeOG7H5EFZVVsLCdGEP
	UY1R8QPgy+z09dqXUxNhPNfwhGA/TNJ7W8AAQmmc/tUg5TwCV91sJYyb5djeiQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 17:14:56 +0100
Message-Id: <DHAANIKVU6BV.20W1GS0MWT55E@bootlin.com>
Subject: Re: [PATCH v2 9/9] drm/rockchip: analogix_dp: Add support for
 RK3576
Cc: <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <nicolas.frattaroli@collabora.com>,
 <alchark@gmail.com>, <cristian.ciocaltea@collabora.com>,
 <sebastian.reichel@collabora.com>, <kever.yang@rock-chips.com>,
 <heiko.stuebner@cherry.de>, <tomeu@tomeuvizoso.net>, <amadeus@jmu.edu.cn>,
 <michael.riesch@collabora.com>, <didi.debian@cknow.org>,
 <dmitry.baryshkov@oss.qualcomm.com>, <dianders@chromium.org>,
 <m.szyprowski@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-rockchip@lists.infradead.org>, <linux-kernel@vger.kernel.org>
To: "Damon Ding" <damon.ding@rock-chips.com>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260320004554.2006299-1-damon.ding@rock-chips.com>
In-Reply-To: <20260320004554.2006299-1-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091514_119047_521FD1B0 
X-CRM114-Status: UNSURE (   8.66  )
X-CRM114-Notice: Please train this message.
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

On Fri Mar 20, 2026 at 1:45 AM CET, Damon Ding wrote:
> RK3576 integrates the Analogix eDP 1.3 TX controller IP and the HDMI/eDP
> TX Combo PHY based on a Samsung IP block - both of which are the same as
> those on RK3588.
>
> The patch currently adds only the basic support, specifically RGB output
> up to 4K@60Hz, without the tests for audio, PSR and other eDP 1.3 specifi=
c
> features.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


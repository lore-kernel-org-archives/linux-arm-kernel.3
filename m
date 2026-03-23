Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 809D1F483CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:From:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6obHe83BAwmzQr/bTjTPtRZKHUknQfMZAa88iZ63Kw=; b=mPEkZaylaa5PXKhDWX7OPox3W3
	sPKypuNF5YB5RyQ2LqwjP8boGc7u5zR4/ibAYM5Es7yP5/SKjQ4+U+zHjjo8JVaMAkebrUhVmLs9H
	LwDrr1reDN9Uny82sH4ic1mY1ovg5FO9ObQMbJTDZg9siqnmsU7KccoA708AUkMXK0tVsZc9KDRcF
	dAh5o2groSU6WbagcOScKCCBk1PND1oV7RiFJ/eD7onCPxk4gF0875jV6gvmcTCCdylB5j61oAdVO
	iVaRTQAh729RznY8bNuks2V5uwizlPD5oWTMa0qb/apMSW8DMbgAKDs5L6Wv/Y05usIz9QW4zB1cN
	+TEls52w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hw3-0000000H6iD-32wU;
	Mon, 23 Mar 2026 16:15:23 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hvt-0000000H6dk-4BqM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:15:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 605151A2FA2;
	Mon, 23 Mar 2026 16:15:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 297505FEF6;
	Mon, 23 Mar 2026 16:15:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 290B210451097;
	Mon, 23 Mar 2026 17:14:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774282505; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=K6obHe83BAwmzQr/bTjTPtRZKHUknQfMZAa88iZ63Kw=;
	b=gZNQO9t18okNaQnCJgK7AKFN1ayJZ25Qu2grAZkSWH+meBwEgO7CYqMhvUJtDfkJR9zNLX
	tGqnLFBrLSfkHP+VwDq95ZuNIqDPpirhxj0bxO9gK6fMJUJjnkZzetUhBsdRqsIzWcb6Bn
	Jf5uGXZpdLJklu6d251BycDsDJeBqGjtDLlctYHnez3K8HitbTJ4BWLghBFUcl8QvyV+4i
	xqZXiVd474eHdHttYTF9u6SmKMfXkbeizy6+R75x6p5CwZrP253w0ee9tH3HdqKKWj3i7n
	T8XAoObLuid6VqMe4CHkq30vE1krtSaImN4BJ/R+feuefkotqWvX+wDMdRkLRQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 17:14:53 +0100
Message-Id: <DHAANH2HFRIK.26SLTPXGLHOS2@bootlin.com>
To: "Damon Ding" <damon.ding@rock-chips.com>, <hjc@rock-chips.com>,
 <heiko@sntech.de>, <andy.yan@rock-chips.com>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
 <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 8/9] drm/bridge: analogix_dp: Add support for RK3576
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
X-Mailer: aerc 0.20.1
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-9-damon.ding@rock-chips.com>
In-Reply-To: <20260319104031.1986946-9-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091514_159328_DAEE0965 
X-CRM114-Status: UNSURE (   6.51  )
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

On Thu Mar 19, 2026 at 11:40 AM CET, Damon Ding wrote:
> Expand enum analogix_dp_devtype with RK3576_EDP, and add max_link_rate
> and max_lane_count configs for it.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83742F483CB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L93GLqLus5B8kLAj3bNWOHqwo3TpCpr9wsx8jieRi1E=; b=uxZx/7xOKEfs1k/BXcFEMi+X8r
	eCpHHtHallG37COwUcxphucVF7oMs6+Zo+QLMgWbt8y1hzoiFuCmaJLCSR64eQkPi81DareKd+N+V
	xwNTyLNJEi4jLJzVKaOwknlRqTDvLpS0paiej6l65qKtd+ty9mKISiNvJhjQrQoUhAbxSR6sW+6Jp
	6Ks7c5MX5SjyFcCucHEYDrwifi0HwCAOxN8Q8TdyHNy7yR4ZqhJsDBldvLF28LXHHcJjxufKiMOtu
	qeN3+mx/3xAyPcRKsAS/JfM8F/S7VMcgTPd3rDUwHl1C/y/h1mL0ULv8Wznm53Pb9dMERzB8NIpTo
	iB/7Ck4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hvx-0000000H6fY-1K8C;
	Mon, 23 Mar 2026 16:15:17 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4hvt-0000000H6dp-3T4S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:15:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 78FFAC58083;
	Mon, 23 Mar 2026 16:15:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 821D7601A0;
	Mon, 23 Mar 2026 16:15:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC02710450FE5;
	Mon, 23 Mar 2026 17:14:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1774282506; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=L93GLqLus5B8kLAj3bNWOHqwo3TpCpr9wsx8jieRi1E=;
	b=Y9Q5yK4wSxbiIxPpWmJBuauTLMPubXYCTglW000y3lpGh25SszpOYvUrxJuQECba/o2q1l
	TjuoLvy2B7i+go4faD59gCap17AtHWUaqSeq5NMW/ms6zrQ5Tz4kcdXIWZbIB2lMNrDhzj
	35dSPmVEiJTV/JXx2gXhAxV3IitA7Dn1L9CRdCTrkwrJ8Z9K/pOtEJVAKDl74Wpf4CS9nW
	P7VoidWaZhEsqS0s3HmOvrCuxYGgp0bACrvOjA7DyCOoXBkpv153f9Q3RuRa1eUhtR7AiM
	4iUu6RfXa4LN9MLMyH9RmxXQCWhrLZpVaHWh8Iq3HEktUyhE41vVtz58WeRNMQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 17:14:50 +0100
Message-Id: <DHAANFJ6QZKU.5NN7RD47T8TI@bootlin.com>
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
Subject: Re: [PATCH v2 7/9] drm/bridge: analogix_dp: Rename and simplify
 is_rockchip()
X-Mailer: aerc 0.20.1
References: <20260319104031.1986946-1-damon.ding@rock-chips.com>
 <20260319104031.1986946-8-damon.ding@rock-chips.com>
In-Reply-To: <20260319104031.1986946-8-damon.ding@rock-chips.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_091514_009823_FE9EC436 
X-CRM114-Status: UNSURE (   6.50  )
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
> Rename is_rockchip() to analogix_dp_is_rockchip() for naming consistency
> and readability, and simplify the code with switch.
>
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
> Suggested-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The patch content is OK:
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

However this won't apply without [0], correct?

So, worth mentioning in the cover letter that this series depends on the
[0] series.

[0] https://lore.kernel.org/all/20260319071452.1961274-8-damon.ding@rock-ch=
ips.com/

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


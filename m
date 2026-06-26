Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF262C43327
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 16:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q0Ay+Nn4LPYfCIMIxKfuL34eMs2xRlO4A06aFPmJvUY=; b=WNiWWfL6p4ip+Y4tjwxamu4BjV
	0HV0lLH9/1mccKOHmIEDH4dnGV6hwu3+33nmca1HyGglQwa4//k59Ty9Ay0LVTE2W8khSZOrcYQWq
	8VPbUGX7zoMCsKvWTHxtmbrhvN9I/naFdJ2zCZJQCQjmMey2aP6Ktt5gwQT1YYYYT35vkiySgLCp9
	pw/rRqoJbMEQ/f3c71h5PZgPrHum0a+q/xTj/ZY/hFJY2J0ZYtyJ+aaHJrD23jTtGmb6G5hVAcK6T
	fdIZ/8F9GhZTXVfkPq+Z0xGOonsfx68VagUS2Vck95IeadRBuwBjS9twBhUAqmbT2BZvS7Bw1Sy1H
	M8xgoYWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9R7-0000000BdMz-15tZ;
	Fri, 26 Jun 2026 16:29:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd9R3-0000000BdMJ-3f8c;
	Fri, 26 Jun 2026 16:29:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0953F1A0981;
	Fri, 26 Jun 2026 16:29:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C329360232;
	Fri, 26 Jun 2026 16:29:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B26C3104C955F;
	Fri, 26 Jun 2026 18:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782491380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Q0Ay+Nn4LPYfCIMIxKfuL34eMs2xRlO4A06aFPmJvUY=;
	b=rMdekB3octyzR3BlwL50+P4o3/w2gjcnOoiNdFe83N1UEw1jIJXEbmDaBSFBRZYQtMl+Nf
	mhjLkNZvDSHJS6BavFM59GiibovXVO20x1QrvJ+eyw3EUKDc9MiKtvw4oT3eFhjNWH6M+7
	isNZdGKxDn7W+yvM1xFsdWZLIndEvZaycDDFsuDo0DxFQ0PuHp5RVgXBQOXBkxsQTOGTzw
	np55BLuu9BYqC63ExvqsmJrQinu2uEQj4UGh259SbTm3eqs19aOSHOfYuOVSpQCLrvLiTi
	Ls7rxoycSWo5la/Y8tbktKm2dZ2HUiflyl5RVIvOMfloo/Z8oEYt9Qsx76w0Sw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 2/4] drm/dp: Add helper to validate DP lane counts
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
 rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, nicolas.frattaroli@collabora.com, 
 cristian.ciocaltea@collabora.com, sebastian.reichel@collabora.com, 
 dmitry.baryshkov@oss.qualcomm.com, luca.ceresoli@bootlin.com, 
 dianders@chromium.org, m.szyprowski@samsung.com, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260604085220.2862986-3-damon.ding@rock-chips.com>
References: <20260604085220.2862986-1-damon.ding@rock-chips.com>
 <20260604085220.2862986-3-damon.ding@rock-chips.com>
Date: Fri, 26 Jun 2026 18:29:25 +0200
Message-Id: <178249136511.1374898.9104900523077961218.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_092946_055656_F1E2ABC8 
X-CRM114-Status: UNSURE (   4.98  )
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

On Thu, 04 Jun 2026 16:52:18 +0800, Damon Ding <damon.ding@rock-chips.com> wrote:
> Add a generic helper function drm_dp_lane_count_is_valid() to check
> if a DisplayPort lane count is valid. According to the DP specification,
> only 1, 2, or 4 lanes are supported.
> 
> This helper avoids duplicating DP lane count validation logic across
> individual DisplayPort drivers.
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



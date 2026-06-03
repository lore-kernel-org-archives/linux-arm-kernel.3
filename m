Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD13CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 14:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BKbscUIXoKzqAFiwAcHaYT3Mk5rF5DQTvvMLxv7eXHc=; b=ZB6aL3+6x5VfAHwzsl+GNxxzOB
	BOkm9ha2EjzL0ZP8tOjbd6oDSSpedIir1jR5rrrcyr2XyZUe0tPBKYLsh+3TM7RxuCbXf8sdu7V1f
	Oz3EngAPUCvTaY8HoeAQnF+jxD6/jvZgIx1E1LbicqcvG1ebmfXP/0gRAtRKOIT4fYcQ8kGLwfWtD
	DLERTwardOpudExMC3ZYo+diQxRTxiVR0vlhchf3YMLX9oQgb9O7U9AJRAR7M+feWThRw4LSy7XEj
	hNNRvcMftIA98vAAwF1CVJzcoZoyYH/pMnl+EsEF79N8cUh9vz1d3dvFII8AuBSO7dF/E9xi2kKay
	y3J/bZtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmGS-0000000FDnF-0IWt;
	Wed, 03 Jun 2026 14:08:12 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUmGP-0000000FDmD-2pyX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 14:08:11 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 34A534E40111;
	Wed,  3 Jun 2026 14:08:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 078B05FA0A;
	Wed,  3 Jun 2026 14:08:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D51D10888CC6;
	Wed,  3 Jun 2026 16:08:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780495687; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BKbscUIXoKzqAFiwAcHaYT3Mk5rF5DQTvvMLxv7eXHc=;
	b=rbR8KSY+VxymSrlkEeVA/MRN0QI/Gc14P0NCIC51AD9WXucw3m/KT6w4jryNCStcg9dPls
	hKNvXONb1aPuNFv+7XYbrO26hEUhvMtwbWdlLLwEKgF2S5VQ9qk65sDElpOs3lQJQsCAH+
	phBsbQTqxkR9or8Glroyeu6qTNfPh5N9TxPEDcuPjgdvHv0NdG3m+HtB2ixqUARRoP5jxT
	sYmF/GTb/zZkTid0zZtgL4xr0yuuho3D6NlASIfATa0WvMZazwf+T3ZObDjVozorkXmb70
	yI/wIECTAIAn3/ObUym09J43cL4Bbwqcl7YBBhhKhEWZc/dBcKeFr6iKCG/tTA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 71/76] drm/xlnx: zynqmp_dp: Switch to
 atomic_create_state
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Dmitry Baryshkov <lumag@kernel.org>, 
 dri-devel@lists.freedesktop.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260530-drm-no-more-bridge-reset-v1-71-875d828d31bc@kernel.org>
References: <20260530-drm-no-more-bridge-reset-v1-0-875d828d31bc@kernel.org>
 <20260530-drm-no-more-bridge-reset-v1-71-875d828d31bc@kernel.org>
Date: Wed, 03 Jun 2026 16:07:20 +0200
Message-Id: <178049564003.8577.8250291272445185539.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_070809_859730_749DAA4A 
X-CRM114-Status: UNSURE (   6.84  )
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

On Sat, 30 May 2026 16:00:16 +0200, Maxime Ripard <mripard@kernel.org> wrote:
> All drivers have been converted to the atomic_create_state callback
> and its drm_atomic_helper_bridge_create_state() helper.
> 
> Remove the deprecated drm_atomic_helper_bridge_reset().

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



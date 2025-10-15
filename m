Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AB4CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 20:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLA31juQGoiGMUFqFzO9vTxSXS7E8CLrzp7upb7S4y4=; b=jL7rhgzsTNdEEW52gLAjEhMa8k
	pX1AyQw1PyEEcqXSOr9a8nTmDPsPwCS/je1yoW+Tcntdn4UYLFNwL9Q/EmtA7JpI16qGQY8Vh6VrH
	LZstaqzUUHWCM3mjtPDq0aXUPWu/f5wA2sQRFrzf62ohrryYwTwzCKfOkPhrj/N9fN08x0oEKe1eJ
	7mqC8E6yhe/p1p98MzJHGw5Xra9XAM/AL1CJRRHdAekT1Y5xusO3OoUFwED5Sgm86L9JYLhVKV8j7
	1YgaFI5AY+64UPB3BenWEkwry6P2fgBPz0UwWJJPDKNXO3Fz9XZS6+1DFDWBfSq1jxA05WtDWNtSZ
	mPMr7VWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Cy-00000002qoS-0LUZ;
	Wed, 15 Oct 2025 20:34:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Cw-00000002qny-0AjB;
	Wed, 15 Oct 2025 20:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oLA31juQGoiGMUFqFzO9vTxSXS7E8CLrzp7upb7S4y4=; b=RE/bb2wsWC0jFPZ0LnXOCzGckA
	MSSGJQAdCT0bNdMy2vS/bI1cV+TseWvApROuIScugMXMH3KmH3GSuOyHcghxkjxg/GawZtAMfqV77
	fNWaUlKUB9ZpgL2864hrTB7NvzodbvaK5XdHINIs5ouvPnIM2SHsCe/4DEQQCjqTNCPWfUw8YepfM
	0htiYe6MfpCEcfHecLu/8/3R3zszcjTy+sJEKgD9Wzd9Wu2i9OrQHYUZe/V6kHiStVfYeNe+vVgn0
	peXx4wSWY79Ydj4qw8XhW02ljHsWpZnrxTrP6L2A+QrgmEGwT8pWJt7+qgzTywCmLUMjyrKQQVtpa
	RSqKBVgA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v98Ce-00000006Egi-0z28;
	Wed, 15 Oct 2025 20:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=oLA31juQGoiGMUFqFzO9vTxSXS7E8CLrzp7upb7S4y4=; b=rzJavV87hAgCX95iHRI8ObRfv3
	wEp+Pc0pnwzuAcaIiVvZGyZXJuiKY5TIr0dvGQsZ55qp1R0ec/kDZMhUoiCYl3Ddk3YRCukg1tIXk
	zjfH50xfAm98qHeof2rRjjna6bPfZPlEmUQ0D843Lm9jdubu/3lN7Mx1krASzz/75FztfB0DrtIXA
	gdo338yTXvbipLWJZslBzbEN3hTKnmE9h6rs94OoKUvIJKfLBbVosU+CGe8pn7rMreD62EIE5OZIa
	JLBcqXCcw3i53sP+GIEZ57MjjAXVL9VC55b3ZK5+aSFfJVntsR42Ttet1+vztxHTzRiI+DgFlpDh9
	OkHOY6qQ==;
Received: from i53875a40.versanet.de ([83.135.90.64] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1v98C8-0002Qp-Oa; Wed, 15 Oct 2025 22:34:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	kernel@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Algea Cao <algea.cao@rock-chips.com>,
	Derek Foreman <derek.foreman@collabora.com>,
	Daniel Stone <daniels@collabora.com>
Subject: Re: (subset) [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576 SoCs
Date: Wed, 15 Oct 2025 22:33:50 +0200
Message-ID: <176056042470.2037566.16932540958621144492.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_213435_058148_D8BD651B 
X-CRM114-Status: GOOD (  13.61  )
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


On Wed, 03 Sep 2025 21:50:58 +0300, Cristian Ciocaltea wrote:
> The first patch in the series implements the CEC capability of the
> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
> This is based on the downstream code, but rewritten on top of the CEC
> helpers added recently to the DRM HDMI connector framework.
> 
> The second patch is needed for RK3576 in order to fixup the timer base
> setup according to the actual reference clock rate, which differs
> slightly from RK3588.
> 
> [...]

Applied, thanks!

[6/6] arm64: defconfig: Enable DW HDMI QP CEC support
      commit: ae753d769a5f63cddd483ec50067ec61eef5489d

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D9BC624D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZS6D3dNfXN/WHHhWf6mBfOo10yYBtRBlMynvNuuKjhk=; b=GbnfOxtpdedlDG+/OkmG3pDDk5
	3YBkII+pYm4Lm/sGWBwe0eX1PdypY32n7v84xErXIGihVrFgZLwqZt/hSyOIdceyst+bBQ6zbvZVd
	6/ZRQnDxoQ2vGB+7WjcoDQZ7W+WmpYrsTgcHhsDOhw2jGr9QnvQQu8w2QU6T70h2hzJh7heY7FJTn
	Vr70whA4BT5vlYgDIkO+XhjG+3eOV4WK4OEAjxpmKJc877QT5POdYazX8ZCbzTppE7XLaIKVVK4Le
	Qb4iqmvM7WNw5A7d5hYmcxXvqujEOYEauwJy4WYfgdx1Y81orrjaYxCqV41xb9r81aqyYbr0YZgk+
	3R7J3xzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AOP-00000000BHh-1EDH;
	Thu, 03 Sep 2026 16:34:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2AOM-00000000BHB-4AZM;
	Thu, 03 Sep 2026 16:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=ZS6D3dNfXN/WHHhWf6mBfOo10yYBtRBlMynvNuuKjhk=; b=kvPpxYWXgdKBe382DNY/BvGN8x
	DNlFmCjcaldzhRskNDvW3lWW1aU63ogTZtKR7aFVNgvlIRe3QxCRG5LeWrHe2Lp4nqS0vUjA0gNRE
	oTtS5FKFJI+8bO3sMc/Yu/dP+ajod3lNcOUwNlpaSccHg0xpyOA3s4Rmr3mRnqzdaBvmpV6ZZi7Oe
	rdBaku5uZ1KfTLQf8lgKMd+yJpG1j+i2hCMriN4bZfmrTzJ9+iwPynAwBxKlOfQrtYUEkBgGvZUYP
	KQAKJn8u0wVXYO6S7s6xXDpE1nW2CFJwJTjbWRRZ2XsVER4vZiyzRhNIUmrpnHztm8ZW4YW+iJfHW
	eoC2voKg==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Igor Paunovic <royalnet026@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Marius Dinu <m95d+git@psihoexpert.ro>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/rockchip: Add missing DRM_BRIDGE_CONNECTOR selects
Date: Thu,  3 Sep 2026 18:34:00 +0200
Message-ID: <178845323373.2687836.517588125431937296.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260813144019.12089-1-royalnet026@gmail.com>
References: <20260813144019.12089-1-royalnet026@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_093423_029115_A66B5F80 
X-CRM114-Status: GOOD (  12.09  )
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


On Thu, 13 Aug 2026 16:40:17 +0200, Igor Paunovic wrote:
> While testing the dw-dp v11 series I noticed that ROCKCHIP_DW_DP does
> not select DRM_BRIDGE_CONNECTOR although dw_dp-rockchip.c calls
> drm_bridge_connector_init(), and Sebastian suggested handling this
> independently of that series [1].
> 
> The ROCKCHIP_DW_DP gap was in fact found before: Marius Dinu posted
> the same one-liner in March [2] and dropped it when the failure
> stopped reproducing in his build. The failure is
> configuration-dependent - any other enabled option that selects
> DRM_BRIDGE_CONNECTOR masks it - so it can come and go with unrelated
> config changes. It still reproduces on current drm-misc-next.
> 
> [...]

Applied, thanks!

[1/2] drm/rockchip: dw_dp: Select DRM_BRIDGE_CONNECTOR
      commit: c83e3e806d4c115f1dad9ef756db4cd91448a262
[2/2] drm/rockchip: rk3066_hdmi: Add missing Kconfig selects
      commit: d72aa5cf045a69d5fd433cde5dd4e113d9558fd1

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


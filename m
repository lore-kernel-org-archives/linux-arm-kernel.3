Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F80C88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+P/aelEmT5OmZhL5uaEKQ81rGaiX1if48juBRP3e/OU=; b=lo0u5+P6vMDMIq7gQp9GjcfDN/
	GirQe8XDYMmCT7yoUB3hMDPxFJu8K0m/V3JUO3zNqh09fJArNIJf82LzBY9VAZMmMJ1jApSZjf7WP
	74ofTtRX/ZIp7t/74Lml+lRVeX+CxHHP/4PzfC5YYDnBKDZ6TaQThZG2aDo0BZ6X34HQMOGD+BiII
	GN/8T1szY2Z1VBYGKT6lZS1J7nOgBPQvBs1Qkt33arNkpB/x1okX96DTu2f+Ap2Hvw+DkC/BjUbFc
	tRG86i51K2QFTqeNpEJjsB0zVHy3mYb2lhiLWDWgCXVcXarou49BE7ysBfJISL7z0GBEcQnwOvoFi
	hER9scag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WC9-00000007Qye-1cQL;
	Tue, 15 Sep 2026 16:39:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6WC3-00000007Qpl-1Orf;
	Tue, 15 Sep 2026 16:39:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+P/aelEmT5OmZhL5uaEKQ81rGaiX1if48juBRP3e/OU=; b=GWt9urhD8fOcH0OWB5ykrWGte6
	HCEYbJVOO1Vr1vcRhzKhzO2tIXmtp+pU1eoIRvrfmcdvDTdNfNjglGuA/viP+Z+rF2VODdGinew10
	NXkdJ00VIHELw02Mgd9b47APL9Jsd7WZ4kt+3oLro0hR1RnZMcXgympO0i/IekXjY/e8wRGc0x2U0
	sCeniFcZ5sRm6vX+1X3eznzJMwRUhAvyNE7jNvr/8ahQ+GLifp39OrcKmBCvi1aZyVfSkP8BWCOrO
	uTgh5dlF4Y88WEODWgpgGuKBR4DYuQ+2baezZXEGEVv8qfNIVbZ2RLNTnAx2uxPf1/oq7gyEmDjO8
	808/9qkA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6WC0-0000000722G-22gA;
	Tue, 15 Sep 2026 16:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=+P/aelEmT5OmZhL5uaEKQ81rGaiX1if48juBRP3e/OU=; b=FqxOKnW4UAtlz/+j9rCK4PvGx4
	Q1oIU4etLxxljXppJ94pMP5Yr2dFkPBv7DH2Q23GAdMuV4/ZX05Gs4jv+tH/W2PHAw0VABoqTNZTQ
	T/ImrUc3hoC/laWHvX60W7bUD5QJPtq5zroPQWeiNWlHehdl/C4ZTL10ZcV1B8u11aMTG4OUJ0fjP
	1oQWN2A3dy7ZIOV1ffZc3u03gEYr9ajoc5O6BsJOQzL1t/HgGXjCuhG6RO2uBD70mhnwbVPwTct3L
	lhUKXEUD8raQCUfBk1eJ9F3aZg1QRhlPI8r57aorNhRkh7MXc/uU7iGAIsaiqwp/mWWSLxVS+giSN
	nAEmmHfA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: (subset) [PATCH v5 0/3] DSI Controller improvements for Rockchip platforms
Date: Tue, 15 Sep 2026 18:39:17 +0200
Message-ID: <178949035407.582306.14026680120994991425.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260914013331.108-1-kernel@airkyi.com>
References: <20260914013331.108-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_173936_654718_AB404859 
X-CRM114-Status: UNSURE (   9.72  )
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


On Mon, 14 Sep 2026 09:33:28 +0800, Chaoyi Chen wrote:
> This series is dedicated to enhancing the DSI controller and PHY timing
> interaction, refining the lane rate calculation, and addressing the
> associated hardware limitations.
> 
> Changes in v5:
> - Link to v4: https://lore.kernel.org/all/20260812073002.328-1-kernel@airkyi.com/
> - Change the upper bound check for target_mbps from < to <= (sashiko).
> 
> [...]

Applied, thanks!

[1/3] drm/rockchip: dsi: Add maximum per lane bit rate calculation
      commit: 3c58af05953af5ab120e2c9061d7bdedde0d1bfd
[2/3] drm/rockchip: dsi: Add dphy_get_timing support for multiple PHY types
      commit: 5363e01e4ff03a204cab85292b89cf90c2d1b101

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


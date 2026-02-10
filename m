Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4489EA8137
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P4+0/YE0gH8j5UUpwwVDaG3+q+OnC+D3xIwE8dQOwAs=; b=3Zpg3fi6cOA1LXDO42btbVxJdk
	OSqqBvlXaHfs+4+tlnVmcb0616Rl5B5pLeCZyHK/qXMfsWu6xP7EbxeZKJ4FHHp1dUeLjN9ekZ13e
	kDMlJX+WGKQCdRzulLAyvVqXmMz2C3GdSQC59RFpirkz+AaknQIh+FuWW5RYtpdvABMe7VT2zgdj9
	C8MmI3ZtC3kre95DAN1YuOcEYUz8ygNtHXvXngT7HOTC5+29o8Ex+SDssgFMggPtwsnw+AodzpFRg
	eQOFRLdj8FdxBEqmhhtb/jGFvCgvDgKGur+6klShBsH/vuRzQT4UVy0q1Bf8agtQL1SCwcWZZt2a4
	SesdNG7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq1a-0000000H9VM-29xX;
	Tue, 10 Feb 2026 15:51:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq1Y-0000000H9Uc-2Lpw;
	Tue, 10 Feb 2026 15:51:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 515B2442DF;
	Tue, 10 Feb 2026 15:51:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8BDC116C6;
	Tue, 10 Feb 2026 15:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770738695;
	bh=q++is72bj4uWTYoc+vkSxji6zhNdE9WWO1UbEw2tudU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=cnWI6HFr1xnNHjshPC4yDw5r3+LkkXpVxaFR3h2hnFByRL3mXa2IZkAWf26KgNLHG
	 P7Qo5hWsg6/4z9qOyshZWKCSOBKbiGeS9Z6a/2f9Dxu4si/Al+lkTj0Wn/QV/jN7N0
	 ZBAb2QM7//B7b2eK/anIQ/bEhWHa+8YbEnjMKVdzI5yXLDPyn1cBrAeIL8/DlNtWhr
	 tfMPvfCdHpCEpIpG+vveOFecl/QePKAD8y1bvSOV84opabNTBxS0cYwe9z0mUJPL+7
	 XiX7IgAzzf2ceJD+gaS3/eAd/8XwnDw1XsQdk86Bb6bC3KRkQ+ReQuaJT5kdQleZK5
	 /4xNZoC+I20pg==
Message-ID: <5c9aeeb9e9d9c0609028dc3637eb9dc4@kernel.org>
Date: Tue, 10 Feb 2026 15:51:32 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 18/22] drm/tests: hdmi: Add tests for the
 color_format property
In-Reply-To: <20260121-color-format-v7-18-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-18-ef790dae780c@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Joonas
 Lahtinen" <joonas.lahtinen@linux.intel.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo
 Li" <sunpeng.li@amd.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_075136_625841_D3219492 
X-CRM114-Status: UNSURE (   6.36  )
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

On Wed, 21 Jan 2026 15:45:25 +0100, Nicolas Frattaroli wrote:
> Add some KUnit tests to check the color_format property is working as
> expected with the HDMI state helper.
> 
> Existing tests are extended to also test the DRM_COLOR_FORMAT_AUTO case,
> in order to avoid duplicating test cases. For the explicitly selected
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


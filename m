Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1CCD1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 14:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YwBVHWLKXgAWm2GG3lOpudGgI+dw1B2tNXbWWRVtMcA=; b=uxesJVk2ApAS59+A0gmSdXBbxr
	8Ee52N6sl29Fi2kLQF5t5qwAjVZfP+DQrlQ04Qp7iHmadk26CIlMt/oy+hWPgSSFtNv/eMaLvE94p
	t0ECJ5SIJ98NdPN0W4VFlOorfrS7tew8gG/Xzg9zL/sAGVPGMF+v3P+hqm2QSIZ6cgL/JUcFIxetp
	uTz3+T1pf1Eqkg8bjEp0F/uhGO1lVY8ArtEG1FEA45/eW5wO0AcoC3FpzY/rbwGq8nfKKo5R0ijwo
	g0DyYtlTob0hv/WvrfpNLvyN/4Nt9V+vtVl1NFtwwXjcDzxb/vMuhI3D4HdYAauy/KLKZ+rpuB3MM
	X9vp/LyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSySR-0000000ENuW-3Bec;
	Tue, 09 Dec 2025 14:12:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSySO-0000000ENu1-4Bk5;
	Tue, 09 Dec 2025 14:12:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 40F6941B3A;
	Tue,  9 Dec 2025 14:12:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95D16C4CEF5;
	Tue,  9 Dec 2025 14:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765289567;
	bh=dcA6/fqf5XdKH1miBHnaV1JJIsXJldco1on9OC/4Z2w=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=T3Y2kWL04vVmln/LeWD6/qfRdjTL1fZSLrrLRH7GmjO5jCarnvr3vl0AZbRKALbm+
	 /1u+vzZtrqVSP/TGoAQZhFInaTdVYO6v4ghjrpHn/m8G2RHn0wwFEyEy/asgOFDSZm
	 v6XxnqdaYKtNynUQiSuPo6+1GcNugkLFyxa+4bKiLLj654s8q5DwR6XWBa1oGuLn5w
	 h92fxBHcFvu3SfTojN3l9PFDTo8Wld+kRtkn2ASxn0QbfNkXTc7W2jo0OzmPzB5V4p
	 Tdx/tnoWBuiKFgEcT4W3+xMVSx8r/u4C6fHq2RFPya7CycL/96/HeugSyIm8eYTRWQ
	 CS/NKcougDysg==
Message-ID: <6736385e287d063e19c8301550edcd17@kernel.org>
Date: Tue, 09 Dec 2025 14:12:44 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v5 03/17] drm: Add enum conversion from DRM_COLOR_FORMAT
 to HDMI_COLORSPACE
In-Reply-To: <20251128-color-format-v5-3-63e82f1db1e1@collabora.com>
References: <20251128-color-format-v5-3-63e82f1db1e1@collabora.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, kernel@collabora.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, "Alex
 Deucher" <alexander.deucher@amd.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "Andy
 Yan" <andy.yan@rock-chips.com>, =?utf-8?b?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>, "David
 Airlie" <airlied@gmail.com>, "Dmitry Baryshkov" <lumag@kernel.org>, "Harry
 Wentland" <harry.wentland@amd.com>, =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Leo Li" <sunpeng.li@amd.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marius Vlad" <marius.vlad@collabora.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Rob
 Herring" <robh@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Rodrigo
 Siqueira" <siqueira@igalia.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>, "Sandy
 Huang" <hjc@rock-chips.com>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Simona
 Vetter" <simona@ffwll.ch>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tvrtko
 Ursulin" <tursulin@ursulin.net>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_061249_066164_FEB25771 
X-CRM114-Status: UNSURE (   5.45  )
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

On Fri, 28 Nov 2025 22:05:39 +0100, Nicolas Frattaroli wrote:
> From: Marius Vlad <marius.vlad@collabora.com>
> 
> While the two enums have similar values, they're not identical, and
> HDMI's enum is defined as per the HDMI standard.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


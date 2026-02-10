Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6EAEA8139
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uJRB3Jx3pS1CX1VpH1EC87FAmQud46y2n/7tOgVnXco=; b=Rhhkp3tDxh7YGKJ4h36HqP2520
	Tv5uZyGkCIIMjnW3IigDXfUbXw4kAOkgvqSwMkSPa+vjBYwTvGxD6InEJtng5U5T43VI7jGZYtgqx
	krYodQRb23DmoCAhDWArg4+99s65ByrBLJyD8H6D8JgflA/B8k7LBWYESrPCJ8XhOuoPLm4kkirpO
	ImunFomlfnycUPytIbx2Y+tkpnjA84w2s9JyXdfBz2x21xMQHWwvDM5pBYN/m8caTno4pyTK9qIgi
	et+DhLjFNqONjiV9dUshIfazTLJcJyUVvaWvPkkUT2EcyDq8DTjI/TspK9CAA8CeH6uafadyUNRH+
	2IzxsLJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq2F-0000000H9gF-3y7k;
	Tue, 10 Feb 2026 15:52:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpq2E-0000000H9fj-25pz;
	Tue, 10 Feb 2026 15:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83C9760137;
	Tue, 10 Feb 2026 15:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACB61C116C6;
	Tue, 10 Feb 2026 15:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770738737;
	bh=RQCwNCcBeQU5tvcCgLx7gzzyD5u89C/R0Ffzky3epSg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=L59I9SaTtdMvZlOhb5jGb3izQPshIAAA5N0NwrHQ9OHzFRKT2N2aTHa6mubs/+8fT
	 Fd8ClyLKa2PSEiACbqV/S/q35ydzv8P72f6fDEDz7fmEgXd9mNOlAV4RUKfXafs2Pi
	 W3f7efLT91mlI5d8Z2t8uaGyffr+UL9jMyEDKDFRyB2IdVElXspukJmAsg/0p211AK
	 nczKveQhsTZSu7CzRB0lD0yApoKULmjqz0i3Cb+5+0RCtBPgq3lLfFmhAnDXrLoWAV
	 HNBBL+Dh6OWzv8FeSN+ajGyLHIu+c5etcJmxfpXoV80OQf4OewLWzMvnVySHkLp9IR
	 +14wAkevYkQfA==
Message-ID: <6650ab0f95871398568f6f2c3d2f3e56@kernel.org>
Date: Tue, 10 Feb 2026 15:52:14 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 19/22] drm/tests: hdmi: Add tests for HDMI helper's
 mode_valid
In-Reply-To: <20260121-color-format-v7-19-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-19-ef790dae780c@collabora.com>
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

On Wed, 21 Jan 2026 15:45:26 +0100, Nicolas Frattaroli wrote:
> Add some KUnit tests to verify that the HDMI state helper's mode_valid
> implementation does not improperly reject chroma subsampled modes on the
> basis of their clock rate not being satisfiable in RGB.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F06EB26E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Je/5SAjKXUkI73lR7788g2aEvJPINff3OdEpueGEboQ=; b=T/yqLiDjlG11Fu15dyo8BcjmJM
	Zi1XCcFw0OsXSX9uTtqTKXxdl9bjJAdnyCpu6FRrA81Wd7+lcgXW1+1Tr0B63ncJYmy/U1+HhVYZO
	rb0Zxm8vAqYPT056owS/ZDt1ZzvB8ok3Mzp21EoH2B7tgT6D0qTtifkotLh6rQvr8/1reo2x2NsxV
	DFXN1Q8H2Sc4x+aO9vLA2mYLPW84TgtCGbiwp9Gw332sYQY0tXDA8368LBYD1TThRNsrvBNKThhDb
	iU5v9sbOLVzk595wHa81xkPsIrBFIYWar7TOeggPM/yMd1kudKgsq90w/Pe5XwqokufXyQyr7NPOt
	7dZ8n5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqYm-0000000HEKZ-3bFx;
	Tue, 10 Feb 2026 16:25:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqYj-0000000HEJg-3tvf;
	Tue, 10 Feb 2026 16:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 325784397B;
	Tue, 10 Feb 2026 16:25:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CD6EC116C6;
	Tue, 10 Feb 2026 16:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770740753;
	bh=/wir6iRl8M3VhbZ6x9JgtCsgH2vMDZx9252IMDQzJsc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=HFM5+JoqsgG77iBMdOdDaGUaChBd4DkaiTuxtcwCNXsOJlfZxNiH7/xA2FGKMMEkt
	 MdHFy/GjglpYvsoYBTKpLaMiw79YJbgRsBHLZltR7qorARTdCNYI55I3pJgBoPZVbR
	 cF7DnyR0+nlwofqcqiaTYbYadSWXlNUWHkiJCopxrOkTR1N7nwKupyGLAyjdHeZ7d1
	 ZfIatV62Ll4VjNbqYwn1sbWTvXfHCX0r8BTOmLGXC7W07YcquXNNnsqawQjoLPvoaQ
	 ucgrKp3k4VqAHalOM+5w6u+ZVmSG7tOhe1fnmV3HieUjSTDKLRW3pqG1gWDDfAyDO1
	 P2yz7cUfkHs+A==
Message-ID: <f3f44bc5186c0b6f9ddeeae21809cef1@kernel.org>
Date: Tue, 10 Feb 2026 16:25:50 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Nicolas Frattaroli" <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v7 22/22] drm/bridge: Document bridge chain format
 selection
In-Reply-To: <20260121-color-format-v7-22-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-22-ef790dae780c@collabora.com>
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
X-CRM114-CacheID: sfid-20260210_082554_832367_D0B6B197 
X-CRM114-Status: UNSURE (   5.76  )
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

On Wed, 21 Jan 2026 15:45:29 +0100, Nicolas Frattaroli wrote:
> The bridge chain format selection behaviour was, until now,
> undocumented. With the addition of the "color format" DRM property, it's
> not sufficiently complex enough that documentation is warranted,
> especially for driver authors trying to do the right thing.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


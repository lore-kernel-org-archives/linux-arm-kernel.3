Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BB5C02196
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 07:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:References:In-Reply-To:Subject:To:From:Date:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z0TxrbDlDQlSlSD+smpxdoWcW1fkGAoh+/pTrIkjZlE=; b=o2TvipsRY+AzVy
	s6J0Bnia8rBEWVcImJEs7KSAO3sBQOt4Gpk+rIqz44GzP7r2CLRUK46o0Kok9kB3zpKc8NmB5GX0O
	LGznjpbGynJtsSVtG3gO3ag7MHaxYqKWw8hSNU3/JgkkS1eulS0UjsOEIjrxsZGs5WnOFG6Q8hLs+
	8jSjmZKXW5ffAAQgbY7MfnvxokPQhkbT+6TJzBUbT8v7jcKzq33wrxuE2FQg3RRUDkYFp/m/+vhE/
	nCtxXwOxMRyXgVNvTfk6S3dr3jnq2gcKLVqcxPwadRw0bn0zJiU+/TOs7HSOH+mZH8uvF2mF+Jqf1
	gI82ufrlosmIUwbxYZvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgImb-00000008dmF-2IHe;
	Fri, 07 Feb 2025 07:28:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgIk9-00000008dMb-0fZj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 07:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 47BBFA42868;
	Fri,  7 Feb 2025 07:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BCD1C4CED1;
	Fri,  7 Feb 2025 07:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738913139;
	bh=RH1nZRu6/rvTiYwNWNvLjiMC9XfUG3eG9OzimREUwgU=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=MMnApV3NXZZMPZW3IGvqiDxdnVD7McmJuXaD2J2CFRVEEz1U5oOJ/73tGE0Vj18mw
	 zA/YpQwJ20DYSsFFAdCpYuwRoh7owAExbbrSdecSTLrPijpZKy6hv7tRsFmhEQWouw
	 7dhP3TgkVAGEQo5SYnGIG6xLpAOJKPUaWYNGapPzfSypfh0VeAtIT+jjhCcmE18NfJ
	 R3VxW3NSXWK9L7LMptQauHv+P7c3n9d/gKQWa6EMt1u3y9ABEKWoP5jk59cK8badPw
	 TbDrW4kCQmk9GcCGX90m4/yPY5oPEkElu7bKkv281t6Gmk5U1NCfSdiaMtNJ8llbi3
	 pJcVrGGRDj97Q==
Message-ID: <9dd0d7d40b9e178650c9c70a6a496568@kernel.org>
Date: Fri, 07 Feb 2025 07:25:37 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 04/26] drm/bridge: panel: drm_panel_bridge_remove:
 warn when called on non-panel bridge
In-Reply-To: <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
References: <20250206-hotplug-drm-bridge-v6-4-9d6f2c9c3058@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_232541_268023_2F44AB76 
X-CRM114-Status: UNSURE (   6.24  )
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
Cc: Alexandre
 Belloni <alexandre.belloni@bootlin.com>, =?utf-8?b?SGVydsOpIENvZGluYQ==?= <herve.codina@bootlin.com>, Thomas
 Petazzoni <thomas.petazzoni@bootlin.com>, Sam
 Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul
 Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu
 Beznea <claudiu.beznea@tuxon.dev>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Fabio
 Estevam <festevam@gmail.com>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, David
 Airlie <airlied@gmail.com>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will
 Deacon <will@kernel.org>, Jonas
 Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki
 Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil
 Armstrong <neil.armstrong@linaro.org>, Boris
 Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shawn
 Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 6 Feb 2025 19:14:19 +0100, Luca Ceresoli wrote:
> This function is for panel_bridge instances only. The silent return when
> invoked on other bridges might hide actual errors, so avoid them to go
> unnoticed.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


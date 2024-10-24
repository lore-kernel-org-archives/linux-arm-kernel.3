Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 202FBCE8E8A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:09:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O8pXZgTZmcx0V1827hQ7L8Zq0XogP5F9RyOGnMf2py4=; b=fdSpkco3R/nrlcDnME7qvb1VzB
	UpoYzyThrB3wRrzeenSJ3MkvooGsiSFSwKQTWqCS3ZPk6XMZPqQMzMt/6LyUYiawnJqYw7uwvohmU
	tnqe2cM4zFLWcFLyC2pfrRClbsI874/xmqQqbovsGDappbqz8NuflKqTadeg9mXwnhV+6NKlmwSiE
	TLX36rX+hootuWpT/ac5/A2AmYMhq03FeuiaXwawfc1HCm5YJPTxGbJc0DXq7gmOAmfLptgOf/zWa
	ueolVUNuyynblc0rvUpI4z17f9Ht4VT/PM3L7EE8ybN/YM5zY97rgkKPwtuOCo28VotTlOD71CPf1
	VCtYrWiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zSD-00000000rqO-45Xz;
	Thu, 24 Oct 2024 15:08:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zPX-00000000rLE-1X9l;
	Thu, 24 Oct 2024 15:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1A0FA45430;
	Thu, 24 Oct 2024 15:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4830FC4CEC7;
	Thu, 24 Oct 2024 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782361;
	bh=Ih493C7FW7huTj70GvMdQCxCv0/8gBvIIgko/BVBESQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=G2B8GiT06sGhvAw8upxtM0+4xoxyH2VU5Fs2aV8Al5mf91nP+UD9BCyr8wxtcM8wq
	 VCmJN7wdKuj8FdYcDhTFEDpfx1uK0I+897Y5r1LBrarAwoUlKOQB3lAFScFx7ZstWn
	 xU2HUvAs/GrFlF1cSAweX7XZ59QcWpNVQfXYA4oXTgzef1RaSzz6mDI/hD52/ki9wj
	 Xdi7WTeDIG39ORLQJRsHowGLTWUbFsECRnBcbU91mbvXGGVWvbHiRTKwaDpeYqYr6y
	 wAgdjvcRVdhrByzczYohXrfkDIrIv/Yp6HRW+4LMMc3xc1gc8PJCyMYY9kS1Dfnox8
	 qH0T0lJDW9jTw==
Message-ID: <35fc492aa7d6298eba531d08e9fccfa4@kernel.org>
Date: Thu, 24 Oct 2024 15:05:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 23/37] drm/vc4: drv: Add support for 2712 D-step
In-Reply-To: <20241023-drm-vc4-2712-support-v1-23-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-23-1cc2d5594907@raspberrypi.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, "Broadcom
 internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>, "Catalin
 Marinas" <catalin.marinas@arm.com>, "Conor Dooley" <conor+dt@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Florian Fainelli" <florian.fainelli@broadcom.com>, "Javier
 Martinez Canillas" <javierm@redhat.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 =?utf-8?b?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, "Michael Turquette" <mturquette@baylibre.com>, "Raspberry
 Pi Kernel Maintenance" <kernel-list@raspberrypi.com>, "Ray Jui" <rjui@broadcom.com>, "Rob
 Herring" <robh@kernel.org>, "Scott Branden" <sbranden@broadcom.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stephen Boyd" <sboyd@kernel.org>, "Thomas
 Zimmermann" <tzimmermann@suse.de>, "Will Deacon" <will@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_080603_501025_358852AB 
X-CRM114-Status: UNSURE (   5.10  )
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

On Wed, 23 Oct 2024 17:50:20 +0100, Dave Stevenson wrote:
> Add in the compatible string and VC4_GEN_ enum for the D-step
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


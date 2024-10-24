Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 578C2CE8E90
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYpydxo3gJedi9tlLdJTrACOHNcgjIhUI0gDt5ZX5fA=; b=rNLrL5ZW+7UdxHjFIQgZ8OrmSp
	6mIOAfScPQ9m2y6wm4B7BwmHkXqMzQ0repsYsdiR0pPme/TRbHlOjEH7OTa8VJ0GUO4py05RTc4sK
	U+WrK5IGIX0oO+/rYHmfL7q9JmTKRkCTrM9aUrKwHUYwOtg7xGWH0cujSQUHN4yUyDF+lV4V590lj
	ZQEX7VIdV/ex/X9eKwSAVmlJn3l8D1LjronHjjRQ/y39Hu7PeeMXux7kCNN51VNHvKiMWPpjwHo3k
	4xkbkmm3HdIeNmNwXHHH2m/Wboh6WK391ELxnR6GGCyg9VipremCfIfB3QbhTDultZ2pvacEuKVn5
	Vuy6N1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40VK-000000013ZB-2sjj;
	Thu, 24 Oct 2024 16:16:06 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3zRJ-00000000rd2-1j8S;
	Thu, 24 Oct 2024 15:08:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 27776A455C5;
	Thu, 24 Oct 2024 15:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E471C4CEC7;
	Thu, 24 Oct 2024 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729782471;
	bh=gsSRaxF5qMUcw8w2aFZFzRk8Uw2PuZFPXxc0eD5vXhw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=HyklSNg+3Iov4TU9gqtKiQUm2hzQu0aZHkrNMPUa6dIsZbb4gGoBaapCT1JtLqTbb
	 CzvBJyu86RqlIErqmui2/Tieibxb12WjJkPOKUeAjKQ5/Bandf78Es5DC/QbL7vaJR
	 W/6CTpsmJD1A39S/EeI62TsB3jj+kMyiPkmWDiWwQ3mUswQc+JuRVzvKu3gBQh3QWF
	 wSWrRJMd/DXp5TIVdyGIqCJYSHRz66TYuazHO9YQaFytFGkAaMECjMYa7ykMH1gxbo
	 kBNeIiFnHilQSeU9bJSuledTFYxrC5piIIjt7t7uF4gQE+iLPGFVkx0ECw1MPavgp0
	 sW3E7vG58mAew==
Message-ID: <a308178ba289f0df76fbf031b3cb103b@kernel.org>
Date: Thu, 24 Oct 2024 15:07:49 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH 24/37] drm/vc4: hvs: Add in support for 2712 D-step.
In-Reply-To: <20241023-drm-vc4-2712-support-v1-24-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-24-1cc2d5594907@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20241024_080753_557607_4FC4444B 
X-CRM114-Status: UNSURE (   5.33  )
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

On Wed, 23 Oct 2024 17:50:21 +0100, Dave Stevenson wrote:
> THe registers have been moved around, and a couple of minor changes
> made, so adapt for this.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


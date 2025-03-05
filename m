Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E13C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8aO4nUAYYsK7CbYcngMFkNu2vCLer0vDQ0Tj5RInDJY=; b=PhqX91+XUpYUhByC3UH4WymEGr
	P4Dgd98U2IRLh4sE15CQQpBBMzj2cXcnpe9uq+rNhXABWQ2W52CWC4MO46i91NlF9Car9+eqgn++A
	YKfNvre9npjlE3Nu/Yv82z1LzSZTHDAJ5m5pJfx0iCO+CGB6Xs6dmpZoU8mK+CQEzb7K1jy665Fnp
	Ovka29Kk5WJS61swH7RQQjNZl17RRmJGsMeFK2B1ZjaW9SLeUYXQsw27lqXCKDrDCVYtpkweduqXR
	YQqwnapSjYVlXqwhULtYoT7dvaNsVAYNXocD/mxnAEZF8qDQLvw/oJFlRT8zje2CoMKAHsOw4pLBZ
	Q58Lto+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tppN9-00000008Hi8-001v;
	Wed, 05 Mar 2025 14:05:19 +0000
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppJK-00000008Gwy-2Aul
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:01:23 +0000
Date: Wed, 5 Mar 2025 09:01:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1741183279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8aO4nUAYYsK7CbYcngMFkNu2vCLer0vDQ0Tj5RInDJY=;
	b=Q5wNHCqCR4Ez8bHn5tp61cOjO45ii7ooQ70GuXfN2lAV0c48bwr1Qsc3x9jEOkiOnChGU0
	amhTJW4fa6MOAjgg5bSWoybFgzRC/ihNpp2y8XcrGvRdNlXUWNTRwX0V7hg6lr2N+TXcq9
	WXVlEHQs6qrYMubYwrelO7ZFwcfuaq/e6mqQQTw73asaOad09YXmOsMimMjvWeft3BmQPo
	ezUG/ZiE34dWpyUU7uep7BaxZAk9yMpjzisK+LbXXunqEPe8vkjP1VPoYsf/6N34qJ27st
	Fpl3VymGb7t8lSsmvOqzOyivlEeF7i2KqxL/waOmVH/l3icaTDy818PmiY6BsQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev,
	Janne Grunau <j@jannau.net>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alyssa Ross <hi@alyssa.is>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Neal Gompa <neal@gompa.dev>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Nick Chan <towinchenmi@gmail.com>
Subject: Re: [PATCH v8 0/5] Driver for pre-DCP apple display controller.
Message-ID: <Z8hZKW_F-HtzYm-w@blossom>
References: <20250224-adpdrm-v8-0-cccf96710f0f@gmail.com>
 <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <174118223158.156873.6982508045942987984.b4-ty@rosenzweig.io>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_060122_764641_503C2E52 
X-CRM114-Status: GOOD (  15.05  )
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

Er... I only applied 1, 2, and 5. Patch 3 was already merged, and patch
4 is going in via arm soc. I am, new to b4, sorry!

Le Wed, Mar 05, 2025 at 08:43:51AM -0500, Alyssa Rosenzweig a écrit :
> 
> On Mon, 24 Feb 2025 12:02:15 +0100, Sasha Finkelstein wrote:
> > This patch series adds support for a secondary display controller
> > present on Apple M1/M2 chips and used to drive the display of the
> > "touchbar" touch panel present on those.
> > 
> > 
> 
> Applied, thanks!
> 
> [1/5] dt-bindings: display: Add Apple pre-DCP display controller
>       commit: 7a108b930a84e71be71c3370eef6dd96fbb8f618
> [2/5] drm: adp: Add Apple Display Pipe driver
>       commit: 332122eba628d537a1b7b96b976079753fd03039
> [3/5] drm: panel: Add a panel driver for the Summit display
>       (no commit info)
> [4/5] arm64: dts: apple: Add touchbar screen nodes
>       (no commit info)
> [5/5] MAINTAINERS: Add entries for touchbar display driver
>       commit: 4d2a877cc0efefa815648f1ed5f5b2b796f55bab
> 
> Best regards,
> -- 
> Alyssa Rosenzweig <alyssa@rosenzweig.io>
> 
> 


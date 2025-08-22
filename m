Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45AACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfeArQLHOZCG9DEaegjgSOUlxvrfV9hgTLOAqLgF04Q=; b=hzgD5BE3mxN7OT6o0TWamJjQcO
	Dt6ZfP6dmMOzgRFMr/h1EFGUnB0PbiWBxqDd3bZ1Ef2MDJ0j7XZubSzxK6VKNvunVCe7WjCLYMNPx
	vm9N+s6+CDMZaGDYkw8gXZHtMuCIMGgGW+T9j6oleplzV5gFLfYO5m+3bt7e4NDrDIaZYodDVvuUc
	CKf/Ds94ZPIagI7UOTjqQECEz7KPeH3NYNDS6DM788HbN8e7KKFR8uFBjvqn7AU79Lw/PUzAJbcAF
	S5XhDBGc2bWSpRYJkbhS0z2NRTmhYKWgBneFH9TAOd3lzXbGeM3RbY49j681pGW9qQ/SY1RbS64/i
	JnkbXM6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuT-00000004Apf-1pr1;
	Sat, 23 Aug 2025 06:39:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUaA-00000003AQA-3Vz4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 16:25:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8447344263;
	Fri, 22 Aug 2025 16:25:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 498F6C4CEED;
	Fri, 22 Aug 2025 16:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755879938;
	bh=Nex48aIDk1j8bD/co9kBtGCIGQ1+WTl9k9p2q0c2jXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oEDfaPC5yXFWTh03301m707/qLr5PrBs3mpPy0RS4TM4y4CFH+V4fYu4e+7Z1TvNx
	 WCS8+P8GrxHh4WR8Ftm3DYSMOR5li62ObmFyVMU0aVFW6mFkq5CkmkqgmvC3pHKu9D
	 E/bK0yWf/MQNBGgfR/nU8LZw4DOzkXd/955YD8JcZCGDPr9EVdhKKgnO3t9ntziIxZ
	 2828Uh9FCa5JK6GdMHVJHAHSptW/qSEp7ZkNq0+CHhi/i1VEn0jyTyRFKaNWpxAMtq
	 navhaS5gSBpkDTokJDoUfkvPblq7IChIjEgRDsUTP3OLSgimvmNKhPUgLO/he7DKKb
	 bIpp63ueq6/iw==
Date: Fri, 22 Aug 2025 11:25:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sam Ravnborg <sam@ravnborg.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, imx@lists.linux.dev,
	Maxime Ripard <mripard@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/5] dt-bindings: display: simple: Add JuTouch JT101TM023
 panel
Message-ID: <175587993686.3971718.4392476548821514847.robh@kernel.org>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
 <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-2-b492ef807d12@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-2-b492ef807d12@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_092538_893453_37E0E3D5 
X-CRM114-Status: UNSURE (   8.77  )
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


On Thu, 21 Aug 2025 09:55:29 +0200, Steffen Trumtrar wrote:
> Add the JuTouch Technology Co. 10" JT101TM023 LVDS panel.
> 
> Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77103E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 08:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rf0yM8ACoNrR1lf2m+wAf9fd0pjkjlV1uOpYVDSHz8I=; b=OwQb99fT+XOhGai23A2nPSFhsk
	aExSZHmmEYxv5Qhbtw3Tel97K2w/93sBHi+Z4xIZW6PwO/lQzWuUFCotV+AZkqBi6Dt1NXYDIEp84
	ybUpXR4fetg7pXDkxsaSn4GenKn/KZZmODqVLUj5Md3bzLIOI0gNKgWeUaOWZ7B23cNRA8FJGvmdA
	/MY4J4qlK2nwF2HpuTT21wuniNzSGsiyIqi44JIesBXkxeJNfozE2QHMWuVs8hIRVMXYNzKSKd/X6
	f+ShElyHZHKu12NtrYFmPMfCriOUZsYMvMXI6YhODwdfAIPePgoXuPi/5r6uovQVayyBzDm7rO38/
	T4YMUdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLeAk-0000000HEHW-2dFs;
	Thu, 12 Dec 2024 08:03:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLe9g-0000000HE20-36uU;
	Thu, 12 Dec 2024 08:02:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3413C5C6782;
	Thu, 12 Dec 2024 08:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC461C4CECE;
	Thu, 12 Dec 2024 08:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733990559;
	bh=QjGG+uPw1phO2lbXkJHqiIAA/RKCYzFXaFQKMiuYHrg=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=rs3Yu//wQuOG540diDP7gIFMrT1Po6r7u7y4CvaDpyeT8XQ5DOf8/amogqp9klusN
	 xgF+158ew4eiPaPAZNXTjXj+5CA9cYR6NWDCZyi48wZNDSe79iZ5Rm0ipF3fgRiuSj
	 wk9JwG/toXsn6SWS5X0EsyL38XfbPBruEiKXPl1HBJpG1AKmpNZZBQ6dKyZ1enquWN
	 C4TU6QvyIEGYtZM/svHeXj2qpcyo9+BeEBElZUU4UWoYLguHGnmdGjXlpCRJlXqe6A
	 uK0f/jQ68Jl8OzNlPO4i/AOSrjF93ujZ19shfL5X01jFmP+JAPvgK6Hmux4sEkgDSH
	 AlSjMPUkOM07w==
Message-ID: <e3b1230308d20b4e7525952d01eb44fd@kernel.org>
Date: Thu, 12 Dec 2024 08:02:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Liu Ying" <victor.liu@nxp.com>
Subject: Re: [PATCH v6 09/19] drm/imx: Add i.MX8qxp Display Controller
 display engine
In-Reply-To: <20241209033923.3009629-10-victor.liu@nxp.com>
References: <20241209033923.3009629-10-victor.liu@nxp.com>
Cc: agx@sigxcpu.org, airlied@gmail.com, aisheng.dong@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org, dmitry.baryshkov@linaro.org, dri-devel@lists.freedesktop.org, festevam@gmail.com, francesco@dolcini.it, frank.li@nxp.com, imx@lists.linux.dev, kernel@pengutronix.de, kishon@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch, tglx@linutronix.de, tzimmermann@suse.de, u.kleine-koenig@baylibre.com, vkoul@kernel.org, "Maxime
 Ripard" <mripard@kernel.org>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_000240_827619_6F57B1DD 
X-CRM114-Status: UNSURE (   6.69  )
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

On Mon, 9 Dec 2024 11:39:13 +0800, Liu Ying wrote:
> i.MX8qxp Display Controller display engine consists of all processing
> units that operate in a display clock domain.  Add minimal feature
> support with FrameGen and TCon so that the engine can output display
> timings.  The FrameGen driver, TCon driver and display engine driver
> are components to be aggregated by a master registered in the upcoming
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


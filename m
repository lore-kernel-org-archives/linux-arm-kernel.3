Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7538DC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Su8HglqQIQ1l7oqWCHPFPEcOzi9Y4F9wQFJ8EF4XNO8=; b=Yn2WkF1lZOO1wbbi4K60fCJirY
	Mdokeh0p5wDxH0VLGgKaN3h2yOKJUfTEh31/YI9V628pKg+Vs4KIAvQUOu8NlQfvk3poXQ9Pgi672
	d/Hy1knRMgHqFzKMLaoMRB+khsf8UBcwsDGyz4Qtclwolw8n2T/95KcFUJ+nw7AAkOO03vCQTK4Uq
	TEJkhBwl/V3grb/HH7yXF65JnOFc0ybURVlLLo3QfyYEXlLNTB2+lJVf9nTWvWSRHwsb4rHFHwiDw
	IN8Gsy5i2wZdeoNL3W3rqZHD9n5JXR12wi+cUnBnXgTZq8y5NIwzD5GNkc4AJxplH/h5/D7LJr5HK
	8ALMrxkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFFDc-0000000FnSk-06HZ;
	Wed, 14 May 2025 16:44:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDi5-0000000FWSh-3qGI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:07:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E063CA4DDE7;
	Wed, 14 May 2025 15:07:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D76F3C4CEE3;
	Wed, 14 May 2025 15:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235272;
	bh=Je7z9K7ymRrYfxtdg0xKNmBIQNr0pJcc9qkLjyd7sDI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=KAVtp2mj5jVTvUPkfQvXVYs5GBS/tfo0+4jmu/du+cJOJe816t7PMik1ZpRyi68aX
	 o2aZMaDoLKyhncXAMp8odvjJpLxnlc7yVwYcZm20rtV/QCKI7zfhlM2ts5xzsy0ccq
	 dYUi4qYrvP1WSsgqUZ4cWYiKQZZ4L0T9+jVtMUTy3XYYhWo/U2nTN6qBi5VnJWCq3j
	 Vq0RX9/KG/qagXke2tspF1B42xo0ONN0DqFXBn6N0YXFc2FQCoTCdU/U4Yhej1HOEo
	 qST+5BBXFrMOBCymjT6Xftdn959wvPiEqbXZDn6B3AmslVQkL/ENE5hjtXLIn0QD/K
	 Sj9GWsgrKK7rA==
Message-ID: <4d4c8f0ec82bba6bea02dd2ec5f2dc39@kernel.org>
Date: Wed, 14 May 2025 15:07:48 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 11/11] drm: sun4i: de33: mixer: add mixer
 configuration for the H616
In-Reply-To: <20250511104042.24249-12-ryan@testtoast.com>
References: <20250511104042.24249-12-ryan@testtoast.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-sunxi@lists.linux.dev, "Andre
 Przywara" <andre.przywara@arm.com>, "Chen-Yu Tsai" <wens@csie.org>, "Chris
 Morgan" <macroalpha82@gmail.com>, "Conor Dooley" <conor+dt@kernel.org>, "Daniel
 Vetter" <daniel@ffwll.ch>, "David Airlie" <airlied@gmail.com>, "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>, "Hironori KIKUCHI" <kikuchan98@gmail.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, "Philippe Simons" <simons.philippe@gmail.com>, "Rob
 Herring" <robh@kernel.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_080754_018304_745D65A3 
X-CRM114-Status: UNSURE (   6.14  )
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

On Sun, 11 May 2025 22:31:20 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The H616 (and related SoC packages sharing the same die) carry the new
> DE33 display engine.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


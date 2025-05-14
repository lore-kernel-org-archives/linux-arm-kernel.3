Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16211C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 15:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:Cc
	:References:In-Reply-To:Subject:To:From:Date:Message-ID:Reply-To:MIME-Version
	:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CXXzGKy2yUkseFEyd2t0IqMThuOypspAetwDiSu9SdU=; b=1jvpUpNlfUc5+f2VPY9qlrhHkT
	WxDcR4bM/ik9Yukh5IHSHDWwnQBWzxZYWbqaf3w+B1XyGzdvkBcXbjdxstijohePWcUMQsPqVmaww
	PCLrZArmoBN5JrIFVdMKx4JPNuSkn+EMmpsN3dgjPs5E5oFtdpkmlGpAXrS+7Rrqy1WrRrojsSWI9
	5yvxng9zjNn2mE5wfgHSbzg9Oz7XnL1znK5wkxyB5PphvEeh4DsTpzPifjSczek7n9EyNYjZ3ZgST
	mJRsQLPZ6BUnu1nEjJ7JZ30HHaPPxJ9CmvNoG+qbGrI2y7rH0zxHiTBP6Zq80a3OwXnfRicFV6uDp
	PoKbyRVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFE9Q-0000000FcA9-0XJ0;
	Wed, 14 May 2025 15:36:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDiC-0000000FWTS-47qr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 15:08:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7660F4A609;
	Wed, 14 May 2025 15:08:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8C29C4CEE9;
	Wed, 14 May 2025 15:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235280;
	bh=jMsr9BmmdCkE0Abau89NyQKZWBTl9u7x3Di10p0ErLQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=IrXsS288P1rcLWS/VkVu7VWFpLKe+W0B7IBNPDv/SlK5ZOyMzwjwRE+WH/LgbnGJX
	 bQiEP8Zjc5dlI4OtebcC84iMHhVqXtBobKBa+M4jnKDyJdb2/SseMITsI2dTDfGiOU
	 GFZAJtp5k367KcBV9uvsXw4IaQJhSGDrX0DUMZtWa+yMGvT+mFVUkZ4TQ3ebaWHZb0
	 EwYILOpGhGitFujf2Pm9d2IR3kwGWO7nmGOGK7l+7iIKvnsCGRxn5KMpT4QXyovHuu
	 oUYLTIoAqdNHEmV2yT4HL+sB65H776f8ZWtR1Sq2ML3qP4/AOZZEzOcwsuU7FNvY4J
	 xsd+re7szMYgQ==
Message-ID: <e6065744c7d70b5b93bd8f9ffe720771@kernel.org>
Date: Wed, 14 May 2025 15:07:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Ryan Walklin" <ryan@testtoast.com>
Subject: Re: [PATCH v10 09/11] drm: sun4i: de33: vi_scaler: add Display
 Engine 3.3 (DE33) support
In-Reply-To: <20250511104042.24249-10-ryan@testtoast.com>
References: <20250511104042.24249-10-ryan@testtoast.com>
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
X-CRM114-CacheID: sfid-20250514_080801_055907_2B99361D 
X-CRM114-Status: UNSURE (   7.21  )
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

On Sun, 11 May 2025 22:31:18 +1200, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> The vi_scaler appears to be used in preference to the ui_scaler module
> for hardware video scaling in the DE33.
> 
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime


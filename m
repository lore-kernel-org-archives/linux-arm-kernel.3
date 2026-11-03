Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E585F606BA47
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=psi9Nz1s;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cwGIH3ua
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=o+P6q3DZzJVDgAtxOxsBNiFQ77g8/YvF2QELBdxcJZk=; b=psi9Nz1sJkzmhFqkwJkGv57Zpx
	TgVvNLm1rrjq4FfHSqxb6Xb+FM/E2j56chLfLwZUJ6VSRnt9I62DlyvSf6cenfSPbRZEvTbH3C0ii
	CdLqbu+YjFZeEJiV5B0OqfQyy1mxr7UpsauJwjwjwUSbfTyR7t7CEGvOW+7LWrMSyf6gtnOgUdjgh
	EKHXWJ5J1W7VcbxhPKh4dcZngDUlIoMqNZQQugMAHK6WCGENKCOoBkAzZZAXsqf8o0/7T4HFE/H/P
	jnBK4cO6dKq8DyDL6/cwc5hp2iqaHkd6w81XzAAQ/KUvizatbt2HnvViBkzoZ9LPIjjYPhpK9El0b
	uJ/zaBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCU1-000000029vo-2Lmm;
	Tue, 03 Nov 2026 11:15:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOCTz-000000029vI-3Doq;
	Tue, 03 Nov 2026 11:15:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id F124D609EE;
	Tue,  3 Nov 2026 11:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B77F1F00919;
	Tue,  3 Nov 2026 11:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793704514;
	bh=o+P6q3DZzJVDgAtxOxsBNiFQ77g8/YvF2QELBdxcJZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cwGIH3ua3/gX2aX0cyytE+vXc3lCWe1q3aM52HqhDeaorXpPMV2UxKffYso22rqyv
	 bJbe/Ldz3OmMWfkZw7F/sT4HzeWtRN8gEYLKH5MBD6dXE4eykygI+sKo3b0EZ1+qHv
	 QWqLbCmtvbKtV1+qv9cogfmhM5Eo/OCLZagDrtGmpZlkOJ+yBZ/GK4tYcHxKUVVUWe
	 L03yV20n4ka8ZfOhGk8JZRnYR6+5bnQ0OoQ7iSC7KrSntOXjQnUfrZlGiuWXiT8PEj
	 Fu28TbQ6Qrs1kImtHaR3dnISWsdUl+wdKcMMxoAecU/o3DH+FUvLi3PQ3T1DThlMih
	 /LPgp3EUYcnRQ==
Date: Tue, 3 Nov 2026 12:15:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Damon Ding <damon.ding@rock-chips.com>
Cc: Sandy Huang <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Dave Jones <s.dave.jones@gmail.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v4 1/6] dt-bindings: display: rockchip: analogix-dp: Add
 support for RK3568
Message-ID: <20261103-therapeutic-ostrich-of-romance-b29fc9@quoll>
References: <20261030064905.2248999-1-damon.ding@rock-chips.com>
 <20261030064905.2248999-2-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030064905.2248999-2-damon.ding@rock-chips.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Oct 30, 2026 at 02:49:00PM +0800, Damon Ding wrote:
> Document the "rockchip,rk3568-edp" compatible.  Like RK3576/RK3588,
> the RK3568 eDP controller has the dp/pclk/hclk clocks and dp/apb
> resets, but unlike them it does not use GRF registers, so make the
> "rockchip,grf" property conditional on the SoC.
> 
> Also document the avdd-0v9 and avdd-1v8 supplies, which are needed by
> the RK3568 eDP controller.
> 
> Signed-off-by: Damon Ding <damon.ding@rock-chips.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



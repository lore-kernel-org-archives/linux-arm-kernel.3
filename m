Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1552C606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OVJ5ooZY;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k8qL2zK4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=OWtIv2rMCHEkb9YrYRFfqNdiQBQqnQmJx5Z8aHn54NI=; b=OVJ5ooZYEE6rFn
	OMqCFh6ud7hIlgI9vgPNhX96MxpaOl+DX3ZwoVb3adwrqqVsx5jcql9h42SJs5COGD6OhSnvCC0su
	9wVbSfGyIUuXvtLoZmSRJGmvJc7kCQc5Yq5k6m/iy3+Yg5SzW8HOfEZa5tlPTqMFIloG3SL5XAfyl
	f5tEZplAgvTjpmJfQc1v/e5dO3GR2u9xH/QXToqro3qyz7C3P1bLCtT3w7+lKA8Hb3MzWmCFrLqlB
	ZgSkkzoC1x11OOVm8OfLB9WvtKIi9KS3xssrfcBPf9C3birnF2iQZabGxc1B81TxutaoXyUEl7Coo
	pRuHxlqI6w0hSJqz8lqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2pL-00000006xgI-0h6Q;
	Wed, 28 Oct 2026 12:32:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM2pK-00000006xg5-01u2;
	Wed, 28 Oct 2026 12:32:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 913BA407B1;
	Wed, 28 Oct 2026 12:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E0FC1F01825;
	Wed, 28 Oct 2026 12:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793190741;
	bh=OWtIv2rMCHEkb9YrYRFfqNdiQBQqnQmJx5Z8aHn54NI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=k8qL2zK4H5UbQnirnjxELeoSUjas6GR43drulrTkmAGDnfWFhe8K2tGH5Joer3tN6
	 t4AWTID5K5qj/nIfH48dZB9GWoKP/cpIzNPOtWziR8b2ITwBOn5faCNm9Qaw5oKoar
	 E2fjSz9TJbs0cSDiowmcXhSw1z5tJ4O2OykGM/zj607jtqxjT/qEiIqI76QGg0dT45
	 8/eHEySokNnXMvAO0kBJpfNpUCnBD5l/kyPGd6OVYdfXzSxdt4JyxQabky8Lmyh+rz
	 xauy+WCUXjG6A9/VHNfJj3kNboXzB51NMehS/S9z6aaHk5Rv+INpzkqUN0yXMmmPKT
	 1AOleMil+AjZw==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v13 2/2] phy: rockchip: naneng-combphy: add SGMII MAC
 selection for RK3568
From: Manivannan Sadhasivam <mani@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261006162807.2843858-3-coiaprant@gmail.com>
References: <20261006162807.2843858-1-coiaprant@gmail.com>
 <20261006162807.2843858-3-coiaprant@gmail.com>
Date: Wed, 28 Oct 2026 18:02:13 +0530
Message-Id: <179319073317.10280.5733564257033545150.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202; i=mani@kernel.org;
 h=from:subject:message-id; bh=vxS67DTf/JwGyhIBlIUbrOL/+WeuLhEf9HYah2XysGo=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq4etQyYPtZ8kpKV2DjVhh+jYGLvZ4KQ4Kwo7w3
 Awg/cJKHuyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCauHrUAAKCRBVnxHm/pHO
 9X9yB/9ZQLWzKP2JQ9tfLeMVLBcQ1sqRk2Sjhqw8Mq5KMyXWMnPh3H0AeVgGC9IEyI8d2SIBINv
 N2HUwFU7ps6i6Jnuwd4FDLqgndqErXuLXg/eTig3s4C5ttTUqw6dSzIxOLE8T4Gpa2LiMCQcrh6
 LFedPPf7zIKH2x7dvsayY4lZQNcYdcMm9YdAQXe3jPGgWyLmq7yE/9+QJEsAN97YsOqTbYj54T1
 buTE3xSKOywg2PiDiDi7GPiJzvX2MnHIhuGzrQYZJEYGuNPMSJ80gDaNi6IQG7jNGecZKQ8HDeC
 ZSJ1sboCaVBlc+XPaFvxgOz/RsPvw+wW3FZ29LMMR010RSh6
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-10-07 00:28 +0800, Coia Prant wrote:
> On RK3568, the SGMII interface can be routed to either GMAC0 or
> GMAC1 via the GRF register pipe_sgmii_mac_sel.
> 
> Add support for this selection by introducing the
> "rockchip,sgmii-mac-sel" DT property.
> 
> From the RK3568 TRM (Part1, Page 229), the PIPE_GRF_XPCS_CON0
> bit 1 (pipe_sgmii_mac_sel) is defined as:
> 
>     0: SGMII routed to GMAC0
>     1: SGMII routed to GMAC1
> 
> The hardware reset value is 1 (GMAC1). If the property is set to 0,
> the driver routes SGMII to GMAC0; if set to 1, it routes to GMAC1.
> If the property is absent, the driver leaves the routing unchanged,
> so the effective value is whatever the bootloader or hardware reset
> left.
> 
> The driver validates the value and rejects anything other than 0 or 1.
> 
> This is necessary for boards such as the Ariaboard Photonicat, which
> uses the SGMII interface connected to GMAC0.
> 
> Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani




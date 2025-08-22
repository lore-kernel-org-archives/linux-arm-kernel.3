Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71740CA0FE9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=il8hQMyYfXw8Tzc5sMl2lQfGh5RbcWxWYW3ucD/cb6A=; b=FlXwvGBvCeF4w4n7sOhWOcI7hf
	kRayVzB4Atipusx3mJxlbX9k50jO1w2epTugLtqY5DJtFbwJtyz84+vTfPGaGw//I6esDUz2ALDHW
	PosFPiDRG7dLhCJU+vqe+gkCcQDtI77KAjUQNxROTSjFZ9PLtqdJwX6Qb26mwZO6QUgCNYvXRoyNj
	qMcm0ZP1G0nfjVpNTz/PD2QxBTNA1HgSfUzNw9UwOqiKjb6v7hDrSW+cVRtfELB2skAKJzij8FlMi
	jDy9UQeMu5HFgCJdPyVxxLjMoDUVLjWYss4G+ZTjZVxAw5LaOMINeK1DwcKRvwh37nnFVX9K+GBG6
	VJO4nrWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkfy-00000004Vfz-32Xn;
	Sat, 23 Aug 2025 09:36:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upZ7I-00000003Ttq-05HN;
	Fri, 22 Aug 2025 21:16:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=il8hQMyYfXw8Tzc5sMl2lQfGh5RbcWxWYW3ucD/cb6A=; b=fynZ0aC+YlzyqDD4FY9zewVQIF
	56ZPhZCK4JrmqwCsIFYyjHXl4Gn5RzbWhahxobiC0G3VrpBzWVMLX84iQvYgLICQoi/N1nxs57xV6
	Cs5buzQUXm/qj9j26+HWra+6mZL6k3nLJptNO+yZFZgXk4I8osr9fFBI8sufkxIB8dsE73RwJQiXs
	dOzEnM6jM308RctZLplYa7BBArafztWwqvyxLGyXm4WgLykBfh5rvZqhCwXRntKD98+oECQT7aI9f
	I64phKLZX8Y0ALyhm6/gB7/wYxp+5DAMiqMsQRkq1mOWXHBcu8oLjYOM7nnDx3ibZ+Wvilg/kanQc
	LiaCQm9g==;
Received: from i53875a83.versanet.de ([83.135.90.131] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1upZ6x-0004T7-IZ; Fri, 22 Aug 2025 23:15:47 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Heiko Stuebner <heiko@sntech.de>
Cc: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	andyshrk@163.com,
	nicolas.frattaroli@collabora.com,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: (subset) [PATCH 00/13] Support DSI output on rk3576 and roc-rk3576-pc board
Date: Fri, 22 Aug 2025 23:15:44 +0200
Message-ID: <175589734234.3314397.11816121357365151257.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250707164906.1445288-1-heiko@sntech.de>
References: <20250707164906.1445288-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_141608_057053_FFB13163 
X-CRM114-Status: GOOD (  12.61  )
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


On Mon, 07 Jul 2025 18:48:53 +0200, Heiko Stuebner wrote:
> This enables all the necesary bits and bindings to get display output
> on the dm-m10r800-v3s addon module for the Firefly roc-rk3576-pc board.
> 
> A bit of cleanup of the ili9881c, because the driver was still trying
> to send dcs commands when the underlying DSI driver might have already
> switched to video-mode, which caused me quite a bit of headache until
> I realized this being the culprit for my garbled display output :-) .
> 
> [...]

Applied, thanks!

[08/13] dt-bindings: display: rockchip: Add rk3576 to RK3588 DW DSI2 controller schema
        commit: f05530bdaf42aa0e6bb4cde76ba6a081cf473d44
[09/13] drm/rockchip: dsi2: add support rk3576
        commit: b6f11f114759a088acf44e86b5cd72f24de85d44

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


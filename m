Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC29FE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 13:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phv7iVVXVzjakNqDgdbYw7zx5GFmWGAQJh9j37w1dWc=; b=xRFuB+jniLCc25WkqTVwNunmyH
	v6hn7S6D+jC/NFQgy1As+qZMQ/6/weQl6rDsACLYDjgUHVQJXKU6IOb6FaQXVygZuknVsvsNhBsDi
	eOmyERbhC55YfpSLj5YChpQQlgrZvaCmRC9vfALtCgbFj6otDGM3/vHc3rjBPYQdI81FHw1OxvUlW
	4RTiNAsUoCXrRMfouEJQqFli78Ay0DLfilc7dIHGJQfCJSVRZpunJ+vn+F5uz4P13BS40Ak6fsKCl
	VYjATOmfXGEkSKP9RlyLJE10xlN5f3WtLs0yEsGGweHyjgZUTYJnCD7NRAIrbdkKzU9RZOf28iIHd
	TVX/nVgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRABi-00000000GHh-1FFe;
	Fri, 27 Dec 2024 13:15:34 +0000
Received: from omta36.uswest2.a.cloudfilter.net ([35.89.44.35])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR9z4-00000000DPT-0feN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Dec 2024 13:02:31 +0000
Received: from eig-obgw-5005a.ext.cloudfilter.net ([10.0.29.234])
	by cmsmtp with ESMTPS
	id QqMNtbDu1qvuoR9z3tyI5W; Fri, 27 Dec 2024 13:02:30 +0000
Received: from md-in-79.webhostbox.net ([43.225.55.182])
	by cmsmtp with ESMTPS
	id R9z0tuDzEjcdmR9z2tN82B; Fri, 27 Dec 2024 13:02:29 +0000
X-Authority-Analysis: v=2.4 cv=DrWd+3/+ c=1 sm=1 tr=0 ts=676ea565
 a=LfuyaZh/8e9VOkaVZk0aRw==:117 a=kofhyyBXuK/oEhdxNjf66Q==:17
 a=IkcTkHD0fZMA:10 a=RZcAm9yDv7YA:10 a=-pn6D5nKLtMA:10 a=vU9dKmh3AAAA:8
 a=VANPn-21L8UGAxZ6yr4A:9 a=QEXdDO2ut3YA:10 a=rsP06fVo5MYu2ilr0aT5:22
 a=ZCPYImcxYIQFgLOT52_G:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=linumiz.com
	; s=default; h=Cc:To:In-Reply-To:References:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=phv7iVVXVzjakNqDgdbYw7zx5GFmWGAQJh9j37w1dWc=; b=MhSVMdZpGT/3YN6WA4C63drtku
	xRh1qBZik1Oku888v04qGK618IQEgQuB9/zKZ8w3j14+w992UlMoIy0Oivsf2hh3xTNbEDbR7agdE
	lVMDmXiGg0W2Te2a4pez6WA/xXOhwJSJ70aZdU9/3dxyUi238znqXKlQ0PGLVu961nNIa/0eOBYD2
	UX20JxNTEXZyEP5UkVsPBdPjS1T4QSCZoth24Ju7DGc0Brja43/aOqZcylzIWCmGKJHUQ7FXw09dJ
	FK0Uy+tr4Re3cnWisewKBAONwNeX8AEWuVYDbz6rEswtSAZtV1pAdkAuNsD/IDYq/w/3TmpU3r8lx
	ObzPhlBQ==;
Received: from [122.165.245.213] (port=58270 helo=[127.0.1.1])
	by md-in-79.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <parthiban@linumiz.com>)
	id 1tR9yt-002EaQ-0t;
	Fri, 27 Dec 2024 18:32:19 +0530
From: Parthiban Nallathambi <parthiban@linumiz.com>
Date: Fri, 27 Dec 2024 18:31:00 +0530
Subject: [PATCH RESEND 11/22] drm/sun4i: Add support for a100/a133 display
 engine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241227-a133-display-support-v1-11-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
In-Reply-To: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-phy@lists.infradead.org, 
 Parthiban Nallathambi <parthiban@linumiz.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735304469; l=915;
 i=parthiban@linumiz.com; s=20241125; h=from:subject:message-id;
 bh=OF2xEirt2I4TWCuMHqY/Rfu3fQsoGOZ+4waicM8FC9g=;
 b=HGHE7FIkhzVXr2bzSYQN/APXLS7hoE7h8PpfzMDLfmskWW0X5xf3aKov2lNS6OvqgImNsDhVF
 IH0y/vmrBKWDHFJoJixEGQPfgnOmBdvk5asMsYb1R93wvAXRQPbPSsE
X-Developer-Key: i=parthiban@linumiz.com; a=ed25519;
 pk=PrcMZ/nwnHbeXNFUFUS833wF3DAX4hziDHEbBp1eNb8=
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - md-in-79.webhostbox.net
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - linumiz.com
X-BWhitelist: no
X-Source-IP: 122.165.245.213
X-Source-L: No
X-Exim-ID: 1tR9yt-002EaQ-0t
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: ([127.0.1.1]) [122.165.245.213]:58270
X-Source-Auth: parthiban@linumiz.com
X-Email-Count: 362
X-Org: HG=dishared_whb_net_legacy;ORG=directi;
X-Source-Cap: bGludW1jbWM7aG9zdGdhdG9yO21kLWluLTc5LndlYmhvc3Rib3gubmV0
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOXN6TlOOtW3kbdGRytpecm+WcWiEVfXCqSn7005uNEWYUdPIsRlmDGx83tTfms8ByI4lnca8pI0ZQx0hSeDgqhy7Hql+x0cSbGXI9jGNzqUwM9c4255
 /A8nuBVXwc9x2KAEIvVRAJUOjUwhWVSx6Z18inxX006NcwTSIoVTh3sQPsf08vnrO3g202qzV0ohNEcYTLyNNWNbAW3O5XOZMPVzV0L9EhmnAUPkHJ1NE5a2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_050230_218258_FAF2597B 
X-CRM114-Status: UNSURE (   7.23  )
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

Display Engine(DE2) in Allwinner A100/A133 has one mixers and tcon.
The routing for mixer0 is through tcon0 and connected to
LVDS/RGB/MIPI-DSI controller.

Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
---
 drivers/gpu/drm/sun4i/sun4i_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 5eccf58f2e17..e012a6316bba 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -436,6 +436,7 @@ static const struct of_device_id sun4i_drv_of_table[] = {
 	{ .compatible = "allwinner,sun9i-a80-display-engine" },
 	{ .compatible = "allwinner,sun20i-d1-display-engine" },
 	{ .compatible = "allwinner,sun50i-a64-display-engine" },
+	{ .compatible = "allwinner,sun50i-a100-display-engine" },
 	{ .compatible = "allwinner,sun50i-h6-display-engine" },
 	{ }
 };

-- 
2.39.5



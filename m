Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14088C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 20:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8b1/uzHkmLRM1y/RYzrMjDEcfh/Uu5cXz1HbOjoZlx4=; b=vMdPruuaqNKKKeUMGNj6OwZmqa
	zFWYu5CL6bZZYvgkWKZZLFUpdvCk6CrKbsZcLo3x6VQokewvwKtMcLVTtmQ4ScrTz3dIrg0Wc0e8o
	FQeEwBx+HyoHDgMNlIHrYZJCB/o4wjPWcrv8ju0a20ZVp2ixrW02T2tR+XFQzkWgcmtmEXVoyjP7e
	9me8tXwUyAix2TKFCSmROSdZd6GzdQiuEmc2S/hJJX7M6MiyNs2+BcyEeXlGv9ZYsE51aaOT7K9F4
	VJ3X2TOKE30/zCWWeDfIsbOR8KMOx1nVp6kPKvsJ9hDuDRfoTHzq0EDXgp8WPBQHaA1VMYutcxTc2
	tm7PEHpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpvEJ-00000009CSp-3g2q;
	Wed, 05 Mar 2025 20:20:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpue8-000000096Le-1WiS;
	Wed, 05 Mar 2025 19:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8b1/uzHkmLRM1y/RYzrMjDEcfh/Uu5cXz1HbOjoZlx4=; b=Ye9QKxX0PEYub3YwqWoLgRmGep
	7l9EKC6wNxACHF4p5dRYP3vqSK/jcNcXQNWhGRI1qsaw7JAOSrDzZU9Ebu1SnmpF7fOiFS55nGMwc
	F3M8qQb33cV+CEmZ8Rxq2ZtNlX5773XyJ1bJqR7MkqoA8d4aejOiWryJYPZC1hPBYL8/GH5GOje4a
	mFZJe0/XQkGyfnhref463yW8mmVzvLprOSFpN5xw3N7Wu4eJWo1zdrWuxPnjHfEabx2jORcO6OuAE
	okdFcvcTk4ZReY/FPkjd25x1b/sELcK/ynVDxYc4WAcprC+bsJCpSw6lsWoDkKri52h0b8MHG8XZW
	IG+Dh5Gw==;
Received: from layka.disroot.org ([178.21.23.139])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpue5-00000000j66-2rUM;
	Wed, 05 Mar 2025 19:43:11 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id F357B20D00;
	Wed,  5 Mar 2025 20:43:08 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcFUuhmvejPn; Wed,  5 Mar 2025 20:43:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741203788; bh=+LUmQPB+tURq91r5Yr6zdu4bs85M0PK3opWSYhnifBY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XQQG5nF+p1VSPixYAnYKKG3oBzbPUWg5oYFpWZV5o0jm9ODr0MIpT39jycMnDRltY
	 ipl507d/b96y6EDS6ZyP+Co/ssH/He+ZQ9ERa2/3gELnGLa63AuUMnkensjJm6k/qg
	 f+CH1Y/yipr3WBvWaLM3YrHl8BBjP+peLCIn4VWAA7qBYasfyXFz1Q2o6RzNJQGPsK
	 TfMlqaMBGMuNH+vL+ylSH0ix1GKHX1VobJblgfEJ+es3T+2UWZ5654NxWSMc6w2NWL
	 l7oKAg2GtM85dv+nv4iwKGbvC7wulY5OHDTHAqw6VALGSzfQZ9a7YwvgbWYlh5mdfu
	 FWCZDQgNh6+sg==
From: Yao Zi <ziyao@disroot.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shresth Prasad <shresthprasad7@gmail.com>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>
Cc: linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH v2 3/8] dt-bindings: mmc: rockchip-dw-mshc: Add compatible string for RK3528
Date: Wed,  5 Mar 2025 19:42:12 +0000
Message-ID: <20250305194217.47052-4-ziyao@disroot.org>
In-Reply-To: <20250305194217.47052-1-ziyao@disroot.org>
References: <20250305194217.47052-1-ziyao@disroot.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_194309_829970_473F53E2 
X-CRM114-Status: UNSURE (   8.06  )
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

Add RK3528 compatible string for SD/SDIO interface.

Signed-off-by: Yao Zi <ziyao@disroot.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
index 06df1269f247..ea0feb733e32 100644
--- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
+++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
@@ -38,6 +38,7 @@ properties:
               - rockchip,rk3328-dw-mshc
               - rockchip,rk3368-dw-mshc
               - rockchip,rk3399-dw-mshc
+              - rockchip,rk3528-dw-mshc
               - rockchip,rk3568-dw-mshc
               - rockchip,rk3588-dw-mshc
               - rockchip,rv1108-dw-mshc
-- 
2.48.1



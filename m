Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3ABDC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 10:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3EgUvtajMBMNThJ7mV5vCDPFFmnv2HebuYoPXVNWVw=; b=nIlbpCl8+76KmrRHfCsbmT2lA6
	3G0sIag7kWgP9wYZTZM6uXurYK/UhEUInprinhYVOYhTzyfuT2wtHuOW2+nMZtEToeUYMh+k6F92V
	jRf0fKdOzELeHLw35Jko71voTk2fJBxPObmRoYSDTn7z+aSAT6J+nGlut8dIrseg46oPo9AIrwu8N
	jmCEyvTy8+UwjbM0R6H11FwpnvcTxDy47rI8GVrXYiHqR1Njl0ZWBxQTH77A7PokzEjX3C9JV4ck4
	DMXepCafq/5rtAfaz+Sx6+azhATptMAfqSZEdoP8p/y+gd64LyC8w48xEaiBHEYMhFF8CeAlhMPpF
	IZff3SYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKC0-0000000CLF4-2Bpz;
	Tue, 20 May 2025 10:27:28 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHJmh-0000000CH70-0H2F;
	Tue, 20 May 2025 10:01:20 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c04:7a30:290:8105:3706:5628])
	by smtp.qiye.163.com (Hmail) with ESMTP id 15b895911;
	Tue, 20 May 2025 18:01:08 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org
Subject: [PATCH 1/2] spi: dt-bindings: Add rk3528-spi compatible
Date: Tue, 20 May 2025 18:01:01 +0800
Message-Id: <20250520100102.1226725-2-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250520100102.1226725-1-amadeus@jmu.edu.cn>
References: <20250520100102.1226725-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTR5OVkofGEIaSENCGUtITFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtPQUwaSEtBSUJLQUNKS05BSExLTUFOTUlDWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a96ed23c87403a2kunm0a9e35a49fab4
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRQ6Pyo6QjErDBpKPQgwNioQ
	GjAKCQxVSlVKTE9MTEhOSU1CSUJCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS09BTBpIS0FJQktBQ0pLTkFITEtNQU5NSUNZV1kIAVlBSkxOSzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_030119_265462_F15AB7B5 
X-CRM114-Status: UNSURE (   7.24  )
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

This adds a compatible string for the SPI controller on RK3528.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index 104f5ffdd04e..748faf7f7081 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3328-spi
               - rockchip,rk3368-spi
               - rockchip,rk3399-spi
+              - rockchip,rk3528-spi
               - rockchip,rk3562-spi
               - rockchip,rk3568-spi
               - rockchip,rk3576-spi
-- 
2.25.1



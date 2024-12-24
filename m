Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E44E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOM1U89s1aYg720JAUn/jQO6iCYKE+w0kQFvGel09Ys=; b=oGIG/88MD2FWFzG6fADr4ia7MY
	se9ma7jV6FTYHegZbIkTURS8hERBpVR/vXv74/AaI12O6GISzgU31sJPJhKsm3cQuHxFWCF2GBjyw
	N5SIg29mZhxAxki6ZYqjTnmTyfVRC0VFAzBBEB9UQBVapOcneXFGxkpi4yZoekWOCNgPR8KhL9ZQK
	cFHPgmg86FdU9DyO9/OId3kqeB3NrEmK9zogsWzuqDsGdto5jFalDlOWrRv0+hMFeOSliOuJT06dy
	xF/8VibmBUHyPId8y/FSGOVAe2WtfNGJkan3BkttwMu2KOD3Ep+WASf3iKitMhH7DU9J7op+jYGy0
	x20qjvMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1n4-0000000BhAL-0MLb;
	Tue, 24 Dec 2024 10:05:26 +0000
Received: from mail-m12764.qiye.163.com ([115.236.127.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Xn-0000000Be2b-07tY;
	Tue, 24 Dec 2024 09:49:40 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aad4f1b;
	Tue, 24 Dec 2024 17:49:35 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 08/17] dt-bindings: spi: Add rockchip,rk3562-spi compatible
Date: Tue, 24 Dec 2024 17:49:11 +0800
Message-Id: <20241224094920.3821861-9-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0JDTlYaT0pJTE9LSkkdQ0NWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a93f812647d03afkunm6aad4f1b
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MS46Nxw5DjITPkodS1EvLCo1
	NQMaCw9VSlVKTEhOS0hITExNT01KVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDT0o3Bg++
DKIM-Signature: a=rsa-sha256;
	b=aIC4AIcWKqKoT7LNOzi3cjWVG65DmdskHtqwrE28ZQDWJltkEJs9GEM8YYIm/lHy6ezEtwUeZSGqS9x8XL/4bkC4F6pYHknE00uMA3alZaocRHp07Iqg93Yf5VPrlx4Fwe20YQkfz6soDVs5O5K7ryO9OYSnuv4IrLrqGF2AiO0=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=IOM1U89s1aYg720JAUn/jQO6iCYKE+w0kQFvGel09Ys=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014939_273066_FD894C54 
X-CRM114-Status: UNSURE (   6.77  )
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

Add rockchip,rk3562-spi compatible for rk3562.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/spi/spi-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
index 46d9d6ee0923..104f5ffdd04e 100644
--- a/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-rockchip.yaml
@@ -34,6 +34,7 @@ properties:
               - rockchip,rk3328-spi
               - rockchip,rk3368-spi
               - rockchip,rk3399-spi
+              - rockchip,rk3562-spi
               - rockchip,rk3568-spi
               - rockchip,rk3576-spi
               - rockchip,rk3588-spi
-- 
2.25.1



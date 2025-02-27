Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4373C1B0D9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 11:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I3iQQEtRmNRV5igybnDSqzo+ihaIIQT1QRYBRaPEXgI=; b=r1oZD2X11U3k5vqqiKWPjwEBfZ
	O24yJvcbP5AJoWVQDB/WZl7cu/HinffTTmGKEIzYHXlN00T48eBefTvcJncoEw/GFROSaDH1D/91s
	yYUPN3c6Uz6W1zU1try81AWdhtDCWxIZ/FL5r6d5vxCQ0S+ePFLAC1xhq2NmYFy5J8VvU0owHivzY
	B6nz/YKcHLlvzawQzGilbBEYSzqC6+hA7uD09DB9icsJOPkkpxg+wXNKGOZMis4ybStNsy/v1wIj4
	tekfjEQmf6uJcOn4hHmpEyr/zqmYPQK/d4JQxsmCVYrwVuWak/gBnwsKA0vAkOKsQOrTpnGYMt4mP
	gqbQoSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncLj-00000007EIe-47Bb;
	Thu, 27 Feb 2025 11:46:43 +0000
Received: from mail-m4921.qiye.163.com ([45.254.49.21])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnbvN-000000079ED-2hcv;
	Thu, 27 Feb 2025 11:19:30 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c65f97d8;
	Thu, 27 Feb 2025 19:19:26 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v3 04/15] dt-bindings: i2c: i2c-rk3x: Add rk3562 support
Date: Thu, 27 Feb 2025 19:19:02 +0800
Message-Id: <20250227111913.2344207-5-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR1LH1ZJHRhJQkwfGB5LGUlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a95472202fd03afkunmc65f97d8
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PjY6MBw6SzIWEQ0oAkI9Hk0p
	LgkwCzxVSlVKTE9LTU5OSk1MTklJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFCSkg3Bg++
DKIM-Signature: a=rsa-sha256;
	b=Jshtcg4qo4tv3yp57f8BeQ4JVpSLtF/rSPS/xDxZHaH7hdmqHDMcwL58orV/jhG+nFDHJMy4HMP1t5dQ2yJmoK4PHR23qTWvWRzA2jdXaaibcq6F3Rej4qz/PsIOg2Lgx/1dJRX+W4naeD84FzCvNz+5S7XQ9SMu7eM5m5BVB7s=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=I3iQQEtRmNRV5igybnDSqzo+ihaIIQT1QRYBRaPEXgI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_031929_860239_63998D23 
X-CRM114-Status: UNSURE (   7.10  )
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

rk3562 i2c compatible to the existing rk3399 binding.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---

Changes in v3:
- Collect review tag

Changes in v2: None

 Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
index a9dae5b52f28..8101afa6f146 100644
--- a/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
+++ b/Documentation/devicetree/bindings/i2c/i2c-rk3x.yaml
@@ -37,6 +37,7 @@ properties:
               - rockchip,px30-i2c
               - rockchip,rk3308-i2c
               - rockchip,rk3328-i2c
+              - rockchip,rk3562-i2c
               - rockchip,rk3568-i2c
               - rockchip,rk3576-i2c
               - rockchip,rk3588-i2c
-- 
2.25.1



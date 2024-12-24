Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E985E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Dec 2024 10:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DTvew9FRb8bcd/cfA8z7sQXsLhbV+v0u07kTJMk/M2w=; b=UIijhIT/JOxSaq4PbhYG54cZlc
	waDV7YrWOXSkBxtOUhEFmYHX7zSbi3Qbk5OY3ov1Vrg1nAU6xpnaqb7X/0JuhsMq6Vi5mJu8zpiEC
	YHxUoAGUpL/NTJIIGnigjqSuzNDmM7/uIiiG4UgeD6gBzxL7xibcjRqSgihUoILR0FV+r33Pt6vbt
	CTg07/ho6FmDZzn9F16vA7TMNVwEFj3D7XrhT/HP0FBsPXGcPeIpd6bV7Av5gho24BC/fr3wMuWks
	HwwOvkgQ7xtUVWToz6rGaxFeWaccefFGDdyjwbubRw5OUJvXqchtdUGcXOgcps+bivoTio0n0AUg8
	3vwvn+fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1pM-0000000BhdG-0Zrp;
	Tue, 24 Dec 2024 10:07:48 +0000
Received: from mail-m49200.qiye.163.com ([45.254.49.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQ1Xq-0000000Be3m-3x7x;
	Tue, 24 Dec 2024 09:49:44 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6aad4f5e;
	Tue, 24 Dec 2024 17:49:39 +0800 (GMT+08:00)
From: Kever Yang <kever.yang@rock-chips.com>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	Kever Yang <kever.yang@rock-chips.com>,
	linux-pwm@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 11/17] dt-bindings: pwm: rockchip: Add rockchip,rk3562-pwm
Date: Tue, 24 Dec 2024 17:49:14 +0800
Message-Id: <20241224094920.3821861-12-kever.yang@rock-chips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUJOSlYYTEweSkoeThhKSB9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEtNT0
	1VSktLVUpCWQY+
X-HM-Tid: 0a93f812742d03afkunm6aad4f5e
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRA6KBw6LTINLko*LEo2LC0P
	ShQKFD9VSlVKTEhOS0hITENLTklLVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFDSkw3Bg++
DKIM-Signature: a=rsa-sha256;
	b=cNBvizXwpV1e0xw7155UyKzIz+tVZDUiMSgZtdb3yHjj2jdauY7AUm8yUDhAGDzFd2NL9w7KbZsyeXnJemM2sWNwD0bxw0rbZTXs8AgZ5f7lKOPddhFyO3tlVoOpy6g1mm+V+hgqIwMavzwUmngGp1Hw5rGhLwDKd4xstPKS0sM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=DTvew9FRb8bcd/cfA8z7sQXsLhbV+v0u07kTJMk/M2w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241224_014943_198759_5C27D403 
X-CRM114-Status: UNSURE (   5.96  )
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

Add rockchip,rk3562-pwm compatible string.

Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
---

Changes in v2: None

 Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
index 65bfb492b3a4..e4e1976c542d 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-rockchip.yaml
@@ -30,6 +30,7 @@ properties:
           - enum:
               - rockchip,px30-pwm
               - rockchip,rk3308-pwm
+              - rockchip,rk3562-pwm
               - rockchip,rk3568-pwm
               - rockchip,rk3588-pwm
               - rockchip,rv1126-pwm
-- 
2.25.1



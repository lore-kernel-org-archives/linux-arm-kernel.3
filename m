Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4995E8304D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 03:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+RZfcth7vxLk3F23wpG7lF8kLp7QMay9kzSlavNfkA=; b=VZgLJ0KZzcbYuXA88TbJLyejUd
	0ja6x2gO7qOh6bXnMug4BYEd5zKHmfJOpCTYdTKjrbWI1qor+If6fNvrfl3bND8j+uWvafXZ6531z
	QfTtDMc9Oe+nxKkyJUlbjiMH2Y0Mxl70eWPD7t6KNWx6K/BBZD6u1ehQNECUH9iCh6lX1f/tfGoq1
	RsehHiAz9mlcH699uEaWyx5gMnyQWILcUPTFa4DmB6Q6HVfiAtZFvBVR6k7xK83SS9MocPhC843AB
	NO/eiQa+1Mlj6CEUklAMlgTzQQeQ1E05Z1RIlz4BDd5gS1wTlotIobJWOQg9IOeYw9H2MqAKF30wr
	1elaDjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7Vb-0000000628p-1Cy2;
	Tue, 03 Feb 2026 03:55:23 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn7VZ-0000000627o-1NNU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 03:55:22 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 3 Feb
 2026 11:55:11 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 3 Feb 2026 11:55:11 +0800
From: Jammy Huang <jammy_huang@aspeedtech.com>
Date: Tue, 3 Feb 2026 11:55:08 +0800
Subject: [PATCH 1/2] dt-bindings: soc: aspeed: add
 aspeed,ast2700nx-uart-routing compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260203-upstream_uart_routing-v1-1-6bd5dd75ee3b@aspeedtech.com>
References: <20260203-upstream_uart_routing-v1-0-6bd5dd75ee3b@aspeedtech.com>
In-Reply-To: <20260203-upstream_uart_routing-v1-0-6bd5dd75ee3b@aspeedtech.com>
To: Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, "Oskar
 Senft" <osk@google.com>, Chia-Wei Wang <chiawei_wang@aspeedtech.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Jammy Huang
	<jammy_huang@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770090911; l=916;
 i=jammy_huang@aspeedtech.com; s=20251124; h=from:subject:message-id;
 bh=29cX7wLiEvG4nuiYCRISWCJL6gqUkOol7p8pKkxhJmA=;
 b=kQhySbgAx4A+uRYNmsCnwp3PcP3dXS7qxsxh6Qqka3k3mWwmHYWC/IpgObc7AOFm3/U0tvPlX
 RJhzRbIuEKfBnKcurBxw1SQa5FhMJi4+ttxz8LRdv+YdDm70/HFyxge
X-Developer-Key: i=jammy_huang@aspeedtech.com; a=ed25519;
 pk=E5YwijeJZZcuDR6srvwNlXrNHvLxwipUg3Mb/xxUF9o=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_195521_370615_F90CB6FD 
X-CRM114-Status: UNSURE (   6.99  )
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

Add aspeed,ast2700n0-uart-routing and aspeed,ast2700n1-uart-routing
dedicated compatible for representing the Aspeed 7th generation.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
---
 Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml b/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
index 51aaf34acb..6e0d63ca8b 100644
--- a/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
+++ b/Documentation/devicetree/bindings/soc/aspeed/uart-routing.yaml
@@ -31,6 +31,8 @@ properties:
           - aspeed,ast2400-uart-routing
           - aspeed,ast2500-uart-routing
           - aspeed,ast2600-uart-routing
+          - aspeed,ast2700n0-uart-routing
+          - aspeed,ast2700n1-uart-routing
   reg:
     maxItems: 1
 

-- 
2.34.1



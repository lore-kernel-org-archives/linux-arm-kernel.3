Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4B64D5CC91
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 23:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FXyL3DypPFSd8TW3PTO+e+7t9NOqRV3fsU3dmjBNp60=; b=jhcJWioXDOQxuUc548WcPEIv9v
	sEXDsKy2NoV6PXIfyfVUkQP8dcWRQsDQNKp0nYbm2UxeUZyxRtBv6jrfwaNOyUNerDHaSFnLpRrOA
	Qlxt24G9dEwEX7rGqjEA12PWwV+7zHXa6iJeDudVq6Ad8Xpn/OCOj2q0iqEiKtXzrJNv7Tg/CtYLK
	QGarUG6hZjKKHr/Ttldbce6pPfEkw+EQh2n0L0YyY3tGJg2mhFA6O12avd8iXlY+aDlGlxcMBVEoe
	qBTwZONtJhRBbM6Lqv49QqR77EvYJSrwUKwuGWrBHSzIMC+Fx+M8YbxDHrNMENV4QnHRT6J0SCuEU
	s9HAN5pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6IIk-000000024R6-3X53;
	Wed, 30 Oct 2024 23:40:34 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6I6s-000000023SY-2Vuq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 23:28:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FXyL3DypPFSd8TW3PTO+e+7t9NOqRV3fsU3dmjBNp60=; b=MKmUtxoe5Z2q52+0mEeOw3eGF5
	6QCc1rW8UPEIamWzpuROmb3mf6Q3sZYoUo3kaC6UBLnI8BVkjuff5oIrMIsCuLFqa/+GxLg00L4mL
	yBxltGbL7c2uHihNu4QiH9MXTD76hglYTAaPwooqe3BI2QwxYLk27NnlVnJ02jWtXg8NxwTQAa9B4
	cXEPqRLgDnvD95BwnSH+CfDjyNuF7D5oP74hoon7V8HGkbvj8DWm5+rbJsqlLapyvwIE0KPFYIQiS
	cM7WFjfQPlt6mhhhlFlqQqGA7wQ+lLjN7CpyLXx7jzCzRXMesk9acc8jVkAQab0RbE0/AjbNW9LLz
	JEH3A0Ug==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
Date: Thu, 31 Oct 2024 00:27:44 +0100
Message-Id: <20241030232746.2644502-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241030232746.2644502-1-andreas@kemnade.info>
References: <20241030232746.2644502-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_162818_660506_C54A30BC 
X-CRM114-Status: UNSURE (   7.60  )
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

Adds compatible strings for the Kobo Clara 2E eBook reader.
There are two variants differing in the EPD PMIC used.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b39a7e031177e..a78903076269b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -620,6 +620,14 @@ properties:
               - kobo,librah2o
           - const: fsl,imx6sll
 
+      - description: i.MX6SLL Kobo Clara 2e Rev. A/B
+        items:
+          - enum:
+              - kobo,clara2e-a
+              - kobo,clara2e-b
+          - const: kobo,clara2e
+          - const: fsl,imx6sll
+
       - description: i.MX6SX based Boards
         items:
           - enum:
-- 
2.39.5



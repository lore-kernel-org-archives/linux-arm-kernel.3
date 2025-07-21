Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DCB4C87FC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 07:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CECHK3/TvaUBS7vTQd/dCnJSOpEhSRdWvqHUX5n6xGY=; b=qXJRaubNoCmeL081GpQ6T4GoNx
	gi1UQZ65V4xmCFWx7H0zY9ayAgJh6KyB6MgxSNeBwygNfIUWk8qzQ1/aszU113CZgci2GQpU9sYDN
	k7osfzz9Cf+488j9xHHXFKXmaW2aJKZeWa70X4HckLbi7zlNmo4gY6s5/vMSn5/X5ueD3O0ut094v
	X6AD6+hjfyJMG0xTH+QqPeGuJesIMrwGtLw8mbSi6jle5ya5cfTtHXqLLuD1skn3n98D/J0XCXwlT
	ic6LRBvMIO6WY8EZjAeBeA79Q3fieevS/Yn6RZ3+lrNFpOxFnWgRpMpSw5wGNfuAjD/nlePAcNZGl
	pOEFVQow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udkzT-0000000GUeD-2LDi;
	Mon, 21 Jul 2025 07:31:15 +0000
Received: from out203-205-221-205.mail.qq.com ([203.205.221.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udkx0-0000000GUNo-23OY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 07:28:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1753082913; bh=CECHK3/TvaUBS7vTQd/dCnJSOpEhSRdWvqHUX5n6xGY=;
	h=From:To:Cc:Subject:Date;
	b=njcJqYO8ppAVtjZwg427WgO/XAzvdHEFtwAZaP0CrmhxEbl1k+cwtmdpEncae7EaY
	 kxA10paC5YFyfojaxiSRDNMTYZbWALVn0EU5Ye8prLOB+4NIFTV2afLKbqUfoKwALL
	 JJXmexR96XMwTBq262WLWB57nSEmLfLmKlesm+E4=
Received: from VM-222-126-tencentos.localdomain ([14.22.11.163])
	by newxmesmtplogicsvrsza28-0.qq.com (NewEsmtp) with SMTP
	id 70BBB67D; Mon, 21 Jul 2025 15:28:11 +0800
X-QQ-mid: xmsmtpt1753082891t74zqof58
Message-ID: <tencent_72EDAD7F6E52D8FB5933030A569A08AEC406@qq.com>
X-QQ-XMAILINFO: MllZffuBkEb5iY/9mp9LBQpbgJ/fQvfNWOtdXd/FI0PPSmsjDSeD70i+7z2hkb
	 VA81p3Zxlv1UELLkFOp77t2D3WzzAOUXgPiZxMAyEcaLWS0htXury4GJLJvEB/fPTTGlzd3ZT2rJ
	 WH2z1IwSWDiYEhO7WNJN/7xDNaPq8M19nGLiqxu2Bd8S3nCfMccWj++8Y/IC1vtAqijmXgLK0fUx
	 VYJatAySdNzUXV7ntYl7HbodyIvVFUl2w1Kz9AGlU6FFlEOdcQ71pXcxGP7CctBQ1wPvDRnHbPGp
	 vmxAnaGQebSgRXnv4DKlk7I+Qav0FYQwmUuL/GiyiJeCvVipqSf9hSjs5zpOkREfsLuCnjsm1fAV
	 4yOWaJIlo2VGgbAfxw7/ZloZrXmoeVBf/BezHOmXqZGR7E2YYwvidyVE6LL9SD5imYJUgEd9xwRm
	 6+Oko26TplZCNdpI2a+Op1xSWiVJcoYu4zTHmT9kTmzIF2yYia6quUJ0fUpjgZ7oVxITgGdyREhk
	 iVk/vbmbASdrbD8V3SjVvHmI/z0RH5YOfJjlFzJrTob05JMQzqpq7vglMEWwDKCF5acsrBjo2RBP
	 eyy2vqaSO4wSR1S29TcizutHzcdXFQPhzgWCXPURon/ZnFozRhygoorMUmRdqh4MUHvYP2GQ6qYA
	 X8UrZoLiIG10ycQrem5rLf8q1D5VRqUeSf4qAlTcZWt/c3eh7stfisUEQ1v/TNLLkLqs8eXueUYw
	 g/2Jre5OKTqrjFGPiDdcGRgJM89ZBEj6/Vxdk1UK5qLeJsVDc12e5qmVzqgaCY9bUDiUeEbO2dZM
	 e2y0wpaqp2PxfghQbn1lWmiiGnqniIQgbGovYa4tkeBrkT9BETJkJMbvlmViWlUx/F+uYaK+6Oen
	 yERmWPmJ2h29160aJNxPJ9YjXQwEDdPG02g4tYQpb7Jeq1TyoTJ7RnJ45gzjEEb73TleFM2uQ560
	 rb8r+UhRfexWudE7MgWe7vft8UoBp2jtG+80ClJ5CiF1jcO3UYmkiWqxpcUN2MK1TJbF/su2EIOq
	 Y0fL7wfCdKt/vfGVpTEDC3L/WXspq/2k1jGFt0HRB3raKDzuvszGe2cDk2Yjo=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: jackysliu <1972843537@qq.com>
To: maz@kernel.org
Cc: tglx@linutronix.de,
	herve.codina@bootlin.com,
	antonio.borneo@foss.st.com,
	anup@brainfault.org,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jackysliu <1972843537@qq.com>
Subject: [PATCH] irqchip/gic-v3: fix resource leak in partition_domain_translate()
Date: Mon, 21 Jul 2025 15:28:04 +0800
X-OQ-MSGID: <20250721072804.343055-1-1972843537@qq.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_002843_690953_7E405C10 
X-CRM114-Status: GOOD (  13.43  )
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

There is a device node reference leak in partition_domain_translate().
After the function obtains the device node np via of_find_node_by_phandle,
it does not call of_node_put(np) to release the node reference
in both the error path and the normal return path.
This causes the node reference count to increase each time
the function is called, causing a resource leak.

This issue was detected by rule based static tools
developed by Tencent.

Fixes: 87228532e7e9 ("irqchip: Switch to of_fwnode_handle()")

Signed-off-by: jackysliu <1972843537@qq.com>
---
 drivers/irqchip/irq-gic-v3.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index efc791c43d44..61c1d404b726 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1821,12 +1821,16 @@ static int partition_domain_translate(struct irq_domain *d,
 		return -EINVAL;
 
 	ret = gic_irq_domain_translate(d, fwspec, &ppi_intid, type);
-	if (WARN_ON_ONCE(ret))
+	if (WARN_ON_ONCE(ret)) {
+		of_node_put(np);
 		return 0;
+	}
 
 	ppi_idx = __gic_get_ppi_index(ppi_intid);
 	ret = partition_translate_id(gic_data.ppi_descs[ppi_idx],
 				     of_fwnode_handle(np));
+	of_node_put(np);
+
 	if (ret < 0)
 		return ret;
 
-- 
2.43.5



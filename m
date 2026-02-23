Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6554EA4FC7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=36By4hHiLip6ZItoue2GPzjv1r334r4hKXOooo2hsrc=; b=h86ojW2kW81bKws7gDldJddGPN
	cYBlxurWLOFwXleaKBuqIkqB4NQQY1rf7cIPwQgEhfT38ThxDnjDKMqvDL3w2irJUTwvTxOvPjR+o
	XRzPe6Jg4iSWN7JA1KD+CKpvNU8zeYS8O4Ertd3uxNGCjnWd4kBqOxAMBLif+078amAKwQMwkis/9
	I9ojiYoRmqP4F/Ieikc2EjsocnrVJdtcxdvPcc82iYBRMXvjzYH3C8uRAW4Hworr6gqsaO5GUrEjP
	c8TiOxsIgq2vceLaHWK07nQDlp/EGewnfcshKbGuPsucS4RXCAYeVdb5m5WapH/a9oEHv0nxqpbY/
	7rY2Pa3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLL-00000000cMJ-3NaL;
	Mon, 23 Feb 2026 15:59:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLJ-00000000cKH-3O6M
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Feb 2026 15:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=36By4hHiLip6ZItoue2GPzjv1r334r4hKXOooo2hsrc=; b=PP5OARzi77M3pyn9Km77oaSrty
	SVMDwxkShepTEho9Rx2SvEQii8KgZCEqnOd3JYQgr3GvPCsr+/LkoexQf7vpdJM88Am2jQvi6ncy7
	vATJI99MRJguZQ5thSvB596kALNnNR4wMmz6iOKjR+UVpCYsiQ3pZQCLAsnvZzneE+3w306R4qgM7
	IiYwCkqs1NZBc9+ivKZ1IzzlzbQTTGr42x7eajWV1mNPcG+Yb4RWw+Es3fYCjMDFzfjn3YQqgXnPh
	oz+y/1/xHSFfUAlP3QQfXYo18U4o+d3BT9egdHDfUgezZzQGJw5iJi45mJqwjgE6t1S8MS4vcSL3X
	sf9Pkt3A==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYLF-00000005POU-140b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 15:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4B8624453D;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27EE9C116D0;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771862360;
	bh=8VgLBNuTxD72+GI4e0fkK8v9sYu+VLaZ56iTicorfVQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=NUXNpPayyGsKW9S8uDu3RI4dyDMmw9yk5MjGvGpU8WVZ+jR+qRN/wmS18qegVP6Um
	 U0n0Nt4f1xPvKSuGcTMmcz2Xcjgw9NrbTIF/D4zSz19Zhzn0zmjnCPiind2d2aVGyE
	 7oO1zsUEGWJrje2+ZGsnWnxTmSPApUxGaA/0yaFY+r9/mvl7v+cRKl4SQG4QyculwA
	 VCgQjBZTpGlE8+QPsdDiUklj2vQnIxb9xCkzKr9ii9qD/HDOu8CSP28B9geUCBw3sR
	 531w9w3n832apGGrB1OCMGMShZhqUyT/+oP8ot3Y1cupMxpodQht5IzInp3XadJ7kJ
	 GzOUsFKRgUkGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202BDEA4FC7;
	Mon, 23 Feb 2026 15:59:20 +0000 (UTC)
From: Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>
Date: Mon, 23 Feb 2026 15:59:22 +0000
Subject: [PATCH v12 7/7] i2c: xiic: skip input clock setup on non-OF
 systems
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-xiic-v12-7-b6c9ce4e4f3c@nexthop.ai>
References: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
In-Reply-To: <20260223-i2c-xiic-v12-0-b6c9ce4e4f3c@nexthop.ai>
To: Michal Simek <michal.simek@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, 
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771862359; l=1194;
 i=abdurrahman@nexthop.ai; s=20260119; h=from:subject:message-id;
 bh=usc1CKg+f05YBR4E4GFMUb7OKXzoYUSPfhhuE4yE/XA=;
 b=+y1k9kEklzjax8kw0/GxG/XFD+YRKhH4DvYmswPoEay7CKIIqzhSrJB5CtDpA1+ol87X1I/6o
 wBmNI3aTuLmDsP7/x9j7bzPOs5MdZ3A0bhlLvxYUcuC5Ia6PtpP5mJV
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=S+ysnf+NwMcBdHBlyKIUEAtaFGSIhQwcJcgcXhq0osg=
X-Endpoint-Received: by B4 Relay for abdurrahman@nexthop.ai/20260119 with
 auth_id=608
X-Original-From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_155925_651768_671C0CA5 
X-CRM114-Status: GOOD (  11.95  )
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
Reply-To: abdurrahman@nexthop.ai
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Currently Linux does not implement ACPI ClockInput() resource to describe
clocks, unlike DT. However the xiic driver is happy if something
magically enables the clock before the driver probes, and does not
turn it off again. The clock should always be considered optional for
ACPI.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 drivers/i2c/busses/i2c-xiic.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 6eb0c6a2618a..3e7735e1dae0 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1464,10 +1464,12 @@ static int xiic_i2c_probe(struct platform_device *pdev)
 
 	spin_lock_init(&i2c->atomic_lock);
 
-	i2c->clk = devm_clk_get_enabled(&pdev->dev, NULL);
-	if (IS_ERR(i2c->clk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
-				     "failed to enable input clock.\n");
+	if (is_of_node(fwnode)) {
+		i2c->clk = devm_clk_get_enabled(dev, NULL);
+		if (IS_ERR(i2c->clk))
+			return dev_err_probe(dev, PTR_ERR(i2c->clk),
+					"failed to enable input clock.\n");
+	}
 
 	i2c->dev = dev;
 

-- 
2.52.0




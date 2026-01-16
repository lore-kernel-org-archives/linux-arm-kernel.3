Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12933D4899D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M9hfnzEF43IHdUY2dVVEA/3BjfGPtqhazX3KdgqvRkw=; b=AFcfhBMv9+rTqN
	azSf/s8Vo8iY0iKIjlaCtGxwqbaWmRKYgA7ifsROAi/cHtP0iYxd+mLueNQHqIqBZqulyVz02Pd/o
	np+z1Uu17DoQOPPOViOaIWA4OTTg9MOdWXScJ+cu4NpnK/823SVJBs4HndjqNMmopE0N7dK1u4EK3
	mHKmdIiy3i0NLQkQcUB3cCsemkVg0RQgWHhRUDu4YkeOLxTjvVGjtKRoJtLsjQ9nxn/JlCDRzI0xJ
	M/ywYbcTA+PoDaUW9xwJwV1xI2cCb+R4+3naHWXRqk47k/bE6rKCzsYlz6zHkshD0PPMCa6/dsBBW
	m5nEwqKA+SsX0cZEMpSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjLk-0000000E87o-3gfI;
	Fri, 16 Jan 2026 12:54:48 +0000
Received: from xmbghk7.mail.qq.com ([43.163.128.48])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgjLg-0000000E87G-2wvO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 12:54:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1768568082; bh=M9hfnzEF43IHdUY2dVVEA/3BjfGPtqhazX3KdgqvRkw=;
	h=From:Date:Subject:To:Cc;
	b=ak/WWA8Az/xurRReEvTZjwAjh9Ncv3zUcQYQFjjJBgjZyOuV1TyHrlBMx/a4zAuLo
	 5SeWJ/W9jpXW3TthU8EVZWnxeYJV63ETwA3uPdzWOaaFvIyW218CBCLeaHYQsEc5hk
	 NxrJCJ2Kd5KoPPs+q9pQ/XWnZ4yFl9T7aprVEwJ0=
Received: from junjungu-PC.localdomain ([223.166.246.160])
	by newxmesmtplogicsvrszc50-0.qq.com (NewEsmtp) with SMTP
	id DA818077; Fri, 16 Jan 2026 20:54:40 +0800
X-QQ-mid: xmsmtpt1768568080t7j1nb336
Message-ID: <tencent_A3E20C513BBE7D268B863A5CE473FBA10B06@qq.com>
X-QQ-XMAILINFO: OOO9dHjlsLs7QQS1rP69LWQ35Hp/CJV4p/t4Uitp63MkRuS3enNuG6U4eJ4HUA
	 tSPVgwV52BIS8fRB8wQps4rICSoSkiPAmutE8ShD+9QqZWtHdJ4wmXkPMuKc3pRtMlDXsgYIUqI2
	 7kv1YCa3yRAW2UpGjk3r+7ZEDHQf0axXBaQfCr+O+ZR2LewawR/DFN6A3aP6+cfEtI/qfh6JcONX
	 7rYgNbaEtEwiqiLAqtBFbVmVz+5hxSx5qnGi6zcEHhPwJBI8LVidSQzpPM6ASMA+F/z6VtWCCtSF
	 EfqFN9xXssmguqL9V5UHxlrIbAWKJhAU2awW2upnkkdXeXzzNUm9OfOJv1i+rv4A1JwSolsLafTg
	 I1Y3hAMCKwA85PYB6bYAfEQXXkAk7EoV+dnbh1ykh4B9qSQvkkYhnfoslB3E5dvQcBkxkLh623Zu
	 174i99Gm21+Yee9ASCi2WRlQqaBCv527zu+jFFkrXrK0OeW07CKNaYwKF/4fq5+V/EVmviLDm14F
	 pWFT+IdeSQDqZV3PodY4qN+rC1h8bi2MU8jXcUYTR8g0oVPpx3WT3GUI6diwP2cVQp5CAfMxObAQ
	 ba7dOid5SFIB2wTODJCesdiI4teF9Q2nbz5qYfOSgCxSHdiXNuujIh63FarEYnicCxvilVhBUZ7n
	 m/n9s98MgOd/e0iQqsXvLAD05HghEinbgoW2fRPr8W4UvmIhINx8TlLNUM1svPzkROBMjBB3/Nxu
	 akomwrw6/0V+mynVlG9qpLuiXbNGVV3A5Y/bYGOykzvOBCb0tRCZte0BEYS/mkHI262aF2A5p5uz
	 4wHQN7VUEK8yvsxcpxURqMEG2P2y7m8bSoD5A5Pt5kw44GHhne/UVWJr0zj3K5+wj8YtnpbVLPJw
	 5N5umlxXfAM8Q0W8myHVZcjb+qmO9mOnnCARmVxSJozBi7EaoWzcj8jtuCtJEM5lchJIUwTWe1sx
	 jgpiMTG1umAt2soO4XLKBdwMg6UahZo5gXLtsyYb//tAGEEm+EWGvZMp+htDBGqH3vs8wPgjPzFT
	 Qv3MWgO9ZFaInFk6qsXNEkXas/dfxkyRcc/4pW/V7NlBhSH6vPbpgpE6Hp+r3VmJIVtf6BUpryCe
	 GzGYceRyJU6hvOjWyP0OVP+g7S5XlDnWQeSJMAWwliQlBU5T/6MsMWGO8MLfV9ISyUQ/5zgSz48J
	 9roD8=
X-QQ-XMRINFO: OWPUhxQsoeAVwkVaQIEGSKwwgKCxK/fD5g==
From: Felix Gu <gu_0233@qq.com>
Date: Fri, 16 Jan 2026 20:54:39 +0800
Subject: [PATCH] firmware: arm_scpi: Fix a reference leak on device node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-OQ-MSGID: <20260116-arm_scpi-v1-1-a9692a4b86ef@qq.com>
X-B4-Tracking: v=1; b=H4sIAA41amkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0Mz3cSi3Pji5IJMXQNDY6NEy9TUVINkIyWg8oKi1LTMCrBR0bG1tQA
 pdV6uWgAAAA==
X-Change-ID: 20260116-arm_scpi-0132a9eee0c2
To: Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <gu_0233@qq.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768568080; l=936;
 i=gu_0233@qq.com; h=from:subject:message-id;
 bh=8/Sq8StM0qXW5/FciyUQix3rskELa+xfqwbu9DohIkM=;
 b=UUtDXrPKMygBcY8JVWTKhqAQ4+cB1V3jx2cl42pVNs1JZPzjsRKypTST6kcL/xg7X+m2l69ac
 k1GWZpbePhYDOEgJQaSfe0rmpTvm2dEhjbOdBS1/xgUa6hYK01lfvu2
X-Developer-Key: i=gu_0233@qq.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_045445_060870_3360DBD9 
X-CRM114-Status: UNSURE (   9.45  )
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

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In scpi_dev_domain_id, it does not release the reference.

Fixes: 45ca7df7c345 ("firmware: arm_scpi: add support to populate OPPs and get transition latency")

Signed-off-by: Felix Gu <gu_0233@qq.com>
---
 drivers/firmware/arm_scpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/arm_scpi.c b/drivers/firmware/arm_scpi.c
index 87c323de17b9..b6233f81ef3e 100644
--- a/drivers/firmware/arm_scpi.c
+++ b/drivers/firmware/arm_scpi.c
@@ -665,6 +665,7 @@ static int scpi_dev_domain_id(struct device *dev)
 				       0, &clkspec))
 		return -EINVAL;
 
+	of_node_put(clkspec.np);
 	return clkspec.args[0];
 }
 

---
base-commit: 9b7977f9e39b7768c70c2aa497f04e7569fd3e00
change-id: 20260116-arm_scpi-0132a9eee0c2

Best regards,
-- 
Felix Gu <gu_0233@qq.com>



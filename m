Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FF6CCD192
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=edgJ+UnzHfu+Kla+0Dy39eOF/WXmrxnMu3maKbz+O2c=; b=AMPmcrpBiAkadsDrdcnI27WWzJ
	Jbq8TC+hUKcNA3aBY/dR+Jn/+xw19+BjjCo9x7IAjciq9qNXxsVeEKltd9qmYSMyDuYO7KDPGS7Ft
	SAYQSQkdeApBhGvrD6TZ85wyjANk4QmzIly8dn4pWYa0s3mGfSAv1qvxl0USHz+5UqQlx2EdIDSQA
	Lg07PQy5SjQf1mrwFBPKAjN/LTOA1DRRA6twEIm5YY+uQxoWgrAO8tcL4K4xEqsQC9icugzgMcEhW
	2IJalaH1T+Mutoq7iQHt5gzAToRVrZ3XekoScaoTzJ14waHvZr+sHntZwGBbvnxGcdZR2+pl1mz+j
	GbZHyErw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Knn-0000000Dl0b-0USA;
	Mon, 13 Oct 2025 15:49:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Knl-0000000Dl0C-3bXk
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=edgJ+UnzHfu+Kla+0Dy39eOF/WXmrxnMu3maKbz+O2c=; b=coHbTFlRe4lwi8dggJ/ma5xxPN
	5s5xTjCLl4+KXoq+icZlN8hxycXOH7UU4iRxAfqjitARpwcucPvWWgA1YrnP/mrnAVWxL2960Bkh3
	lTdBgmHBo8zL5qAEaMSNbpOdILc8r8q7RR4kuGIp8hxJTluLmQ63Zv9DvpvyrN3xDbijmDpaMIxK4
	yVbXkWUtCB7RhfKsaiAxys1C2J6fXyhiJ3li2x5YDja7szV+ZSAMmBoVB9dD0X360GYGjPxCso8PI
	J4R2PbvUnAlOeLbizXUZjc/rSbepwRv1lzyeezuTwjvzBRmnm9iUPvq6o7xlfmxYVwVC7OOUzdA1J
	gH/RBXdQ==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Knh-00000004RCZ-0qUm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 750FE48989;
	Mon, 13 Oct 2025 15:49:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4A1A7C4CEE7;
	Mon, 13 Oct 2025 15:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760370565;
	bh=YIPVFumAT9DHDl+3NSoby0+v8/FmUF2QL269vIj3vhQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=ksgnG4GBbWOJxeQTzloKur8JW68127xr+1JOQt2hPE+McNJnuJ+vigSYO/NGqTW2w
	 f01RstPL41vUb+C9ZjqdFjR0oa008euBoOvMXr8FIrAwb6TdgQG+T5MM/0pwRMQASJ
	 bkw1A1cZpREPjEl9LVFdjs0WWSAiCfpqsil/Cfvl03tqsP2vjCQztNiga/1/phGsKj
	 RDTIqI74YxENgYrZ/lUn6Vos1x51zE5dzV0sEofnoX7CVSV7EA7ISAQfDIFqrFqsdu
	 dyztcLd3MXLEfhFQcyf91Lzgu0GzhLdw7b+pfhy/K4Kh940lQbiWqaEmcGDfTya++a
	 KV2YoVZ7LSjjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 361EDCCD18E;
	Mon, 13 Oct 2025 15:49:25 +0000 (UTC)
From: Anthony Brandon via B4 Relay <devnull+anthony.amarulasolutions.com@kernel.org>
Date: Mon, 13 Oct 2025 17:48:49 +0200
Subject: [PATCH v5] dmaengine: xilinx: xdma: Fix regmap max_register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-xdma-max-reg-v5-1-83efeedce19d@amarulasolutions.com>
X-B4-Tracking: v=1; b=H4sIAGAf7WgC/33OSw6CMBCA4auYrq1h+uDhynsYFwOt0ASoaYFgC
 Hd3cGVIZPlPZr7MwqINzkZ2PS0s2MlF53sKfT6xqsG+ttwZaiYSoZMiAT6bDnmHMw+25pCqokq
 VLqTOGZ28gn26+cvdH9SNi4MP768+wTb9A03AgZcpJkqnYE0JN+wwjC1G344D/RQvle/YZk7iy
 BHkPFFmQmIGeWUOHPnriJ0jydEbVOZGlKAPHPXryJ2jyMkLlQmATNPKH2dd1w9iAz6ziwEAAA=
 =
X-Change-ID: 20250901-xdma-max-reg-1649c6459358
To: Lizhi Hou <lizhi.hou@amd.com>, Brian Xu <brian.xu@amd.com>, 
 Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, 
 Vinod Koul <vkoul@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Sonal Santan <sonal.santan@amd.com>, Max Zhen <max.zhen@amd.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
 Alexander Stein <alexander.stein@ew.tq-group.com>, 
 Anthony Brandon <anthony@amarulasolutions.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3329;
 i=anthony@amarulasolutions.com; h=from:subject:message-id;
 bh=zm9B3BfNwF6YoIlqBfCv8ID8sIfD6lc0Mod18hncI6s=;
 b=owGbwMvMwCUWIi5b4HjluATjabUkhoy38i3rlObXltcKZGfnZTPlh9lcYd6vyn/49ZLII2Z7V
 zfmbuLqKGVhEONikBVTZCnXkef1UK4rV5r5xBhmDisTyBAGLk4BmIjSK0aG74I+Eye1VMtoRaSf
 vfenvyH4HtOzP/dPvvCf3pkzt2STEcP/ml6O2V2P+g8ziN2LO621z2pZv9of2R0yt3/ofpY4s72
 eDwA=
X-Developer-Key: i=anthony@amarulasolutions.com; a=openpgp;
 fpr=772C1F0D48237E772299E43354171D7041D4C718
X-Endpoint-Received: by B4 Relay for anthony@amarulasolutions.com/default
 with auth_id=505
X-Original-From: Anthony Brandon <anthony@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_164929_829615_7D38C5EA 
X-CRM114-Status: GOOD (  13.90  )
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
Reply-To: anthony@amarulasolutions.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Anthony Brandon <anthony@amarulasolutions.com>

The max_register field is assigned the size of the register memory
region instead of the offset of the last register.
The result is that reading from the regmap via debugfs can cause
a segmentation fault:

tail /sys/kernel/debug/regmap/xdma.1.auto/registers
Unable to handle kernel paging request at virtual address ffff800082f70000
Mem abort info:
  ESR = 0x0000000096000007
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x07: level 3 translation fault
[...]
Call trace:
 regmap_mmio_read32le+0x10/0x30
 _regmap_bus_reg_read+0x74/0xc0
 _regmap_read+0x68/0x198
 regmap_read+0x54/0x88
 regmap_read_debugfs+0x140/0x380
 regmap_map_read_file+0x30/0x48
 full_proxy_read+0x68/0xc8
 vfs_read+0xcc/0x310
 ksys_read+0x7c/0x120
 __arm64_sys_read+0x24/0x40
 invoke_syscall.constprop.0+0x64/0x108
 do_el0_svc+0xb0/0xd8
 el0_svc+0x38/0x130
 el0t_64_sync_handler+0x120/0x138
 el0t_64_sync+0x194/0x198
Code: aa1e03e9 d503201f f9400000 8b214000 (b9400000)
---[ end trace 0000000000000000 ]---
note: tail[1217] exited with irqs disabled
note: tail[1217] exited with preempt_count 1
Segmentation fault

Fixes: 17ce252266c7 ("dmaengine: xilinx: xdma: Add xilinx xdma driver")
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
Reviewed-by: Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Anthony Brandon <anthony@amarulasolutions.com>
---
Changes in v5:
- Update Reviewed-by
- Link to v4: https://lore.kernel.org/r/20250903-xdma-max-reg-v4-1-894721175025@amarulasolutions.com

Changes in v4:
- Reorder Reviewed-by
- Link to v3: https://lore.kernel.org/r/20250902-xdma-max-reg-v3-1-5fa37b8d2b15@amarulasolutions.com

Changes in v3:
- Add Fixes tag
- Link to v2: https://lore.kernel.org/r/20250901-xdma-max-reg-v2-1-fa3723a718cd@amarulasolutions.com

Changes in v2:
- Define new constant XDMA_MAX_REG_OFFSET and use that.
- Link to v1: https://lore.kernel.org/r/20250901-xdma-max-reg-v1-1-b6a04561edb1@amarulasolutions.com
---
 drivers/dma/xilinx/xdma-regs.h | 1 +
 drivers/dma/xilinx/xdma.c      | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/dma/xilinx/xdma-regs.h b/drivers/dma/xilinx/xdma-regs.h
index 6ad08878e93862b770febb71b8bc85e66813428e..70bca92621aa41b0367d1e236b3e276344a26320 100644
--- a/drivers/dma/xilinx/xdma-regs.h
+++ b/drivers/dma/xilinx/xdma-regs.h
@@ -9,6 +9,7 @@
 
 /* The length of register space exposed to host */
 #define XDMA_REG_SPACE_LEN	65536
+#define XDMA_MAX_REG_OFFSET	(XDMA_REG_SPACE_LEN - 4)
 
 /*
  * maximum number of DMA channels for each direction:
diff --git a/drivers/dma/xilinx/xdma.c b/drivers/dma/xilinx/xdma.c
index 0d88b1a670e142dac90d09c515809faa2476a816..5ecf8223c112e468c79ce635398ba393a535b9e0 100644
--- a/drivers/dma/xilinx/xdma.c
+++ b/drivers/dma/xilinx/xdma.c
@@ -38,7 +38,7 @@ static const struct regmap_config xdma_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,
-	.max_register = XDMA_REG_SPACE_LEN,
+	.max_register = XDMA_MAX_REG_OFFSET,
 };
 
 /**

---
base-commit: 52ba76324a9d7c39830c850999210a36ef023cde
change-id: 20250901-xdma-max-reg-1649c6459358

Best regards,
-- 
Anthony Brandon <anthony@amarulasolutions.com>




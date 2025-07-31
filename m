Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA37C87FCC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UnphpVcmPzNJhcjLqjwRNs8+L4EyqXZIXU2FKe5UNDU=; b=phSYMKj5Nk9avWIkLEB7xZwIxa
	0zoKICoFL9QwaRdHr11BDS63qIMYJ2FnkLNm6evEB/qW6FRRIob9kMC+Roupcyji36UtTl7+OVp/Y
	azvR/tZ776z0SKJ9Q/S5A1sYX3pZn9qvOgGq2BMtuhfr+MirpKKRCWpNYmAxGqJDjBkbQz099NsY1
	jxI8iho4xqedB1+2RYggLlZvXwqK2sR02ngElsibsagWuQrqe5JP15VFPGAIse9Nra23MctQG6sp/
	niuOXWNtuVc48kbD63d876dF6c+3nCF0DPkhMNp1dDUH3wZht+5fyWOVP86SYMwd9y3IeK99TZK/f
	TnTXn7WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQYo-00000003NLE-1zfT;
	Thu, 31 Jul 2025 10:30:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQTw-00000003Mba-0ajB;
	Thu, 31 Jul 2025 10:25:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 50911601F0;
	Thu, 31 Jul 2025 10:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA37C4CEF5;
	Thu, 31 Jul 2025 10:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753957548;
	bh=7Fd9WJGGEH/ptepLhWaVJOgjnuQ/nuG0jrZ0GePe7JY=;
	h=From:Date:Subject:To:Cc:From;
	b=YNacCbqze0RsKwE7YCQEKcwKKwGPXhylIhwMfrKkTxSbtoubtMahb/DAqCA6jmGge
	 ztQyR3nWPSlsdbftw6/HdPu3S9NCLbLMHnKYdjxPa0zmtealEEwjUnmZiLF/FN1Ayn
	 +GMM39kxKxmCKHp5sUtY+10IE5glcCRLfvybGNFIhyTCds1NYvU/fXevEp/mKi76yT
	 3a2DoD3IUxMXK6exw2bBhUPpMhh1onEewA9xJ1aQfcrZ90+R/W6Wo+7GY348k/vxCI
	 v+7USAytiwXMc8V9h4mUBOk5cy2Mu+kWgpU0WmTSdcBvqUUrnUbyNrM3bl2metrBZl
	 1Swi1/xlImuDA==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Thu, 31 Jul 2025 12:25:21 +0200
Subject: [PATCH net] net: airoha: npu: Add missing MODULE_FIRMWARE macros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-airoha-npu-missing-module-firmware-v1-1-450c6cc50ce6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJBEi2gC/x3NwQqDMAyA4VeRnA20SinsVcYOcY0asK0kuA3Ed
 1/x+F3+/wRjFTZ4dCcof8Sklgbfd/BeqSyMkpphcENwcfRIonUlLPuBWcykLJhrOjbGWTR/SRl
 j9G5KLgQaA7TQrjzL7548X9f1B9NBQAt0AAAA
X-Change-ID: 20250731-airoha-npu-missing-module-firmware-7710bd055a35
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
 Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
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

Introduce missing MODULE_FIRMWARE definitions for firmware autoload.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_npu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/airoha/airoha_npu.c b/drivers/net/ethernet/airoha/airoha_npu.c
index 9ab964c536e11173e3e3bb4854b4f886c75a0051..a802f95df99dd693293b1c0cc0fbf09afab2c835 100644
--- a/drivers/net/ethernet/airoha/airoha_npu.c
+++ b/drivers/net/ethernet/airoha/airoha_npu.c
@@ -579,6 +579,8 @@ static struct platform_driver airoha_npu_driver = {
 };
 module_platform_driver(airoha_npu_driver);
 
+MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_DATA);
+MODULE_FIRMWARE(NPU_EN7581_FIRMWARE_RV32);
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("Lorenzo Bianconi <lorenzo@kernel.org>");
 MODULE_DESCRIPTION("Airoha Network Processor Unit driver");

---
base-commit: 759dfc7d04bab1b0b86113f1164dc1fec192b859
change-id: 20250731-airoha-npu-missing-module-firmware-7710bd055a35

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>



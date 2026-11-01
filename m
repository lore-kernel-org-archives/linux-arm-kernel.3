Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AD8606A324
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 17:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SOCPxxqy;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBQdCjNf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:Message-Id:Content-Type:MIME-Version:Subject:
	Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=04jB84VdLzfHkj69mo945MaBrRiV6cJ1AnFmBuXNdhA=; b=SOCPxxqytf7f7w32KFRuUClhIU
	CgRpbKTL78jgTs5YvtjH47JkHhZ8bMAj5jEGryNP7rvsZ6JupsUHy1KxxZi+VTshMnl+cZF1zJiq4
	rfyruVP6PN5B1h2ZZMxZcpoQwNC7M3irbIOVVMa8HHfqquNs0ky65kGnuoy5IIq3hwSZ18mZVM+YX
	5P9q6ntcrONj1gejvNCmrDkcHoQc40WgjgZ60h2awtxTs19BhvA03M/uvyG+dRtGxBdd25JTAkqQo
	EciBZ4Jjfc4YPVfr6n+2Q0FDpcqO9FJQMVv/8HJq6G3XIF98+0ea18nGEIZ9bQ7s4d2yez+yCuerY
	QCADXzhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNZir-0000000EjTH-10YX;
	Sun, 01 Nov 2026 17:52:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNZiq-0000000EjTB-2qDh
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 17:52:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDB1D42E0D;
	Sun,  1 Nov 2026 17:51:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793555519;
	b=sXfzo9104f/43Yg7gxa/BGTOo2ol35gBhWV5el5hFbsS8a+D8CL5rP0D0y4nizJYQ6wl
	 uf16k83QVYGcfO9AhXavWdcP/f5GFDU5C9fM5NDu4Oc5XoW5PCnPDNmx1+9tOBKSmV/PV
	 xeZcK5ylOvTKxCn6w+qDvEbNLDNtSfA8eIeX3NB4Q2zCLhwEwpHGKdwsu1vEErYQQivfE
	 qFnDQcOc6/vP6W1LYJD7KBvNgVSDFAntg3RjsSYckL7ffaFZYlHrCduVvYD1r0Nb5ITUd
	 gmVyAPbwf7R+fcftFFwC4H5XFchc48W7MUR4cNU3996YG0rPFenOa2Fi3DzN5+IbHLA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793555519;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=04jB84VdLzfHkj69mo945MaBrRiV6cJ1AnFmBuXNdhA=;
	b=F4ZG8tWI5//FZhb745pETv57rQESqopzLGLklVUEC7FkXrX6+OBcGlUVWubn1sYGSpMD
	 aZ+oIpiELGICO5fQ7xkElymNutdkhSRefQYO6+qQGG+9xswPphcf6I0XhO/hZuL7etnRN
	 0P/diIDCKFCNcsMtqlC1Eel184mpXprZMyMdxCgd8z/g2BSoaWaktXg8WSiqhNvTorRQe
	 K3rLUpkepYOuOJhCUarJBsc+5tpcv6iS/YGAJ2m/CHlqmRZQ4w5ZeZ8jCIfxBMGeZQ4CC
	 QVPYT9c23dIJwc5UtquNMu2dlVgcxzunu7AhiLGizrW+oZyR1zArlK6St7kiAwByU/w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 439791F000C1;
	Sun,  1 Nov 2026 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793555519;
	bh=04jB84VdLzfHkj69mo945MaBrRiV6cJ1AnFmBuXNdhA=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=MBQdCjNfTBfbhDQR4/BGiRo01HzNxda0XO/2zdWa+JlYjCiz9sqij/hr30rXPBHK7
	 0SVisKVATYmkaVX8LlZS9ExdR8TNCf5hzKH/vH1etuPlUHdQHy9DRcdtGNpKyx+aWt
	 G85yud2cRcALh8FUIOQF+9Cm6ps9DSRxxNlZZf7VQ4OkBLo/+SrkdF71qd/T2URyCH
	 dD11LMF+XeFk57Sw5WH8NvYN9/I3tqY9q+71DfrWea2eU31DBm9nfGXOefdWDh0KWw
	 jfzK9I/89/c6x47yyW20O4EEdJApWGKtC43aRIP1OBq/mCfGL5K5GBr+7a7oDRXLcu
	 VvwGYrJFu3OnA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A717846223;
	Sun,  1 Nov 2026 17:51:58 +0000 (UTC)
From: Yuvan Shen via B4 Relay <devnull+yuvanshen09.gmail.com@kernel.org>
Date: Sun, 01 Nov 2026 11:51:58 -0600
Subject: [PATCH] mfd: macsmc: Hold the lock while reading key info
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261101-upstream-macsmc-key-info-v1-1-fa9ff863d199@gmail.com>
X-B4-Tracking: v=1; b=H4sIAD1852oC/yWMQQ6CQAxFr0K6tpEZBROvYliUsUjVGUg7GA3h7
 oIu389/bwZjFTY4FzMov8RkSCu4XQGhp3RjlOvK4EtfO1c6nEbLyhQxUrAY8MEflNQNeHLH4Cr
 qDnXlYdVH5U7ev/Sl+bNN7Z1D3nrboyVjbJVS6LcpkqSnJN5HsswKy/IF2U9hJp4AAAA=
X-Change-ID: 20261101-upstream-macsmc-key-info-714c15af3652
To: Lee Jones <lee@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Yuvan Shen <yuvanshen09@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793555518; l=1529;
 i=yuvanshen09@gmail.com; s=20261101; h=from:subject:message-id;
 bh=z1N8QvE7NPiEd4ppeCID6vYGqTPd3Hl1S5pezXvfG2o=;
 b=BQVABoR5+DuuysFyDMIucZZjqkKYPOqazylEB0iamxcetVukCPamNuwomHGvn6It7Fr/X+0ig
 lQwLiEsF6vTB5VoiKka3aujTpTF6rN+mtKM0BJDJACUgCOFDMqRiqzt
X-Developer-Key: i=yuvanshen09@gmail.com; a=ed25519;
 pk=jK3+w+YlV0oJPk7h5w6yT7jKMg0+4IkP9H/eGB+ImJA=
X-Endpoint-Received: by B4 Relay for yuvanshen09@gmail.com/20261101 with
 auth_id=1380
X-Original-From: Yuvan Shen <yuvanshen09@gmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: yuvanshen09@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Yuvan Shen <yuvanshen09@gmail.com>

apple_smc_get_key_info() releases the SMC mutex when apple_smc_cmd()
returns, and only then copies the reply out of the shared memory buffer.
A command issued by another thread in between can overwrite the buffer,
so the key's size, type and flags can come from a different reply. The
hwmon and power sub-devices call it from their probe functions, while
the other sub-devices may already be issuing commands.

Hold the mutex until the reply has been copied, as apple_smc_read() and
apple_smc_write() do.

Fixes: e038d985c982 ("mfd: Add Apple Silicon System Management Controller")
Cc: stable@vger.kernel.org
Signed-off-by: Yuvan Shen <yuvanshen09@gmail.com>
---
 drivers/mfd/macsmc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/macsmc.c b/drivers/mfd/macsmc.c
index 514cba7dc897..4dbaacc7eb3d 100644
--- a/drivers/mfd/macsmc.c
+++ b/drivers/mfd/macsmc.c
@@ -210,7 +210,9 @@ int apple_smc_get_key_info(struct apple_smc *smc, smc_key key, struct apple_smc_
 	u8 key_info[6];
 	int ret;
 
-	ret = apple_smc_cmd(smc, SMC_MSG_GET_KEY_INFO, key, 0, 0, NULL);
+	guard(mutex)(&smc->mutex);
+
+	ret = apple_smc_cmd_locked(smc, SMC_MSG_GET_KEY_INFO, key, 0, 0, NULL);
 	if (ret >= 0 && info) {
 		memcpy_fromio(key_info, smc->shmem.iomem, sizeof(key_info));
 		info->size = key_info[0];

---
base-commit: d89e1d186ec9271bf78e62771779e9fc03bf0fc3
change-id: 20261101-upstream-macsmc-key-info-714c15af3652

Best regards,
--  
Yuvan Shen <yuvanshen09@gmail.com>




Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B141606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 01:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QTnQUZTZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rSPRvSyZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=t2wSWUxJ47IKpjldIgoNYRsgVyXDkMkOl01ADtWY7xk=; b=QTnQUZTZJclpvbmNslxIPSele2
	tm7pR2rjpzbZXwMwe19AZC4BLcM0E5D+Iq/+xcQfFfa1Qo1/qgkIwB3NzM6NeyFA8B6f69g8DURgr
	DUI1xyissZY9uqC2bJHQH2FKmTeYn1N2OImIBg8MFiKLGBDx1el9lyjlvJYwqb7pBLVAeyysEvwlS
	Wk7rBSOT2OCs3Zs7Dldubh1rSYvve4lk0M4vaQbKWk9+/hkXJ7UzLdq3Fbcw1zsChaczWO5Rpnr+r
	egDBHq0g9tQKb/jFxhJxhub+64b7W8XUCQKRz4srH2MnCXewMBdnVLlOxFuxHXoPqq4XcC9MbtZJ4
	Kw2dn9dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8PM-0000000AxXe-28yb;
	Fri, 06 Nov 2026 01:06:20 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP8PK-0000000AxX8-14oX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 01:06:19 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-91c9cfd8b1bso1125686d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 17:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793927177; x=1794531977; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t2wSWUxJ47IKpjldIgoNYRsgVyXDkMkOl01ADtWY7xk=;
        b=rSPRvSyZHkoojOi4/+yJbdhnGzbmtWQPjrkQXB0jLrDTKA3e8kg/Y10CpMN9eG717M
         KNK49xBFe4nf1/ZXg5j2lmRjFAcB+waas0AUat5n69cUjlraEio1dqoumVpUXL89fFtr
         WUb3TIbEpNrsht385gUgRcPD/TfTBFvzhicAVBuo6JpcJGVblwFP9MNKx2WfweCU9d9B
         3WvImtt1mFxzAlWFGBciRLM57smJE5H/NlwtQj16TeVkDye9S/YfE1yOVO9P48TcQeSe
         e+hziKSw21AKTQyY6RzxFNobvposIPBNEQ4BSm0e1EBEUro9dfqfM3SlQiPuHsj27tW7
         6UaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793927177; x=1794531977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t2wSWUxJ47IKpjldIgoNYRsgVyXDkMkOl01ADtWY7xk=;
        b=tmOqYTCykOiOP5j2NkXA326AjxIsRBsjCYv9mXF1A3IFCUV2syIom5UrKzBjHZWZyQ
         v+8AkwY3zBQxi1qlWMiqOaDuMaQasgc/zTY2JfrHhlt4uTUkkqDVyIUTeAK3Qz5iGT0g
         IcUL25+imWHpIOGJYKspJ92toUheBrih/r9ltovhcOXs5qfRwB7feWVtJ9PtnsfykW8A
         GeDkaP89WqNI70pSNZJyIVM8+ZRxlTuGFWxCRNYWkQwqQ6FfwRuu6eowJ3bCroY/KiK1
         QQLKxT1EDMaLYLN7C0nV+sIpcUMqdPcbA3k1/GZ8lCyjMOBgvTB8ogcdP7crnMIZbitu
         sXtg==
X-Forwarded-Encrypted: i=1; AKwUvBzYKxdMftrnIk9rdEWnpAtXEHDWi5g6h7mfKvLEeN3wtacjsS+qevK6XQxmr0bV/PUpdKH8/0wJnlxUPU9s0liB@lists.infradead.org
X-Gm-Message-State: APuU4Z+s0pLGkw/aFvJnf20z+DWTa88vt1h3xSDylyU3yOe+4cWbo4X2
	cMcVqSwxi2x26OLkvh/xhwBJGUeiERDTDPEbSQC6DfbZtF5qWgrGs+rX
X-Gm-Gg: AYBFou0uufjhWH22JxZh6OEBkpx85pOrCT3CzCEi6mYaxWdqDQlS+47JyVAhn+9yFCI
	tNvh/vBHCYtAG9oAks7Ac3meicrYLSXkAUN8d3BYAZD6TXW4JLHg2iXy1AyzQhUhOmblzg9oXa8
	Uba/zow1csvthq9gMBCKC2HkbJeZ3RVOeEeLKnZ0qrwOLAo07qGD+Yll5AFQqlNOktQN3anB7aA
	0h++DRgV1Oj1j4Ndzww/cL/A4+H+9B46KPN5XQG3QNL/eYLeA+XB2IsMQj8S97Rzlejx7oaZb4D
	qw2Bq2uwwx6hojFIC7KHQdKvqQC4NfZePDQQELPvBweSWvRmoKRzCPfRmTz6VHbY7KRqMpnsBwe
	Q3KIcPF94aiJMv/SMnCmwAKtg8eyYmJVCVjgd2oSWyXxx8v2xjJ782aSIhFRKpxIopL1PsxX/x4
	Dgsr7xZnjsxCRKJ3Yj5Ep0k4X9JPGxrMnHwq+ZYAdFPNExE8Oj9AFQGb741pNtMj+V4bJBFoXPh
	VpVn4TvPOLPguB3QkcvKI21C1acf1gScXMSPa4g0jxUiOXBKofI1v1jvxv5psbpH6Ti7CoPyDoG
	iZ26kH6R540YJ+KXSg==
X-Received: by 2002:a05:620a:4449:b0:93f:115:7338 with SMTP id af79cd13be357-945f353bbf4mr138733785a.54.1793927176554;
        Thu, 05 Nov 2026 17:06:16 -0800 (PST)
Received: from linux.. ([8.34.174.240])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5c1ea1asm20043685a.37.2026.11.05.17.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 17:06:16 -0800 (PST)
From: Changyul Lee <lcy8047@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Vladimir Murzin <vladimir.murzin@arm.com>,
	linux-serial@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Changyul Lee <lcy8047@gmail.com>
Subject: [PATCH] serial: mps2-uart: Remove the ports_idr entry when probe fails
Date: Thu,  5 Nov 2026 20:06:11 -0500
Message-ID: <20261106010611.1708587-1-lcy8047@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_170618_305785_48EF9163 
X-CRM114-Status: GOOD (  16.08  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mps2_of_get_port() adds mps_port to ports_idr, but mps2_serial_probe()
does not remove the entry when mps2_init_port() or uart_add_one_port()
fails. mps_port is allocated with devm_kzalloc(), so devres frees it
when probe fails, while ports_idr still points to it. When another port
later registers the console, mps2_uart_console_setup() looks up the
console index in ports_idr and uses the freed mps_port:

  BUG: KASAN: slab-use-after-free in uart_set_options+0x650/0x7a4
  Read of size 8 at addr ffff0000018c41a0 by task swapper/0/1
  Call trace:
   uart_set_options
   mps2_uart_console_setup
   try_enable_preferred_console
   register_console
   serial_core_register_port
   serial_ctrl_register_port
   uart_add_one_port
   mps2_serial_probe
  ...
  Freed by task 1:
   kfree
   dr_node_free
   devres_release_all
   device_unbind_cleanup
   really_probe

The stale entry also keeps the ID in use. A re-probe of the port (e.g.
after -EPROBE_DEFER) then gets a different ID than its alias.

Remove the entry on both error paths.

Fixes: 9f25e07b882b ("serial: mps2-uart: move to dynamic port allocation")
Signed-off-by: Changyul Lee <lcy8047@gmail.com>
---

Notes:
    Found with a static analysis tool we are developing.
    
    Reproduced in QEMU (arm64 virt, CONFIG_COMPILE_TEST, KASAN) with two
    arm,mps2-uart nodes added to the device tree: serial0 without a
    "clocks" property, so devm_clk_get() fails after the ID is allocated,
    and serial1 with a fixed clock, booted with console=ttyMPS0. Without
    this patch KASAN reports the use-after-free above. With it, there is no
    KASAN report and the boot goes on until it looks for a root filesystem
    (the test has none).
    Not tested on MPS2 hardware.

 drivers/tty/serial/mps2-uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/mps2-uart.c b/drivers/tty/serial/mps2-uart.c
index 2a4c09f3a834..c39aa534b822 100644
--- a/drivers/tty/serial/mps2-uart.c
+++ b/drivers/tty/serial/mps2-uart.c
@@ -590,15 +590,19 @@ static int mps2_serial_probe(struct platform_device *pdev)
 
 	ret = mps2_init_port(pdev, mps_port);
 	if (ret)
-		return ret;
+		goto err_remove_id;
 
 	ret = uart_add_one_port(&mps2_uart_driver, &mps_port->port);
 	if (ret)
-		return ret;
+		goto err_remove_id;
 
 	platform_set_drvdata(pdev, mps_port);
 
 	return 0;
+
+err_remove_id:
+	idr_remove(&ports_idr, mps_port->port.line);
+	return ret;
 }
 
 #ifdef CONFIG_OF

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0



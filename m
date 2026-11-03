Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F1456083616
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vbCNiviJ;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=AKxvzUaM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=8CEWkT7YqUsdXweSEdsC/4Zt6jRvvN21t2iGWXTpN6Y=; b=vbCNiviJ+6Rs279M85l1VGRk0g
	5pUgRKvFjdBtktxkNYDGq1Ff5L3/4gBLP1swWbHgVcCD3BojJ7N4lAmtsS2asNBo0G9Fs0uhiFz4o
	ZalRElrVAyoDpTivy++v6wetuztZc6X+Bcn5ucMaPzeXwR0ckH/49pmyoaHdeXI8p7q5jJzKev5Ms
	zNgC/73R9QB+5oZvt2Vd5FYoPYBxpNlq+kwEM0Httvuros5K71IC2GV+Qx8ezlco8RfUDKDBw0Z0O
	Z8vkbLqIg+kOsQAdRzFSjVsHPPgHw4CvywevVnTSEB40bzm3ah+HHa9XXC3OG20ClnIvnvxZVuhgw
	tIDsH9fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrH-00000002md9-49nx;
	Tue, 03 Nov 2026 14:51:31 +0000
Received: from mx1.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::107])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFrF-00000002may-1IQF;
	Tue, 03 Nov 2026 14:51:30 +0000
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 85DFE20282F;
	Tue, 03 Nov 2026 15:51:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8CEWkT7YqUsdXweSEdsC/4Zt6jRvvN21t2iGWXTpN6Y=;
	b=AKxvzUaMon+g0eGzCnebblLH0CQcxu8Mo/fFmm8bfgtmnb02+x1Vy5RY1vosc/Dw6PLVz0
	iRKifvYEPlj5/s7iWFg1uVg/oUekVa6FeN8gSMs2n7hniuC8liZ/LCHiE1Wayt8dKd+xC/
	0HWs26UU6iYCS/AuSEj8Craj6vU+On1yXrQ0YBdoPrSO4fA8n9o8nX4Fc4/3f9hHBDNBDf
	8+cZj+HpHZHxmGBd8cISMMjBkY2RFlLvZupD3w7qL8BQC845KA4iQLM0RGwfABSaMyZ6J5
	n7gODCunrVoOj24Xg23eiZo6dtn6YfFYG4eNG16MN0XA4aesJAR+xn89xIT2lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793717482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8CEWkT7YqUsdXweSEdsC/4Zt6jRvvN21t2iGWXTpN6Y=;
	b=J1YgoWoR056rCWe9m7gmbluw3/CwDa8OIITK8tjGD2eFfT7dUXhwOEyeIzKBDBbiVb10qu
	LXbERBF3J09rvwzzJrcRwU3I+6y7pxSysu2RCSgU/MmBjduzbNSuaeqUApW9iUtA9P1CYe
	a7EEvwH3mCR/3DMV6uqGyE0iyxRODSLcNpDxJPUY4hod4qkj3ZgaeZYpGjfenWIUybOUQs
	1HRNdsOa0DOm/sRcF7/WyZGp0XupTHtswpxzFMfpM9VET3UYEICYB8hfasa/Zv7ElBAnEw
	2ykIAIkl2V+d1zgGBxaHKCG0HtPZ4ceq9mgR4HWFgtFRwjXH7gKnymwshWYhJQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-drehscheibe.grey.stw.pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793717482; a=rsa-sha256;
	cv=none;
	b=FlBlrPWLFpbVGtVUDlo+TNRTijjaKFBomt6Ys7PgXV8sXb/txPBFgyoAcFHzNBCb2O89lZ
	Wi+mJiMIQVCmECccsrtmnvXai0v73WrvlemN2YdULLu8ZZ/cjONxI3GMTIST/HTnwlml0+
	ougMKkF+V0D3D4fJTCNUMcFmU9/3GFRpLNq4rV/OD0gOyyKTwsuueAy1ckCSDjxgJF4V2B
	aWBR65LqU8FwHC/+T+tato3U1QfM9PtfLAoUCvLnAeBiaBLXnNyPb8VkfpuaHYDmHXdh5d
	2BOyqE56pn2OjATD86azrqrGYzQnNR8Ll03qkn96TMoGLWfC5m3eLJwCNgJMNg==
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1xOFr8-002SzQ-1V;
	Tue, 03 Nov 2026 15:51:22 +0100
From: Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 0/8] reset: Use regmap_test_bits to simplify status
 callbacks
Date: Tue, 03 Nov 2026 15:51:20 +0100
Message-Id: <20261103-reset-regmap-test-bits-v1-0-1b33607a76b0@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOj06WoC/yXMwQrCMBCE4Vcpe3YhidJWX0U8JHHarmAt2VWE0
 nc36mXgO8y/kqIIlE7NSgUvUXnMFX7XUJ7iPILlWk3BhdZ7t+cChdUd73FhgxonMWXf5RRSPPY
 HN1A9LwWDvH/h8+VvfaYbsn1rtG0fG+lJgXoAAAA=
X-Change-ID: 20261103-reset-regmap-test-bits-17cb2ba9840f
To: Damien Le Moal <dlemoal@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Philipp Zabel <p.zabel@pengutronix.de>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_065129_542790_2A09A87E 
X-CRM114-Status: UNSURE (   5.16  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A lot of the regmap reset controller drivers open-code a variant
of regmap_test_bits() in their status callback function. Simplify
them by calling regmap_test_bits() instead.

Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>
---
Philipp Zabel (8):
      reset: a10sr: Use regmap_test_bits in a10sr_reset_status
      reset: reset-intel-gw: Use regmap_reset_bits in intel_reset_status
      reset: k210: Use regmap_test_bits in k210_rst_status
      reset: lantiq: Use regmap_test_bits in lantiq_rcu_reset_status
      reset: mpfs: Use regmap_test_bits in mpfs_status
      reset: rzv2h-usb2phy: Use regmap_test_bits in rzv2h_usbphy_reset_status
      reset: zynq: Use regmap_test_bits in zynq_reset_status
      reset: tn48m: Use regmap_test_bits in tn48m_control_status

 drivers/reset/reset-a10sr.c         | 8 +-------
 drivers/reset/reset-intel-gw.c      | 9 ++-------
 drivers/reset/reset-k210.c          | 8 +-------
 drivers/reset/reset-lantiq.c        | 8 +-------
 drivers/reset/reset-mpfs.c          | 9 +--------
 drivers/reset/reset-rzv2h-usb2phy.c | 6 ++----
 drivers/reset/reset-tn48m.c         | 8 ++------
 drivers/reset/reset-zynq.c          | 8 +-------
 8 files changed, 11 insertions(+), 53 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261103-reset-regmap-test-bits-17cb2ba9840f

Best regards,
--  
Philipp Zabel <p.zabel@pengutronix.de>



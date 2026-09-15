Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67989C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q7wi6r9wAePoWVCptBPKcLKqO0Nzc9N9NB8MrkgmWxo=; b=1T+F+lAV/4bTOGXPiOC0m8oOSm
	6GtIzzRgBEV1axtheW6YFWkLfnMbsjdO/C9bilskFtMQeY0K0aNrJxpWEta18SVAOdVIrOlfMtTZ1
	ot4q8ugBpo6QsgMF6///n/BXYeHR+lp7ZShe9+zrldwfs4MS4VPlOvFQ6UOBrauePPMcvFsmJ11Uj
	EhRHBmkNm+ZyWhAsugb7AyOTG6U41HO1NsvjoM7AXHV/q/itbfvNFvSAK4w9/wgAhdmWlPEUmMsO7
	IJbW109H6JXGjonG0oDfUGWH5DugI6x69UdPsF+E3E+OkPL31j77X8hvLH+rLYVKaXhjeX4ZqeMrT
	/nTl/C/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P67-00000005jeA-3X1N;
	Tue, 15 Sep 2026 09:05:03 +0000
Received: from out162-62-57-49.mail.qq.com ([162.62.57.49])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6P64-00000005jbe-0X0U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 09:05:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1789463089; bh=Q7wi6r9wAePoWVCptBPKcLKqO0Nzc9N9NB8MrkgmWxo=;
	h=From:To:Cc:Subject:Date;
	b=ryQmUQn+MABfd6Kli6Jq5yz5Ocr1UaQk+ze64EYDTD6jQQZlplSwHnYS47H8HWQdT
	 PpfHrSGAlyzhPSYIyggkLFVnNyvqwyzXko9dLqRHu56XkU8F/4tf7OaTS3jkKZXa4A
	 wP/HkdqTrxFgKgKThWuum+Pjo7AHybtSAkZhv9GA=
Received: from winnan.localdomain ([2408:8207:7883:f750:f55f:bb89:a2d7:fb33])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 12E94204; Tue, 15 Sep 2026 17:04:46 +0800
X-QQ-mid: xmsmtpt1789463086t9soi69em
Message-ID: <tencent_FC9BD4844FBADF31F931DC723D8F4C3E1808@qq.com>
X-QQ-XMAILINFO: OTDiW3m6JtSJAr5KUinNGlyDnf8h29tlDnDBzEmlhhpm6TSgUqEfM+n5gTcjfo
	 oa2ok5p7JxStcKx8CtV6Uz6t2oCBQgjIVIXq6qI+vo2KhrRAdO4g55GharhrONzFsnJTb+OHI8fh
	 AuuIOZFX/cSbGfDkI3keyAFX+CnflcMgANAzmuX37O/01eXj+5h6QOL3wzoqdjSE8xXPB7kpvgaV
	 BXyNZYrUkmsf8ms0KqrAAA9OdPKCphUZxdFHHtEBMdNOHM6R6V78gQICvfIkLccgWuWWES+cMI8B
	 o1ZdUn0z4d8lWc3HEauSQprZx07t86Wbpdq4GN37t8v56yvrOo3cJgxXWHh9OBAAu+mpbh0TwNoL
	 xWO/5psnCOlk1pc6kZPHM6Dsu0qMDvFP8Oc4/rVzy5gFOO1iqN+60664QuqEWH4+Me4SgJO1OLk4
	 cAhw2+wU7BSTLLg43VRj152qFG7C9EWvpmaTnIQNLWl03HxRpzDHmKifpNm2FbEnr366U2IFMlr2
	 mHmetMJjO3W8JV52QPYoWAkDg9oouvNDjsNbiatt1V/9bBbOF87D/89AYVbeGMhi9A9jRVAenLph
	 Y+tgtESzjZJ3y6ihx28noxnYaYzd/iD3vGHJB5RvgNuNPiJihuoyQ7ZedUODh5vlzzqWYrMHUj5i
	 3eyacnWmAyaYia6Fm9FT8j8no1FPboJKHkgS1QMLeLO1L40dYuF2Hm2iAow7FNbnKarU/XrWSJyd
	 3oQfT6vxxGChVBGiNEw/J+UpfSiSMRG5jd82f5pxbQu3Ct5m/Obt5/oqgivjeGos43lrJeS0TZ4C
	 m7+S/M/8qfXyd33ksETgl0+QOZkUBj12qIpzzMh90/zWS5lSaIexoYl0E8kyn4AZ6ybWlxknA2I9
	 febqgb7DcgWyGPHwN9vJxiQigWyHXQp3l764slLx1cKEYeDo/cHkuhjeUtwkTeMaB1as1TjKXfmj
	 hn4w4IGVGAC4+fuI1w6TpblGLU6qQGdQYviLKECsRH6sKapTJztl+6lMjAkCdW33WPrWqQrmR921
	 M53/XfscCg8VD280lkLrc4fd9FdMaz3M+YaKie66dnoqr3DZsWSbikGLEKimI=
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
From: Xiaonan Chen <chenxiaonan101@qq.com>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xiaonan Chen <chenxiaonan101@qq.com>
Subject: [PATCH] irqchip/gic-v3: Fix typo in eoimode1 comment
Date: Tue, 15 Sep 2026 17:02:43 +0800
X-OQ-MSGID: <20260915090243.170981-1-chenxiaonan101@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_020500_927153_54ADA045 
X-CRM114-Status: GOOD (  11.39  )
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

Drop the duplicated word in the gic_eoimode1_eoi_irq() comment.

Signed-off-by: Xiaonan Chen <chenxiaonan101@qq.com>
---
 drivers/irqchip/irq-gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 6e1fa5b247fc..69ca208eeee6 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -687,7 +687,7 @@ static void gic_eoimode1_eoi_irq(struct irq_data *d)
 {
 	/*
 	 * No need to deactivate an LPI, or an interrupt that
-	 * is is getting forwarded to a vcpu.
+	 * is getting forwarded to a vcpu.
 	 */
 	if (irqd_to_hwirq(d) >= 8192 || irqd_is_forwarded_to_vcpu(d))
 		return;
-- 
2.34.1



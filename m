Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A311CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 08:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=u9AsTUxmyjgLUHtq+jJ/YkeM2AU/tnFtecLAaBwaB/k=; b=2z0rrsAo/y+cB4IS8HNlMy6Q2X
	d+pHzMszrdtq8iSDZRfkNzi+0Z2COOczxICv9VsYCT6bRZaYINWBXCpwbCSuCCcOdzUAdFcEuPj3x
	7+SVI7GCmMwCyS4BuDiiOyQzJ5miyjroBqOXYg8akFY5za7xiczXrxw8Bw5edEY5uMIJRBkyEbA76
	XEkCeR3H7ij4mImNT5dVm++48Cx7/kV9NQ2EUQ9QwtnXkEDfvgXSlKxIGE3NpKTpE56PovFRAfIpH
	RniAnbjEM6dt9zyGcBDhbpRBhD4My828qTxN4sjx1COhOe6HXjKyuw1LfaF3JG/NIbZnwcttZOJ9q
	kVSgS5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIid-00000007NXi-3ozJ;
	Wed, 24 Jun 2026 08:12:23 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIiZ-00000007NXC-2Mj0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 08:12:22 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowABXPONgkTtqLuyvFQ--.23904S2;
	Wed, 24 Jun 2026 16:12:16 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Russell King <linux@armlinux.org.uk>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: configs: sama5: Enable current Microchip KSZ DSA symbols
Date: Wed, 24 Jun 2026 16:12:16 +0800
Message-ID: <20260624081216.75559-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABXPONgkTtqLuyvFQ--.23904S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtF4DJr17tw1xAr4xCFykKrg_yoWkKwcEkr
	WfWw1UGrWrXrWa9r17u39Yga48C3WfG3W8JrnFqw12gw42qF1ayw4kCFyrt3W5W3WUursx
	uFWkZayIyryIvjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbz8FF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfU0iiSUUUUU
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_011220_032060_0D53192A 
X-CRM114-Status: UNSURE (   9.51  )
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

The Microchip KSZ DSA family now uses `NET_DSA_MICROCHIP_KSZ_COMMON`
for the common switch provider and `NET_DSA_MICROCHIP_KSZ_SPI` for SPI
attached switches.

The sama5 defconfig still enables the stale `KSZ9477`-specific symbols.
Those symbols no longer select the provider objects, while SAMA5 device
trees still contain Microchip KSZ SPI switch consumers such as
`microchip,ksz9477` and `microchip,ksz8563`.

Enable the current common and SPI provider symbols instead.

Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/arm/configs/sama5_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -70,7 +70,7 @@ CONFIG_BLK_DEV_SD=y
 # CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_NETDEVICES=y
-CONFIG_NET_DSA_MICROCHIP_KSZ9477=m
-CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI=m
+CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=m
+CONFIG_NET_DSA_MICROCHIP_KSZ_SPI=m
 # CONFIG_NET_VENDOR_BROADCOM is not set
 CONFIG_MACB=y
 # CONFIG_NET_VENDOR_CIRRUS is not set



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E301C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AnSWWjHuVdnEZJaZQMy4jd9uHU1J964TwqjX49Q4s3c=; b=kvAxgDcVWeNpi1DG2BsItqv1bc
	9FUnOF+4O4qGm90wbo43om1zvvQqPKp0G8U5AUI9eDuprvQAw/k3GK/aCNhDnSLextD+e2KDhIEey
	8X1F6mOZaCYb0GdK/SBGgXIOXSnGvwnJxlzyXbNhqCp1ZbLl12rOByRXhCjHx/lm+Etd8cRQ8LWn+
	y/rZ1/CrP2Y1d8CLcCAPCZYTd7oUzxZmHZ1nK5bgvEhEltH3ZFo4K56+sxI8eQCEq0rdFAa8fj1H0
	kdLNaFd4OD0ykghtvdYWBLG4SrAs3oSC0oUvdsI2JQrxwUtSO7FuuVNTztjrW6LhnwulqP30svooD
	tpIwHJig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumj6-00000002DqV-3ZpZ;
	Fri, 14 Aug 2026 07:53:16 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumj3-00000002DpX-3QdJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:53:15 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowACHW+9myX5q4m+eBQ--.61807S2;
	Fri, 14 Aug 2026 15:53:11 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengpeng Hou <pengpeng@iscas.ac.cn>
Subject: [PATCH v2] ARM: configs: sama5: enable current Microchip KSZ DSA symbols
Date: Fri, 14 Aug 2026 15:53:10 +0800
Message-ID: <20260814075310.11613-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowACHW+9myX5q4m+eBQ--.61807S2
X-Coremail-Antispam: 1UD129KBjvJXoW7ur15uw4xZw18GF4rKw17Jrb_yoW8Xw1kpw
	4rurWDJr48Wr1SyayUAa9Yg398Ja97Gw1DGr12yw1UZw4DC347ZF1kKF43Wwn8XrZ7JFW8
	ZF9akF93Ca15Ja7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjfUeL05UU
	UUU
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_005314_236946_25F5DFED 
X-CRM114-Status: GOOD (  11.22  )
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

The Microchip KSZ DSA family now uses NET_DSA_MICROCHIP_KSZ_COMMON
for the common provider and NET_DSA_MICROCHIP_KSZ_SPI for SPI-attached
switches.

sama5_defconfig still enables the removed KSZ9477-specific symbols even
though SAMA5 device trees contain KSZ SPI switch consumers. Replace the
stale entries with the current provider symbols.

Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
Changes since v1: https://lore.kernel.org/all/20260624081216.75559-1-pengpeng@iscas.ac.cn/
- no source-code changes
- rebase on the current SAMA5 defconfig
- route the revision to the AT91 SoC maintainers
- add the coding-assistant disclosure

The Kconfig/provider mapping was reviewed statically; no SAMA5 kernel build
was performed.

 arch/arm/configs/sama5_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/sama5_defconfig b/arch/arm/configs/sama5_defconfig
index bd7f0b5f7d66..46e7f554faa1 100644
--- a/arch/arm/configs/sama5_defconfig
+++ b/arch/arm/configs/sama5_defconfig
@@ -70,8 +70,8 @@ CONFIG_BLK_DEV_SD=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_SCSI_LOWLEVEL is not set
 CONFIG_NETDEVICES=y
-CONFIG_NET_DSA_MICROCHIP_KSZ9477=m
-CONFIG_NET_DSA_MICROCHIP_KSZ9477_SPI=m
+CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=m
+CONFIG_NET_DSA_MICROCHIP_KSZ_SPI=m
 # CONFIG_NET_VENDOR_BROADCOM is not set
 CONFIG_MACB=y
 # CONFIG_NET_VENDOR_CIRRUS is not set
-- 
2.50.1 (Apple Git-155)



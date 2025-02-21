Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4EEC021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QlexyJK7ElExAZiM4lnlOMFeEKHM1VJEcZYVjyVeCI0=; b=W4nDdQo3qberQBMZYOvKxHuR2U
	GX8P9+EqObUwWQ6DEulDUHcmx+u+b0Dcnx3YZkx6QNbzqXx6a8D/GJyakQTtil5WiEwlmYFwShu4B
	lcw4dWj2/7DwlnvHBsufUhYn/3v1pPqAFmeuL1rPvkjbVI4C4pWg5l7pB5jvoSOanKcvgaS/Alb2a
	1Z1OEgqazAsBiOxK2f5P0LzpVDs0V5pX6HS6YypWfDwl0J0CqmCYnOlexf7NRbHqQlNuW69i5KcKU
	SiPlWQJqAYRTIfp5uWKSZKJYy3gAqIk29oI2NyOwtK1fvRwpWs5TGBl/um+f30eOszch2CvDbYLQ0
	H3l7yz1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWSE-00000006IhH-0qYG;
	Fri, 21 Feb 2025 17:04:46 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWLK-00000006HOr-2ClN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 16:57:41 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:ae9a:419e:d123:9695])
	by laurent.telenet-ops.be with cmsmtp
	id GGxX2E00E0y8aK501GxXFY; Fri, 21 Feb 2025 17:57:33 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWKs-0000000BMsN-3PeM;
	Fri, 21 Feb 2025 17:57:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tlWLD-0000000EOql-0uqo;
	Fri, 21 Feb 2025 17:57:31 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 1/5] Renesas ARM defconfig updates for v6.15
Date: Fri, 21 Feb 2025 17:57:22 +0100
Message-ID: <cover.1740156738.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1740156736.git.geert+renesas@glider.be>
References: <cover.1740156736.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_085738_707359_31B7FA1F 
X-CRM114-Status: UNSURE (   6.25  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v6.15-tag1

for you to fetch changes up to ff5a81e0178e5c032ac9700093f4877632d28c0a:

  ARM: shmobile: defconfig: Supplement DTB with ATAG information (2025-02-03 11:03:40 +0100)

----------------------------------------------------------------
Renesas ARM defconfig updates for v6.15

  - Supplement DTB with ATAG information, for older boards.

----------------------------------------------------------------
Niklas Söderlund (1):
      ARM: shmobile: defconfig: Supplement DTB with ATAG information

 arch/arm/configs/shmobile_defconfig | 1 +
 1 file changed, 1 insertion(+)


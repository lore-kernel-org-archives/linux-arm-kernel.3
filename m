Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E452CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAvCYMHOHWeTTH8OAnOsEw6Tpy+LiWOwLB0yT/+Ewv4=; b=TA2vmnMRx/9G8S3izsmtJ/jVeh
	c1T2bkGv3cFJzEpzvNsQK1hZ8Ivfsbqm6bBTq2HAALblIGoo9/F5sFj8wejIJG19ZBjIORPKImJs9
	uPzvw+/WeAoHxRAIG/Jjw1eYuDEmPhYxwwG2CYcll6Dqc1D/4FqQ50DTs96dhCeg7hqOhxG8ALnb/
	ReHV5FsuMc7XQnud3ErlC13gl3Pjq6C4IaIoaXZtst3F1G69+Rjr86UBv64ueMUMK/MCx5Va6+1A7
	kuqvyWccv9GiOUUi3ZIwKg51tRP/znYsnCFcFefZ/u9t3wEaxtOAB7ZHugLM0Tst5UdFJTpHarYnD
	PTCx5yyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM12-0000000FyIU-33bi;
	Fri, 05 Sep 2025 02:17:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF0D-0000000Dj4A-41Q0
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 04 Sep 2025 18:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TAvCYMHOHWeTTH8OAnOsEw6Tpy+LiWOwLB0yT/+Ewv4=; b=BfP3aVvRkutQvf5RqrDA8RB4NP
	t8r0VkCJVU4qZ7qZt+cFO133YjJKgAe8Mg81VVzb6V0hRW/8/uDHXZqLQD95U6DFfpyHsLn1D7oV1
	sF2l2xA3J88gYfyURGa/IsluztEgQHuez0qVrcMO6brIEmHQZHAbf39lolTYLVl/+17zoHB+w0Udc
	Si2xCQDNLrjB8iA7pivHqcRuyptGYYODOgJooSwoqqANjiHibVJYxDymO9nOAUDDoSpGPYLI4eka7
	dl7WQoAW9Ptwcdf2y7TBIrq5xHdBYnUbGzIaifX2gBlqclCQsc3rDaPCGnGKFb9RdPFQI1JcQVDFB
	xgaq4oqQ==;
Received: from mleia.com ([178.79.152.223] helo=mail.mleia.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuF0B-00000004PA5-004k
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 18:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011623; bh=V6UjyEP4enR0aaZjIfYcybAs2bn7WAkQ8HTnFlXBw+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tUYLUpIQh5wbfl6nwN7FS8dq4FRkYatmdebS6xylj3rE9DZj12GKyTfL7+JzCWA48
	 6PiDKKBi/JzHq7UGXxx5uu0WzoCGW909mV4DWBVEYZaUS5c1obmG8MsZo0ozrqgdYw
	 VhGEcMAspvfw/Oyob/egV35JWOIwNam5GD9wKungm17OXhrS9QTVmviMIckQ8QlRHY
	 6Dt6ioKCEwJI27JXFmHZgq0sOeUVcUopx9KrzY2dJIb64XGLZUuMD9Xxp0WyJkjHZo
	 YNOKVURhR18UYOKSavdqE/PWWUZUZJPP03J/GO3O65smxV+yStAbQ0lq8H7KvF9WUn
	 awXVnEQPd/j+g==
Received: from mail.mleia.com (localhost [127.0.0.1])
	by mail.mleia.com (Postfix) with ESMTP id C04423D2188;
	Thu,  4 Sep 2025 18:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mleia.com; s=mail;
	t=1757011623; bh=V6UjyEP4enR0aaZjIfYcybAs2bn7WAkQ8HTnFlXBw+0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tUYLUpIQh5wbfl6nwN7FS8dq4FRkYatmdebS6xylj3rE9DZj12GKyTfL7+JzCWA48
	 6PiDKKBi/JzHq7UGXxx5uu0WzoCGW909mV4DWBVEYZaUS5c1obmG8MsZo0ozrqgdYw
	 VhGEcMAspvfw/Oyob/egV35JWOIwNam5GD9wKungm17OXhrS9QTVmviMIckQ8QlRHY
	 6Dt6ioKCEwJI27JXFmHZgq0sOeUVcUopx9KrzY2dJIb64XGLZUuMD9Xxp0WyJkjHZo
	 YNOKVURhR18UYOKSavdqE/PWWUZUZJPP03J/GO3O65smxV+yStAbQ0lq8H7KvF9WUn
	 awXVnEQPd/j+g==
From: Vladimir Zapolskiy <vz@mleia.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/7] ARM: dts: lpc32xx: Specify a precise version of the SD/MMC controller IP
Date: Thu,  4 Sep 2025 21:46:45 +0300
Message-ID: <20250904184647.397104-6-vz@mleia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250904184647.397104-1-vz@mleia.com>
References: <20250904184647.397104-1-vz@mleia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-49551924 
X-CRM114-CacheID: sfid-20250904_184703_804434_AFD5F44E 
X-CRM114-Status: GOOD (  10.46  )
/bin/ln: failed to access 'reaver_cache/texts/20250904_184703_804434_AFD5F44E': No such file or directory
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_184703_804434_AFD5F44E 
X-CRM114-Status: GOOD (  10.98  )
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

The SD/MMC controller on NXP LPC32xx SoC is ARM PrimeCell PL180, it is
reported by the driver:

    mmci-pl18x 20098000.sd: mmc0: PL180 manf 41 rev0 at 0x20098000 irq 36,37 (pio)

Signed-off-by: Vladimir Zapolskiy <vz@mleia.com>
---
 arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
index c8b9d70e9362..522d616a9205 100644
--- a/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
+++ b/arch/arm/boot/dts/nxp/lpc/lpc32xx.dtsi
@@ -225,7 +225,7 @@ i2s0: i2s@20094000 {
 			};
 
 			sd: mmc@20098000 {
-				compatible = "arm,pl18x", "arm,primecell";
+				compatible = "arm,pl180", "arm,primecell";
 				reg = <0x20098000 0x1000>;
 				interrupts = <15 IRQ_TYPE_LEVEL_HIGH>,
 					     <13 IRQ_TYPE_LEVEL_HIGH>;
-- 
2.49.0



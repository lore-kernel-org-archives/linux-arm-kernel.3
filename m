Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E344E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 11:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Sv8VlDcdty6dXKs5TqiCQneSEFJfWRoyrb9P0zJ3B4=; b=QbxkAXoIlyKvce6lHQZ2akEIPa
	RYv7JxQCdqlTLzWWl35SpJFgi/8LTuJc0/TDvdLciBtSdWCrRJPf45YHR+aVHGm8dUvISZcm3RuFK
	FgBC+lflwiB1kM5CT6prq5gHTihsClSMdmlixfJ4r0gV7KvL7jY4vmjl/9GioYUUmYy+i3UDajeGC
	dlzM4kpdxxs0+xoR9Lqwv5svEASHqZiGf18ihmYELZcJx+RdF1aD0/v4Ss3G1dO5hr83dljPU9PbS
	cMNJeiLsYl5z4AVMWjVy76oTwHuHwaKjjlb01Qp8elTV5TiHTyJ1zUDAjqTD49mfB4oRsX8rg2xD7
	5LFTQ39w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJCY-0000000AEJt-1TYo;
	Thu, 02 Jan 2025 11:17:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTJBN-0000000AE4f-3FMT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 11:16:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3D3585C5BCA;
	Thu,  2 Jan 2025 11:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DBB29C4CEDF;
	Thu,  2 Jan 2025 11:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735816563;
	bh=TzjaYhY/z3XxXLGIN2R6r5WrYgQeVscsnkIXZorYgOQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Tel1G9tDHbWDZKJA0yBm885Spi5Hv0lyWtvKOOeYMwHTURcTQMaoXl8s81R0ZRtoM
	 iJmhF7GiURrp7P5zJmhhjPIe2Gjs654OAkSQDepm4v9ICVoPfixP6t46SFkvRTSxBG
	 zoEr6iBi2T+ZP04eHVuein2/px8+IslsMqbJlDnDN7XxXw4m7oazWqgOyzFGM1yLGe
	 DoyVHHbDEU0MiveeGVkZlDw2Wr5h8IBL+inL29Fo+ytxJGQKUXQtH3lQIr8kWU3qyh
	 Z7voe7ZaGgzDqSRP2Ao2uaC31hsyQKfzCYyukGWwi3miHk1yPJjsMk7dBD8HdPd1oT
	 2jvkBTvgPkuQg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B5BE77188;
	Thu,  2 Jan 2025 11:16:03 +0000 (UTC)
From: Thomas Antoine via B4 Relay <devnull+t.antoine.uclouvain.be@kernel.org>
Date: Thu, 02 Jan 2025 12:15:05 +0100
Subject: [PATCH v2 3/4] arm64: defconfig: enable Maxim max1720x driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-b4-gs101_max77759_fg-v2-3-87959abeb7ff@uclouvain.be>
References: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
In-Reply-To: <20250102-b4-gs101_max77759_fg-v2-0-87959abeb7ff@uclouvain.be>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Dimitri Fedrau <dima.fedrau@gmail.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, Thomas Antoine <t.antoine@uclouvain.be>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735816515; l=716;
 i=t.antoine@uclouvain.be; s=20241202; h=from:subject:message-id;
 bh=4mcHoKDe8g9Cb02OHRiFohYMU9w9oiqZT1kzkWCs778=;
 b=u0MDFhtyvDcPVMHQuoWVOLHGPzXV3ocxbaOLiaQom2uPtJRuCPR0HfSqrffKvygn/k6OgR/84
 UQ452q5sO5HDwZZZ+qihb1/5ZRmhVbSBhf9AHV5ljOjW1yQ/N3jmcky
X-Developer-Key: i=t.antoine@uclouvain.be; a=ed25519;
 pk=sw7UYl31W1LTpgWRiX4xIF5x6ok7YWZ6XZnHqy/d3dY=
X-Endpoint-Received: by B4 Relay for t.antoine@uclouvain.be/20241202 with
 auth_id=289
X-Original-From: Thomas Antoine <t.antoine@uclouvain.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_031605_911925_384F035D 
X-CRM114-Status: UNSURE (   8.97  )
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
Reply-To: t.antoine@uclouvain.be
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Thomas Antoine <t.antoine@uclouvain.be>

Enable the Maxim max1720x as it is used by the gs101-oriole
(Google Pixel 6) board.

Signed-off-by: Thomas Antoine <t.antoine@uclouvain.be>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f458d9c555ab9771a1fd9139ce1aa..7161387d1ebfea0d363e9413ef4350d83b581d96 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -676,6 +676,7 @@ CONFIG_BATTERY_QCOM_BATTMGR=m
 CONFIG_BATTERY_SBS=m
 CONFIG_BATTERY_BQ27XXX=y
 CONFIG_BATTERY_MAX17042=m
+CONFIG_BATTERY_MAX1720X=m
 CONFIG_CHARGER_MT6360=m
 CONFIG_CHARGER_BQ25890=m
 CONFIG_CHARGER_BQ25980=m

-- 
2.47.1




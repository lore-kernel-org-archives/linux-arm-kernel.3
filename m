Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5D0C36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8eCl6CZTUbFxawHBHfRNrN5PBTE71kQx/9ktTJkzUx4=; b=iVakBFZuhmv8LppUVjF3UA1iZl
	6zlRvB/2qTIypa+rcGxeJIgJVJom7+e90Bv6J719X1JP4wyiwSyhPp8k9Epb+lN+N9pk54SKmC1U1
	utg40/EPe8WlRdzewEPN5MgFa6/kg/BP6M2Dc/Fu+zlt3eicbZZovwO27i2AzWaOqDOlXFJabJZnd
	hNk4sssknustTKMl73LFlq5MlX49zyqxhUeWKEH1h198wFxbgekJQo8XP5fqD5IwnPeIciIgjHQVF
	bFPOLKGgKwfJ/+KaE2PF++/FfIA/6fxgQWTzTjAqppCeyEi/W40Vcg+JT8/AaDKpgdwaoGmbIbrOU
	Ay8nVW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyV36-0000000F7uo-1GiG;
	Sat, 29 Mar 2025 12:12:28 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyV1L-0000000F7qz-0eiH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 12:10:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D4BF9A42E3A;
	Sat, 29 Mar 2025 12:05:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56773C4CEE2;
	Sat, 29 Mar 2025 12:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743250237;
	bh=80jFHIrCBi/yzSoHffaggIFyzzx4mYBt2QJfX0/mmq4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=YoYXw7Ifei7X0/qcZk1nvS2qQ4dQI1uzTLKUV+JUVL5kqkBJ73SMHiqCJx1c0vuhP
	 JxfEXS+mzQ6cqclxZx+pWkEi/NMcxRbGGRbT6s7UFJiwMIrbHptBdgq8I7wEt+SxGE
	 BJR4XmK3GOfnzvHvBhVKD+YK4Nb29oLiiWt/H9/FtXFTNrCfdb8SwezclqzvIPGFSo
	 yoHMtJqrXWvCDMP1GCfK2qr4FG+pxKzV1kLmTSUW2riBD5QFlaiFISKKaPKeIMCXOA
	 eK+XfGYjplHhIYCp3drqW53RaDJBnp2cNuezC+ws5+jA2HBRRnL8r93zT4hqFxRV9l
	 Xc3nx+2QpN9bA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BC8EC36008;
	Sat, 29 Mar 2025 12:10:37 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 29 Mar 2025 13:10:04 +0100
Subject: [PATCH v2] ARM: multi_v7_defconfig add /proc/config.gz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250329-arm-config_gz-v2-1-f725d331fb5d@ixit.cz>
X-B4-Tracking: v=1; b=H4sIABzj52cC/43OQQ6DIBCF4asY1sXAGFC66j0a0xBBnYXSDMRYj
 XcvmnTf5b94X97Ooif0kd2LnZFfMGKYc8CtYN1o58FzdLkZCFCiAsMtTbwLc4/Da9h47bTSjTL
 WKcPy5k2+x/Xynm3unsLE00je/pRKaAkgBYimlMKArrnkzi7oHrhiKrvtdEaMKdDnurXIU/tz2
 x7H8QV+51ff1QAAAA==
X-Change-ID: 20250329-arm-config_gz-7d656859ad59
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=CbA+gZnkNtIFncohuGK/3N46iMOwo2R3h73PJJZfyhA=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBn5+M8TVTU30peaj6GGd1EoPFBWTPo29JY3IH4+
 Jy5GzOK5tOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCZ+fjPAAKCRBgAj/E00kg
 cszhD/0UJegGCFX+OSuIwG70meXkExgC8YlChrr49t9ZKSZMLiaagx4qX2Wk1Y4hP4Rb55PXgTJ
 H8VhUU3ak18CnRDETxJGqJznu4klqIsZqzKyf2Xz+BIvcpg1rAn6HPp9b+F8s62xd9Eum6uxsiJ
 OqR9uuSYHEIPirUR9x2FAZpPTZyl2+F5w5eXHObikoVsAHERzcSv/5vFblMzyIa1kj9eZ26D6hT
 22EhHwY7e7gI3Ll/nJgz4iv4mJi19UaTWGaBBfrF99bqCDIQAZisZOQHUXo/Erx0dp2q/h4bLJN
 274jm8OpYQTyNTIts76z44MFEcjd5cEMCtm2RoSSaOToOaS/7+OBz6+LUBbTZ/5kv/dz4wuKj5a
 1dwVCsc/9llGXa50oJDWay0P9jgxZ5QtgGCG3Lp3F/sj/idgS9RTbu4BxMEaBW1RZup4ucZBDGo
 6qTd0A6qsc/QY2l0Gt62H5AKtJ5TbBDi9zikMEJXl6yct2T0UQz3ONX1umpMCY/OGhDzLWZ0vY6
 1u9h0vVmtfV3uEYwMMhBzqJYcj3+8FWRLF4K2un2G4SVYWtZpwd+8RiDxNBXp0yJylLj0kquegR
 HrOmJePcSOFuVxc5VMqwdRLbV+vEhHG65oau7cheeZj0sgl/BKc+d+UAnaFLrqqAZ9lsbgTjLJG
 wkheOjZsBNxBWYA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_051039_335282_F1E540A7 
X-CRM114-Status: UNSURE (   9.15  )
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

While 32-bit ARM isn't that widespread, multi_v7_defconfig is used for
building more generic images, where having access to config can be handy.

arm64 and x86_64 already bundle config.gz, so this is an effort to provide
the same level of comfort with ARMv7 devices.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- IKCONFIG is now module instead of built-in (Greg).
- Link to v1: https://lore.kernel.org/r/20230612210208.109267-1-david@ixit.cz
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ad037c175fdb0ec8601c9b3607aca0c0e5f3c145..16144a519243daee25fbd339b3250e2ff77928ee 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1,6 +1,8 @@
 CONFIG_SYSVIPC=y
 CONFIG_NO_HZ_IDLE=y
 CONFIG_HIGH_RES_TIMERS=y
+CONFIG_IKCONFIG=m
+CONFIG_IKCONFIG_PROC=y
 CONFIG_CGROUPS=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y

---
base-commit: e21edb1638e82460f126a6e49bcdd958d452929c
change-id: 20250329-arm-config_gz-7d656859ad59

Best regards,
-- 
David Heidelberg <david@ixit.cz>




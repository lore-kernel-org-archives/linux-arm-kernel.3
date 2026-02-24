Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9F6E9B24E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 10:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3anWyn7fJD7tloH6wyDktrvnU/7yWNaxU6qE+6fX/TQ=; b=kHlyXtt5ZOewAbZZIXA0hPYD1t
	ALB6j5b05W+Lo+c2rf+sF/yvkSuv7yUHFwcnNjyRHWu4tmV5AtUrLEt6Qv/wTlBfHuynQRw+uxQNB
	lidLH8bqKe1RQ4+Wbv6PaaoOi1VHgCeYirb+97XIkwIOJvOx5eceIIfPf/Jbxh2vZV2VhB8xzERJn
	sdVZ0Dug++hOULbSEQqN5XZvV+D3b6JXoBShxsnqSNPlMG/ebVFmARixVtU2rfd9uyxwn8roxGvLa
	wCMbO2cvu8FIqo8eWMrL0GJWrgz3+EKjLj53pBYmBsXXwm7cz3pWR7Y2hmnvjzpr/c5S/8Bie8f5Y
	cD/6UBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupMd-00000001pKQ-0nVY;
	Tue, 24 Feb 2026 10:09:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vupMU-00000001pFH-0Rix
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 10:09:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03277445AA;
	Tue, 24 Feb 2026 10:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39ADC19424;
	Tue, 24 Feb 2026 10:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771927788;
	bh=+mIYXoJQ0DKik4PPz+rU9CG4TWONToou5quJ/VFR000=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dUcXbY0/iNiZQI00KrTaVdv8bnC9DzKGpoSAPzVdTegTjPbB/dA+WYFsUuMLYRCpD
	 9FrlsTxdUjPcd7wRlvyOjy3jR4gag559naNnj0S6tmC+6H7ymwW62GBjOgTnHThXoO
	 AqCaf5scJ68hxfkPqNfXc7zhtkhbFsmgB253f92czb2EvjW276eyinWEZ8uVbh9fYg
	 92ZyM4daFuvCvHpsHNkhscbdlqUEAwDJ6h3l3npRdBVCqODNCsQvVQO0AZT8yoJH9S
	 ApyljUaXQmIwwdsQU8FdSEKpjc0pcdD0gz4nJiv20X+KM9t4USuskTpjmN9S2+ClDz
	 525brg1S6D/nA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vupMR-0000000DIa5-0175;
	Tue, 24 Feb 2026 10:09:47 +0000
From: Marc Zyngier <maz@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Thomas Gleixner <tglx@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Sascha Bischoff <sascha.bischoff@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 6/6] platform-msi: Remove stale comment
Date: Tue, 24 Feb 2026 10:09:36 +0000
Message-ID: <20260224100936.3752303-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224100936.3752303-1-maz@kernel.org>
References: <20260224100936.3752303-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: ioana.ciornei@nxp.com, tglx@kernel.org, chleroy@kernel.org, sascha.bischoff@arm.com, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_020950_170802_DD85A73E 
X-CRM114-Status: GOOD (  14.49  )
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

The backward compatibility code for the previous incarnation of
platform MSI was removed in e9894248994ca ("genirq/msi: Remove
platform MSI leftovers"), but the comment about that removal is
still present.  Remove it.

Reviewed-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com> # LX2160ARDB, LS2088ARDB
Tested-by: Sascha Bischoff <sascha.bischoff@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/base/platform-msi.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/base/platform-msi.c b/drivers/base/platform-msi.c
index 70db08f3ac6fa..69eed058eb208 100644
--- a/drivers/base/platform-msi.c
+++ b/drivers/base/platform-msi.c
@@ -61,10 +61,6 @@ static const struct msi_domain_template platform_msi_template = {
  * parent. The parent domain sets up the new domain. The domain has
  * a fixed size of @nvec. The domain is managed by devres and will
  * be removed when the device is removed.
- *
- * Note: For migration purposes this falls back to the original platform_msi code
- *	 up to the point where all platforms have been converted to the MSI
- *	 parent model.
  */
 int platform_device_msi_init_and_alloc_irqs(struct device *dev, unsigned int nvec,
 					    irq_write_msi_msg_t write_msi_msg)
-- 
2.47.3



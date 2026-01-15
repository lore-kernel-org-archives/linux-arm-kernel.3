Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB54D44C4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Jan 2026 13:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UiAx5WuXGvtE6Dm0Yb4U89IgF+maNkttJEYkZry0QsI=; b=pYHzwvEvrmfsYC2Y8ABctw+naK
	2Sku3gC6qN+M/R6zowva7eZFCQN2+HwxD7XgqDWeQbka4d2maeg8WqorNi12TLHxyXQscPDDyAHcr
	gN9EmO9vaF/OdorCEwj27zE3PZkUfz8oJvumCQvdKDJUN4WxLC+hfxgSfYULwt5Zpb4yYS/De3PvL
	PgU/ba3PduSqEOCRIF+JmG+5+osVWx/kfpA81lFzi9yyMauKX/Wml1fqcciU7+cQwEGjE8VZPY95S
	lYlMzKjm4vLpcTvwFSgC9WgYp0ixBpLQQQtucJug/yB03lzGMxwdy8BDgckiwp2WDjvj9y9fTiPBX
	+oE7H22A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNN6-0000000CPkN-484Q;
	Thu, 15 Jan 2026 13:26:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgNMi-0000000CPg3-1IdP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Jan 2026 13:26:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D227440AF;
	Thu, 15 Jan 2026 13:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 778A3C116D0;
	Thu, 15 Jan 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768483579;
	bh=p4txa/i2Zai6qOaNpN3Vxz8HAL+Zj2VdE8UWCj6FBVU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jLL5UqR3xILvzGb4boW4w8anaS3A3eAulN3oSQfy6pdrQGSXLUnJdIb+pKruviHoV
	 VyWy3ettVCN7Ou8kXJT7loSe3YBdA3n7cRWF4GjXTmwh9WcOjdK++giX7NBnLOcdb+
	 SemLadHdY0/PRXlrjY7A0RESYFrfPdQPRoLGztfpXdZlLTNlsFVLx4l2lohBsrPMmr
	 CLJucU2Mtv2QKvJId9vn6qnyoJqe0u/Mw6N9uwUzlaAFYN4aU0YezLPY+RyllSRFIv
	 HUM64tQa4epVPu499H/OMgMTfHIAsTu8GvM5hgAUThA/Y61Ek2wQ0cSICYwqZSIw5m
	 4zjJbXR+WtF8w==
From: Michael Walle <mwalle@kernel.org>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 2/3] arm64: defconfig: enable TPS6594 power button module
Date: Thu, 15 Jan 2026 14:24:43 +0100
Message-ID: <20260115132558.1522169-3-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260115132558.1522169-1-mwalle@kernel.org>
References: <20260115132558.1522169-1-mwalle@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_052620_363138_C91C015E 
X-CRM114-Status: UNSURE (   8.91  )
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

To enable the power button on Kontron SMARC-sAM67 modules, enable the
driver for it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fca36c2bd1f0..e175e283e76b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -494,6 +494,7 @@ CONFIG_INPUT_BBNSM_PWRKEY=m
 CONFIG_INPUT_PM8941_PWRKEY=y
 CONFIG_INPUT_PM8XXX_VIBRATOR=m
 CONFIG_INPUT_TPS65219_PWRBUTTON=m
+CONFIG_INPUT_TPS6594_PWRBUTTON=m
 CONFIG_INPUT_PWM_BEEPER=m
 CONFIG_INPUT_PWM_VIBRA=m
 CONFIG_INPUT_RK805_PWRKEY=m
-- 
2.47.3



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7239C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 01:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lqupIVmUfM/FwKL2CtGRCLXKXJXt++c24hQ1CeX4PTg=; b=eQ0rrytr4+9sEfEes0APx6yM5J
	MacixYqtWUum2BilTHIxRiEuZhvAtOGQ2hzlU8SydoJxURzpLSfPI4NZzlsjTYHD6+6+Ic5a5oZuF
	O0RlddjEWph4xAFe7jRsAC+gtiABdIzDhY5haeupC63kW08Rv4Ia9wsuWrB89vfsgojkIPy+nKS9t
	hKW601AAcjz+3c6S0U34zWeXsJqr7ZAEBcNo1Ubg4b5m4EK+jH135ipa2nlRurvt+dLguMbLaAnUd
	DpD+C9XRMFgRXHDHqe2s/DkS2JBlv1hAyuTi2yqTncThdnGwAf7X4w4H6jb/ky6dmsXhZbM3I+R7d
	Tpn8HShw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmIC-00000006zEQ-08CP;
	Wed, 02 Jul 2025 01:29:44 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWmD4-00000006yqX-3c4J
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 01:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1751419458;
	bh=lqupIVmUfM/FwKL2CtGRCLXKXJXt++c24hQ1CeX4PTg=;
	h=From:Date:Subject:To:Cc;
	b=jEMMyiHttf9+780o3EE1L0TRtmlzNa50LTyif7nkuZquu0MMdgyPMQXZIdm7MNFA6
	 EPsT3n/sTdRIh2VMmtQ+I3K5YD0AhQntiv1/9WmfCsLsS7aC2elVM39SUpsaC14FT/
	 wrAeaNGbm4ZjuqaSP34+E2pQVgt+Z3LoZPRXXS3ysQozss7vN4+crr3VhCMqMklN/B
	 8OmnudSbGaRM/j+DB/p1PYqkHp1hSQOBX2w3gp0MXqiilY42vKId8mtoPXI2BCK7n+
	 Zr/fWEUcM1L4Y7YVOCkEPLBR6K6x5uWKnIDDbHWHlfYP5tNOeUOf+TOQIcKKaerPD8
	 HAmJAM88iNKoQ==
Received: from [127.0.1.1] (unknown [180.150.112.153])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id C1B25640B4;
	Wed,  2 Jul 2025 09:24:17 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
Date: Wed, 02 Jul 2025 10:53:54 +0930
Subject: [PATCH] MAINTAINERS: Switch ASPEED tree to shared BMC repository
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-bmc-tree-update-v1-1-c270cd8af0ab@codeconstruct.com.au>
X-B4-Tracking: v=1; b=H4sIACmKZGgC/x3MOwqAMBBF0a3I1A7EwR9uRSw0eeoUfkhUBHHvB
 stT3PtQgFcEapKHPC4Nuq0RWZqQnft1AquLJjFSmMoID4vlwwN87q4/wJUMYh3y2pQjxWr3GPX
 +j233vh+kq9TyYQAAAA==
X-Change-ID: 20250702-bmc-tree-update-72b2cde4806f
To: soc@kernel.org, Joel Stanley <joel@jms.id.au>
Cc: linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 openbmc@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1313;
 i=andrew@codeconstruct.com.au; h=from:subject:message-id;
 bh=gQXNDlKtiwItGVQoQQmPChI9TajdcpMw23001kg7pts=;
 b=owGbwMvMwCG22PjiTL8dD5cxnlZLYshI6bLNPv7N3WJ/3tYN1979qjZaz311JuOeK3ZfHnyVX
 /0ya/e76I5SFgYxDgZZMUWWFYG2hXc3T4r/eSD7GMwcViaQIQxcnAIwEb63DH/Fnd33nn1Q89lA
 t/A7l7mcff5slg0XGRgFP7p/2bpOLH4NI8OpZ96qGzZ0mUjzxS4WnqbypixYSXEfn7wJ74fpmrv
 c2rgB
X-Developer-Key: i=andrew@codeconstruct.com.au; a=openpgp;
 fpr=C0F5E25A7D30ECBBF3BE3CEC3B837651FC0D8CF4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_182427_193292_1276CD3E 
X-CRM114-Status: UNSURE (   9.78  )
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

We now have a shared repo with write access provided to M:s for the
ASPEED SoCs.

Cc: Joel Stanley <joel@jms.id.au>
Signed-off-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Hello SoC maintainers,

Joel and I are chipping away at the workflow for shared maintenance of
ASPEED and Nuvoton BMC SoCs. The latest is this shared tree from which
we'll do future pull-requests.

Andrew
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..a4b8e52ace9fff3c7f43b67b288c5a2c8ec3efa4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2408,7 +2408,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-aspeed@lists.ozlabs.org (moderated for non-subscribers)
 S:	Supported
 Q:	https://patchwork.ozlabs.org/project/linux-aspeed/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/bmc/linux.git
 F:	Documentation/devicetree/bindings/arm/aspeed/
 F:	arch/arm/boot/dts/aspeed/
 F:	arch/arm/mach-aspeed/

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250702-bmc-tree-update-72b2cde4806f

Best regards,
-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



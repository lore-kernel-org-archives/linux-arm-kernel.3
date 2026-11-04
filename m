Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A97606C599
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SDtHlk9u;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RQv6onCX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=m4EVjPKuNlWTkSp9eyxuaIy4tdORfqMQgA3XER/MQXQ=; b=SDtHlk9uq4Z0ES
	c42Rym723Ffho+iHISVisCiTtA7mud9os6oQJMDb6g4pTrtHWQQAIgSObo+JZPWLyAFetMsqi9W5r
	MgpkFaOcqE+lpaoV5chekVRTvlfL+6sLxNu1SGpiC54ECeMbV/tBNJn1rz1H1fA8QZQMV/YgFdg0d
	Bx7ngXWYuosgk13qKW2ccRixfn+gudQaRPho1EfcWq8miiVzMI/84mVduo6wfs8eWbVGwjPBHoR9U
	sI9D6O3KqFjLLaOF4lh2e3z98TL3FoIKT+kg7KthuxO8UzpnxzRYcfAkPz2oEX8oEiv0hhoNEHVzb
	Zn5tkZ2FKXhtRmQWxw+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib6-000000072ko-1jhh;
	Wed, 04 Nov 2026 21:32:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOib0-000000072cC-0dCG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:32:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E225442299;
	Wed,  4 Nov 2026 21:32:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A9001F00A21;
	Wed,  4 Nov 2026 21:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793827957;
	bh=m4EVjPKuNlWTkSp9eyxuaIy4tdORfqMQgA3XER/MQXQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=RQv6onCXKEHCZBYC3H96qPozIS7yQJVxQ+vQKGUbQ9GhyRJFOxbf+V3+bcEhJ2KKu
	 I+QSrd5k0qBlqhijI6glwWC38yUILJJNBKvaZYno/EsZU6cJnWHEoac4lF+yN2i6bo
	 xFpO3FjuM+pvZwbgCHGCuWMa/b0C0868KZklUE176LAeqxoe24dyMszY6lFaBSxnxb
	 4Fb38iTQ74VtDedopsPywUFZPECkfB+1dkIr1wL71cpL6FDQHfOwHWNRMn/WCFdJBl
	 CvjE7qsniGGO95JogqE/xErmw35Uqa6VFmlKqi/SWTBBlWXY1z4ppXNf9ttip6nsrb
	 6Q65U8D47pvDg==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 22:32:29 +0100
Subject: [PATCH 13/16] ARM: configs: u8500: Update debug and CoreSight
 support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-ux500-defconfig-update-v1-13-451d0537d49b@kernel.org>
References: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
In-Reply-To: <20261104-ux500-defconfig-update-v1-0-451d0537d49b@kernel.org>
To: Stefan Hansson <newbyte@postmarketos.org>, 
 linux-arm-kernel@lists.infradead.org
Cc: Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expose the running kernel configuration, build the CoreSight components
as modules, and disable unused generic debugging and runtime test
facilities.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/u8500_defconfig | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/configs/u8500_defconfig b/arch/arm/configs/u8500_defconfig
index 64230ee55da2..6efd7003b126 100644
--- a/arch/arm/configs/u8500_defconfig
+++ b/arch/arm/configs/u8500_defconfig
@@ -12,6 +12,8 @@ CONFIG_TASK_DELAY_ACCT=y
 CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_PSI=y
+CONFIG_IKCONFIG=y
+CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
@@ -272,12 +274,13 @@ CONFIG_CRYPTO_DEV_STM32_CRYP=y
 CONFIG_XZ_DEC=y
 CONFIG_DMA_CMA=y
 CONFIG_PRINTK_TIME=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_FS=y
-# CONFIG_FTRACE is not set
 CONFIG_DEBUG_USER=y
 CONFIG_CORESIGHT=y
-CONFIG_CORESIGHT_SINK_TPIU=y
-CONFIG_CORESIGHT_SINK_ETBV10=y
-CONFIG_CORESIGHT_SOURCE_ETM3X=y
+CONFIG_CORESIGHT_LINKS_AND_SINKS=y
+CONFIG_CORESIGHT_SINK_TPIU=m
+CONFIG_CORESIGHT_SINK_ETBV10=m
+CONFIG_CORESIGHT_SOURCE_ETM3X=m
+CONFIG_CORESIGHT_STM=m
+CONFIG_CORESIGHT_CTI=m
+# CONFIG_RUNTIME_TESTING_MENU is not set

-- 
2.56.0



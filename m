Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F000CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 15:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TlDf2DZxhXMl14tO2DW3avtLbr7ZlZMXA7RDEcwpHCg=; b=JqL+MwmEH/SVMWGObziI0Y8T2l
	B0A1ZysluAWpVBcyKrFrSD+dCM8yImGS07VCKbJsy1g6YrcfaEl9DUV3rENOo3404rEFYxw+KQlwI
	55CRd3E72qAF7KC2U4RC/gh7nGKqzrsyJyh3nBKjDGCQWSQVgXWz6+6grHcn28aqXOtu28S6bDFtp
	tciLQFXYe4IGhx4hdWayqcJUfDmEm6EnimeKEEnpFR1f6Gv+oancM5ucctqWp3BGGKChKtr/0jxRy
	4t4QTLopLHCX7AaBU5dk7jRErd6exOMDwfYjEH2WaGiCnaI8KwGnTC2FmDg7h5c6VlKu/gMEIjY/k
	BTnhNXdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pd7-000000058cV-0ONq;
	Thu, 16 Oct 2025 15:11:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Pd5-000000058bn-0k6h
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 15:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2C4BC417C7;
	Thu, 16 Oct 2025 15:10:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09AFCC4CEF1;
	Thu, 16 Oct 2025 15:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760627458;
	bh=hjA+KH3Wj1C+zAvItz/eOBEiIkWyOOrmjBXeUhx60V4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=Uu9nsJddt3eQ9c+WthR+SA1K1ZBI2GrAwnqByaF5rvFKlFBAzj3eRpdaSr1QbwQ1D
	 SVwAeFgEbez7sSRppoCVr8XgO1QmVkbKfQOwqRX92KA0cRc/cj8R5EZg0xxmhzHD+r
	 QrsjhRoiqyqYTqia/bBAiJFZNsAOGNKHnv/hzDNMvEOYR+XxLUKBDa57iDvUhfeEnT
	 gnF7FtMA/JcoQS6Sc8tMWnIRBUf+Wl8sxdgUCYVpZQrH/OF5Qr1HM4Kdm2zE/hMC7p
	 zy7dbL0i2ZNmbg4fQ9B3fgbIiSqAIfbWLHneSM/RIu1hxuwjiUCrTnsAdeBfpSnxfv
	 NcUGpE3l4SOrw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F29B5CCD183;
	Thu, 16 Oct 2025 15:10:57 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Thu, 16 Oct 2025 17:10:50 +0200
Subject: [PATCH RESEND v3] ARM: multi_v7_defconfig add /proc/config.gz
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-arm-config_gz-v3-1-3874adbf07ad@ixit.cz>
To: Russell King <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=7w/aD3shZMm8S2nIaaI4q8HkXYxgH0I/7K7GWxdOw78=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBo8QsAL6yf9pjJS3iO30WWOBjT6+PwMNJHZhFwG
 qnooKwCd8SJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaPELAAAKCRBgAj/E00kg
 csuTEACboB0BZzXR0uwri8Qb1JkyA8RYDzGFFe4g9Hrf2EFiCVtOdkvzmo/H5wnnUvXkSKVyNYA
 jwIMrQRxPDciNoL1AaIqVN2K97isMpKKR2koVJVaWHkhBQiWqQxynMVBHsmjUE0R/mssFizOfa8
 B5Bi9ILpz9GYlM80tgC3/Tbkx75CgYHbYj4dXfSO+qB2jd5OYX63asmXQwlszi9AkSGj/SKpf7Z
 t8Vqri322w29wCdzDnDFDoHWqfNO07mR4zfibE0zX2RhKzNvvLwPBq0gSk8r1KUL680F0L9pexx
 rTlwFOR01b65TFxLfHJP1awvFBnzZ1JZPi2EEzZXUvillNszbJ9yTTIOsNjp2Pfq+rUWk4kDeAX
 FJ9mYE+ufWvHlR2erSE4V8u+8EP4wRpMhU45KVS0lXmcjtxpQDYkIz5/78rupQrLii1tcqNhppw
 yOuXkR3Xuw2Et2qyyxsLWPwj8IEzRXxXS5+1DZKcYMdn0YfO+drS7gxik8YfB1lXudeFAJi4fyU
 I+BJ+0EvDuz7nfz//pTCiiHR7EewLZmEmCLIuy5RS0Bpv4eAS2PhhjjWFQQL5c8unEIc/vy8/3u
 2ZwpUhBfOmhtd5BS+SgwKhSgPYjVGAv1GbZ3Ms/LwlyHJuOqlj59BYvT77GtmfMVJSvnyh470Jb
 cHsrH31gU1Y/LWw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_081059_257558_CA0980A6 
X-CRM114-Status: UNSURE (   9.33  )
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
Changes in v3:
- Rebased against next-20250715; otherwise, just a resend.
- Link to v2: https://lore.kernel.org/r/20250329-arm-config_gz-v2-1-f725d331fb5d@ixit.cz

Changes in v2:
- IKCONFIG is now module instead of built-in (Greg).
- Link to v1: https://lore.kernel.org/r/20230612210208.109267-1-david@ixit.cz
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 65df4014c4a60..5180c90cb5da1 100644
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
base-commit: f2b1f6a9f382564b1d4cf16c45e73ccccb917f1f
change-id: 20250329-arm-config_gz-7d656859ad59

Best regards,
-- 
David Heidelberg <david@ixit.cz>




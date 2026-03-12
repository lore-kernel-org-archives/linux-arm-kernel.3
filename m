Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D2CFED2EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FEH3325+jhXoeQPrWO/1AcgY3xcOkfp9JU9nCI5U+X4=; b=mG0DYBDkZPtq2GoUeqdfMWpL2w
	klkc4Jg/Y6a7fxHHgOd122Qk8oV6ySpiQlMQ/ERc4RoivoLMxEAbwfLamV+rKEhHS3Cz9vIvR6m0y
	OC5O50ERb3xSVnE0PRZ6t+XVKgKHih2HTs66MHhO+gCz9tCO/qymiZu1cEQ5uwD3sr8M8LAgdWMcS
	lvx6+ziXd05Ur9CJDQ+6u1WQxRyDx+tv9431Mn97bYLfZTMmmprcTFZLwfgmdpZUO7g4SbC/kYMRH
	Hm9GoJo8IOOryJWXUVSWprfoDMW95/Oxt5Ck/Bjjr/CbxnQbZUTOiN/UZcXBeaeF1kg3MKNBWwyPa
	1/uKraiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bFn-0000000DdZ1-0gyZ;
	Thu, 12 Mar 2026 08:18:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bFk-0000000DdYd-1YqP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:18:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3A51B43FBF;
	Thu, 12 Mar 2026 08:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 504CCC4CEF7;
	Thu, 12 Mar 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773303523;
	bh=zaiw6ohbC9zCzTRpwnLAe3c7LEjMMvMfCa83XflODHk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xv18C9rGMeCRDNgcgnuV6dLDJo5QaRsfDSyclftrain5i3x72szmFg1DLzuYLZshB
	 8+yTqt8d1MTdzNnKoNrB9RFZ9PwgnWSUvrSQcEoiRSYUxzpjgRn54SRZzbIPYHAam6
	 X9DZegf2Mj2T/qFHxe5OK0YX7JWM9i6rqdDTIlON1iCZ/cEJWRU++W0o5IUPQ4bSZn
	 HHJrmv3Clmq2+MIST8R2dPFQloQTosCAdTQD4vWjzuAeRjz5oDp57W+RsOr8KTmlRd
	 FVQfiu5bmj86rCBAFfqZdNmclWFS5PJs7twUGqA4aR7wEIBrzaKZwZjzwCIj3jBuSY
	 FDPgXr5tZENMw==
From: Arnd Bergmann <arnd@kernel.org>
To: 
Cc: Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] ARM: defconfig: enable CONFIG_MFD_STMFX instead of PINCTRL_STMFX
Date: Thu, 12 Mar 2026 09:17:45 +0100
Message-Id: <20260312081805.3020612-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260312081805.3020612-1-arnd@kernel.org>
References: <20260312081805.3020612-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_011844_457557_87DAE4D2 
X-CRM114-Status: GOOD (  11.43  )
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

From: Arnd Bergmann <arnd@arndb.de>

PINCTRL_STMFX now depends on MFD_STMFX instead of selecting it, so
adapt the defconfig to pick the right one again.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c102c4acdd8f..728b36ad3a08 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -481,7 +481,6 @@ CONFIG_PINCTRL_MCP23S08=m
 CONFIG_PINCTRL_MICROCHIP_SGPIO=y
 CONFIG_PINCTRL_OCELOT=y
 CONFIG_PINCTRL_PALMAS=y
-CONFIG_PINCTRL_STMFX=y
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S500=y
 CONFIG_PINCTRL_MSM=y
@@ -627,6 +626,7 @@ CONFIG_MFD_SPMI_PMIC=y
 CONFIG_MFD_RK8XX_I2C=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_SEC_I2C=y
+CONFIG_MFD_STMFX=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_PALMAS=y
 CONFIG_MFD_TPS65090=y
-- 
2.39.5



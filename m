Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49B8C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 09:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FvQqVbQ2+SqL/kfE6tpmwT7tqLXppZmdY3mZKZt7Fhk=; b=CtsuLIHyUOBDM6mQYaoxMYkrHH
	9uFWbl40dSulGgiRL9QxRaP2dykAZ3RX8Y7V+TMTZtC0pyZXbAChvkJxplR1a8H63ZolCMUFkM2VM
	o0f81J88OVU60GgslLrzSWglEphChhnkQgsyH7yk1PelLyMKayczud+5K6s32fAm51tW0ohZnwORX
	NjqUvg9iuHFz7nic7+e3nY01Itq/xavIsQIA0s6t8j/V+Ib9cUInSBv3a3yqdVnDQi0A2c8iuQ+hG
	i+h9E/M4Kk+BKlpoI7i9s8EQh2UNvuJYwlgeoUTRnumULfSyClEFWdQY5UfAyXKvnnTekTVh8pLJ8
	lBNhTMRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKD4m-0000000CjAw-1e5e;
	Wed, 28 May 2025 09:27:56 +0000
Received: from mail-m32102.qiye.163.com ([220.197.32.102])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKCYz-0000000CdgT-0Uzh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 08:55:07 +0000
Received: from localhost.localdomain (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 16b15a642;
	Wed, 28 May 2025 16:55:01 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	Taniya Das <quic_tdas@quicinc.com>,
	Eric Biggers <ebiggers@google.com>,
	Ross Burton <ross.burton@arm.com>,
	Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Albert Yang <yangzh0906@thundersoft.com>,
	Ge Gordon <gordon.ge@bst.ai>
Subject: [PATCH v1 7/9] arm64: defconfig: Enable BST SoC
Date: Wed, 28 May 2025 16:54:59 +0800
Message-Id: <20250528085459.481424-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSk8aVhkfQkpOS0kdTB9IGVYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ01VSk
	tLVUtZBg++
X-HM-Tid: 0a97161a225c09cckunmb0655d34397ebd
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OjY6Dhw6MzErIkhNLg0COSI9
	HjlPCi1VSlVKTE9DT0lJTktJT0NJVTMWGhIXVQIaFRwBE0tCS007DxMOFR8eCQgUHQ9VGBQWRVlX
	WRILWUFZSkpMVUpDT1VKSUJVSkhPWVdZCAFZQUpMTE83Bg++
DKIM-Signature: a=rsa-sha256;
	b=e8d1bcyYgMfcqFBcfcKCbu8/3vbHRzSzf5RSyZnxz4MgvfCDqEOywydTOFxg7XSH1np/n+zEKwn5LiDGvWelykoXnCLRydhcf9ZmjKq+6huVrXyasFGjDwJSma/6mgnS+RF1TxdtUzQNbb6Ux12ypC/ks3b7epluQ9nt91e4brE=; c=relaxed/relaxed; s=default; d=thundersoft.com; v=1;
	bh=FvQqVbQ2+SqL/kfE6tpmwT7tqLXppZmdY3mZKZt7Fhk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_015505_317664_7F892ED4 
X-CRM114-Status: UNSURE (   6.21  )
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

Enable BST C1200 SoC support at ARM64 defconfig

Signed-off-by: Ge Gordon <gordon.ge@bst.ai>
Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
---
 arch/arm64/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5bb8f09422a2..9f072028fb72 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -45,6 +45,8 @@ CONFIG_ARCH_BCMBCA=y
 CONFIG_ARCH_BRCMSTB=y
 CONFIG_ARCH_BERLIN=y
 CONFIG_ARCH_BLAIZE=y
+CONFIG_ARCH_BST=y
+CONFIG_ARCH_BSTC1200=y
 CONFIG_ARCH_EXYNOS=y
 CONFIG_ARCH_SPARX5=y
 CONFIG_ARCH_K3=y
-- 
2.25.1



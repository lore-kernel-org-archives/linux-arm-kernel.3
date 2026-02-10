Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F22EA8102
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 11:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0NWAU1Rgj+7j8yaUZF4MpiO+9Actr8LGdHetxcCk75c=; b=TiYReiQSGmy23grc9ZXDjCVuI3
	PM9M6EAl/Yty6hGHgz2k4fDP1UGAeIhMX00lIXl8NVngTMdY3NFwCksujEX8Drn9zf9Y+8rDsedTo
	RRgZPTA5AaOp32ZxWi8S/De3fBlTWSuuWfASqj6AzR+qtZYNjwoCObFKk1ZLaAodp3+A74MMTdyYt
	Arun8+pAq7ECe5G7reBqaY+ptRkcZXPQHBHH46+hYRzmZVhPWX0dRkR+CiB/d+UNBMR99zi9IA9L/
	kvD5CHvsDTtmdYdy9qOj4pN/xT5I3q6q4x4XCE4+M5l97kcP1VG6hUD40ILmwC/teWjkprp0oHR+V
	+Q33R/nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmLt-0000000GuS0-1Szr;
	Tue, 10 Feb 2026 11:56:21 +0000
Received: from mail-m19731117.qiye.163.com ([220.197.31.117])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpmLp-0000000GuRQ-2YwD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 11:56:19 +0000
Received: from albert-OptiPlex-7080.. (unknown [112.65.126.162])
	by smtp.qiye.163.com (Hmail) with ESMTP id 33be0945d;
	Tue, 10 Feb 2026 19:56:07 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: adrian.hunter@intel.com,
	arnd@arndb.de,
	bst-upstream@bstai.top,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	gordon.ge@bst.ai,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	yangzh0906@thundersoft.com
Subject: Re: [PATCH v5 5/6] arm64: defconfig: enable BST SDHCI controller
Date: Tue, 10 Feb 2026 19:56:06 +0800
Message-ID: <20260210115606.270000-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <93bff61b-ffc3-4b09-ac97-99f576e6d48f@kernel.org>
References: <93bff61b-ffc3-4b09-ac97-99f576e6d48f@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c4768a8a609cckunm56c64d2736b8
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQk9IVk9PSBlNT0weSklNGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSklVTU5VSklNVUpNSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0
	tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=Dd/RXPqlOX5WnrutWKlnLu79gR1Tndka9KaC/J4akPCejzCdnVfB1Sb4vRcJ4SjhNHwNoch9Ko74te9rLzPayowwwKwEjylBa4bw9R4MZJzSCf617H6dLsXkBgAsanvJStWrXS/LrLQW6JkuySt/19W15a6jKyYAeqIwxgqIDus=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=0NWAU1Rgj+7j8yaUZF4MpiO+9Actr8LGdHetxcCk75c=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_035618_242047_0F8B47D9 
X-CRM114-Status: UNSURE (   9.94  )
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

On Sun, 8 Feb 2026 at 12:38, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 23/01/2026 10:53, Albert Yang wrote:
> > diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> > index 45288ec9eaf7..7f4da3117329 100644
> > --- a/arch/arm64/configs/defconfig
> > +++ b/arch/arm64/configs/defconfig
> > @@ -1222,6 +1222,7 @@ CONFIG_MMC_BLOCK_MINORS=32
> >  CONFIG_MMC_ARMMMCI=y
> >  CONFIG_MMC_SDHCI=y
> >  CONFIG_MMC_SDHCI_ACPI=y
> > +CONFIG_MMC_SDHCI_BST=y
> 
> This is still wrongly ordered. Look at your Kconfig. Run savedefconfig.

Hi Krzysztof,

Thank you for catching this again. Sorry for the repeated mistake.

I incorrectly placed CONFIG_MMC_SDHCI_BST right after CONFIG_MMC_SDHCI_ACPI,
but in Kconfig, MMC_SDHCI_BST is defined after MMC_SDHCI_BCM_KONA (much later
than MMC_SDHCI_ACPI). I have now run savedefconfig and confirmed the correct
position is between CONFIG_MMC_SDHCI_TEGRA and CONFIG_MMC_SDHCI_F_SDH30:

  CONFIG_MMC_SDHCI_TEGRA=y
 +CONFIG_MMC_SDHCI_BST=y
  CONFIG_MMC_SDHCI_F_SDH30=y

Will fix this in v6 along with the DTS patch, which will be submitted to
the SoC tree as per Ulf's direction.

Best regards,
Albert


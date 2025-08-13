Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2F6C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 12:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1cRAJe0CxUVqAqDKj9DnA6hGyWzBbsykTcnAehrRdI=; b=fERxk1WIw2n3v1jc3lbvN+n9JZ
	/HnuBNlHoUCdtwsyqUqk4R1X5u262T3HCpHC7G6ZkYrXrWRj2lz/b4ZrB1dmaVSIgqGiTiR0Gse2l
	oXrt/yFUdFlCTpIr+OcOonql85s2EEhfLjFrB6L3aaDNsb3Qqqc+xJLhrUeJbeNaI9qQeN1J+Kmf1
	KvIMzC6UD7jlA4j97mcpuJNbLui3P8RoOdCrTQvQf4RIp7pgfWqBXzaR+FotKg+5Ax63y8xwudH8I
	1ire5neTr+g1Ah+NU6ikXHTKZgETRxNvSlhghgn9CgN9eGTPrwPbZP8HIcnq/PFSXhy6mfLIbn8VF
	xY8ZQVgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umAsY-0000000Dfgs-0AyD;
	Wed, 13 Aug 2025 12:46:54 +0000
Received: from mail-m19731114.qiye.163.com ([220.197.31.114])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umA5j-0000000DZbf-0lv4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 11:56:28 +0000
Received: from albert-OptiPlex-7080.. (unknown [117.184.129.134])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1f43d5da5;
	Wed, 13 Aug 2025 19:56:21 +0800 (GMT+08:00)
From: Albert Yang <yangzh0906@thundersoft.com>
To: krzk@kernel.org
Cc: will@kernel.org,
	adrian.hunter@intel.com,
	catalin.marinas@arm.com,
	arnd@arndb.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/8] arm64: defconfig: enable BST platform and SDHCI controller support
Date: Wed, 13 Aug 2025 19:56:21 +0800
Message-ID: <20250813115621.2396944-1-yangzh0906@thundersoft.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <3dc96186-a314-477b-8d2a-a2ffcb2e482c@kernel.org>
References: <3dc96186-a314-477b-8d2a-a2ffcb2e482c@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98a349d4ec09cckunm0b9ac1c0a1693c
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQx0fVkIZHhpJGU8dS0sYGFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSkxVSkNPVUpJQlVKSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Imlp1NHFgbTmnv0P8tYVBoDQMYGg53wt9sfi+MKW6znw3nE0bujbDsf3HceS9/Xcdnl7rCOqBQBM/Im0zW/FpNgdyQaVOc6K3fs6rknxRKV9CNzz7euOwUWWkidtgXbMiee/iUHNX7O7J5u/VECDLrQXa+rAtC4/QoCE6CtVPBA=; s=default; c=relaxed/relaxed; d=thundersoft.com; v=1;
	bh=f1cRAJe0CxUVqAqDKj9DnA6hGyWzBbsykTcnAehrRdI=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_045627_527894_809936DD 
X-CRM114-Status: GOOD (  10.84  )
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

On Tue, Aug 12, 2025 at 03:38:08PM +0200, Krzysztof Kozlowski wrote:
> On 12/08/2025 14:31, Albert Yang wrote:
> >
> > - CONFIG_ARCH_BST: Enable BST SoC platform support
> > - CONFIG_MMC_SDHCI_BST: Enable BST C1200 DWCMSHC SDHCI controller driver
>
> Either this paragraph...
>
> >
> > This enables eMMC/SD card access on Black Sesame Technologies C1200 series
> > SoCs. The SDHCI driver provides hardware-specific implementation for the
> > Synopsys DesignWare Mobile Storage Host Controller integrated in BST SoCs.
>
> Or this. Don't say twice the same. Second paragraph is more relevant, so:
> "Enable BST SoC and MMC drivers for BST 1200 board".
>
>
Thank you for your review. I will refine the commit messages based on your
suggestions.

Best regards,
Albert


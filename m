Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97229E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mG6WP/xuY69mvRbTFAtLrXDRLub1uk69rFbah1D2r0w=; b=dun5F2SZqeLBh5F7OdSGtkMssg
	pBrMcMRaOzGXUXCbbR6efEc8aoFRISM+8IM9740jyDpfaCXBtdq2gV+3EM4gHwiPuBNuZG3XyBDts
	wv5GULM6xD6GkdSIEaLksC/HWNpsWuUQ4ZwTVEB8UtiMYoNsFBeXuMVWlUbjlEp2thoeQfOnFPWPS
	+sxeroZHRQtBeBEulHYUwB1lxcZYxtPt8ABsZTZ8jpYgBkUQiAPLK2OoDuG68FxTsZxvp15t3NSCM
	Xh241ALn+uEQaB1qFPniuhsyx247g7QkEsDV/YrJgHfhQdofw/DzsBZkkl3fo12CxTTeJjWOtIkUf
	ceIgttJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVRQ-0000000GODR-2pdb;
	Wed, 11 Dec 2024 22:44:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVGV-0000000GKx5-1kj9;
	Wed, 11 Dec 2024 22:33:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BE5BC5C67FC;
	Wed, 11 Dec 2024 22:32:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03B1C4CED2;
	Wed, 11 Dec 2024 22:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956386;
	bh=6vzy9W7MutUOZNBEPu/ZaeFKt+pCcG6i2Mi81FMo/zo=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=o4HKpHYz5SmpQqTC9GZTYYy4yG9JFVIeM+ayvy/+YFWquF15hl5vh5/qKEH5pK49v
	 Sieu7dXVq6LpyNvgG6Ftq2AxnjNx7Shc2dADxtWMJv98WMfPVAN0CyRGwOlPl4UzRK
	 DQ+aSQcSiq26XFF3vdiXybukEqBL+ue+nAhU9FcxjLus6W+b0DurNnzqZ38s90Y5Qp
	 U4WwSSY6uJeUD4uqItXPW5GVeHBrx905oU0uOJ1f2/PIK78s84wyvLbykSNqaAi/hD
	 9BS/2U3/CPf8fi0fQKyMn81FhMNGoFgySNjam1t4JouI8BmJqaQUyPj5B3C+ALubUm
	 30gtmj941aCyQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3458B380A965;
	Wed, 11 Dec 2024 22:33:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4] ACPI: introduce acpi_arch_init
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <173395640299.1729195.506901103763287454.git-patchwork-notify@kernel.org>
Date: Wed, 11 Dec 2024 22:33:22 +0000
References: <20241121-intro-acpi-arch-init-v4-1-b1fb517e7d8b@gmail.com>
In-Reply-To: <20241121-intro-acpi-arch-init-v4-1-b1fb517e7d8b@gmail.com>
To: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Cc: linux-riscv@lists.infradead.org, guohanjun@huawei.com, rafael@kernel.org,
 lenb@kernel.org, sunilvl@ventanamicro.com, sudeep.holla@arm.com,
 lpieralisi@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, shankerwangmiao@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_143307_494609_287C2319 
X-CRM114-Status: UNSURE (   7.44  )
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

Hello:

This patch was applied to riscv/linux.git (fixes)
by Rafael J. Wysocki <rafael.j.wysocki@intel.com>:

On Thu, 21 Nov 2024 22:25:21 +0800 you wrote:
> From: Miao Wang <shankerwangmiao@gmail.com>
> 
> To avoid arch-specific code in general ACPI initialization flow,
> we introduce a weak symbol acpi_arch_init. Currently, arm64 and
> riscv can utillize this to insert their arch-specific flow. In
> the future, other architectures can also have chance to define
> their own arch-specific acpi initialization process if necessary.
> 
> [...]

Here is the summary with links:
  - [v4] ACPI: introduce acpi_arch_init
    https://git.kernel.org/riscv/c/9d8a2b033db1

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html




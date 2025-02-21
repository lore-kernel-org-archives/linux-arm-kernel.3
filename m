Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A48C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 17:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LMzn9I6GJ/zLraScFvUFQQnSiBwEvYgaKkCLn/ILywo=; b=A8QA/atRmQsSaJqaWC0ufBsHiG
	mIMkbh7L8Yfq5kx9SMyJpe1tb+r4NXW1pkTM/5veJ8YwQy0Ol6aOzaIakpERaCNEXsYXr7rXqxmZd
	1tAcjhvk66fbECGooIuTwh3aOj5dku51k9qLpqjHEGj913+UAyrJdu3BjskpcWxCm7AtTutwpeER4
	LE+AW7ZFv7KWL3xBGlebDT+IvarVkgYq7eQnQU+FWFIDYZ3LxQE45aFQXbFnUKasmMxgW0PdEYsKy
	fz9mfa8JXpuf/oGlPt5fSbOBFXJ0OGfC1BTgOhnBKmI8js4Xbcj+Ng9WsfBTd7eVp9kvWDeE+nZju
	ipfsk+gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWnL-00000006NAK-1vWE;
	Fri, 21 Feb 2025 17:26:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlWl0-00000006MeS-1A40
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 17:24:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DF2A0168F;
	Fri, 21 Feb 2025 09:24:25 -0800 (PST)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 67E243F5A1;
	Fri, 21 Feb 2025 09:24:06 -0800 (PST)
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: mike.leach@linaro.org,
	James Clark <james.clark@linaro.org>,
	Linu Cherian <lcherian@marvell.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	coresight@lists.linaro.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	devicetree@vger.kernel.org,
	sgoutham@marvell.com,
	gcherian@marvell.com
Subject: Re: [PATCH v14 0/8] Coresight for Kernel panic and watchdog reset
Date: Fri, 21 Feb 2025 17:23:44 +0000
Message-ID: <174015834099.1418247.14151654370992096221.b4-ty@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250212114918.548431-1-lcherian@marvell.com>
References: <20250212114918.548431-1-lcherian@marvell.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_092410_354787_FD5DA90A 
X-CRM114-Status: UNSURE (   9.34  )
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


On Wed, 12 Feb 2025 17:19:10 +0530, Linu Cherian wrote:
> This patch series is rebased on coresight-next-v6.13.rc2
> 
> * Patches 1 & 2 adds support for allocation of trace buffer pages from
>   reserved RAM
> * Patches 3 & 4 adds support for saving metadata at the time of kernel panic
> * Patch 5 adds support for reading trace data captured at the time of panic
> * Patches 6 & 7 adds support for disabling coresight blocks at the time of
>   panic
> * Patch 8: Gives the full description about this feature as part of
>   documentation
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: arm: coresight-tmc: Add "memory-region" property
      https://git.kernel.org/coresight/c/87b8166a
[2/8] coresight: tmc-etr: Add support to use reserved trace memory
      https://git.kernel.org/coresight/c/91a2086a
[3/8] coresight: core: Add provision for panic callbacks
      https://git.kernel.org/coresight/c/46006ceb
[4/8] coresight: tmc: Enable panic sync handling
      https://git.kernel.org/coresight/c/6dbcbcfc
[5/8] coresight: tmc: Add support for reading crash data
      https://git.kernel.org/coresight/c/d58a70bd
[6/8] coresight: tmc: Stop trace capture on FlIn
      https://git.kernel.org/coresight/c/942bbeea
[7/8] coresight: config: Add preloaded configuration
      https://git.kernel.org/coresight/c/4b7e6262
[8/8] Documentation: coresight: Panic support
      https://git.kernel.org/coresight/c/b47d1fcd

Best regards,
-- 
Suzuki K Poulose <suzuki.poulose@arm.com>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70396CCA464
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 18:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dcEKdCNeFWLh2liBnbQSqgk91jsP0Q6T7uioxsqmrqk=; b=O0vDqPqgFghPPELS6Un3Y6cv7q
	QIBvw7fdc2zNU6pXKfkAK6pEd/GsDqgow28IUnTYEYzBWwRkd0gNEMdNKw9r8MVqIfIpkhUY0cyIa
	C1VnnzL1Nfo3ZU8uEDuA/ofvGK4nLtk+qzTCqHkTb0vqqdz9nQLDc9jEU479pTmoVhMFF7Fo73Bfq
	hYMvlEUtCU5avwsyYy1gOvEQ1WEkc3EOT4wRqbhrGf4tzDAhYBS0mlkCKGN4tEWhM5lvTzDbXQq30
	IFnRq/0C/bDpTlHH3IfBymF+QVKwZuXHP1a63cUm+BUSV5YiVliQXjtf9rt47ubisBdEmK50KEIvT
	MVln4EAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPwW-000000016jg-4Blr;
	Thu, 15 Oct 2026 18:12:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHPwR-000000016hE-0Rkv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 18:12:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6EBE14BF;
	Thu, 15 Oct 2026 11:12:30 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EC3A3F871;
	Thu, 15 Oct 2026 11:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792087953; bh=QDCjVKj4BPQQ2TRdLH38IEHILLRayJsSVeZmDsJRJ/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nDE+/vYyuG1W+NyCied4u7Qpgf3bt3UYa4NZOAX6uRC2XO4aWuOK1y/WE78xrCB7w
	 J/VGJ+Gyl3NEtlPtSV6IWeIfvZXjuxh/Oalag+JyGnwfA2ozJMRzzEmUPIRAt0tzbs
	 AFMgQSFZklYW74PXhonJPPLg43KX2xhwsxT7sz58=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Shanker Donthineni <sdonthineni@nvidia.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vikram Sethi <vsethi@nvidia.com>
Subject: Re: [PATCH 0/2] arm64: Add NVIDIA Rigel CPU definitions and BBML2
Date: Thu, 15 Oct 2026 19:12:26 +0100
Message-ID: <179208793359.161729.16006522437434117288.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261013150508.1798938-1-sdonthineni@nvidia.com>
References: <20261013150508.1798938-1-sdonthineni@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_111237_217501_414CD5A9 
X-CRM114-Status: UNSURE (   7.19  )
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

On Tue, 13 Oct 2026 10:05:05 -0500, Shanker Donthineni wrote:
> Add CPU part and MIDR definitions for the NVIDIA Rigel core. Then add
> Rigel to the BBML2 no-abort allow-list because it supports BBML2 without
> raising TLB conflict aborts during mapping granularity changes.
> 
> Shanker Donthineni (2):
>   arm64: cputype: Add NVIDIA Rigel definitions
>   arm64: cpufeature: Enable BBML2 for NVIDIA Rigel
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/2] arm64: cputype: Add NVIDIA Rigel definitions
      https://git.kernel.org/arm64/c/cd2a6b71f974
[2/2] arm64: cpufeature: Enable BBML2 for NVIDIA Rigel
      https://git.kernel.org/arm64/c/6be42f0e4dc1


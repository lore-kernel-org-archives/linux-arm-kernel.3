Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2F0CC44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3S1zX9GkrFfN27WqhkOCRDsNzyrzoS3HSqoBzTT5nY=; b=aL9mcakvsSSczhO0Sotcd+/5LM
	PCOu6cxIlkOY1e98puZaeHt1jRk+5gnD+fQEjaWczRL/ONMtreqLS4P96lNQpaLAzkumNlb/u6B0F
	H9r4VmqzgN4SfwU+CPKxvNh04DCrLtmMP2Rqrd5+U3kAov01iD8l2Seb8aLl3pwGzuBpuA2CK9tnt
	KKRlNIAJvkxc9vUSthSuKZ871yhwNqM8RxoGCN1fGJgfdiQtokXlhSAPzsABS44b8ZxQeQHyRaJrj
	r8LDNYQjQkVLL1vjGoLLglMiEkyhJl/QFRJzvj+JCk4ymDVWAHwpYlWh1f/4TOX8yXWl/uqVLMvwE
	YyDkbYmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virbz-00000006ntg-1Nr3;
	Thu, 22 Jan 2026 10:08:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1virby-00000006ntP-1JAa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 10:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F99B60053;
	Thu, 22 Jan 2026 10:08:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83EB8C116C6;
	Thu, 22 Jan 2026 10:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769076501;
	bh=NS1dUdpfEov7TFYOYmIUueAnbmo+14IrbGqTOzqyWvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oHbe6bQSL4QiwjjO4mUSVMXO5By/hF870UEYDu5DkGHRU9o50dcjo/JKnssq82sJm
	 Ynhr++5vrrNX2U1GQrBsyggmFgmPBATe3feabngNO1ldImAy/4VQz1hDVR7+okp9Ei
	 vUmxTMiTZKFVlSqCqBfVoVssmVFCkT2PH0QEuD2/HydQ+v6wSzsA0Jv46pCvJDPb5p
	 0MHKP5mPQc4SmNO5O0B/JbU+vSJXgbqxeu5d3CdPE1sXkmOngLdtf4ntaPZ/BN5WRd
	 QHp5Un4f6m8UsDhNEsyLU7LM5ket07ec2BP3sFd/d/FhB+XJVisqv+Vw0vuRPGtZeA
	 w4qP/JUtFUEYA==
Date: Thu, 22 Jan 2026 11:08:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: arm@kernel.org, soc@kernel.org, Jon Hunter <jonathanh@nvidia.com>, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <20260122-hidden-goat-of-excellence-a43b9f@quoll>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260118080304.2646387-1-thierry.reding@gmail.com>
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

On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> Hi ARM SoC maintainers,
> 
> The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:
> 
>   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.20-dt-bindings
> 
> for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c627:
> 
>   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 01:58:18 +0100)
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> dt-bindings: Changes for v6.20-rc1
> 
> This series updates various DT bindings for Tegra architecture,
> primarily focusing on schema validation fixes and new feature
> documentation for Tegra234 and Tegra264 SoCs. Key changes include
> correcting realtek,rt5640 audio codec bindings (adding missing ports,
> clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> (introducing CMDQV and DBB clock support). Additionally, it resolves
> legacy warnings for Tegra30/132 display and VI interfaces.

Same comment as was for Geert, I am surprised to see DT bindings as
separate pull and I see drivers were alerady merged, so I will defer
entire Tegra pull to Arnd.

Best regards,
Krzysztof



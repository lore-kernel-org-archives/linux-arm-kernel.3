Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973DAC36013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 16:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qM3Uo88p0F10n6WWJ2iu+yXnwGtM73E8rTtttS8FnYA=; b=vsF+u5nrY+6Elf+u4Sv9Iodv7H
	QJXYeF1Q4ToraEgR3Q82HnnHHgiyo/lDQuMqpRVnmPTHsvaxJkYRu97PV8/shZQQEGObdlEwVouAE
	wXllzezGR1aV9zGW7S9JFHsqZNEVTI/nMrpsBsGKrsXqOoH6HAT4IpCPILPpcYZB77V7wkgnq92Fl
	UCsF2ccIy3rDugjnxDVRxsIgGTv/hRIK6S1X9fdszTThz6/2+5rFi90kTLSR6/UYHqV3JwnPYZyp5
	KMXB/6U0+MpDxwxwqcKgQL6TBRrJjvRRCCFTsgA+Vqe6PSbf6Mr7mWHQ7dLnSKPIVJW/ck6peCNZP
	V+Lzjxdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyCKf-0000000Drxc-2GOY;
	Fri, 28 Mar 2025 16:13:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyCIu-0000000DrcZ-14ZO;
	Fri, 28 Mar 2025 16:11:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4EDC9A40A03;
	Fri, 28 Mar 2025 16:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68534C4CEE4;
	Fri, 28 Mar 2025 16:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743178290;
	bh=vd+MsqR+zb+ZUwrDod4YyaT5G91/MYukXepr+eOQBMM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QqjE1BodPJFzurkmx6XGTJzHwXGtQsoj6RrUC9OFfJw9Q5rrVLGe+fQvF7lBiRmih
	 Q5n3RLJXMhEzWJ8L+pwPclOgDTZFeY+I5d7jJhHAD3mtKZ7VBpGw08rFqzFK7ybnka
	 HTTwDLHNvWdlsfTuhBPWCsCB7XOcS6vdSYZYb2vpNf+6AtSFUE2tSsU9rVas11XopT
	 gnupgIcs/V6SVdwUMrtoE2K3BcX0+Sd4j6lEdvYj3vpcuC24r7lrgjPuEIyhQKuKzL
	 FTYnoboB9tXJN1zY3z3iroEVGlasuOtNb2YYT7IXKwn21/l7FII8CjUQBWXVFktYpf
	 qiWnSOdZvaeoA==
Message-ID: <04201b5a-34fe-45e0-bb96-237bd6eec414@kernel.org>
Date: Fri, 28 Mar 2025 09:11:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] PCI/arm64/ath11k/ath12k: Rename pwrctrl Kconfig
 symbols
To: Johan Hovold <johan+linaro@kernel.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250328143646.27678-1-johan+linaro@kernel.org>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20250328143646.27678-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_091132_370168_85D3B950 
X-CRM114-Status: GOOD (  16.62  )
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

On 3/28/2025 7:36 AM, Johan Hovold wrote:
> The PCI pwrctrl framework was renamed after being merged, but the
> Kconfig symbols still reflect the old name ("pwrctl" without an "r").
> 
> This leads to people not knowing how to refer to the framework in
> writing, inconsistencies in module naming, etc.
> 
> Let's rename also the Kconfig symbols before this gets any worse.
> 
> The arm64, ath11k and ath12k changes could go through the corresponding
> subsystem trees once they have the new symbols (e.g. in the next cycle)
> or they could all go in via the PCI tree with an ack from their
> maintainers.


I'm fine with the entire series going through PCI
Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/...


> 
> There are some new pwrctrl drivers and an arm64 defconfig change on the
> lists so we may need to keep deprecated symbols for a release or two.
> 
> Johan
> 
> 
> Johan Hovold (4):
>   PCI/pwrctrl: Rename pwrctrl Kconfig symbols and slot module
>   arm64: Kconfig: switch to HAVE_PWRCTRL
>   wifi: ath11k: switch to PCI_PWRCTRL_PWRSEQ
>   wifi: ath12k: switch to PCI_PWRCTRL_PWRSEQ
> 
>  arch/arm64/Kconfig.platforms            |  2 +-
>  drivers/net/wireless/ath/ath11k/Kconfig |  2 +-
>  drivers/net/wireless/ath/ath12k/Kconfig |  2 +-
>  drivers/pci/pwrctrl/Kconfig             | 27 +++++++++++++++++++------
>  drivers/pci/pwrctrl/Makefile            |  8 ++++----
>  5 files changed, 28 insertions(+), 13 deletions(-)
> 



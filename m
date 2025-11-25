Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503ABD0EE00
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 18:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Ip/j9aPCPYo4Tez2I5USFmSYi0LZgG79POUmCP/TOE=; b=P6Z8YJekoEauiuD/zWVkXMFntl
	+lu2WveQYzkqtljJ9YtzZLjlkhPM3sjaLD48rakUFtHe/ke/eaq4cJYUUc8S8SfwB9yZdGYX8QtnF
	AWDMbtG1hJyCeM54Q2S++1QGp+gZXTYNwbVRsOUpjgyteReLnYIZ/CmfVKKFAUH8DkYkwlQ8tkJMR
	m5HSoLd989Ydiwk265LEMeUvob0u8AaVRHPbQCNmdq7RnTnGKWwI9SVteAt0vr2d54Vf57GVw16z6
	hbhqohJVsfj6kx6y7cDklAoTKLXmfJ8CRAhXlT2dLj+XtgzuC2R6F+UOpiQFCMmUIXbyU/9s0ruoI
	etZ49kyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxKo-0000000DiWI-2KdH;
	Tue, 25 Nov 2025 18:00:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNxKn-0000000DiVr-0nfH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 18:00:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 553866018D;
	Tue, 25 Nov 2025 18:00:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A84C4CEF1;
	Tue, 25 Nov 2025 18:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764093612;
	bh=7aV5v3Js8JnD672c3H3QPHvgFhNwPE7FtnDcETPF26g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SAC7uF2PfTHFryBDj6ceTAhUjx/ouXXDJE0/qD1S5e4lvFp4gI40PANMgDhT6/xcT
	 nLtcaSzC6hTRB5Sg0dccifpWFye4+jdcsMefEcb7rUyIYE6gB4/SdjQO1BiMCqHf73
	 rQ+HiruE5/uFtCaYZ8qt4uUEXdZ58TdCP7mqouIuzxAVoeX7ojCR+AOrLgFiy1mNxs
	 tl8v0SoDu6Wjre/1nQCIITb7obRfx7anRMEoKee7B+2lVMioSvWEwSKyb8i58b1Kt9
	 Dhr4TM4P+H+TJdMkwK6vVsLAo8nyeh76OFgklDqE0OXcVsixW1Vlxs9pgFSl1Et6pQ
	 YkTiYsc9yTUIQ==
Date: Tue, 25 Nov 2025 18:00:07 +0000
From: Will Deacon <will@kernel.org>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	jean-philippe@linaro.org, jgg@nvidia.com, praan@google.com,
	smostafa@google.com, robin.murphy@arm.com
Subject: Re: PRI support in arm-smmu-v3 driver
Message-ID: <aSXupxMeHLajOmDW@willie-the-truck>
References: <1256faaa-e9cd-46a6-9a42-25aa74b984a8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1256faaa-e9cd-46a6-9a42-25aa74b984a8@quicinc.com>
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

[+iommu list and usual suspects]

Hi Pavan,

On Tue, Nov 25, 2025 at 02:22:05PM +0530, Pavan Kondeti wrote:
> I am trying to understand IO fault handling in Linux w/ SMMUv3. While reading
> the code, I understand that SVA domain creation allows taking IO pagefaults.
> arm_smmu_enable_iopf() checks if the master support stall upon fault
> feature or not. How do we handle page faults for PCIe devices, for which 
> transactions cannot safely be stalled? IIUC, The PRI handling in the
> driver i.e arm_smmu_priq_thread()->arm_smmu_handle_ppr() is not doing
> anything. In the SVA support for SMMUv3 series v7, I see the support for
> PRI via "Add support for PRI" patch [1] but it is not merged. 
> 
> Can you please clarify if we can support SVA with PCIe devices w/o
> pinning the memory?
> 
> [1]
> https://lore.kernel.org/all/20200519175502.2504091-25-jean-philippe@linaro.org/

The only SVA client we've had for SMMUv3 in the upstream kernel is the
"uacce" thing from HiSilicon which is a platform device (rather than a
PCIe device) and so I think the PRI support just fell by the wayside due
to lack of an upstream user and no ability to test it.

I'm not sure whether or not Jason has plans to implement PRI but maybe
it's something you could help with if you have hardware?

Will


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C35DFCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 15:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egkQO5rSZuhvDzAWypjBMQfkK9TMUqcOI7fLpXUCcDY=; b=OCENkNCgCEFj7WMoWNJZQFQ97c
	+lfdas7Z8sQ/Yuwd4rse167eC9u5kLVQiQX/mPLWQjJbcvfptFF6wguClTwOPSPPy3WbSlcJwPIw9
	2JR/7XmcqlM0H7nmsftcxC4bWR2UKWgGD4i+Z1yByctXyBfqClPp0uDigywAtFm0B1j6zc/UJ+k36
	d9DzS2voFZ7QnzBbKfrNQKUrpLV//mcKGjLpK+5HV2Lq4PHpU+sX4m+PmEKYN2CmO+BTADbZTZ1/p
	At8o/O45wQxczc3Yzoln2LviTYg2+jXnoy6Feeuqk4HYe7jZWd6IOLqjUTjRXPtHIkQ0PHVuRDRUh
	p+/C64KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNB4J-000000030UL-3rc3;
	Wed, 13 May 2026 15:00:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNB4E-000000030PG-43St
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 15:00:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DECD60121;
	Wed, 13 May 2026 15:00:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E74EC2BCB3;
	Wed, 13 May 2026 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778684410;
	bh=/uW52ugSWwtF3Yt2difUPaJV99v9sizQWUARunWAmFc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrei1yAtUKzo0amo9A0//XrWbCS3EumS5X8DZfk97DLPG4FF/mwKvZmfcNrwHfi22
	 TLwoNZpB+YAWWgVFEijOVUFHfCOpSaPbQVnekr78I1R5VrMte3m7ZcDacMadqbvcpk
	 RY8HZiCK4y919QSMV/ax4vThVzjydZO2iGqc7BDez+7PFF1fP0phBcT1lWol4fLH91
	 FGSbRWt4x6J3t5eoQVBvqZqwppCsjqGWOTN8Jd7d/Kon5/E8wpH9U062xemFMYW7my
	 zAQ/DHvmyfMOxktWmg+Y2gBrb7iNaaUM87+Ktr0M3O7VAP5dLrVZir3KmkPs88itKC
	 gAnJvsGmpueMA==
Date: Wed, 13 May 2026 20:30:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Steev Klimaszewski <threeway@gmail.com>, bhelgaas@google.com, 
	bjorn.andersson@oss.qualcomm.com, jingoohan1@gmail.com, jonathanh@nvidia.com, 
	kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	lpieralisi@kernel.org, robh@kernel.org, will@kernel.org
Subject: Re: PCI: qcom: Add D3cold support
Message-ID: <22mtoygxvyfaibmfwv5itayhcwwjl2mv6knmdyfiehmebdgg4u@hfooqf6css2l>
References: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
 <20260504041407.289464-1-threeway@gmail.com>
 <ffd59407-c65c-4f99-a587-3b968f9c82c5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffd59407-c65c-4f99-a587-3b968f9c82c5@oss.qualcomm.com>
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

On Mon, May 04, 2026 at 12:36:29PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 5/4/2026 9:44 AM, Steev Klimaszewski wrote:
> > On Sun, May 3, 2026 at 10:37 PM Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> wrote:
> >>> v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
> >>> and unfortunately, the machine does not seem to get to a point where I can even
> >>> get logs from it.  Do you know what I might be missing?  I have *not* attempted
> >>> to remove the nvme drive and boot off USB to test it.
> >> This series, will not have any impact on the boot, this series comes in to the
> >> picture only in case
> >> of suspend and resume. can you share your platform details and kernel you are
> >> booting with.
> > Oddly, it seems to, because if I simply go back to v4, the system boots.  I'm
> > using a 7.0 kernel on the Thinkpad X13s (SC8280XP).  The sources are at
> > https://github.com/steev/linux/tree/lenovo-x13s-linux-7.0.y (with the v5
> > applied).  PCIE_QCOM is built-in to the kernel.  Not sure what other information
> > is needed.
> Hi Steev,
> 
> I made mistake in re basing the code, can you try below and see if that fixes
> your issue.
> I will send this in next patch series.
> 
> --- a/drivers/pci/controller/dwc/pcie-qcom.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> @@ -1327,7 +1327,7 @@ static enum dw_pcie_ltssm qcom_pcie_get_ltssm(struct
> dw_pcie *pci)
>         struct qcom_pcie *pcie = to_qcom_pcie(pci);
>         u32 val;
> 
> -       if (pcie->cfg->ops->ltssm_enable)
> +       if (pcie->cfg->ops->get_ltssm)
>                 return pcie->cfg->ops->get_ltssm(pcie);

Squashed this change while applying.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


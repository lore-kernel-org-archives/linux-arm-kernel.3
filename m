Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF738F30924
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 09:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHGfmLQlYWoWnO/gB4Jj0t1AleoYs9MLmnbOCdE0T4E=; b=tBPVqQX8sUGgY9hJHKHMY2LWg7
	E+Wa/wDApHbGCY7WCoE1uHaq2MhlEShUrjcyWLtp68TyTEH7yYr1d/63O8/ZgPDgBdn9fj9OGCUfR
	F2FmfzzQMaYToGcUArzMu8Y9Ktob+/wRLln70oEE/FelQUw2caH1wIe3rw6GQaARoQnNDg0zrXkM1
	XezNfKUGclb3Lrb6il7miRnRfnOxqWghtVmIuxkPaD6d3W6MkK0+a56zIrIMl4cQ2oID+PQWJMMU8
	6zDnflMk3UVh7f8pNE/e+P7bWUQdyVruMI5mmahXO5zw2j/EpcTqvbFCYZnHhIA2KAkFjE5KYll+v
	zLmP/jNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy56C-00000001PAh-3seY;
	Thu, 05 Mar 2026 09:34:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy56B-00000001PAC-1e7b
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 05 Mar 2026 09:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dHGfmLQlYWoWnO/gB4Jj0t1AleoYs9MLmnbOCdE0T4E=; b=XcZkXC2uOSFqaL2oGnmlaGcZgQ
	evaLZUhkt+BhKJfi33WnNr5UohdPr7sysZBoPuwKXK8+ehQD6eEEjYoMW2kQG6A26KXJwNm3T/IlP
	opI9tLTuRkfVe4ytA70ZhBimZF0Jaa8IqmCphK1TKp+DnBy9iu3kTeBEMbZ6brfxI9IU/Xfe5UwPD
	ucsHGe1c1BPUZ7LAMFqSoDq4Z8/C7SPKTGtZjFoFgtlKVR8dSkHLwcbX5iRmTv0ZZhdqTnh6+KY+Y
	aNDLZvc+Rrv+BQDGAo9GNeHtqTmZMNNZkLplZlfVClWjKF7yWLTUD5s9/E22ITyQGWmkQR+f02KyA
	vq51d57g==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy568-00000006Lho-1d1N
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 09:34:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04A3440577;
	Thu,  5 Mar 2026 09:34:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD47EC19423;
	Thu,  5 Mar 2026 09:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772703262;
	bh=o+Gt34zYsvVZNf9S0aEU6z0ayfCGUkefkXSathmQwOY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LZoqMdIevoJOdKFYKmLmmvsGrlJOmvo0VKoeyPYUoepG+AmtQCtsQUtfdw5O/+lex
	 QjlohXiJRjslpf/qz+85ry7b67eXoz+KIPtStGCLhvYiK/RmWOwF33eSRLn1566JTP
	 PnzBM0Ao7LIzhHDhah6FP43KCz7mxfxSPr0e+JHrDn4Uyzw+f/spcE0Nof3gUeyteM
	 xDi1IGsiQbNpIgdeZEIc168xBUYLWVPnPly8FEJc4WVHJyM58PwQMwnIPQwCiJfcUV
	 9Bsu55isc+KqwL7GXku4cMPppOCbLZEe9ETIh/HnfSmvOt9DDCA9L3lfDyfLK46cSj
	 kBg2ueTyjKeHA==
Date: Thu, 5 Mar 2026 15:04:08 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Will Deacon <will@kernel.org>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jonathanh@nvidia.com, 
	bjorn.andersson@oss.qualcomm.com
Subject: Re: [PATCH v2 5/5] PCI: qcom: Add D3cold support
Message-ID: <5bbsp5pqj2qk5c4zaaumykks6ekvhej6zpnezud3vzf3tha3rk@fxzjbfm3jroc>
References: <20260217-d3cold-v2-0-89b322864043@oss.qualcomm.com>
 <20260217-d3cold-v2-5-89b322864043@oss.qualcomm.com>
 <om6t5hlnxadpmet5i2gochjmfjw6mdfllrdbgewiz4u6vj3zot@nse5rbl3je64>
 <c0cb73d6-262e-4529-8b07-4c545c76015b@oss.qualcomm.com>
 <miorzejq4sxcl7pucaa7fq7fplbs7bqcnflawnw4qnvntxohmf@xyttdgbfllvy>
 <9327c6a7-b2af-420d-bb1e-f2829ddaef7f@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9327c6a7-b2af-420d-bb1e-f2829ddaef7f@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_093424_836602_585807B0 
X-CRM114-Status: GOOD (  31.41  )
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

On Thu, Mar 05, 2026 at 02:55:25PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 3/5/2026 2:44 PM, Manivannan Sadhasivam wrote:
> > On Thu, Mar 05, 2026 at 02:30:17PM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > On 3/5/2026 1:28 PM, Manivannan Sadhasivam wrote:
> > > > On Tue, Feb 17, 2026 at 04:49:10PM +0530, Krishna Chaitanya Chundru wrote:
> > > > > Add support for transitioning Qcom PCIe controllers into D3cold by
> > > > You cannot transition a 'PCIe controller' to D3Cold state, but only the
> > > > endpoints and bridges.
> > > > 
> > > > > integrating with the DWC core suspend/resume helpers.
> > > > > 
> > > > > Implement PME_TurnOff message generation via ELBI_SYS_CTRL and hook it
> > > > > into the DWC host operations so the controller follows the standard
> > > > > PME_TurnOff-based power-down sequence before entering D3cold.
> > > > > 
> > > > > When the link is suspended into D3cold, fully tear down interconnect
> > > > You cannot suspend a link into D3Cold. Link and D-State are different.
> > > > 
> > > > > bandwidth, OPP votes. If D3cold is not entered, retain existing behavior
> > > > > by keeping the required interconnect and OPP votes.
> > > > > 
> > > > > Drop the qcom_pcie::suspended flag and rely on the existing
> > > > > dw_pcie::suspended state, which now drives both the power-management
> > > > > flow and the interconnect/OPP handling.
> > > > > 
> > > > > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/pci/controller/dwc/pcie-qcom.c | 121 ++++++++++++++++++++-------------
> > > > >    1 file changed, 74 insertions(+), 47 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > index b02c19bbdf2ea5db252c2a0281a569bb3a0cc497..37442bbe588c36b0b0414cc4d0016da2d8424a87 100644
> > > > > --- a/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > +++ b/drivers/pci/controller/dwc/pcie-qcom.c
> > > > > @@ -145,6 +145,7 @@
> > > > [...]
> > > > 
> > > > > -	if (pcie->suspended) {
> > > > > -		ret = qcom_pcie_host_init(&pcie->pci->pp);
> > > > > -		if (ret)
> > > > > -			return ret;
> > > > > +		ret = icc_enable(pcie->icc_mem);
> > > > > +		if (ret) {
> > > > > +			dev_err(dev, "Failed to enable PCIe-MEM interconnect path: %d\n", ret);
> > > > > +			goto disable_icc_cpu;
> > > > > +		}
> > > > > -		pcie->suspended = false;
> > > > > +		/*
> > > > > +		 * Ignore -ETIMEDOUT here since it is expected when no endpoint is
> > > > > +		 * connected to the PCIe link.
> > > > > +		 */
> > > > > +		ret = dw_pcie_resume_noirq(pcie->pci);
> > > > > +		if (ret && (ret != -ETIMEDOUT))
> > > > No, dw_pcie_resume_noirq() was reworked to return -ETIMEDOUT to indicate a hard
> > > > failure. If the device is not found, it will return -ENODEV. So you should
> > > > fail the resume if -ETIMEDOUT is returned.
> > > Ack, didn't noticed the reworked changes, I will change -ETIMEDOUT to
> > > -ENODEV.
> > > 
> > No, that's what not I meant. I meant, you should do:
> > 
> > 	if (ret == -ETIMEDOUT)
> > 		goto fail;
> there can be other failures also right, where we should fail,
> like pci->pp.ops->init(&pci->pp); can return different error other than
> -ETIMEDOUT in that case we should fail here. - Krishna Chaitanya.

Hmm, I overlooked the init() callback. In that case, you should skip both
-ENODEV and -EIO and fail resume() for other errors.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


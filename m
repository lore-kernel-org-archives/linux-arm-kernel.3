Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37D36CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VwVLebZJMpkNW/Hpy5NIGgka35JKD+knjOKlH2qW3ZM=; b=D79P9kfwMrv2ifEYJ80jpfLU4K
	rdtYsOPzGvX3Tz7u8XezCFP3ISvek/URuPWHAvYxb4rn2JO7lNDSsjqQjBRhj88p2AzfpwuLtkqPZ
	XiR0oaK7GRPFhsTRlfjiGlTqWM3uxXEvcnhqus1Z2vpTxB6gD9EaFh84/4y9RGwrHpJLAiAkOBxSy
	UoSFuU6wXlhPRzVLDweyKeox7z6vAo4wu6EsBvb3zw4najmTJSeuDmAqe+8loPdJTxrgBEVBAQMVE
	/3XZmNfupJ8YYnpetCTjE5JGuYPrhAivmctbHTgVa3bYoqFdB57H0uyaKeWhQhz2199+yr8oGuw/U
	olpff9NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ogw-0000000B39m-0m2A;
	Thu, 25 Sep 2025 16:19:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ogu-0000000B37y-15zH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:19:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C75C44349;
	Thu, 25 Sep 2025 16:19:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 630F7C4CEF0;
	Thu, 25 Sep 2025 16:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758817171;
	bh=7AVIF0kZTDey6ZhzfUZ3+wr+sPFo2gu91AUy+CefXhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzkHAeNYo5rE0NLdPInOl3hThl6qLGz2kZnyIJDc6EeGnmbJvruBBlPhY7BeAxkVT
	 MEoDIdw1opJyCmSwj7oCaYEdBJeAnbj2sjy8FQvePRZWoWe+S4Wg42NHmrNkpxwN5s
	 pS00wtIxFfgXaDwvKOLchauboc8dNg/LM8+y46xtFylfHCtRLqpO6jKNdbgUP9RN1K
	 8J9lgZWVl9JOXq5rqwwDs1/nz40tWBCznax8SFnqRCAUfxUx6QV8+xrNdQhbM+8RvS
	 ZX8rcuWoimFqMOMQw2Onlh544FODNe4ukX4d8goFyHIgoCTSaxxW7KUlUSg8H1bzvr
	 AM+9voZqJoRFw==
Date: Thu, 25 Sep 2025 21:49:16 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, chaitanya chundru <quic_krichai@quicinc.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, Jingoo Han <jingoohan1@gmail.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, quic_vbadigan@quicnic.com, 
	amitk@kernel.org, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, jorge.ramirez@oss.qualcomm.com, 
	linux-arm-kernel@lists.infradead.org, Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v6 5/9] PCI: dwc: Implement .start_link(), .stop_link()
 hooks
Message-ID: <yofmk5uyykyv4jxzem622dtuyzknk7ipd5xlkzdrfl5v7tgojy@5aarg5wj6bar>
References: <20250828-qps615_v4_1-v6-5-985f90a7dd03@oss.qualcomm.com>
 <20250925145416.GA2164008@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250925145416.GA2164008@bhelgaas>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_091932_340722_2E135699 
X-CRM114-Status: GOOD (  29.14  )
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

On Thu, Sep 25, 2025 at 09:54:16AM -0500, Bjorn Helgaas wrote:
> On Thu, Aug 28, 2025 at 05:39:02PM +0530, Krishna Chaitanya Chundru wrote:
> > Implement stop_link() and  start_link() function op for dwc drivers.
> > 
> > Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> > ---
> >  drivers/pci/controller/dwc/pcie-designware-host.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> > index 952f8594b501254d2b2de5d5e056e16d2aa8d4b7..bcdc4a0e4b4747f2d62e1b67bc1aeda16e35acdd 100644
> > --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> > +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> > @@ -722,10 +722,28 @@ void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
> >  }
> >  EXPORT_SYMBOL_GPL(dw_pcie_own_conf_map_bus);
> >  
> > +static int dw_pcie_op_start_link(struct pci_bus *bus)
> > +{
> > +	struct dw_pcie_rp *pp = bus->sysdata;
> > +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> > +
> > +	return dw_pcie_host_start_link(pci);
> 
> This takes a pci_bus *, which could be any PCI bus, but this only
> works for root buses because it affects the link from a Root Port.
> 
> I know the TC9563 is directly below the Root Port in the current
> topology, but it seems like the ability to configure a Switch with I2C
> or similar is potentially of general interest, even if the switch is
> deeper in the hierarchy.
> 
> Is there a generic way to inhibit link training, e.g., with the Link
> Disable bit in the Link Control register?  If so, this could
> potentially be done in a way that would work for any vendor and for
> any Downstream Port, including Root Ports and Switch Downstream Ports.
> 

FWIW, the link should not be stopped for a single device, since it could affect
other devices in the bus. Imagine if this switch is connected to one of the
downstream port of another switch. Then stopping and starting the link will
affect other devices connected to the upstream switch as well.

This driver is doing it right now just because, there is no other way to
control the switch state machine. Ideally, we would want the PERST# to be in
asserted stage to keep the device from starting the state machine, then program
the registers over I2C and deassert PERST#. This will work across all of the
host controller drivers (if they support pwrctrl framework).

But since we don't have PERST# support for the pwrctrl framework, we can have
this as an adhoc solution. I don't think we should try to generalize it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


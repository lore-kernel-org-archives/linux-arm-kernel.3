Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED8DCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 17:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9dNfH+0ubbF2Akq75hPe+iYDP6ddhp7Aof/2clGvK0=; b=oxnJqqwXbWoNlxs0UoDn9ulAEH
	NcyTPJRGnINJWWjXg3O6fDo0eFPMQM6HK2byaLJjBpBCp0MilVbLvssl1bCPcjequcQ8Y3tvPQ5Zv
	3udwQ2afNTCKR5Uw15XAo5AQSZGzSnHuR6Z4RpPZK0N36dol4n7z2nzoL4rN6cPAbZSPfT73rv8Xy
	5XQELrLOcAGYrk6QY/MXEqqUW21HIva87dg6L/F2v3e2kV7lsouwSnmPgaBNqJL0aPYYsN+mD6agf
	UMwZ+QYf2OVjdi9zXDy56GC5FmqkW/fOc8AqbO1YKTjDIydYJS3AWKCQRqsaPuMzxOxpHCRjPo/oE
	9AibhY5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlWw-00000004aeo-2Lv2;
	Thu, 11 Sep 2025 17:56:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwlWu-00000004aeP-3bBo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 17:56:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0CEF44685;
	Thu, 11 Sep 2025 17:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15A9C4CEF0;
	Thu, 11 Sep 2025 17:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757613379;
	bh=OCHmyyyREP4+Sk7q9SH4hwADD3BC7U5F+hODRDkJinA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJ9KJYfAa+ZHiVzHuni8+5wVh1groCL0QGr8j3o6M1YeaKgZ/1CEvx5mJ9rxghYcP
	 U9MnU8ubpuf/eQ1Efabg0aZvOqKQzkzNp/ssxhkYZpC4FTcG+8Bd9KhP3OfxSE40gK
	 +u5g8JMipzDx0UyWtOEOMk9KX76a9PHoRTM+2icbAcQqrNjldgtfUUQkGLsKPXqXho
	 LSL3in6LySimo1PemYXe77fKK59k4Y/zllA7P4lIlgntSNPzTFvbpN/rFNtCMBVOYA
	 Pf0+wI9N4jhc/Z5qlMvQF8CiDWxDQyAjT8Q85Z9LP38x2rg6rhQlR/jUvtdvs5RhQ6
	 Q3+LsdkDAP12A==
Date: Thu, 11 Sep 2025 23:26:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, yuji2.ishikawa@toshiba.co.jp
Subject: Re: [PATCH v3 2/2] PCI: dwc: visconti: Remove cpu_addr_fix() after
 DTS fix ranges
Message-ID: <chsfhg3u5akllpggnjnld5uv2jauwfaccuaoodcmzlpv2nou4s@czb4swbr3she>
References: <1757298848-15154-3-git-send-email-nobuhiro.iwamatsu.x90@mail.toshiba>
 <20250908215510.GA1467223@bhelgaas>
 <aMGi4smALwIJS8Tc@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aMGi4smALwIJS8Tc@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_105620_919881_C7A5AEB4 
X-CRM114-Status: GOOD (  16.44  )
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

On Wed, Sep 10, 2025 at 12:10:10PM GMT, Frank Li wrote:
> On Mon, Sep 08, 2025 at 04:55:10PM -0500, Bjorn Helgaas wrote:
> > In subject, s/PCI: dwc: visconti:/PCI: visconti:/ to match previous
> > history.
> >
> > On Mon, Sep 08, 2025 at 11:34:08AM +0900, Nobuhiro Iwamatsu wrote:
> > > From: Frank Li <Frank.Li@nxp.com>
> > >
> > > Remove cpu_addr_fix() since it is no longer needed. The PCIe ranges
> > > property has been corrected in the DTS, and the DesignWare common code now
> > > handles address translation properly without requiring this workaround.
> >
> > As Mani pointed out, the driver has to continue working correctly with
> > any old DTs in the field.
> 
> DTS should be merged first, then after some linux release cycle, then PCI
> can merge this change.
> 
> The similar case happen at other area, which broken back compatible. But
> we still need move forward.
> 

Absolutely not! DT is a firmware. Even though the firmware turns out to be
buggy, we should not regress platforms that were using the old firmware.

We can surely remove the check after some time. Maybe when all the stable
kernels stop supporting older DTs. But not until then.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


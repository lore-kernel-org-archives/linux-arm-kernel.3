Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10346F532E8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 07:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfgBcgmLcShvMcDnhDId8RiDYNNyrRngvXQLLQ4MCxo=; b=ZGLBFj24ulV2kZbO/fiFLn7wWq
	uvaiL75DqYk4tkYM8y78/Vg0USIrAgJCBrClQqIHuCYHm7HHRI1+yvUecKVW/U+IPRjIxQsISYeO/
	gT620u+kV9tTUEC1tQh6vCMBlI5rV3DW9ir38B6TimOpeXN7J32mEn/5yowzQogTYiNN8WGREgqgt
	0/Q4ETZRElY/R27WNA7Ia4+OFYxtBHnOQhpsqB5Fc3CRwmebsGLj5saGfJUztX9SmNt8GbMIVtUHq
	Wni7W0ARJXu/hA8zm7vXqapjLgHott4CJvTPacCfA9wY0CRY/68cfDlToNPG1c57bO9imxQ1rIKOc
	WJrbBpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vxc-00000000s24-2Cb5;
	Tue, 24 Mar 2026 07:13:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vxb-00000000s1v-2B1t
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 07:13:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NfgBcgmLcShvMcDnhDId8RiDYNNyrRngvXQLLQ4MCxo=; b=kwei8Bji5kG2JSL+9P5sLohgZ7
	4tuMXPRLo6MpwFPsCK5uOu2mTk6JRCT0GSX8pr6M9+daQBp3G5tnjMiNpaSorw+pTmIG/G2hGb7sq
	oiE73h3PpRNrQZwLnHT1X9MlsxsH6VLenEGqj3Pibl17xPLsO3vT/SoWqxip5b/lKHIquiwUi1tpi
	UfblPDaJrR4pUweaPS0k0qIka2K3BAKJQl+IXLzbet5LjuabWS7ZnBp5G7Gpvd6KLtP/+9nPI/5Qv
	JskcVRFsTdbmHXYupVZnk1z6fXyk55KLeQf/hP7evD+18VCGPn/y8wDXnhHO3jdBWapvnDtJPAcBu
	kwzYXwkQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4vxU-00000003Ng1-1Y6s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 07:13:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D3BE444471;
	Tue, 24 Mar 2026 07:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51705C19424;
	Tue, 24 Mar 2026 07:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774336423;
	bh=BEQCK3T20vwV9FXpCZnGuBMjUPmDCTkQ/0wFCqML874=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YpY8LbqMXKIRLaF3S6C1EG9sDL4rwb07YQP5aJV9/vOh2fioYnkHnealNZT2sZ08S
	 DaV5MpEWESeeB9EzKJ1pMnG1Q6Tev3oB4T1MHDu9w8crOsIXnwN6wkyc+bvntGxsCw
	 78NsWATeJvsZ6XpI/UKz9f4Z4AhWLla5SxuFtfl+JmFMzGGCQfW0xsDhEWGgWlSsQE
	 NUj8dCDM8+tMyhndZuHFYmPobLom/U7E+vuEuerDV3gKkwXV0iiYBzNhtYRJm262Nv
	 i9gmn0k4ssrjOXhMw4HQkeoipJ19O2qSBmriYvz7AG2fgcLr1T2b0lYGqHEVyOndKr
	 MHQ5C09jrcZWw==
Date: Tue, 24 Mar 2026 12:43:30 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Gary Yang <gary.yang@cixtech.com>, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 1/2] dt-bindings: PCI: cix,sky1-pcie-host: Add
 power-domains
Message-ID: <fiipz7tlqsd2hm457qr5r36qmrgh3sp2qt52oaaauyp5wmwmz4@fgmqawxrhir4>
References: <20260313114914.1564115-1-gary.yang@cixtech.com>
 <20260313114914.1564115-2-gary.yang@cixtech.com>
 <20260314-maize-warthog-of-modernism-f74475@quoll>
 <abfEO6iW3NcnMyNx@nchen-desktop>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <abfEO6iW3NcnMyNx@nchen-desktop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_071350_536817_387BDE18 
X-CRM114-Status: GOOD (  14.27  )
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

On Mon, Mar 16, 2026 at 04:50:03PM +0800, Peter Chen wrote:
> On 26-03-14 10:26:11, Krzysztof Kozlowski wrote:
> > EXTERNAL EMAIL
> > 
> > On Fri, Mar 13, 2026 at 07:49:13PM +0800, Gary Yang wrote:
> > > The Sky1 PCIe controller resides in a dedicated power domain managed
> > > via SCMI. Add the power-domains property to the binding to allow
> > > describing this dependency.
> > >
> > > Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> > > ---
> > >  Documentation/devicetree/bindings/pci/cix,sky1-pcie-host.yaml | 3 +++
> > >  1 file changed, 3 insertions(+)
> > 
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > 
> Thank Krzysztof for kindly review it.
> 
> Mani, I assume this patch will go to PCIe tree, right?
> 

Yes, I'll take it.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


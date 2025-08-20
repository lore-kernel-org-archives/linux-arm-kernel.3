Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D78DCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 00:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1ArZMZ5oJ4ZjwKgW3gcmStTRPsgDUL1oHpG6NRzht4=; b=L1g7AON+hgRGJm6djC2uNKnvbp
	mitAkR7T1M2JDVoImyYO5is3jn/+H9T8cA6LC1gyFZmHYZFCmuMRVqhhSe9SjFonxm5TpmIL3aXkY
	8VBRBWZBZGmiX4YGSINev1Y71jIQSMX4BeKp6aD705k8ygLSjNngNs1ulE64AvqajnLNhR9QGRn5O
	rC8NaVbbHgKQkV6LBIq9wM3BF6Rjt3EdNBbtUJ0PQtMrN+ACFsBDJHkmEAX4Y3XrSmGOq08Mb4Ufl
	DuY7CbpTCszJ5xtC3sTFKFDQ0VQmY1FXkMQU6MsNVzNDpjhAWc2oVNzO6SZQ/CURDulWgF4tuALu2
	TAssfUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uotWa-0000000FLJr-45fA;
	Thu, 21 Aug 2025 00:51:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uooyM-0000000EnHU-40pp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 19:59:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E627601D7;
	Wed, 20 Aug 2025 19:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6973AC4CEE7;
	Wed, 20 Aug 2025 19:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755719985;
	bh=5YZTBg91StssS8CLY8edYTCDHeeCUPhH7a/Oy9Gtgxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iFLTaOeOOX21B+JnSaJ8f1fz70JoPxM4xSUwV2CLXvdXaBxgN5Ph3w8Z+0R+qmwiZ
	 xHJ4zbMyptHmxhbdDeaCziDELJCn+hKNP3l6LuY7VLXj71Y9w1G6sQ7bKuxUM8yKkk
	 O9/Xi/6l5rHJL891xzHs0O6xTuUHpi4UKyfVHCrR59Cs8pHvUYDke75YwKRfH+Ukff
	 Z87Hr52+3MOdLbOspdWplJHIlPOfJL3aA2F8sOH/iGMhyRrHVIg6DM3aeWvDaUv5RF
	 KSUCBmwirvRKyxc71oIgx0cYUJuH2dImiVuzmyvlpMjK5mdzviZNSfExiD3qRicrGV
	 WXr7a1oeVFraQ==
Date: Wed, 20 Aug 2025 14:59:44 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>, l.stach@pengutronix.de,
	lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Add vaux for
 i.MX PCIe
Message-ID: <20250820195944.GA596147-robh@kernel.org>
References: <20250814085920.590101-1-hongxing.zhu@nxp.com>
 <20250814085920.590101-2-hongxing.zhu@nxp.com>
 <aJ4yuo6bULFy7uAv@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJ4yuo6bULFy7uAv@lizhi-Precision-Tower-5810>
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

On Thu, Aug 14, 2025 at 03:02:18PM -0400, Frank Li wrote:
> On Thu, Aug 14, 2025 at 04:59:19PM +0800, Richard Zhu wrote:
> > Refer to PCIe CEM r6.0, sec 2.3 WAKE# Signal, WAKE# signal is only
> > asserted by the Add-in Card when all its functions are in D3Cold state
> > and at least one of its functions is enabled for wakeup generation.
> >
> > The 3.3V auxiliary power (+3.3Vaux) must be present and used for wakeup
> > process. Since the main power supply would be gated off to let Add-in
> > Card to be in D3Cold, add the vaux and keep it enabled to power up WAKE#
> > circuit for the entire PCIe controller lifecycle when WAKE# is supported.
> 
> if it is standard, it should move to snps,dw-pcie-common.yaml.

It is standard because PCIe spec defines them. pci-bus-common.yaml 
already defines these:

  vpcie12v-supply:
    description: 12v regulator phandle for the slot

  vpcie3v3-supply:
    description: 3.3v regulator phandle for the slot

  vpcie3v3aux-supply:
    description: 3.3v AUX regulator phandle for the slot

Note that these should really be defined in the root port node rather 
than the host bridge node. We've done the latter because the RP node is 
often not defined.

Rob


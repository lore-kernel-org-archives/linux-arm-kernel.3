Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BD0CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQO37iwoL1842Avlnd13K3l5iFyYe8sdEPMZNsnUqmw=; b=HQkCxqqVmav2OqjwxGMSY7FJ0v
	XDazqs0wmhL3MgK4pVEfNx6t5k+ynKnSHY/ZSCcudQX9/QK+xvvxbbzysnqxvj08sxuKRWKoJApr8
	KkeQ13HH96RZ9m63eHpoRTd8DJ+Wsqh1SDJLco0k/f+5kSA39J+CZ3RZtsFwEcsKBX3Unzd1kWgUM
	lYZeU39VM5cYglCMhPZE7pYfFgH+GlkTppB8UKEa0vOHZpFy3aUt4Pvg03fKqvLlj42EH8xQzKRC7
	8OuGo6mfEAftnWrd7Tc8GrZH1xpvWfwMlDvgNxGa6WeBBli/UGu7XAx05yHJP0sg8y8UhNnGlCg7Z
	4nGxRThw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMn8Y-0000000GqIc-1HPZ;
	Tue, 12 May 2026 13:27:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMn8X-0000000GqIM-3K22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:27:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4601D61335;
	Tue, 12 May 2026 13:27:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484FBC2BCB0;
	Tue, 12 May 2026 13:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778592421;
	bh=N1R7TqmycjTX2xwMWBpyDMY64Xdu0Sxh/2pss/RBKaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cKYk/TZy3Ie0pFOp7a9/YmoLU7+Wmas6Ib9z0fwDYQcgzHEqK7gvOBcL3Zqq1B8yc
	 ahYsJFyBNCY3nbSltUHnMiLSNcuwC/WeuTvQTUH+xwrd7cDJoV9p7Ej6BnRlO6UxLi
	 QL4yU1XXw/1ycML975bp0e+jYaXs90knhVNeWyTw1352l8LuuMfOi2A8eCv0mPFzrr
	 tiOACA5MdfvtInsdlpyshTsDFR2oAmL9LzPnQZFFRb2AeANRdq4yp7jwp9FW36r9cV
	 jIi+ZDT0OnAbk9b5IxjVqfCdDKNvh+tUsbnikNisjdGKVCi5/qb+9hB+2Tlx75uv8V
	 KrX19J514c9FA==
Date: Tue, 12 May 2026 18:56:51 +0530
From: "mani@kernel.org" <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	Frank Li <frank.li@nxp.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and
 pme interrupts
Message-ID: <t3d2s6rl25ywobis4xiwwdvjrccua2qrpwfsxqpvp6qw5pzofa@kjm4wzcpjcli>
References: <20260430050954.3467984-1-hongxing.zhu@nxp.com>
 <20260430050954.3467984-2-hongxing.zhu@nxp.com>
 <20260430-proud-ammonite-of-gaiety-abaafc@quoll>
 <AM0PR04MB52202A13D528B3AE16C3616A8C352@AM0PR04MB5220.eurprd04.prod.outlook.com>
 <55258a51-9cdb-451c-be06-74b9b3020cbc@kernel.org>
 <GV2PR04MB12019F5425D6EB9AE52FC32CE8C3C2@GV2PR04MB12019.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <GV2PR04MB12019F5425D6EB9AE52FC32CE8C3C2@GV2PR04MB12019.eurprd04.prod.outlook.com>
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

On Thu, May 07, 2026 at 08:04:22AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: Krzysztof Kozlowski <krzk@kernel.org>
> > Sent: Thursday, April 30, 2026 6:49 PM
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > bhelgaas@google.com; Frank Li <frank.li@nxp.com>; l.stach@pengutronix.de;
> > lpieralisi@kernel.org; kwilczynski@kernel.org; mani@kernel.org;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com; linux-
> > pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > devicetree@vger.kernel.org; imx@lists.linux.dev; linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH v3 1/3] dt-bindings: PCI: imx6q-pcie: Add intr, aer and pme
> > interrupts
> > 
> > On 30/04/2026 10:37, Hongxing Zhu wrote:
> > >> -----Original Message-----
> > >> From: Krzysztof Kozlowski <krzk@kernel.org>
> > >> Sent: Thursday, April 30, 2026 4:04 PM
> > >> To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > >> Cc: robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org;
> > >> bhelgaas@google.com; Frank Li <frank.li@nxp.com>;
> > >> l.stach@pengutronix.de; lpieralisi@kernel.org;
> > >> kwilczynski@kernel.org; mani@kernel.org; s.hauer@pengutronix.de;
> > >> kernel@pengutronix.de; festevam@gmail.com; linux-
> > >> pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > >> devicetree@vger.kernel.org; imx@lists.linux.dev;
> > >> linux-kernel@vger.kernel.org
> > >> Subject: Re: [PATCH v3 1/3] dt-bindings: PCI: imx6q-pcie: Add intr,
> > >> aer and pme interrupts
> > >>
> > >> On Thu, Apr 30, 2026 at 01:09:52PM +0800, Richard Zhu wrote:
> > >>> Add 'intr', 'aer', and 'pme' interrupt entries to the i.MX6Q PCIe
> > >>> binding to support PCIe event-based interrupts for general
> > >>> controller events, Advanced Error Reporting, and Power Management Events
> > respectively.
> > >>>
> > >>> These interrupts are optional for existing variants (imx6q, imx6sx,
> > >>> imx6qp, imx7d, imx8mq, imx8mm, imx8mp) to maintain backward
> > >>> compatibility with existing device trees.
> > >>>
> > >>> For fsl,imx95-pcie, all 5 interrupts (msi, dma, intr, aer, pme) are
> > >>> mandatory due to hardware requirements.
> > >>>
> > >>> This introduces an ABI requirement for fsl,imx95-pcie. The i.MX95
> > >>> hardware requires dedicated interrupt lines for AER, PME, and
> > >>> general controller events due to its redesigned interrupt
> > >>> architecture. i.MX95 cannot function correctly without explicit
> > >>> interrupt routing for error handling, power management and link event
> > detection.
> > >>
> > >> fsl,imx95-pcie was added more than two years ago, so how it cannot
> > >> function correctly? Are you saying that for two years you had here
> > >> completely broken code?
> > >>
> > >> If this wasn't tested for two years, how can we believe anything is tested now?
> > > The basic PCIe functionality has been working since the initial
> > > fsl,imx95-pcie support. However, AER (Advanced Error Reporting) and
> > > link up/down detection were not previously enabled. This patch-set
> > > adds and verifies support for these advanced features.
> > >
> > 
> > That is not what you said in the commit msg.
> Hi Krzysztof:
> Sorry for the delayed response due to a holiday.
> After reviewing this patch-set again, I'd like to suggest an alternative
> approach: would it be possible to mark these newly added interrupts as
> optional?

Yes, since even without these interrupts, PCIe functionality still works. Only
issue is that it cannot report error and recover from LDn.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


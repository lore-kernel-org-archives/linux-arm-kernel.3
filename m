Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EFFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 10:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZh3EAAFw5xS6vEfH+7ykrXOPIOPAtE3oZ5wdfzZmtM=; b=uEeXcK4JjMG660Yv/JhSCZ94lP
	jx+GyxeK9VnLtPW6JNmz/UpxYLxWD6TEZU+bZ8kYkdAd8wb1aPWFHsOLVwwhpHsHVYMtlZpGwo1T4
	dIL6ak44SFGfvt26En/ObMYbXjr5w56xj5IxQDKt0ytvUEUAPOOkop4er1XC8NRaRWvvvGucT21Ro
	ub+sE7x1OpY02EAQhqJwbnl29n41Qixc5h2a1xxdY/Sgen/8woamodASA02O5PSkoLypWkMWuvpO5
	DX5PAxg0lzlfjpE183QgsAy5ijDhU2AkEeaVU7hZ2itn8nVvUC4G99c94otCVd2OzdX8he1MtTYAp
	ZqpReH2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrYl-00000009a9B-2SlK;
	Mon, 03 Nov 2025 10:13:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFrYk-00000009a8n-05Xp;
	Mon, 03 Nov 2025 10:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23CAA60007;
	Mon,  3 Nov 2025 10:13:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DCD2C4CEE7;
	Mon,  3 Nov 2025 10:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762164788;
	bh=3HvSwd3Hdi/gWECtVw0p3KFzqcxgB2PNYUbt+Yyqiyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eI+/sVQ9SlsH4jxh7ldDJPSzl9u1cyTsFagb7+gvmUh4ExL/zDq0bf1Gbvmp5sPSx
	 PxOyHzDt9E/jVv2OmRkPvGEqzu1k2oujSXANHPm55HKlbab005K9610paGE/jgx9TW
	 M6hQTPI06hlYMNQX/ikArLJ0f1JHblDl5xEcz9EXYY7E798ASikJD+vbmD2II+gdxg
	 PBGbA1BQfNdMFMtvDfCgz/DPrYIJFUoPL1O4ODwd2uR7tdRhknbXeVXvi5vkO2eNxI
	 q0s58Y/m24NQnWTfX5sgkHF3IP/b2lDmSmuoX9GhlxwpFYy386TOHtXf9vpc/W15tl
	 h9byOjeJtFrUQ==
Date: Mon, 3 Nov 2025 15:42:58 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hanjie Lin <hanjie.lin@amlogic.com>, Yue Wang <yue.wang@amlogic.com>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Andrew Murray <amurray@thegoodpenguin.co.uk>, 
	Jingoo Han <jingoohan1@gmail.com>, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH RESEND 1/3] dt-bindings: PCI: amlogic: Fix the register
 name of the DBI region
Message-ID: <rguwscxck7vel3hjdd2hlkypzdbwdvafdryxtz5benweduh4eg@sny4rr2nx5aq>
References: <20251101-pci-meson-fix-v1-0-c50dcc56ed6a@oss.qualcomm.com>
 <20251101-pci-meson-fix-v1-1-c50dcc56ed6a@oss.qualcomm.com>
 <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <31271df3-73e1-4eea-9bba-9e5b3bf85409@linaro.org>
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

On Mon, Nov 03, 2025 at 10:47:36AM +0100, Neil Armstrong wrote:
> Hi Mani,
> 
> On 11/1/25 05:29, Manivannan Sadhasivam wrote:
> > Binding incorrectly specifies the 'DBI' region as 'ELBI'. DBI is a must
> > have region for DWC controllers as it has the Root Port and controller
> > specific registers, while ELBI has optional registers.
> > 
> > Hence, fix the binding. Though this is an ABI break, this change is needed
> > to accurately describe the PCI memory map.
> 
> Not fan of this ABI break, the current bindings should be marked as deprecated instead.
> 

Fair enough. Will make it as deprecated.

- Mani

> > 
> > Fixes: 7cd210391101 ("dt-bindings: PCI: meson: add DT bindings for Amlogic Meson PCIe controller")
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> > ---
> >   Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
> > index 79a21ba0f9fd62804ba95fe8a6cc3252cf652197..c8258ef4032834d87cf3160ffd1d93812801b62a 100644
> > --- a/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
> > +++ b/Documentation/devicetree/bindings/pci/amlogic,axg-pcie.yaml
> > @@ -36,13 +36,13 @@ properties:
> >     reg:
> >       items:
> > -      - description: External local bus interface registers
> > +      - description: Data Bus Interface registers
> >         - description: Meson designed configuration registers
> >         - description: PCIe configuration space
> >     reg-names:
> >       items:
> > -      - const: elbi
> > +      - const: dbi
> >         - const: cfg
> >         - const: config
> > @@ -113,7 +113,7 @@ examples:
> >       pcie: pcie@f9800000 {
> >           compatible = "amlogic,axg-pcie", "snps,dw-pcie";
> >           reg = <0xf9800000 0x400000>, <0xff646000 0x2000>, <0xf9f00000 0x100000>;
> > -        reg-names = "elbi", "cfg", "config";
> > +        reg-names = "dbi", "cfg", "config";
> >           interrupts = <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>;
> >           clocks = <&pclk>, <&clk_port>, <&clk_phy>;
> >           clock-names = "pclk", "port", "general";
> > 
> 

-- 
மணிவண்ணன் சதாசிவம்


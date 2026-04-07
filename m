Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CA4EDB7C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 07:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ke8Gk3iGWhjnud+qMNlnODfI83K5OlOTX4Z/E6d5ewk=; b=djZf2z+/flRnfu1fwj4ONhjOp0
	tIGtXxUddQERLEC+pttNghQFDBNaOEmSl1MMUovlW+v7bVE8xbGHDwdKJ6c8EGtgNW20vmGNTMNby
	QRQ8wWcrFx8g6DKGb2gcRkxhFN/1+cAvFnTrxJ9xqPZRpqJD9Y5NKjnzzPH8TXZEnPMgUSYxsNqN0
	4k5zh7i7lLHIfHWLhW4276w/m+heGvvBFJbW7ilhfIHSXo0jm7xHFSrKBjMpwn/SJzalHOidxfJoN
	/YB55A6xKOn+QRTg6QqwMzoqmV0ASDfP3zGTTmn5FIUztQVjGcMv67y5Es4vGNw0NjQaTP0yIbf/P
	+82+/V5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0nU-000000063xR-2Wvd;
	Tue, 07 Apr 2026 07:24:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0nR-000000063x5-3hRz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 07:24:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 395BA43FDE;
	Tue,  7 Apr 2026 07:24:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6945C116C6;
	Tue,  7 Apr 2026 07:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775546665;
	bh=jEc9B6t8+lXVDt5wKNS6slGegGXQKYnxbzzTO5yXNHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rPmQrMhVxW1tQdh87LPyX8H6IconvtcEUVKVP+aHk9T7B7lTyXvj9pj5i5oTV7OmZ
	 Damuf1sgbXHS0uOdxW2AHsOaVlkv4gyp7NXcgtUvyHldfqSC4U6+i0/KmZkW5mQ9Ae
	 MjG4FJ93sVs3JIApyRkt683Cvq35sw1Cb8kbsLpKIjjnj9oq8llBAlNQPCTs/ndC5b
	 R3mpnhoVDEVrLmTs0r+m+f5WkAGKz5d1MOTxTAs5vvFl7uAD5cCE5l2D74u+1ngZjj
	 0BF5S/GyFrHnvRDuIQdKo8ojli0YLHdBLptY236EeP97P5QuZXkFet7IVcYUibvVqd
	 0D/kWWYt39OtA==
Date: Tue, 7 Apr 2026 12:54:15 +0530
From: "mani@kernel.org" <mani@kernel.org>
To: Hongxing Zhu <hongxing.zhu@nxp.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Frank Li <frank.li@nxp.com>, 
	"jingoohan1@gmail.com" <jingoohan1@gmail.com>, "l.stach@pengutronix.de" <l.stach@pengutronix.de>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"robh@kernel.org" <robh@kernel.org>, "bhelgaas@google.com" <bhelgaas@google.com>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v1] PCI: imx6: Add force_suspend flag to override L1SS
 suspend skip
Message-ID: <ihoprlijtwgihkbmszm53iftvpyg7ljvubs3bv2lt22uma74ul@zqgulwmj4jpb>
References: <AS8PR04MB8833061F34B9BEFC9D19764A8C4EA@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <20260323220858.GA1084506@bhelgaas>
 <AS8PR04MB8833137860C682F9E1E743E08C48A@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <y76fzvju42srykr3khio2bx5lmzusy6iasodvs45imis7fw3b5@wjv3gsocj534>
 <AS8PR04MB8833C20B6FF92F96EE7641E38C5AA@AS8PR04MB8833.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AS8PR04MB8833C20B6FF92F96EE7641E38C5AA@AS8PR04MB8833.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_002426_058532_1BC26ED1 
X-CRM114-Status: GOOD (  41.33  )
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

On Tue, Apr 07, 2026 at 03:31:57AM +0000, Hongxing Zhu wrote:
> > -----Original Message-----
> > From: mani@kernel.org <mani@kernel.org>
> > Sent: 2026年4月4日 1:03
> > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > Cc: Bjorn Helgaas <helgaas@kernel.org>; Frank Li <frank.li@nxp.com>;
> > jingoohan1@gmail.com; l.stach@pengutronix.de; lpieralisi@kernel.org;
> > kwilczynski@kernel.org; robh@kernel.org; bhelgaas@google.com;
> > s.hauer@pengutronix.de; kernel@pengutronix.de; festevam@gmail.com;
> > linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> > imx@lists.linux.dev; linux-kernel@vger.kernel.org; stable@vger.kernel.org
> > Subject: Re: [PATCH v1] PCI: imx6: Add force_suspend flag to override L1SS
> > suspend skip
> > 
> > On Tue, Mar 24, 2026 at 02:01:58AM +0000, Hongxing Zhu wrote:
> > > > -----Original Message-----
> > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > > Sent: 2026年3月24日 6:09
> > > > To: Hongxing Zhu <hongxing.zhu@nxp.com>
> > > > Cc: Frank Li <frank.li@nxp.com>; jingoohan1@gmail.com;
> > > > l.stach@pengutronix.de; lpieralisi@kernel.org;
> > > > kwilczynski@kernel.org; mani@kernel.org; robh@kernel.org;
> > > > bhelgaas@google.com; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > > festevam@gmail.com; linux-pci@vger.kernel.org;
> > > > linux-arm-kernel@lists.infradead.org;
> > > > imx@lists.linux.dev; linux-kernel@vger.kernel.org;
> > > > stable@vger.kernel.org
> > > > Subject: Re: [PATCH v1] PCI: imx6: Add force_suspend flag to
> > > > override L1SS suspend skip
> > > >
> > > > On Wed, Mar 18, 2026 at 02:55:45AM +0000, Hongxing Zhu wrote:
> > > > > > -----Original Message-----
> > > > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > > > ... [messed up quoting]
> > > >
> > > > > > On Tue, Mar 17, 2026 at 02:12:56PM +0800, Richard Zhu wrote:
> > > > > > > Add a force_suspend flag to allow platform drivers to force
> > > > > > > the PCIe link into L2 state during suspend, even when L1SS
> > > > > > > (ASPM L1
> > > > > > > Sub-States) is enabled.
> > > > > > >
> > > > > > > By default, the DesignWare PCIe host controller skips L2
> > > > > > > suspend when L1SS is supported to meet low resume latency
> > > > > > > requirements for devices like NVMe. However, some platforms
> > > > > > > like i.MX PCIe need to enter L2 state for proper power
> > > > > > > management regardless of L1SS
> > > > support.
> > > > > > >
> > > > > > > Enable force_suspend for i.MX PCIe to ensure the link enters
> > > > > > > L2 during system suspend.
> > > > > >
> > > > > > I'm a little bit skeptical about this.
> > > > > >
> > > > > > What exactly does a "low resume latency requirement" mean?  Is
> > > > > > this an actual functional requirement that's special to NVMe, or
> > > > > > is it just the desire for low resume latency that everybody has
> > > > > > for all devices?
> > > > >
> > > > > From my understanding, L1SS mode is characterized by lower latency
> > > > > when compared to L2 or L3 modes.
> > > > >
> > > > > It can be used on all devices, avoiding frequent power on/off cycles.
> > > > > NVMe can also extend the service life of the equipment.
> > > >
> > > > All the above applies to all platforms, so it's not an argument for
> > > > i.MX-specific code here.
> > > >
> > > Hi Bjorn:
> > > Thanks for your kindly review.
> > > Yes, it is.
> > > > > > Is there something special about i.MX here?  Why do we want i.MX
> > > > > > to be different from other host controllers?
> > > > >
> > > > > i.MX PCIe loses power supply during Deep Sleep Mode (DSM),
> > > > > requiring full reinitialization after system wake-up.
> > > >
> > > > I don't know what DSM means in PCIe or how it would help justify
> > > > this change.
> > > >
> > > i.MX PCIe power is gated off during suspend, requiring full
> > > reinitialization on resume
> > >
> > 
> > Is this an unconditional behavior? What if the PCIe device is configured as a
> > wakeup source like WOL, WOW? And if you connect NVMe, this behavior will
> > result in resume failure as NVMe driver expects the power to be retained if
> > ASPM is supported.
> 
> Yes, this is unconditional behavior. The i.MX PCIe controller exclusively
> supports sideband wakeup mechanisms, which operate independently of the
> PCIe link state and device power configuration.
> 

I believe you are referring to WAKE# as the sideband wakeup mechanism. If so,
both host and device has to support WAKE#.

> For devices configured as wakeup sources (WOL, WOW, etc.): The sideband
> wakeup path bypasses the standard PCIe power management, so these
> configurations do not impact the i.MX PCIe RC controller's suspend/resume
> behavior.
> 

Once user enables wakeup for a device, PCI core will configure PME_EN only if
the device supports toggling WAKE# from D3Cold. So the wakeup functionality
depends on device too, not just the RC.

> For NVMe devices with ASPM: While NVMe drivers typically expect power
> retention when ASPM is enabled, the i.MX implementation's sideband wakeup
> mechanism operates through a separate signaling path. The wakeup functionality
> does not depend on maintaining PCIe link power, thus avoiding conflicts with
> NVMe power state expectations.
> 

There is no relation between WAKE# and NVMe. NVMe is a passive device, so it
doesn't support WAKE#. With this patch alone, the NVMe driver won't resume (is
ASPM is enabled). You need to tell the NVMe driver to perpare for power loss
too. Maybe this patch can help you:
https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com/

But that patch will only help if your platform supports S2RAM through PSCI.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


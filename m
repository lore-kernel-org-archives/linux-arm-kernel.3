Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF15CA100C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 23:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=01Cc48tgZsQO6D/iGaKHIZXVqSddSGSY01cZfuKAkc4=; b=Dh/eDwqsURtWgBQRFH1tMrQVM7
	V5wevNoF/KzGfgZ+W8kkv9u6C0ZwP8wIzgXQvsxiZSfO7cZAOfnI3eWuX4QpLkrA3j9tjU2kJjbp1
	ROH6wSqBTBar6UQKH6/1IcPgx5qGVsHF50NTa0a7X0jJzhFyflWRnCJPbBWDo3GHpsoJNBba3dSeu
	Ds9XdcWPTq+gMJZkFp1ivpW9ATuXzI3QD2e9GTzAWf1fBvcH2G/91O+keRT15025MUMST+4pd41eK
	U+dHaZEbhzg7g/cwe4fijkki+q3TZSyTgqrnl8bRyfY9RYXQPXPbdE3Mo17P3iT2YbVVc6p2joSmw
	tgYi2Clg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDh6-0000000EE5y-45ol;
	Mon, 01 Sep 2025 23:12:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut6rc-0000000DByb-3Vdu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 15:54:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C590436CB;
	Mon,  1 Sep 2025 15:54:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B14BC4CEF0;
	Mon,  1 Sep 2025 15:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756742076;
	bh=zbaUuwR137ygPnpQ0YzRAfrhZCcuUrJu1SPf+nLYCsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDsaAdUjDt21AAz1YuepphxiXMwMEqxbceRWO1eDFCn3hMyTS0P1AIdUaMqjd9LaY
	 w4UYGZg7mlCI1TfIxr73JZ4GUGJmOZAv8B0LamR11GLZSQZ99JmN3kwYnbn79q668f
	 +xy2lfiIDihfknyZ0KSJCXvKeOoWoloviYzJkK3zlAg3++z2h4I4LDqCL113xr9ORu
	 TrNNLs3a5QVAYlsSPLGOs/oLWL7G2++Qr6o0Zf+LSESwfXV92gYCO8t2zWyoVEy8sp
	 Wt7ejild3mAw1jXg8Pa8V9BNc2/j0KJcP+ldmmtYXzIGj/EMgFnwE4RMTSwqRNxnoX
	 5N7daNBwPszmw==
Date: Mon, 1 Sep 2025 21:24:25 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, bhelgaas@google.com, 
	lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, magnus.damm@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, lizhi.hou@amd.com, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 5/9] PCI: rzg3s-host: Add Initial PCIe Host Driver for
 Renesas RZ/G3S SoC
Message-ID: <vdn4lomtgr6htab7uodgm75iphju6yyimhlnfonysxxdpudib7@qm4yettsvsrs>
References: <20250704161410.3931884-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704161410.3931884-6-claudiu.beznea.uj@bp.renesas.com>
 <ddxayjj5wcuuish4kvyluzrujkes5seo7zlusmomyjfjcgzcyj@xe3zzzmy2zaj>
 <8ef466aa-b470-4dcb-9024-0a9c36eb9a6a@tuxon.dev>
 <zsgncwvhykw4ja3bbqaxwupppjsqq4pcrdgrsduahokmt72xsm@twekpse6uzzh>
 <CAMuHMdUu0uXBJndcwWoZp8NNyBJox5dZw4aoB8Ex50vBDDtP7g@mail.gmail.com>
 <6f2hpdkonomgrfzqoupcex2rpqtlhql4lmsqm7hqk25qakp7ax@bfrzflghmnev>
 <CAMuHMdUEqKc+qtRXiPzgjhWaer5KLroZ+hCSVLCQ497h3BtOAw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUEqKc+qtRXiPzgjhWaer5KLroZ+hCSVLCQ497h3BtOAw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_085436_919089_0E748DF0 
X-CRM114-Status: GOOD (  55.07  )
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

On Mon, Sep 01, 2025 at 04:22:16PM GMT, Geert Uytterhoeven wrote:
> Hi Mani,
> 
> On Mon, 1 Sept 2025 at 16:04, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > On Mon, Sep 01, 2025 at 11:25:30AM GMT, Geert Uytterhoeven wrote:
> > > On Sun, 31 Aug 2025 at 06:07, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > > On Sat, Aug 30, 2025 at 02:22:45PM GMT, Claudiu Beznea wrote:
> > > > > On 30.08.2025 09:59, Manivannan Sadhasivam wrote:
> > > > > > On Fri, Jul 04, 2025 at 07:14:05PM GMT, Claudiu wrote:
> > > > > >> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > > > > >>
> > > > > >> The Renesas RZ/G3S features a PCIe IP that complies with the PCI Express
> > > > > >> Base Specification 4.0 and supports speeds of up to 5 GT/s. It functions
> > > > > >> only as a root complex, with a single-lane (x1) configuration. The
> > > > > >> controller includes Type 1 configuration registers, as well as IP
> > > > > >> specific registers (called AXI registers) required for various adjustments.
> > > > > >>
> > > > > >> Hardware manual can be downloaded from the address in the "Link" section.
> > > > > >> The following steps should be followed to access the manual:
> > > > > >> 1/ Click the "User Manual" button
> > > > > >> 2/ Click "Confirm"; this will start downloading an archive
> > > > > >> 3/ Open the downloaded archive
> > > > > >> 4/ Navigate to r01uh1014ej*-rzg3s-users-manual-hardware -> Deliverables
> > > > > >> 5/ Open the file r01uh1014ej*-rzg3s.pdf
> > > > > >>
> > > > > >> Link: https://www.renesas.com/en/products/rz-g3s?queryID=695cc067c2d89e3f271d43656ede4d12
> > > > > >> Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > >> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> > >
> > > > > >> +  ret = pm_runtime_resume_and_get(dev);
> > > > > >> +  if (ret)
> > > > > >> +          return ret;
> > > > > >> +
> > > > > >
> > > > > > Do you really need to do resume_and_get()? If not, you should do:
> > > > >
> > > > > It it's needed to enable the clock PM domain the device is part of.
> > > > >
> > > >
> > > > I've replied below.
> > > >
> > > > > >
> > > > > >     pm_runtime_set_active()
> > > > > >     pm_runtime_no_callbacks()
> > > > > >     devm_pm_runtime_enable()
> > >
> > > > > >> +static int rzg3s_pcie_suspend_noirq(struct device *dev)
> > > > > >> +{
> > > > > >> +  struct rzg3s_pcie_host *host = dev_get_drvdata(dev);
> > > > > >> +  const struct rzg3s_pcie_soc_data *data = host->data;
> > > > > >> +  struct regmap *sysc = host->sysc;
> > > > > >> +  int ret;
> > > > > >> +
> > > > > >> +  ret = pm_runtime_put_sync(dev);
> > > > > >> +  if (ret)
> > > > > >> +          return ret;
> > > > > >
> > > > > > Since there are no runtime callbacks present, managing runtime PM in the driver
> > > > > > makes no sense.
> > > > >
> > > > > The PCIe device is part of a clock power domain. Dropping
> > > > > pm_runtime_enable()/pm_runtime_put_sync() in this driver will lead to this
> > > > > IP failing to work as its clocks will not be enabled/disabled. If you don't
> > > > > like the pm_runtime_* approach that could be replaced with:
> > > > >
> > > > > devm_clk_get_enabled() in probe and clk_disable()/clk_enable() on
> > > > > suspend/resume. W/o clocks the IP can't work.
> > > >
> > > > Yes, you should explicitly handle clocks in the driver. Runtime PM makes sense
> > > > if you have a power domain attached to the IP, which you also do as I see now.
> > > > So to conclude, you should enable/disable the clocks explicitly for managing
> > > > clocks and use runtime PM APIs for managing the power domain associated with
> > > > clock controller.
> > >
> > > Why? For the past decade, we've been trying to get rid of explicit
> > > module clock handling for all devices that are always part of a
> > > clock domain.
> > >
> > > The Linux PM Domain abstraction is meant for both power and clock
> > > domains.  This is especially useful when a device is present on multiple
> > > SoCs, on some also part of a power domain,  and the number of module
> > > clocks that needs to be enabled for it to function is not the same on
> > > all SoCs.  In such cases, the PM Domain abstraction takes care of many
> > > of the integration-specific differences.
> >
> > Hmm, my understanding was that we need to explicitly handle clocks from the
> > consumer drivers. But that maybe because, the client drivers I've dealt with
> > requires configuring the clocks (like setting the rate, re-parenting etc...) on
> > their own. But if there is no such requirement, then I guess it is OK to rely on
> > the PM core and clock controller drivers.
> 
> When you need to know the actual clock rate, or change it, you
> indeed have to handle the clock explicitly.  But it still may be enabled
> automatically through the clock domain.
> 

Yeah!

> > > > But please add a comment above pm_runtime_resume_and_get() to make it clear as
> > > > most of the controller drivers are calling it for no reason.
> > >
> > > Note that any child device that uses Runtime PM depends on all
> > > its parents in the hierarchy to call pm_runtime_enable() and
> > > pm_runtime_resume_and_get().
> >
> > Two things to note from your statement:
> >
> > 1. 'child device that uses runtime PM' - Not all child drivers are doing
> > runtime PM on their own. So there is no need to do pm_runtime_resume_and_get()
> > unless they depend on the parent for resource enablement as below.
> 
> It indeed depends on the child device, and on the bus.  For e.g. an
> Ethernet controller connected to a simple SoC expansion bus, the bus must
> be powered and clock, which is what "simple-pm-bus" takes care of
> ("simple-bus" does not).
> 

Right. But most of the PCI controller drivers call pm_runtime_resume_and_get()
for no good reasons. They might have just copied the code from a driver that did
it on purpose. So I tend to scrutinize these calls whenever they get added for a
driver.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


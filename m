Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26000CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 09:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vqcms3BCnTiqx8WKyJ73EQe5BSCTd5lDUjgoT9rk4Jw=; b=rHVyd/00flDpUEY79ZywKP8RD3
	XB+KZpeIzmvXRIuYNjEDNSAIXF9Yvd+EXgo1ypauDNqLBb9gmkVpYO2cVVihqEn8Z7PizAG4X9qVr
	+Amx73pNf70B5d1c37FI+RqQhjSyiuej99Bdor/Ur3/Lk/1axa7kAQvgKBNgM+MPWsqf6BDXf1SRc
	qsnW70SfqahVhwsjtkjfnwbKmRw+2AQsiDFZKc22Bdpq8EuT9LIGpy4WXKPxD02eVr1XQKWF/uCAn
	9uWsPgOFGC/9eo1P9RTiCbZ9twegIMrHdmO1A2r7WQPmnlJJYQAFJyFnRhcBPWgCWww0XYcI3GRpY
	cvDWcBxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQN4Z-00000005CgV-05KY;
	Tue, 02 Dec 2025 09:53:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQN4W-00000005Cfx-2Oom
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 09:53:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79B2243FE0;
	Tue,  2 Dec 2025 09:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D95D4C4CEF1;
	Tue,  2 Dec 2025 09:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764669203;
	bh=/AhUc5pNDMIB+MxG8tAbE5vEZvLdVKtKwk2LjUvq2j4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FYE3zYYo5Vf0etfLhw7gf+HgO4jDdia94Of7xcMn3TvSPUR5Xn0P9uVqMwBZjY3O+
	 vOcLfblHAfxA4wsR205oEiC/MYd6Tgmoq2FwAFb26Ky1prZedcELZIuV0j6GyZWz3U
	 s4+vlqBGevYEfKCVMhSzYggbwm/bdM2PjJYu9tGjH/6g+lVLMl5iXG8206RkTLeh1L
	 Gv/CZ17AmVfLwFGmpamjbiFBqn+ezSkCLiIByjsovx/zd3m9+/pTGyVDE/ZoGG6/L0
	 PX2mA7ZthsKOu8/grMPOrRA1WMYrrGgeWCFUWRtBQ5cOEoLDSy3srOH0govZhVMNYB
	 h/mETuUTem8eg==
Date: Tue, 2 Dec 2025 15:23:11 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	linux-pci@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, NXP S32 Linux Team <s32@nxp.com>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: linux-next: Tree for Nov 28
 (drivers/pci/controller/dwc/pcie-nxp-s32g.o)
Message-ID: <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
References: <20251128162928.36eec2d6@canb.auug.org.au>
 <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
 <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_015324_631144_1A23BBF6 
X-CRM114-Status: GOOD (  16.79  )
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

On Tue, Dec 02, 2025 at 09:54:24AM +0100, Vincent Guittot wrote:
> On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > + Vincent
> 
> Thanks for looping me in.
> >
> > On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> > >
> > >
> > > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > > Hi all,
> > > >
> > > > Changes since 20251127:
> > > >
> > >
> > > on i386 (allmodconfig):
> > >
> > > WARNING: modpost: vmlinux: section mismatch in reference: s32g_init_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: .init.text)
> 
> Are there details to reproduce the warning ? I don't have such warning
> when compiling allmodconfig locally
> 
> s32 pcie can only be built in but I may have to use
> builtin_platform_driver_probe() instead of builtin_platform_driver()
> 

The is due to calling a function belonging to the __init section from non-init
function. Ideally, functions prefixed with __init like memblock_start_of_DRAM()
should be called from the module init functions.

One way to fix would be to call memblock_start_of_DRAM() in probe(), and
annotate probe() with __init. Since there is no remove, you could use
builtin_platform_driver_probe().

This also makes me wonder if we really should be using memblock_start_of_DRAM()
in the driver. I know that this was suggested to you during reviews, but I would
prefer to avoid it, especially due to this being the __init function.

- Mani

-- 
மணிவண்ணன் சதாசிவம்


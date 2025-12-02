Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A3F4CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oVENpHA8Wpk/IkT9ZcaMLThiKOhk3o49O+rHr6LJwrQ=; b=l/Edd4gBikpI9d59uNpeXjY86m
	mi0OpH/a45yrAnNc3ojzgX2QhV2OdZYaQzDsnZFPt92hypg44bAsT9tWrg1y4qZpuKyzZ9Lqw4y/d
	9eI6p/9Jh1NQ2cNC4IzSwLRBOMtbAPjEYazkuPOgeYNysDq0M8VY+SyEnfzZaFGTUnTHzUuK+2EP/
	9kky4yEOY4MuefYmHQqeB9DkkXI4SkivrJcitvjz3cVO3FL7wyTu6HH0NqdbylwgUTCqiI63zYL2c
	AWAwbsDX6IJr6PzW/Wlzr8craNjk2gg2WMxHbzesHikFanqkNOez0dmckSQ84hhGzejhQWqcq/vj+
	xSuwfEVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNN3-00000005E7g-3Uh9;
	Tue, 02 Dec 2025 10:12:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNN3-00000005E7a-1WWD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:12:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 735C0600BB;
	Tue,  2 Dec 2025 10:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D571FC4CEF1;
	Tue,  2 Dec 2025 10:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764670352;
	bh=sqiX0jb1v0UmMdokJRTSMz9MKkDH/LfxCka2MIljKkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jG1IlhZZ8dxGIeplIChggbvAm6CB+XG5ghS+Z5ft06za/moeDXhEhbtqR2Y5LKOiK
	 3sdL3KSs/gX9hnn7Fzh27/S9J6rXmfpf5fU+D6/kqPzykqS08yzTme1ML+7XY7t2if
	 H246ARoydoc1WQQE1IbRnppQHzZW0ECCJzQ+6VeKwEAbc0ji517FSlHE83/el9UsIu
	 QHh7O40B1GlgiMrYQbKeXPXvrL3ZH6iO5oQyZ7qkQS1wtOecypo+VUDNd/5K2K2Aey
	 9AgFvpAVHlzI0PwrordRV5G5YWk2onFQ7tLwnYpZyIEbQzU5qdHAEEMdvImtxd23Qo
	 1jg3tefoudENw==
Date: Tue, 2 Dec 2025 15:42:19 +0530
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
Message-ID: <6ulzkdgd6j35ptu5mesgtgh2xa6fwalcmkgcxr2fdjwwfvzhrf@4dtcadsl2mvm>
References: <20251128162928.36eec2d6@canb.auug.org.au>
 <63e1daf7-f9a3-463e-8a1b-e9b72581c7af@infradead.org>
 <ykmo5qv46mo7f3srblxoi2fvghz722fj7kpm77ozpflaqup6rk@ttvhbw445pgu>
 <CAKfTPtA-wir5GzU7aTywe7SZG18Aj8Z9g1wjV-Y8vKoyKF1Mkg@mail.gmail.com>
 <vb6pcyaue6pqpx626ytfr2aif4luypopywqoazjsvy4crh6zic@gfv75ar7musy>
 <CAKfTPtCKmj_dHGU-2WPsEevf7CR-isRiyM0+oftCrMy5MswE4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKfTPtCKmj_dHGU-2WPsEevf7CR-isRiyM0+oftCrMy5MswE4A@mail.gmail.com>
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

On Tue, Dec 02, 2025 at 11:03:07AM +0100, Vincent Guittot wrote:
> On Tue, 2 Dec 2025 at 10:53, Manivannan Sadhasivam <mani@kernel.org> wrote:
> >
> > On Tue, Dec 02, 2025 at 09:54:24AM +0100, Vincent Guittot wrote:
> > > On Tue, 2 Dec 2025 at 05:24, Manivannan Sadhasivam <mani@kernel.org> wrote:
> > > >
> > > > + Vincent
> > >
> > > Thanks for looping me in.
> > > >
> > > > On Sat, Nov 29, 2025 at 07:00:04PM -0800, Randy Dunlap wrote:
> > > > >
> > > > >
> > > > > On 11/27/25 9:29 PM, Stephen Rothwell wrote:
> > > > > > Hi all,
> > > > > >
> > > > > > Changes since 20251127:
> > > > > >
> > > > >
> > > > > on i386 (allmodconfig):
> > > > >
> > > > > WARNING: modpost: vmlinux: section mismatch in reference: s32g_init_pcie_controller+0x2b (section: .text) -> memblock_start_of_DRAM (section: .init.text)
> > >
> > > Are there details to reproduce the warning ? I don't have such warning
> > > when compiling allmodconfig locally
> > >
> > > s32 pcie can only be built in but I may have to use
> > > builtin_platform_driver_probe() instead of builtin_platform_driver()
> > >
> >
> > The is due to calling a function belonging to the __init section from non-init
> > function. Ideally, functions prefixed with __init like memblock_start_of_DRAM()
> > should be called from the module init functions.
> >
> > One way to fix would be to call memblock_start_of_DRAM() in probe(), and
> > annotate probe() with __init. Since there is no remove, you could use
> > builtin_platform_driver_probe().
> >
> > This also makes me wonder if we really should be using memblock_start_of_DRAM()
> > in the driver. I know that this was suggested to you during reviews, but I would
> > prefer to avoid it, especially due to this being the __init function.
> 
> yeah, I suppose I can directly define the value in the driver has
> there is only one memory config for now anyway
> 
> /* Boundary between peripheral space and physical memory space */
> #define S32G_MEMORY_BOUNDARY_ADDR 0x80000000
> 

Ok. I fixed it up myself with below diff:

diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index eacf0229762c..70b1dc404bbe 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -7,7 +7,6 @@
 
 #include <linux/interrupt.h>
 #include <linux/io.h>
-#include <linux/memblock.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/of_address.h>
@@ -35,6 +34,9 @@
 #define PCIE_S32G_PE0_INT_STS                  0xE8
 #define HP_INT_STS                             BIT(6)
 
+/* Boundary between peripheral space and physical memory space */
+#define S32G_MEMORY_BOUNDARY_ADDR              0x80000000
+
 struct s32g_pcie_port {
        struct list_head list;
        struct phy *phy;
@@ -99,10 +101,10 @@ static struct dw_pcie_ops s32g_pcie_ops = {
 };
 
 /* Configure the AMBA AXI Coherency Extensions (ACE) interface */
-static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci, u64 ddr_base_addr)
+static void s32g_pcie_reset_mstr_ace(struct dw_pcie *pci)
 {
-       u32 ddr_base_low = lower_32_bits(ddr_base_addr);
-       u32 ddr_base_high = upper_32_bits(ddr_base_addr);
+       u32 ddr_base_low = lower_32_bits(S32G_MEMORY_BOUNDARY_ADDR);
+       u32 ddr_base_high = upper_32_bits(S32G_MEMORY_BOUNDARY_ADDR);
 
        dw_pcie_dbi_ro_wr_en(pci);
        dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, 0x0);
@@ -149,7 +151,7 @@ static int s32g_init_pcie_controller(struct dw_pcie_rp *pp)
         * Make sure we use the coherency defaults (just in case the settings
         * have been changed from their reset values)
         */
-       s32g_pcie_reset_mstr_ace(pci, memblock_start_of_DRAM());
+       s32g_pcie_reset_mstr_ace(pci);
 
        dw_pcie_dbi_ro_wr_en(pci);

- Mani

-- 
மணிவண்ணன் சதாசிவம்


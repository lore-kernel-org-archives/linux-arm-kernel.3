Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD11C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 07:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIMSoCoPn2TvHqW5r2HbTFAy2cTbWv7M6EsJ8hb+heU=; b=dRCP2CIX7T6oiACMNZPoPCGpjD
	+Tf4oUjkeNokVa4hwkBQxoQgHX3CnrSeXYR/rtEj/FzfFrhrnyn5cntbPIKrJSsAuqiEQHRLFIho8
	wG8PtsP0RlGd8lJgbifu3jQKtFQ8FqbX8j+HWxXnRVwVOUqrH11jZlgheYtHRA4kdZ0EQCFNMsPSg
	y5iOs9PtZ73Bd83HCVHIg2lU516Icyx4ov+9WEEUMrSOPfxlN2WC8aGRhnJfnoDUXchxmFZ/mvv+V
	M0dU161wKik9RsSkXYskQXupLpntCZGRHf0+6IeOrbrCudpEomsN7vhUjjjIMqj25CJx7HI+Rk1cJ
	HjZ+s94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBV2-00000008V9g-3tQX;
	Mon, 13 Jul 2026 07:54:48 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBUy-00000008V7m-3qfu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 07:54:47 +0000
Received: from francesco-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 779A320F54;
	Mon, 13 Jul 2026 09:54:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1783929278;
	bh=LIMSoCoPn2TvHqW5r2HbTFAy2cTbWv7M6EsJ8hb+heU=; h=From:To:Subject;
	b=ApLcwtXrm8U1o5X/EgwHOMc7zNkFNLRtXPDx3p9Pmjkswik6fqocWfMsce+TXw/st
	 QWmo7nafkhY0YvDwtY71mGoHsYO1GznCZqlgQa4J2RWKLiSGalHUE1w6CFEM790w06
	 /ZhSyqAlIQsruRBsU+bA80r79DE9tS2tliGLuFe/N1ryrtSQ5+RwJmt+LEcLF+TeXX
	 SkUPUzmEiQRFlumW/1VgxJjdwC21PgKgHgDhfpiFcxY49sRnwyaFJCVLtG9wapFuiP
	 nT42Tr8HiVnKzuOEL1SJiiLSVllsG/zO3hcXjjiNdKfN+m52pCeeARsrHeI2aYReKf
	 eO3pP9uOEsJDg==
Date: Mon, 13 Jul 2026 09:54:34 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Franz Schnyder <fra.schnyder@gmail.com>, Thinh.Nguyen@synopsys.com,
	gregkh@linuxfoundation.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	jun.li@nxp.com, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH v3 3/3] usb: dwc3: imx8mp: disable auto suspend for host
 role
Message-ID: <20260713075434.GA32373@francesco-nb>
References: <20260108081433.2119328-1-xu.yang_2@nxp.com>
 <20260108081433.2119328-3-xu.yang_2@nxp.com>
 <k2sxmwhrv3tivustfnpz54ehuufkcrcruu2uuukuyugqtqljzl@5roxndm5fn5u>
 <jjwlrgusucoacaye75uqfuh76a4jhdv3ivzjuemgusw3trwseb@mymuy62cptxp>
 <hsyy2owzbt7tsljktlrz5g4bnrnecznvcyy6zxt7gfyxb4xvgi@ysko6xe6h2zm>
 <5zz6yhc4ymoccovibmjlse2l2d6y3g3dwu5r5a677rplpfdnwu@fo2ed54hqzeh>
 <6btg6x2bsgu6jzzxds3koyha3ucaf37apbshhfgpu2vxdgb5oz@npvm7tkg3bxh>
 <25fqcu6itk47tvm4qto7zw2r4cno7kryxi7a6lo6ddbxwzbakx@nj3ytoy44ynl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <25fqcu6itk47tvm4qto7zw2r4cno7kryxi7a6lo6ddbxwzbakx@nj3ytoy44ynl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_005446_019684_CACBB388 
X-CRM114-Status: GOOD (  15.60  )
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

Hello Xu,

On Wed, May 27, 2026 at 02:33:05PM +0800, Xu Yang wrote:
> On Tue, May 19, 2026 at 10:54:58AM +0200, Franz Schnyder wrote:
> > On Tue, May 12, 2026 at 05:53:57PM +0800, Xu Yang wrote:
> > I've attached the logs below with and without the commit. looking at 
> > what happens before the warning I think the problem is that after probe
> > deferral the depopulate path races with the device link state changes 
> > from the fw_devlink cycle fixup.
> > 
> > One important thing to mention is, that we build dwc3 and typec as modules.
> > If I build them as built-in I can't reproduce the kernel warning so far. 
> 
> Thank your for the information.
> 
> It's indeed an important finding. I can reproduce the issue when I build the
> driver as modules.

Just a head-up on this

7.2.0-rc3 is not ok on this regard

```
[    6.285930] WARNING: /usr/src/kernel/drivers/base/core.c:1706 at device_del+0x2b4/0x388, CPU#5: (udev-worker)/409
[    6.285950] Modules linked in: ulpi(+) ehci_hcd amc6821(+) nvmem_imx_ocotp_ele tcpci(+) tcpm roles phy_fsl_imx8mq_usb usbmisc_imx ina2xx typec dwc3_imx8mp(+) lm75 imx93_adc spi_nxp_fspi i2c_mux_pca954x svc_i3c_master i3c flexcan spi_fsl_lpspi can_dev pwm_imx_tpm gpio_keys display_connector evdev fuse autofs4
[    6.286031] CPU: 5 UID: 0 PID: 409 Comm: (udev-worker) Not tainted 7.2.0-rc3-0.0.0-devel #1 PREEMPT
[    6.286039] Hardware name: Aquila iMX95 on Aquila Development Board (DT)
[    6.286044] pstate: 20400009 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    6.286050] pc : device_del+0x2b4/0x388
[    6.286057] lr : device_del+0x1b8/0x388
[    6.286063] sp : ffff80008364b740
[    6.286067] x29: ffff80008364b760 x28: 000000000000000c x27: ffff800081347ea8
[    6.286078] x26: 0000000000000000 x25: 0000000000000000 x24: ffff000087ae28c8
[    6.286088] x23: ffff000087ae28c0 x22: ffff000080a6c010 x21: 0000000000400140
[    6.286099] x20: ffff8000814c8e60 x19: ffff000087ae2810 x18: 0000000000000000
[    6.286110] x17: 0000000000000000 x16: 00000000000017fb x15: 0003a7018ef1930c
[    6.286120] x14: 0000000000000225 x13: ffff800080d6f068 x12: 0000000000000000
[    6.286130] x11: 00000000000000c0 x10: 0000000000000a30 x9 : 000000000000003c
[    6.286141] x8 : ffff80008364b640 x7 : ffff000080001540 x6 : fffffdffc22a7600
[    6.286151] x5 : ffff800080232cac x4 : ffff00008001fe00 x3 : ffff00008a9d8280
[    6.286161] x2 : ffff000087ae28b8 x1 : 0000000000000003 x0 : ffff0000813fb800
[    6.286172] Call trace:
[    6.286177]  device_del+0x2b4/0x388 (P)
[    6.286185]  platform_device_del+0x2c/0xa0
[    6.286194]  platform_device_unregister+0x14/0x3c
[    6.286202]  of_platform_device_destroy+0xf0/0x100
[    6.286211]  device_for_each_child_reverse+0x6c/0xc4
[    6.286219]  of_platform_depopulate+0x34/0x80
[    6.286225]  dwc3_imx8mp_probe+0x268/0x3f0 [dwc3_imx8mp]
[    6.286241]  platform_probe+0x80/0xac
[    6.286248]  really_probe+0xc0/0x3e0
[    6.286255]  __driver_probe_device+0x164/0x1bc
[    6.286261]  driver_probe_device+0x3c/0x118
[    6.286268]  __driver_attach+0xc8/0x21c
[    6.286274]  bus_for_each_dev+0x7c/0xdc
[    6.286282]  driver_attach+0x24/0x30
[    6.286288]  bus_add_driver+0x11c/0x260
[    6.286294]  driver_register+0x68/0x124
[    6.286301]  __platform_driver_register+0x24/0x30
[    6.286307]  dwc3_imx8mp_driver_init+0x28/0xfdc [dwc3_imx8mp]
[    6.286317]  do_one_initcall+0x60/0x1d4
[    6.286327]  do_init_module+0x54/0x244
[    6.286336]  load_module+0x18a0/0x2040
[    6.286342]  init_module_from_file+0xd8/0xf0
[    6.286349]  __arm64_sys_finit_module+0x208/0x35c
[    6.286356]  invoke_syscall.constprop.0+0x48/0xe4
[    6.286364]  do_el0_svc+0xa8/0xbc
[    6.286371]  el0_svc+0x40/0x228
[    6.286379]  el0t_64_sync_handler+0xa0/0xe4
[    6.286385]  el0t_64_sync+0x198/0x19c
[    6.286394] ---[ end trace 0000000000000000 ]---
```


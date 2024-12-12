Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93CF8E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 14:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=i4gRg92u7heNhpg6vOJodZ+D+uvY+K7mBytkbzc1ihE=; b=nxYWG32uwGIxQMsrNmyRojngSc
	QixVBc70NB+mu09Bx969Qpkvfj4Eda7rwm6wK9fg0hP5DvW1yRRbQ6nQrJfbvObMOumXJvs9Ye5rT
	vjQaSPBnRXs9bHIQbswYY1NslUyJxpN/1qep57gVvBaKCb5AGAHnyrsQMckdLXDSqm8w80jcxVyYE
	0AZW8UeYLyRr/Qs/ejZUKZWX5GJhyaMRKHjajxVd35n7ArpS70ktQc8vhDjQBuQ3qlrCVvdFI3+om
	NuFfEPo5tSKYjUl4tYWEAuhqnv0/rsBx2wxmt72pMTLR/JXCQ65PH5V3duH9zqXum76D8ECGFmkQE
	LmeBkcTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjuU-00000000ZrM-2g44;
	Thu, 12 Dec 2024 14:11:22 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLjtP-00000000ZeO-08JG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 14:10:17 +0000
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id BF82B1F93C;
	Thu, 12 Dec 2024 15:10:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1734012608;
	bh=i4gRg92u7heNhpg6vOJodZ+D+uvY+K7mBytkbzc1ihE=; h=From:To:Subject;
	b=SsxpPxyjcrFcPL6GJbAWr7SkbjA2mgIgBDNV7DIZflXRkx+I7LMuOxUnUZalkOSB3
	 XZmQls6x+Wih8xfI0T+xNWN13TqjZ82S72idyiFNajWeU0R5YI74RVL5HSufnBz9Zl
	 jrz0iA26EcpACwydg1+T/okRaMJ45ETJq74ZsU3gjAKTo2+QnJsbB0BJUvqMpTrt2j
	 5/YwGAt1h+qlt2mCL/vRGs2H3fjZ/sHiQXb4wmhgj3KOgxB0ULyADVqFbO9/yW8Iuz
	 Jf4jmOcMJoRjtpvdYV1sSh6sam+Ub+SU+4te43N+Q6ko5IJYYfa0bl60+4fscPB9Sw
	 u/a5cVflb2osw==
Date: Thu, 12 Dec 2024 15:10:03 +0100
From: Francesco Dolcini <francesco@dolcini.it>
To: linux-pm@vger.kernel.org, imx@lists.linux.dev
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Marek Vasut <marex@denx.de>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>
Subject: imx8m-blk-ctrl: WARNING, no release() function
Message-ID: <20241212141003.GA44219@francesco-nb>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_061015_959984_3D189A6C 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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

Hello,
on v6.13-rc2 (PREEMPT_RT, if it matters), I have the following warning

[    4.615793] ------------[ cut here ]------------
[    4.615814] Device 'mediablk-mipi-csi2-1' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
[    4.618977] WARNING: CPU: 1 PID: 11 at /drivers/base/core.c:2569 device_release+0x80/0x94
[    4.638974] Modules linked in: ecdh_generic ecc etnaviv(+) rfkill libaes samsung_dsim gpu_sched imx_sdma(+) governor_userspace imx_bus dwc3_imx8mp spi_nxp_fspi lontium_lt8912b ina2xx snd_soc_wm8904 ti_ads1015 industrialio_triggered_buffer kfifo_buf lm75 snvs_pwrkey pwm_imx27 nvmem_snvs_lpgpr imx8mm_thermal caam flexcan error can_dev spi_imx usb_conn_gpio display_connector roles gpio_keys fuse ipv6 autofs4
[    4.639073] CPU: 1 UID: 0 PID: 11 Comm: kworker/u16:0 Not tainted 6.13.0-rc2-0.0.0-devel-00040-ga1625b19385c #1
[    4.639082] Hardware name: Toradex Verdin iMX8M Plus WB on Dahlia Board (DT)
[    4.639087] Workqueue: events_unbound deferred_probe_work_func
[    4.639099] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[    4.639107] pc : device_release+0x80/0x94
[    4.639116] lr : device_release+0x80/0x94
[    4.639122] sp : ffff80008142b910
[    4.639125] x29: ffff80008142b910 x28: 00000000fffffdfb x27: ffff000005c92180
[    4.639137] x26: ffff000000018028 x25: ffff000000046dc0 x24: ffff800080c43710
[    4.639147] x23: 0000000100000001 x22: 0000000000000000 x21: ffff800080e43750
[    4.639158] x20: 0000000000000000 x19: ffff000007cb06d8 x18: 0000000000000006
[    4.639168] x17: 0000000000000001 x16: 0000000000000000 x15: 0000000000000002
[    4.639179] x14: 0000000000001400 x13: ffff0000000a9110 x12: 0000000000225510
[    4.639190] x11: 0000000000000000 x10: 00000000000009c0 x9 : ffff80008142b790
[    4.639200] x8 : ffff00000013bba0 x7 : 000000000000002d x6 : 000000000113158e
[    4.639210] x5 : 00000001134e0800 x4 : 0000000000000002 x3 : ffff000003b04c50
[    4.639221] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff00000013b180
[    4.639231] Call trace:
[    4.639235]  device_release+0x80/0x94 (P)
[    4.639245]  device_release+0x80/0x94 (L)
[    4.639253]  kobject_put+0xb0/0x214
[    4.639264]  put_device+0x14/0x24
[    4.639272]  genpd_remove+0x114/0x248
[    4.639281]  pm_genpd_remove+0x30/0x58
[    4.639288]  imx8m_blk_ctrl_probe+0x36c/0x540
[    4.639299]  platform_probe+0x68/0xdc
[    4.639308]  really_probe+0xc0/0x39c
[    4.639315]  __driver_probe_device+0x7c/0x14c
[    4.639322]  driver_probe_device+0x3c/0x120
[    4.639329]  __device_attach_driver+0xbc/0x160
[    4.639336]  bus_for_each_drv+0x88/0xe8
[    4.639346]  __device_attach+0xa0/0x1b4
[    4.639353]  device_initial_probe+0x14/0x20
[    4.639360]  bus_probe_device+0xb0/0xbc
[    4.639366]  deferred_probe_work_func+0xa0/0xf0
[    4.639373]  process_one_work+0x148/0x284
[    4.639383]  worker_thread+0x2d0/0x3e4
[    4.639391]  kthread+0x110/0x114
[    4.639399]  ret_from_fork+0x10/0x20
[    4.639409] ---[ end trace 0000000000000000 ]---

and more for other devices, from the same driver.

Just reporting for the moment, in case someone has some ideas or wants to
have a look.

Francesco



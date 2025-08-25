Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216C2CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 08:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CCwjQpVxAwYaUkMfuZFn5zd3paQxpIxh6PvIqoPaH2Y=; b=mmiOSOgvOamKxRrc2cotm4hO8l
	plvfiXe/0VXhlMzSgY+wXbwMXunanHwRrbbV2O2nE8kH43e5ZKNU8WamaXpWdY7Xle8GWBS8DKEsU
	dJ+gVki2TB15QLhGoffZM5hr1Zriad0BjNQ2bRMcBQvJWihdWY/MwIR1S7tNlVLjMjpxssC4D4JON
	noJJWVBDA9bpwZ4dsBybzO7fhPddfmnB+tLldDeQRW6ieZdTLmVchqUMsO6eF9CDhzJpSZEYzjmQ6
	FtGBk0AD9CsT07Tm1hg95b5yD2/D1+YOS/Z5+Ndeni7qq4Iapy6HsLvxt6Y3YkTBZjXak2ctoy9qj
	fW8J206w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqSK2-00000007Gbe-2dgq;
	Mon, 25 Aug 2025 08:12:58 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqRY0-000000079rb-1E2p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 07:23:23 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250825072313euoutp02e54534bfc2b3b5a23cd64405955e8080~e8aSHmG4s1894118941euoutp02i
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 Aug 2025 07:23:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250825072313euoutp02e54534bfc2b3b5a23cd64405955e8080~e8aSHmG4s1894118941euoutp02i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756106593;
	bh=CCwjQpVxAwYaUkMfuZFn5zd3paQxpIxh6PvIqoPaH2Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=JMAenzuYyAApWweTnMU50LL7DXqexmJjg2nk4AHbF9QHHMrYEzA7FSoxXofBiFc3k
	 jPfyWRMlsYYyt8YZR0L6d9CVpDFR+GwO+CD9HGoNMfKVH+XtOZZ3d9JwhmnWM60Ars
	 WuEIgGMRc/3pjyy9yO1Y83W90A3tcPBCxjHV7Mbg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93~e8aRbQSdO2516025160eucas1p2z;
	Mon, 25 Aug 2025 07:23:12 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250825072311eusmtip29de257b9d550c8b3809c733e1b5949a3~e8aP3cLdT1101011010eusmtip22;
	Mon, 25 Aug 2025 07:23:11 +0000 (GMT)
Message-ID: <a30a8c97-6b96-45ba-bad7-8a40401babc2@samsung.com>
Date: Mon, 25 Aug 2025 09:23:10 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH net-next v3] net: ethernet: stmmac: dwmac-rk: Make the
 clk_phy could be used for external phy
To: Chaoyi Chen <kernel@airkyi.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
	Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, "Russell King (Oracle)"
	<rmk+kernel@armlinux.org.uk>, Jonas Karlman <jonas@kwiboo.se>, David Wu
	<david.wu@rock-chips.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250815023515.114-1-kernel@airkyi.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93
X-EPHeader: CA
X-CMS-RootMailID: 20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93
References: <20250815023515.114-1-kernel@airkyi.com>
	<CGME20250825072312eucas1p2d4751199c0ea069c7938218be60e5e93@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_002321_740475_C8F1C6C9 
X-CRM114-Status: GOOD (  22.96  )
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

On 15.08.2025 04:35, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>
> For external phy, clk_phy should be optional, and some external phy
> need the clock input from clk_phy. This patch adds support for setting
> clk_phy for external phy.
>
> Signed-off-by: David Wu <david.wu@rock-chips.com>
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
>
> Changes in v3:
> - Link to V2: https://lore.kernel.org/netdev/20250812012127.197-1-kernel@airkyi.com/
> - Rebase to net-next/main
>
> Changes in v2:
> - Link to V1: https://lore.kernel.org/netdev/20250806011405.115-1-kernel@airkyi.com/
> - Remove get clock frequency from DT prop
>
>   drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 11 +++++++----
>   1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> index ac8288301994..5d921e62c2f5 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> @@ -1412,12 +1412,15 @@ static int rk_gmac_clk_init(struct plat_stmmacenet_data *plat)
>   		clk_set_rate(plat->stmmac_clk, 50000000);
>   	}
>   
> -	if (plat->phy_node && bsp_priv->integrated_phy) {
> +	if (plat->phy_node) {
>   		bsp_priv->clk_phy = of_clk_get(plat->phy_node, 0);
>   		ret = PTR_ERR_OR_ZERO(bsp_priv->clk_phy);
> -		if (ret)
> -			return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> -		clk_set_rate(bsp_priv->clk_phy, 50000000);
> +		/* If it is not integrated_phy, clk_phy is optional */
> +		if (bsp_priv->integrated_phy) {
> +			if (ret)
> +				return dev_err_probe(dev, ret, "Cannot get PHY clock\n");
> +			clk_set_rate(bsp_priv->clk_phy, 50000000);
> +		}
>   	}
>   
>   	return 0;

The above change lacks the following check ingmac_clk_enable(): if (!bsp_priv->integrated_phy) return 0;

Otherwise it blows on machines with integrated PHY, like Hardkernel's Odroid-M1 (RK3568 based):

rk_gmac-dwmac fe2a0000.ethernet: IRQ eth_lpi not found
rk_gmac-dwmac fe2a0000.ethernet: IRQ sfty not found
rk_gmac-dwmac fe2a0000.ethernet: clock input or output? (output).
rk_gmac-dwmac fe2a0000.ethernet: TX delay(0x4f).
rk_gmac-dwmac fe2a0000.ethernet: RX delay(0x2d).
rk_gmac-dwmac fe2a0000.ethernet: integrated PHY? (no).
Unable to handle kernel paging request at virtual address fffffffffffffffe
Mem abort info:
   ESR = 0x0000000096000006
   EC = 0x25: DABT (current EL), IL = 32 bits
   SET = 0, FnV = 0
   EA = 0, S1PTW = 0
   FSC = 0x06: level 2 translation fault
Data abort info:
   ISV = 0, ISS = 0x00000006, ISS2 = 0x00000000
   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
swapper pgtable: 4k pages, 48-bit VAs, pgdp=000000000249e000
[fffffffffffffffe] pgd=0000000000000000, p4d=000000000376f403, pud=0000000003770403, pmd=0000000000000000
Internal error: Oops: 0000000096000006 [#1]  SMP
Modules linked in: snd_soc_rockchip_i2s_tdm snd_soc_rk817 snd_soc_core snd_compress snd_pcm_dmaengine rockchip_thermal snd_pcm dwmac_rk(+) hantro_vpu rockchip_saradc industrialio_triggered_buffer kfifo_buf stmmac_platform rockchip_rga v4l2_vp9 stmmac spi_rockchip_sfc(+) v4l2_h264 snd_timer pcs_xpcs rockchipdrm(+) videobuf2_dma_sg v4l2_jpeg rk805_pwrkey v4l2_mem2mem videobuf2_dma_contig dw_hdmi_qp rockchip_dfi rk817_charger videobuf2_memops analogix_dp videobuf2_v4l2 dw_mipi_dsi panfrost snd rtc_rk808 drm_dp_aux_bus videodev drm_shmem_helper soundcore dw_hdmi videobuf2_common drm_display_helper mc gpu_sched ahci_dwc ipv6
CPU: 3 UID: 0 PID: 154 Comm: systemd-udevd Not tainted 6.17.0-rc1+ #10875 PREEMPT
Hardware name: Hardkernel ODROID-M1 (DT)
pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : clk_prepare+0x18/0x44
lr : gmac_clk_enable+0xf8/0x188 [dwmac_rk]
..
Call trace:
  clk_prepare+0x18/0x44 (P)
  gmac_clk_enable+0xf8/0x188 [dwmac_rk]
  rk_gmac_powerup+0x4c/0x1f0 [dwmac_rk]
  rk_gmac_probe+0x3b4/0x5c8 [dwmac_rk]
  platform_probe+0x5c/0xac
  really_probe+0xbc/0x298
  __driver_probe_device+0x78/0x12c
  driver_probe_device+0x40/0x164
  __driver_attach+0x9c/0x1ac
  bus_for_each_dev+0x74/0xd0
  driver_attach+0x24/0x30
  bus_add_driver+0xe4/0x208
  driver_register+0x60/0x128
  __platform_driver_register+0x24/0x30
  rk_gmac_dwmac_driver_init+0x20/0x1000 [dwmac_rk]
  do_one_initcall+0x64/0x308
  do_init_module+0x58/0x23c
  load_module+0x1b48/0x1dc4
  init_module_from_file+0x84/0xc4
  idempotent_init_module+0x188/0x280
  __arm64_sys_finit_module+0x68/0xac
  invoke_syscall+0x48/0x110
  el0_svc_common.constprop.0+0xc8/0xe8
  do_el0_svc+0x20/0x2c
  el0_svc+0x4c/0x160
  el0t_64_sync_handler+0xa0/0xe4
  el0t_64_sync+0x198/0x19c
Code: 910003fd f9000bf3 52800013 b40000e0 (f9400013)
---[ end trace 0000000000000000 ]---

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland



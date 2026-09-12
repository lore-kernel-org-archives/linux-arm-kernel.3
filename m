Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5293C88E53
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Sep 2026 20:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Y6jm1/pkJQDM9mGVuASKpC3wlUzOHbp3gqCKfcG1sI=; b=2AsG5ISFwBNCqZuWsJVaCDHIZi
	Co+bpYggcNwRC1Qj8ynQQh13bM+oIV1FW8lI7PMGGn3DVhkA1SCok0NLj6Q9+vxhx2oXyE6NlUpWI
	5YRz8lb/p1preYVzGOXTzfXtUEdH3Rb0wadeTe9Bw4lvsIWlT10QXAOoc4T4dYRl1Q1k1vWZArJPd
	o+QHy9C2P4kGgJVMBEb6HG+T6kh/G4SIhdjO4FAc1voANOczrKNiYYT64AaswoCsJ5/WB4EiC44tT
	nwtSgQIAFNCR2YFQl16kKyoDgnaub3TKQZwiWsB+GfSSceHluT6P9IKkDF3Eovdg4LE3gN2MPcDKf
	pR6sK9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5USO-00000001Ai7-3HSp;
	Sat, 12 Sep 2026 20:36:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5USH-00000001Afu-0Pus
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Sep 2026 20:36:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 896CB60213;
	Sat, 12 Sep 2026 20:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AC811F00893;
	Sat, 12 Sep 2026 20:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789245368;
	bh=4Y6jm1/pkJQDM9mGVuASKpC3wlUzOHbp3gqCKfcG1sI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=aZO+0x2PRpTpD+JHIXWMLwn63U9B0oYIUvdqS6seoBbZozca3QhOOzC7CVaoGwoQD
	 nxlOmVczpOWqFAiSVBvO8W+v1L8pn/fCnt5940hCExPE6VYg6GkWcwcLZ7BAZA1Zp0
	 TLvhCuC9U4V8qYEstn5qLBzuYgtXx5ijss6i+5cuzqFxhnz9JicZCtfe+S4cKfTgDx
	 +1isedVG5DFF5tBbsH8tSZJfepPyIo5A1FR8y17QJqlFr711O/D12B8CPyW/sDtNui
	 FLJbikyxWteWebymI9VLft7MbEvR1fPoGVM7EHl7LKQ/WlJARNibqV/ysBJG7RJlPo
	 f6Koc1LlYc4KQ==
Subject: Re: [PATCH net-next v2 2/8] net: xilinx: tsn: add TSN endpoint wrapper driver
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
 michal.simek@amd.com, bigeasy@linutronix.de, clrkwllms@kernel.org,
 rostedt@goodmis.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Sat, 12 Sep 2026 20:36:06 +0000
Message-ID: <178924536666.3125.1102910032368474240@kernel.org>
In-Reply-To: <20260909-patches_v2_external-v2-2-3a40babaff4c@amd.com>
References: <20260909-patches_v2_external-v2-2-3a40babaff4c@amd.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 2

- [Low] Kconfig help text for CONFIG_XILINX_TSN claims the option
  "provides the wrapper device and the endpoint MAC that connects the IP…
- [Low] The binding Documentation/devicetree/bindings/net/xlnx,tsn-
  endpoint-ethernet-mac.yaml puts 'xlnx,num-priorities' (uint32, 2..8)…

--

net: xilinx: tsn: add TSN endpoint wrapper driver

This adds a thin wrapper platform driver for the AMD/Xilinx TSN Endpoint
Ethernet MAC IP node. The wrapper enables the six IP-wide clocks
described in the device tree and then populates the DT sub-nodes so each
one can bind to its own driver.

A couple of questions on the new Kconfig text and on the DT properties
the wrapper consumes.

[ ... ]

> diff --git a/drivers/net/ethernet/xilinx/tsn/Kconfig b/drivers/net/ethernet/xilinx/tsn/Kconfig
> new file mode 100644
> index 000000000000..b8939d8a92ef
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/Kconfig
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Xilinx TSN device configuration
> +#
> +
> +config XILINX_TSN
> +	tristate "Xilinx TSN Ethernet driver"
> +	depends on OF_ADDRESS
> +	help
> +	  This driver supports the AMD/Xilinx Time-Sensitive Networking
> +	  (TSN) Endpoint Ethernet MAC IP. It provides the wrapper device
> +	  and the endpoint MAC that connects the IP to the host CPU. The
> +	  three-port switch is supported by the companion DSA driver.

[Severity: Low]
Is the help text accurate at this point in the series?  It says the
option "provides the wrapper device and the endpoint MAC that connects
the IP to the host CPU", but the Makefile added by this patch builds only
the wrapper object:

  xilinx_tsn-y := xilinx_tsn_main.o

and tsn_drivers[] registers only &tsn_driver, which matches
"xlnx,tsn-endpoint-ethernet-mac-3.0".  No driver in the tree matches the
sub-node compatibles at this commit, so devm_of_platform_populate() in
tsn_ip_probe() creates child platform devices that cannot bind, and
enabling the symbol here yields enabled clocks but no netdev.

The endpoint MAC part is resolved by later patches in this same series:
by the end of the series the Makefile also builds xilinx_tsn_ep.o,
tsn_drivers[] gains &xlnx_tsn_ep_driver, and xilinx_tsn_ep.c matches
".compatible = \"xlnx,tsn-ep-mac\"", so this is only a transient
mismatch between patches.

The remaining sentence about the "companion DSA driver" refers to
something that is not in-tree at any point of this series.  Could that
sentence be dropped or reworded until the DSA driver lands?

> +
> +	  If unsure, say N.
> diff --git a/drivers/net/ethernet/xilinx/tsn/Makefile b/drivers/net/ethernet/xilinx/tsn/Makefile
> new file mode 100644
> index 000000000000..6f99226f3dc8
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/Makefile
> @@ -0,0 +1,2 @@
> +obj-$(CONFIG_XILINX_TSN) += xilinx_tsn.o
> +xilinx_tsn-y := xilinx_tsn_main.o
> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_main.c b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_main.c
> new file mode 100644
> index 000000000000..afe7609c67fb
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_main.c
> @@ -0,0 +1,104 @@

[ ... ]

> +static int tsn_ip_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct xlnx_tsn_ip *w;
> +	int ret;
> +
> +	w = devm_kzalloc(dev, sizeof(*w), GFP_KERNEL);
> +	if (!w)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < TSN_NUM_CLOCKS; i++)
> +		w->clks[i].id = tsn_clk_names[i];
> +
> +	ret = devm_clk_bulk_get(dev, TSN_NUM_CLOCKS, w->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get clocks\n");
> +
> +	ret = clk_bulk_prepare_enable(TSN_NUM_CLOCKS, w->clks);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable clocks\n");
> +
> +	ret = devm_add_action_or_reset(dev, tsn_clk_bulk_disable, w);
> +	if (ret)
> +		return ret;
> +
> +	return devm_of_platform_populate(dev);
> +}

[Severity: Low]
The binding
Documentation/devicetree/bindings/net/xlnx,tsn-endpoint-ethernet-mac.yaml
lists xlnx,num-priorities (uint32, 2..8) in the required: list for the
"xlnx,tsn-endpoint-ethernet-mac-3.0" node:

  xlnx,num-priorities:
    $ref: /schemas/types.yaml#/definitions/uint32
    minimum: 2
    maximum: 8

tsn_ip_probe() is the only driver matching that compatible here, and it
does devm_kzalloc(), devm_clk_bulk_get(), clk_bulk_prepare_enable(),
devm_add_action_or_reset() and devm_of_platform_populate() without any
of_property_read_u32(), so the mandatory property is neither read nor
range-checked.

A later patch in this series ("net: xilinx: tsn: parse endpoint DMA
channel configuration") does consume it from the parent IP node in
xlnx_tsn_ep_probe():

  ret = of_property_read_u32(ip_np, "xlnx,num-priorities", &num_prio);
  ...
  if (num_tx != num_prio)
          return dev_err_probe(dev, -EINVAL, ...);

so the binding/driver mismatch only exists between patches of this
series.  Was leaving the property unconsumed by the wrapper itself
intentional?

> +
> +static const struct of_device_id tsn_of_match[] = {
> +	{ .compatible = "xlnx,tsn-endpoint-ethernet-mac-3.0" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, tsn_of_match);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260909-patches_v2_external-v2-0-3a40babaff4c%40amd.com


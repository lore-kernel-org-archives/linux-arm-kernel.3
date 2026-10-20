Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4E760A2612
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jn7MZ4+p;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d6GwepX3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N5SQ/KnAN/P3YdcqF5GR7+EQ6sknDHr2tVK2ulo6pU0=; b=jn7MZ4+pj7bIX3/Dtw5b+Tnw9L
	l1VusHfDQOu3YpaQtzvP5y+HsQhW4Ko2uwCN3cQcoNtcrGGYK53IMwgy3GpM2CT/AZeWGtdhcI+cr
	mdpTRJ9EHZ71dgPwjMSLtRt+o3O1PWjVcOsM2P80zlH6iLXxU6JXzIA6XjpLZPsgXbx3uzd/dno1P
	6jDIWxGmr9Q+w3o8kxx9aFSctN2xU55YgK3OV9r9UvhNtaFO2YIAx4fHj793slC6XbmGIKEAQKjXd
	7T9DDEsN96NeiKeqNCdiHOb6gPppv/nBlgH7CNCjcN5yQZUXpBy1+FjwGMhfKu8oMYdrODQ/Q/1Uf
	b3EX73Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8U1-00000009bds-1ep5;
	Tue, 20 Oct 2026 11:58:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ8Tw-00000009bbs-16nr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:58:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 04CAE60A65;
	Tue, 20 Oct 2026 11:58:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CCFA1F000C5;
	Tue, 20 Oct 2026 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497494;
	bh=N5SQ/KnAN/P3YdcqF5GR7+EQ6sknDHr2tVK2ulo6pU0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=d6GwepX3DTkOAWX1RW20wID4QIymqhqVsnx0A44I+LsetCRfpUEX6T06TXw4x+ZzX
	 hPq0cuAjK3U03pRypzivioAHrk7fQWCE+cOT5x/CnO1AIuiKaqz45g85wsMRfpd12R
	 zD+ER306Mv5oLEA0UtGhZSiCwPtyhxPj+KQtQTS2kN3CfQhE75p9KhOruiLemUegDx
	 HOVn3iHn/Q3CGG4MSG64R1BwEdQpo6cIzhe08DIBYYWVgAEGI7esw9XnY5E2rs7Gp8
	 BWbYXWblGwjgzFpbglfZWoY0VC0OwfaPy8r5c5Y50Pba57+56bYcqG0mhQiIr1n4Gg
	 aY5EZ21xNiaDA==
Subject: Re: [PATCH net-next v3 2/8] net: xilinx: tsn: add TSN endpoint wrapper driver
From: netdev-bot+sashiko@kernel.org
To: srinivas.neeli@amd.com
Cc: nagadheeraj.rottela@amd.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, richardcochran@gmail.com, michal.simek@amd.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 edumazet@kernel.org, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, neelisrinivas18@gmail.com, git@amd.com
Date: Tue, 20 Oct 2026 11:58:13 +0000
Message-ID: <179249749304.3135.18017691106528923366@kernel.org>
In-Reply-To: <20261016-patches_v2_external-v3-2-e33d3960ca1e@amd.com>
References: <20261016-patches_v2_external-v3-2-e33d3960ca1e@amd.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The XILINX_TSN Kconfig help text says "The three-port switch is
  supported by the companion DSA driver." That driver does not exist in…

--

net: xilinx: tsn: add TSN endpoint wrapper driver

This adds a thin platform driver for the AMD/Xilinx TSN Endpoint
Ethernet MAC IP node. It turns on the six IP-wide clocks and then calls
devm_of_platform_populate(), so each sub-node can bind to its own
driver.

> diff --git a/drivers/net/ethernet/xilinx/tsn/Kconfig b/drivers/net/ethernet/xilinx/tsn/Kconfig
> new file mode 100644
> index 0000000000000..b8939d8a92ef7
> --- /dev/null
> +++ b/drivers/net/ethernet/xilinx/tsn/Kconfig
> @@ -0,0 +1,15 @@

[ ... ]

> +config XILINX_TSN
> +	tristate "Xilinx TSN Ethernet driver"
> +	depends on OF_ADDRESS
> +	help
> +	  This driver supports the AMD/Xilinx Time-Sensitive Networking
> +	  (TSN) Endpoint Ethernet MAC IP. It provides the wrapper device
> +	  and the endpoint MAC that connects the IP to the host CPU. The
> +	  three-port switch is supported by the companion DSA driver.

[Severity: Low]
Which DSA driver is this sentence about? I couldn't find one in the
tree, either at this commit or at the end of the series.

The binding in this series defines the "xlnx,tsn-switch" compatible for
the switch@ sub-node, and nothing under drivers/ matches it.
tsn_ip_probe() calls devm_of_platform_populate(), which creates a
platform device for switch@, but no driver ever binds to it.

The v2 changelog says the help text was reworded so it no longer points
at "a symbol that does not exist yet at this patch". The new wording
still names a driver that isn't in the tree and has no Kconfig symbol.

Could this sentence be dropped or reworded until the switch driver is
posted?

Two other claims do become true later in the series: "endpoint MAC" in
the help text, and "bind each sub-node to its own driver" in the commit
message. That happens when "net: xilinx: tsn: add endpoint MAC driver
skeleton" adds xlnx_tsn_ep_driver to tsn_drivers[]. Only the DSA driver
reference is still wrong once the whole series is applied.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261016-patches_v2_external-v3-0-e33d3960ca1e%40amd.com


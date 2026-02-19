Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20786E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 16:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NqNSewweIKFfCmLrQgWQ7akHkJKLSCW09XG4EmRHUr0=; b=nQiFoBIrElH133oG8he0wfwOmK
	LaDdd4f3dRZ6iM7wmAf8xep8wQx6twbY4/AMq9cZcuW673JVHafzeDD/DiqGb37x0m6A/0oKwjir+
	cjPI67nfekSlpXV4kIEYvXQKKMNiPqemF0HSQGYiz6eF0Gu/T8oWRKYRDu++k/3bsaL678Z0uYAjz
	4pVBXF5rzm1WVpozoQUxD3rXHVwuejKO+RLRp33IgXUCYseXn9x1hudNXqOsvcFJ9kWwmtf5o5TV6
	5e+Lx9PsblsAOpyh+tCA8AmRNm068bVw32uP2vH7TvC9t/WLL+yCH+ykudepy5aZHMviVaUmrQc4m
	Reqwe+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7Hx-0000000Beqy-2QbC;
	Thu, 19 Feb 2026 16:54:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt7Hs-0000000BepS-0weY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 16:54:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=NqNSewweIKFfCmLrQgWQ7akHkJKLSCW09XG4EmRHUr0=; b=aUUac6CLUXaq7d2aPoJC01PxD+
	YVDK70ivOhzz2+bcc2WE720b7dBz5Dsn1eOubCpXqN8MKeW9BpQBSwr1upT5ce+YMCSX03wJF/XKo
	J7mKaZglQ+JQ+XhgLMllxR2fv7lqzcQf8nNSIBxk+siRabMz/VKpVFq8l7cByG8DMHL4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vt7Hi-007wWF-9A; Thu, 19 Feb 2026 17:53:50 +0100
Date: Thu, 19 Feb 2026 17:53:50 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Srinivas Neeli <srinivas.neeli@amd.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, michal.simek@amd.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, git@amd.com
Subject: Re: [RFC PATCH 1/8] dt-bindings: net: Add TSN Endpoint Ethernet MAC
 support
Message-ID: <76c811a7-d081-4238-bf6a-0226e867560a@lunn.ch>
References: <20260219054911.2017362-1-srinivas.neeli@amd.com>
 <20260219054911.2017362-2-srinivas.neeli@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219054911.2017362-2-srinivas.neeli@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_085400_288625_74172845 
X-CRM114-Status: GOOD (  10.09  )
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

> +examples:
> +  - |
> +    tsn_ip: tsn@80040000 {
> +        compatible = "xlnx,tsn-endpoint-ethernet-mac-3.0";
> +        reg = <0x80040000 0x40000>;
> +        clocks = <&misc_clk_2>, <&misc_clk_2>, <&misc_clk_1>, <&misc_clk_1>, <&misc_clk_3>, <&misc_clk_0>;
> +        clock-names = "gtx", "gtx90", "host_rxfifo", "host_txfifo", "ref", "s_axi";
> +        dmas = <&axi_mcdma_0 0>, <&axi_mcdma_0 1>, <&axi_mcdma_0 2>, <&axi_mcdma_0 3>,
> +               <&axi_mcdma_0 4>, <&axi_mcdma_0 5>, <&axi_mcdma_0 6>, <&axi_mcdma_0 7>,
> +               <&axi_mcdma_0 16>, <&axi_mcdma_0 17>, <&axi_mcdma_0 18>, <&axi_mcdma_0 19>,
> +               <&axi_mcdma_0 20>, <&axi_mcdma_0 21>, <&axi_mcdma_0 22>, <&axi_mcdma_0 23>;
> +        dma-names = "tx_chan0","tx_chan1","tx_chan2","tx_chan3","tx_chan4","tx_chan5","tx_chan6",
> +                    "tx_chan7","rx_chan0","rx_chan1","rx_chan2","rx_chan3","rx_chan4","rx_chan5",
> +                    "rx_chan6","rx_chan7";
> +        xlnx,num-priorities = <8>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x80040000 0x40000>;
> +        xlnx,tsn-tx-config = <&tsn_tx_config>;
> +        tsn_tx_config: tx-queues-config {
> +            queue0 {
> +                xlnx,dma-channel-num = <0x5>;
> +            };
> +            queue1 {
> +                 xlnx,dma-channel-num = <0x4>;
> +            };
> +            queue2 {
> +                 xlnx,dma-channel-num = <0x3>;
> +            };
> +            queue3 {
> +                 xlnx,dma-channel-num = <0x2>;
> +            };
> +            queue4 {
> +                 xlnx,dma-channel-num = <0x1>;
> +            };
> +            queue5 {
> +                 xlnx,dma-channel-num = <0x0>;
> +            };
> +        };
> +        // MAC 1 Node
> +        mac1: ethernet-mac@0 {
> +            reg = <0x0 0x14000>;
> +            phy-mode = "rgmii-id";
> +            phy-handle = <&phy0>;
> +            mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            phy0: ethernet-phy@0 {
> +                device_type = "ethernet-phy";
> +                reg = <0>;
> +            };
> +            };

Two } at the same level means your indentation is broken.

So each MAC has an MDIO node?

> +        };
> +
> +        // MAC 2 Node
> +        mac2: ethernet-mac@20000 {
> +            reg = <0x20000 0x14000>;
> +            phy-mode = "rgmii-id";
> +            phy-handle = <&phy1>;
> +            mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            phy1: ethernet-phy@1 {
> +                device_type = "ethernet-phy";
> +                reg = <1>;
> +            };
> +            };
> +        };
> +
> +        // Endpoint Node
> +        ep_mac: ep-mac@16000 {
> +            reg = <0x16000 0xa000>;
> +        };

Except the Endpoint MAC does not have MDIO?  Or does it have an MDIO
bus, and you have simply not listed it?

> +
> +        // Switch Node
> +        tsn_switch: switch@38000 {
> +            reg = <0x38000 0x8000>;
> +
> +            ethernet-ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +                    ethernet = <&ep_mac>;
> +                };

So this looks like a DSA switch.

> +
> +                port@1 {
> +                    reg = <1>;
> +                    ethernet = <&mac1>;

If you look at Documentation/devicetree/bindings/net/dsa/dsa-port.yaml
you see this node is derives from ethernet-switch-port.yaml, and that
derives from ethernet-controller.yaml. All the MAC properties you have
above actually belong here.

	Andrew


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE70AC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTEShFimapGmR74OfvWo1hBw+CheFn/y7KIigUoMWf8=; b=db5udIQGuii4rwlhBBNQiC8og3
	9F5D07g7hNqArIc3nTAlgeBQCywZfsHWSytpZ7jD0XodTXCCMRiLDI8Ts8h1oBKPWXNeyXd3LAVLq
	MWjZdqKrYYpcZm3ZTc5PpfFKTw5pDY+CEilsKCqEMPCNfZACHorNj0efncfXCZskdlg0/T5BWCBBD
	5gM/b4AGb2jc3amrM7G1UXO4h6DnSp0vLTIek5g8HdW3IIqYBPWZzUSPLPirrOVM2z/d110SPrUz7
	NVbyFC5D0PRcw813QhGZMWayk/Lj7dMOzeVitupXrY/RVwC/vhvCLR/3AAOK/Zfrxj8BmhsUz2N74
	hKgPZYcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5PY-00000006nJU-2ocV;
	Tue, 11 Mar 2025 19:37:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5KF-00000006mVg-0FhP;
	Tue, 11 Mar 2025 19:31:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1420B5C4B84;
	Tue, 11 Mar 2025 19:29:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6029BC4CEE9;
	Tue, 11 Mar 2025 19:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741721497;
	bh=9vKWwaB9nvbKVoEN30+SqReCmCUlZ1KxsGwp8d3wTDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQVfBiRm+tK9ub7XWhRYH1fSA49LyxojZHcoZIEpA2/y4jhfdzeYaHh3wH8Fx9fCS
	 FJO7D9rGCl5jwWWYHY8bJV7Eh+Bck5edTeD4AS6JQh+9tvcGzP8CzNhgM1odt8/Wc9
	 VZTfjWf+Momec4SVf3GjKfFZ+KHuiXUiCFq8SIoAHw0YxoDmleV3dpAmZJw9eMyadV
	 BzRcwnE4de5gCMjGdGVRdjrJ77katc+Lf9ggRuIWdYcjqrNBYioZL9/840QlBDdSe9
	 u6LXsizYPXEVlmxNDWCPJB03oJAXuTY1tNLWRli9pq4rFlo52DRjd9tPOCE1RWdQWn
	 ckSJ29Nhs5sww==
Date: Tue, 11 Mar 2025 14:31:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Yao Zi <ziyao@disroot.org>, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	David Wu <david.wu@rock-chips.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: net: rockchip-dwmac: Add compatible
 string for RK3528
Message-ID: <174172149414.4181803.16963634632371171945.robh@kernel.org>
References: <20250309232622.1498084-1-jonas@kwiboo.se>
 <20250309232622.1498084-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309232622.1498084-2-jonas@kwiboo.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_123139_155628_E20BC23D 
X-CRM114-Status: GOOD (  13.21  )
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


On Sun, 09 Mar 2025 23:26:11 +0000, Jonas Karlman wrote:
> Rockchip RK3528 has two Ethernet controllers based on Synopsys DWC
> Ethernet QoS IP.
> 
> Add compatible string for the RK3528 variant.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> Changes in v2:
> - Restrict the minItems: 4 change to rockchip,rk3528-gmac
> 
> The enum will be extended in a future patch, Pending RK3562 and a future
> RK3506 variant also only have 4 clocks.
> 
> Because snps,dwmac-4.20a is already listed in snps,dwmac.yaml adding the
> rockchip,rk3528-gmac compatible did not seem necessary.
> ---
>  .../devicetree/bindings/net/rockchip-dwmac.yaml  | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



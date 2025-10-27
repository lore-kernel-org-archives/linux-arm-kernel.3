Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EA8CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 19:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6w6NG8n0ZxUoy9MdSckOtXSafjCpXxwtT0UwQ2kVQLI=; b=w5c8fLUc0FDzSQAmrwSvRvCVQz
	QeL6bizC6FDbSXJlXAL829JWD9XaTeqa4Ac/aQp5bnOiBuU+gZakc8wcyRfidcVBwb/u/yz5yfmLh
	Kd14j+CqMs3c6YrC34lc5Zwl1srF+e5+1oExMpJ8UPMfS7RTSFty3rePw9qZJMlLhsEOAq47WUFUZ
	aUmOnax0I9bljj2VOwz0b8i83W+ukP8XbIaaRYfmBIRtsAfNiQORN+/gNFV3yG67iz6QbAAKEYb7+
	JrBBII/zeFb3aj5ufFdpZ0OvsReZg1xZbjZ5YKeyG5snj7TmM67MH6QXh0j/jqlRei9s66jCjKTnW
	lt3BeKoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSws-0000000Efx7-0MtG;
	Mon, 27 Oct 2025 19:32:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDSwp-0000000EfwI-3gWb;
	Mon, 27 Oct 2025 19:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2FA0F451F6;
	Mon, 27 Oct 2025 19:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 919B0C4CEF1;
	Mon, 27 Oct 2025 19:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761593527;
	bh=oEIFLwg+vMtiQ/y1rzQR0wldto4rWaop80M5IVc5VzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k6pNEWwMLGvzAWBWoBmVLQ+XdDyjFHAhvOCxXgwSXTxBKWO5/NuLWhQKkihLEX7aP
	 LKgI7G4lkBamHGgtANCDrX8H+tIL19Z79B0S53yciHqFxh/KAA97KGAAebgCdrEJqT
	 LIs/uAa4dG2KF0RnGNfNi9FwqOc7ybIb4JbeCgAy6OxHtn8CpmfErUtv91zMLoLeha
	 cXxu/KlUZKSjrHXUghfEq3uknJmfbwkgXH83ieKob3ixLtD4nTzLdBF7BMgEYdZjWb
	 mRkVcIEj2udzuYnwXuariKZOpOBhpxODdUJJWQXMlacISX+Pp2vwI6QAXHPGtaE0/V
	 NYEL3/2/SNCyA==
Date: Mon, 27 Oct 2025 14:32:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sven Peter <sven@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, asahi@lists.linux.dev,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Neal Gompa <neal@gompa.dev>,
	linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>
Subject: Re: [PATCH 2/3] dt-bindings: phy: Add Apple Type-C PHY
Message-ID: <176159352279.1458022.4288702383335406769.robh@kernel.org>
References: <20251026-b4-atcphy-v1-0-f81b1225f9c6@kernel.org>
 <20251026-b4-atcphy-v1-2-f81b1225f9c6@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026-b4-atcphy-v1-2-f81b1225f9c6@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_123207_956854_8D723085 
X-CRM114-Status: UNSURE (   7.80  )
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


On Sun, 26 Oct 2025 13:52:02 +0000, Sven Peter wrote:
> Apple's Type-C PHY (ATCPHY) is a PHY for USB 2.0, USB 3.x,
> USB4/Thunderbolt, and DisplayPort connectivity found in Apple Silicon
> SoCs.
> 
> The PHY handles muxing between these different protocols and also provides
> the reset controller for the attached dwc3 USB controller.
> 
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> Signed-off-by: Sven Peter <sven@kernel.org>
> ---
>  .../devicetree/bindings/phy/apple,atcphy.yaml      | 222 +++++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  2 files changed, 223 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



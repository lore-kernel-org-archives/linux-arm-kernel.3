Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C148C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 17:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wHv01t1S5YD1hN1/Q4zMRw6Wwu/+y0/yITSxTi55Rms=; b=vP5b9bK36wQ6MX+yhFqYJccCX1
	hlXYEhC2E4W6C7v4v7ZtEl/GyZKPn6XCTPP7gyJC5fQP3hTMPF8xw3Jh+i9e1nC0dfgPVPhjHAU8u
	X+C1rSBMWA56VxE8pZykhkhL4huv0DAUnyFw6/8nQra86ZQ4X1ciGmNGZakymBlvi5//T5lCBVBsu
	xTnn3fMEzzvOIHcExEVBA2SR0uAlKKNB6v5hbb7wT6SOj1czTuhRix+cJNqW54Kn8i0dpsy4xjL8A
	VLuv4Swi2Y6x9Q+zG/8uEah79MoC2kPAntT3RpwkkGAt6Ob/yrB+iX23jgLqjoH+44e2Yg4PNjzon
	flu5fBZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWrd-0000000ACFP-0MVZ;
	Mon, 12 May 2025 17:22:53 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEWQB-0000000A7ul-1sQ3;
	Mon, 12 May 2025 16:54:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A5DC2A4D9C6;
	Mon, 12 May 2025 16:54:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B954BC4CEE7;
	Mon, 12 May 2025 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747068870;
	bh=v8YP76OSQkJ+jZugp5dkNzFbI7u4ptwVFaT/PQOaqs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZHfa85krTALDXckFn1ygz3B+HxjcEezmbPPlyheHYS7jESvlZPqQOJFyhpulS82IB
	 SsvE1/XfeZbTyD8aRtz9Hav3hqWsgdnpTPqc/GxIx6tK8/0JH6l3E34N6A0A2aCPaj
	 iZLQSUbrefiYpRE7l+aIRQphN78QPi3au0lLu7+APHIXcfCRAB8vPaf0VJWb8cuUHj
	 sS5/cu+nf5wPf5nF5QUmmWbaINvN0XrkPwhQzB4iUe7zkLIo7BR+j8X+Tof23Yf61E
	 9ALxd1OaQRq7NPkWU59GSrQ/FCvqsEv//btEZFH615+sRkAiYQ90nAvdTIIt1ZG7jG
	 Yi0TXDfzIJZiw==
Date: Mon, 12 May 2025 18:54:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	kernel@collabora.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: rockchip: add RADXA ROCK 5T
Message-ID: <20250512-bulky-olivine-catfish-d6bcea@kuoka>
References: <20250509-add-rock5t-v1-0-cff1de74eced@collabora.com>
 <20250509-add-rock5t-v1-1-cff1de74eced@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250509-add-rock5t-v1-1-cff1de74eced@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_095431_570838_48E01F73 
X-CRM114-Status: GOOD (  10.77  )
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

On Fri, May 09, 2025 at 02:31:41PM GMT, Nicolas Frattaroli wrote:
> The RADXA ROCK 5T is a single board computer aimed at industrial use.
> Its design is similar to the ROCK 5B+, but it does away with one of the
> USB-C PD inputs, and uses one combination USB3/SATA/PCIe PHY for an
> additional second 2.5G PCIe network card instead of USB3.
> 
> Link: https://radxa.com/products/rock5/5t/
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



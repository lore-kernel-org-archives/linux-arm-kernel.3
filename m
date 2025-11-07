Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AAB6CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 07:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6bBT8BJ8N21olYEHDW0yf2mkkTnhv/PWfg5Dndi16I=; b=gANiMtAwa4r1kfztrNqjtAIXmJ
	bFhCfKUMqoSZNytum7VvYqhhlzb3lxyUTLJZw02JZkjSqhJ+h5CQAfptxUqWuE9ZO+gCstIOsSHS4
	082FnhFQR065+hDXnitFkNVoCP8y6LCtoE2ATHA48zXVMlLRpGbQEw+66D5yhDGPkTQUf8VODqzVZ
	HzSPMEHYHhf5z40yI8jrZVooNOf9QVxmrov9I/k9jCpFFR0FkDFJaENKjwPOabbLtVUDfTmHwYVgu
	qySMozpNpKZmsA0R8nDp5NKMGjBYHmlKrBr0ZfTMfyIRQhzv6pmjaDwh0onU62batq3/Vn3sidxfU
	IoLMWehQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHFA-0000000GoSB-0gMg;
	Fri, 07 Nov 2025 07:50:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHHF8-0000000GoS2-1n9I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 07:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 901AA60143;
	Fri,  7 Nov 2025 07:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3410C4CEF5;
	Fri,  7 Nov 2025 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762501845;
	bh=ZXzKa8ciq7q/j+7BGMdEknERpfHO5K+oFihg98YcdwA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=imw/8VrnU5YGb2Z8C1CEjEKTn4GkSaIhA7J8yV/eZA0dJRdpIux3cmE/ecgKoVBgU
	 CUfNPW/R2B/3WL+/Wvix8Jwvf28ryX9hpbt+zY2T0P3HkOMqVrfinGx7MJObmHCuEu
	 OE3y5C6iH6BNc3U/em1VvLF4O75Ph28WcDQ0nuyVkPf034qPlCUn+kDpdWVRN8u5GJ
	 pD1jV+oHOZ7PMrEfMPsuhui25OKYFQ0lGPgoajkdOy4yWhUZu8w05jRgdcxB79v41b
	 UyII87fQxMwE2M7tt49BGYWbw8RAFrYHl0s1DeYxYpHLUpdy+HxcOHXnSCk3bIGHiW
	 7nPCcLuLAhRMw==
Date: Fri, 7 Nov 2025 08:50:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, 
	simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, louis.chauvet@bootlin.com, 
	aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/5] dt-bindings: mfd: syscon: Add
 ti,am625-dss-clk-ctrl
Message-ID: <20251107-ambrosial-soft-grebe-ebaa3b@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-3-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-3-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:24PM +0530, Swamil Jain wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The dt-bindings for the multi-function device (mfd) syscon need to include
> ti,am625-dss-clk-ctrl. On AM62X, AM62A and AM62P devicess, the display
> controller (tidss) has external registers to control certain clock
> properties. These registers are located in the device configuration
> registers, so they need to be declared using syscon. They will later be
> used with a phandle in the tidss node.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")

Adding missing hardware is not a fix. Drop both.

> Cc: stable@vger.kernel.org

For sure not a stable commit. You just add new hardware.

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

With these fixed/dropped:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



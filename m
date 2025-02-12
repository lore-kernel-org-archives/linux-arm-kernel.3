Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74230C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 09:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOpTmU48qOfRLnGZYfYYZT3ar4zuU2hR8CsimoabIDs=; b=tOcS804vj5hWcDwBHNPrD8Cues
	yjxCHx3PCmncE9ps4X9efHkyVaTg9SufHKg0z7BN/saJEHBS5Uwmb7aoZ7cz2xOFwT8n/9S4JDzlA
	4t1uzFeMyCdocveH6rF1MuTXr/OaSu/YBNHTaK+Ffs/KZ9nnd/63oQva8y1fmugGcHPYoS6eBOzZK
	KXYZEYHJ3A9VYWAZ+SdgM1VuNxLlxx1gf+8qLotdbbIQES94PXcZPjeyaGS41glYs4pCVcv6IppiH
	KYULlct32WbBg1tKrUvjU4yf/cUG1Gu275E5GNkxzUp1UM38Fip0/ZxY4oEvc4EopiITsNX7NIsN1
	XA7MjsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8qo-00000006kED-3o9M;
	Wed, 12 Feb 2025 09:16:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti8oZ-00000006jz1-4Aca
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 09:13:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D5821A403D4;
	Wed, 12 Feb 2025 09:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26F4DC4CEE2;
	Wed, 12 Feb 2025 09:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739351630;
	bh=m8hs1EQzDriUMRQFfLQbZLGjCLK5Tchyqt6Tq25FBmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k0wH+HtMMeLv2bILij2hae73ypCmOGu6XB7618BrDg9dA+OXCvw4Wlw1L/n5489ag
	 CF+3vjW3/31gmpwDOiGtnIgoiDn62rFTOwpj/aVPvEkcHemS4EMll1e3AGMyirKK3H
	 UQJRL4ZSZy4uYqSk1RG3oOrIST75/wfQ2fXJ41BPDwuVjKompYR6GRVkkHHvPF/2Vq
	 26jK0XQN5uUR0o9csMhpi10+Uu6AeHBIimADArQR5M7W9jthxnfjyhm8cqLyuNmYnJ
	 Rnux+8jarjQ9JV7l/90CQqTPNDghBK10FxQXMzgnYRxeFSBzqTsLLtND78IISepghV
	 4HhX1M3CXC9tw==
Date: Wed, 12 Feb 2025 10:13:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexander Dahl <ada@thorsis.com>
Subject: Re: [PATCH v2 07/16] dt-bindings: nvmem: microchip-otpc: Add
 compatible for SAM9X60
Message-ID: <20250212-space-junglefowl-of-teaching-53f57c@krzk-bin>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250210164506.495747-8-ada@thorsis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210164506.495747-8-ada@thorsis.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_011352_122892_2147B8F7 
X-CRM114-Status: UNSURE (   7.64  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Ryan Wanner <ryan.wanner@microchip.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Feb 10, 2025 at 05:44:57PM +0100, Alexander Dahl wrote:
> The SAM9X60 SoC family has a similar, but slightly different OTPC to the
> SAMA7G5 family.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



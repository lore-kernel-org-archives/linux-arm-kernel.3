Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1D0C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCyqPrYLBlDMeicLA9Kl0tgTW9bvHCJqK07qXAlAFZM=; b=sITE1mjiFJJsiWkv06AOm8XWFh
	t3v4IhkcUAcL+HvBO1frGF85SjNbOAgUplGA+AieH9N9wfBzeKG5PiKimXewlcB9crO0Vb5iUQhFP
	o1lpkLE7RJTOnTUFeW5VdqxPqFr08itSWuLSEtOFVQSCDg4PkbcXa8jw6BuBJIrkyvCKoQdeONbPp
	UDV30kA8mqcE2AljEhpuOFoTFwMweU4JVjd0zAF/fa5Y+WhNT7wzPy6Z3+FlHLfbcJbWeic7ZDCLo
	g6TgImwWTzheDWTmDi3bBb589/KLdda16xS/1C/AY7MNp6K74mOveD90q/C4DzlRJGasmS75UsMRL
	CS7mlcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua9gi-0000000EFqd-2ASR;
	Fri, 11 Jul 2025 09:05:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua8zx-0000000E6j6-0y4F;
	Fri, 11 Jul 2025 08:20:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E8356116F;
	Fri, 11 Jul 2025 08:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C62DC4CEED;
	Fri, 11 Jul 2025 08:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752222048;
	bh=cdaXOqQf+RYrHBXTumCBfxof5X07gqf2jbXZEIVlCdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZM3fiGYXWni54KQ5OCCvYNGt5xxzaXnGNjgO/eA3ULRjRL0AJfxXC/hxGkVbQVfV
	 2HlidtjWETQTIjAt0hcvZ5BtWMBGIB01CELX927KIG4qoPtHEarSY+ntWXiPkzXVQo
	 JRc/FuSpCCnAxPn4976pplrbh5jHepPpo8msgMXjEEBz4jhmlH/PEQ6JOzsHOPLBwW
	 d9a4QW1M2n7ptYWow83lNcn1AmUi73lPgE8bwOm7/MnsWG9m2FfJn2dODzNYaN6GJT
	 lruUGlt9PJqOXRdFneM9I7csSRf6IaH/S8ShT1/Xp8Ou5ZC0lMQirskrFcTYmyM1nP
	 OMmoldGVY6c3A==
Date: Fri, 11 Jul 2025 10:20:45 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yao Zi <ziyao@disroot.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
Message-ID: <20250711-polite-seagull-of-expertise-7acdbd@krzk-bin>
References: <20250710202958.3717181-1-jonas@kwiboo.se>
 <20250710202958.3717181-2-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710202958.3717181-2-jonas@kwiboo.se>
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

On Thu, Jul 10, 2025 at 08:29:40PM +0000, Jonas Karlman wrote:
> The ROCK 2A and ROCK 2F is a high-performance single board computer
> developed by Radxa, based on the Rockchip RK3528A SoC.
> 
> Add devicetree binding documentation for the Radxa ROCK 2A and ROCK 2F
> boards.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---
> v2: No change
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



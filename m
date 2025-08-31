Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1798CA0FE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 18:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vABlHPQgjFRuHSCqmY3oGjz+EXzN17jq36avVrc15Bo=; b=l1SHMXs+ufsiGbJq2ypXCXbstZ
	VZ18DHTh53zhjvcsRe9F4HoqJy+UU8LaaIEEsJFNMQGpBAidpOm0gfqGMG8stlsS2p7Zg4b6eGhU5
	NtW0eV7ArvS3zQSGzWpiMsc9VS+GhjLNKL4EBcK2RrGxfrDb9ayDWaZHApu7LITNe1KIQPRfiyWZL
	L/XB+0al031mo/LZ1REae5vmyERnOPJoMHtchBOohVJceRkW3/GnZ/SnXRbDvsKGKWNGmav5Gc1QT
	zPgqvgW2BWQDHjD66/ryix7UFI52iAbYjT7c/OOv0yjbcjiBvQwaPRjq151KWGfPzAVFOmdBCMxuk
	9M3PHlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usmkY-0000000AXPA-1zd8;
	Sun, 31 Aug 2025 18:25:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usmhr-0000000AXE0-35MH
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 18:23:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4090A601AE;
	Sun, 31 Aug 2025 18:23:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DD5EC4CEF6;
	Sun, 31 Aug 2025 18:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756664589;
	bh=LE/s0xTjGqERQm+oRr6TmGSio6PkYKZF+Zhb64b9oaM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rbQNM7jgZsYAAqJOg5AXGdlP0k75F1es+bk51qcSRgX3ICqeRPuOeA5nAq83wHv+5
	 NEMxMfbiU3ndsSjKTyXg1dMhTjRh7kjJrZke0vzjO9U/mAjtpeLcgZWDApb9K04yjl
	 NzUHLHvws0C14nH0BuDsxfwrzeEKW6aaXcKVj3p1GYCtGZL9zLJJqOqK1AGxhmGg09
	 oBTUnDGZfn38xT2zEnv2PN2zvvuKnvFBs7o2BVNgCYXq9Lt0vMRDcMPDpdPhok9mIN
	 Y5HQIDJbGB3UoIZtShnY/UxM6qXyvXDx8A2GiHY6lU9gOV5HSxt7oVOHBCGVnSNEJV
	 cccuaR6WtP7Vw==
Message-ID: <09e1a345-21d5-4ff7-831c-755e00898a45@kernel.org>
Date: Sun, 31 Aug 2025 20:23:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: spmi: Add Apple A11 and T2 compatible
To: Nick Chan <towinchenmi@gmail.com>, Janne Grunau <j@jannau.net>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250829-t8015-spmi-v3-0-58b15ee2c825@gmail.com>
 <20250829-t8015-spmi-v3-1-58b15ee2c825@gmail.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250829-t8015-spmi-v3-1-58b15ee2c825@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 29.08.25 10:47, Nick Chan wrote:
> The SPMI bus found on Apple A11 and T2 SoCs are compatible with the
> existing driver for t8103's spmi so add their compatibles.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Sven Peter <sven@kernel.org>

Please drops those tags if you make a significant change like you did 
here between v2 and v3.

> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---

[...]

> @@ -27,7 +30,6 @@ properties:
>                 - apple,t6000-spmi
>                 - apple,t8112-spmi
>             - const: apple,spmi
> -

Why are you removing the blank line here?


Sven




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7888CC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 07:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6imr/Ij8DmjqfODuyxHY3qf/1LVweAyqgXMuWL7+KPI=; b=cQbT4yT4fSwBjUpUKbfDnTRWfC
	6wwzJ4KcKQzqESajtkwwcR2hQ9UizBve5ZS6GC4AcF7gX8KcSefcKYm607Rkh6zncE/vY48FZdGX2
	xiA/33JGArbumeH52T4/9yaYNH5iBsfp0tEVcWnqsLbbKAMUNUmRGerC8mTEPdfRKFc0wc7qgBNpa
	+C9trQL5Hastt5RYoSQj8NbGx2nDz/ash95P2u0guxlireDH4fxfClt3JwLpf7qOpwEo+VEgIyPlJ
	+DLxo1YErTjxaeWbNROJQukx408K6t80jeR65X/taku1/d7UwOQo35uCxprQJkU1LdRXjQTlc3X57
	Eg0PkJwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfvH-00000004GpP-0c9F;
	Tue, 28 Jan 2025 07:22:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcfu0-00000004Gls-1pGQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 07:20:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8859CA403A5;
	Tue, 28 Jan 2025 07:19:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42E23C4CEE4;
	Tue, 28 Jan 2025 07:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738048851;
	bh=6imr/Ij8DmjqfODuyxHY3qf/1LVweAyqgXMuWL7+KPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nGP30ImzrO8XZS8eU8Swnk2985zVVKwBIHzZuE80spUwbG1vLTA4kSUuyYrMdzOEq
	 yGOcLKuJCqDF/XDgs/9KHikqEY7dv+iC1SGnyonAuAVNwCDR7PFtadrGcYKChx5pbA
	 Og+aUNj/b2tTJBmIDNxKnAwIyfChQ26C+iInxayKCDtA+Q8GIXqsH33Ou3k9mohCsB
	 r2pPIcWi2VD2jV22SRSesMMsrNYu0QqmJH1txYu0iU7SqmWu4gty/stNA+Ep5jL7dh
	 pFnxJ7F0d7XQ9ojyyZHp5YGrhFsTGRo9d/s8HQezpu3qtz/MnNdWsuLVu7XnG+DvYw
	 KjybRFqPrax0A==
Date: Tue, 28 Jan 2025 08:20:47 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: arm: sunxi: Add NetCube Systems
 Kumquat board
Message-ID: <20250128-grumpy-bird-of-plenty-dc7abb@krzk-bin>
References: <20250127202127.971172-1-lukas.schmid@netcube.li>
 <20250127202127.971172-3-lukas.schmid@netcube.li>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250127202127.971172-3-lukas.schmid@netcube.li>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_232052_538386_5F307E2A 
X-CRM114-Status: UNSURE (   7.33  )
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

On Mon, Jan 27, 2025 at 09:21:23PM +0100, Lukas Schmid wrote:
> The NetCube Systems Kumquat is an Embedded Controller based
> on the Allwinner V3s SoC. It is intended for Smart Home or
> Industrial automation without the need for a traditional PLC

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



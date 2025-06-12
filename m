Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9D7C71136
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWK+FTL0galNkZu+x7Qv/q2CzcK439fjgooKj6i6UTg=; b=Nst0Z6Eq44WrF7LJVgVYRJnT6t
	1Or2wKRCNO4JnhiaylwLye1s5WUYm3QRxuA+K1UpRiZJ0WAIEjSosenVaWHgA1aTC0oDG1NoMWkp5
	B6RsQiBtHI87WWFGnmOki5VhahMi6e9AAaT8atxRrPoFhNYI5d8geAXthHDcVBJfWsXLBatRsWkFl
	t6wQZ5AHIWYKmHm5QOkO5+G0BLZ1CNE4QzNdT13ZEBioNBb0a4z685WP022cH0Qhfhy65SlSy5BCQ
	hVHBJPDVMVL0QF2M/EBkMtniLV2RBm+tFxDDz1QN0zLw+N5JxTD/g1h/7ORwT75t0tm40JZxczuZj
	WLhAvelw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnpd-0000000EHht-0U6g;
	Thu, 12 Jun 2025 19:43:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPj9i-0000000DexO-2fDV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 14:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB2BD62A08;
	Thu, 12 Jun 2025 14:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A74DC4CEEA;
	Thu, 12 Jun 2025 14:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749739429;
	bh=lrhWjcC1p3vpAdzkTP5scpnrJVT2HqrYXcMoc7cDr2E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HzTvcfiLdY7e9RyrcfxKBcFXqy5kFNwZcuFmJvfP73bDt/3Mmdsi6oJJ5yLV/Q4xi
	 VtYreZ0IVnD8yTQD81hKk5I1nfMdoXvPZD3Z2ETh+JMSw4Giv7XqCcKnAuoukyT/D9
	 Jjt3qW6ZSJ+ZhGsr0cpYoSxB+688QvM01DqF+P78V3UqeQGDYfHT7uUTIfp3Re44Ok
	 /Cx6sXGz1hHc9ryM9w4hf07lVps1CtbPfuNWAuX4FUNduU87jOOrXYvj3oQ2e3MEwu
	 VrBkgRoLIqGPynkRbK6PHAFrTStNHdrH4pDeWTukvnOwNkMPTWXPB7mZtz4jzhjiWD
	 lXNXQBVyN1XcQ==
Message-ID: <023f1c08-f9bb-483f-89e8-2ff5206d1f19@kernel.org>
Date: Thu, 12 Jun 2025 16:43:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: defconfig: Switch SOUND to module
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, krzk@kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Janne Grunau <j@jannau.net>, asahi@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org
References: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20250612134421.95782-3-krzysztof.kozlowski@linaro.org>
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

On 12.06.25 15:44, Krzysztof Kozlowski wrote:
> Sound drivers are not essential to boot boards or mount rootfs,
> therefore in effort to reduce the size of kernel image (and boot images)
> switch the ASoC drivers to modules to decrease the size:
> 
>    vmlinux: 152864 kB -> 154528 kB
>    Image: 39391 kB -> 39067 kB
> 
> No difference in resulting include/generated/autoconf.h, except making
> modules: SND_SOC_SAMSUNG, SND_SOC_SDCA_OPTIONAL, SND_SOC_APPLE_MCA,
> SND_TIMER, SND_COMPRESS_OFFLOAD, SND_PCM, SND_SOC_SOF_OF and
> SND_DMAENGINE_PCM.
> 
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> If patches are fine, I will take them via Samsung SoC.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Cc: Sven Peter <sven@kernel.org>
> Cc: Janne Grunau <j@jannau.net>
> Cc: asahi@lists.linux.dev
> Cc: linux-samsung-soc@vger.kernel.org
> ---

Acked-by: Sven Peter <sven@kernel.org>



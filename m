Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8756D49C6F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=euq3DIZBTE4qM2eqOaDtKndvOwdKebOXy4NoVSox5u0=; b=niEDrwpt5ue3yFdKR7tebis8NY
	O7o5jTQy8ujhEwNJyzOqauicqowam1pshduFQgpkoAJQzdhawVkFeSWKDHFbSsaJf8EVSFd69YicU
	s9yZaQ2fSP1AD596/JmvVSTNXvY0odNxVFB8otP1lmjpsCWROBLZz1rSRd0uLnB2fVk4ZeTv5u45+
	Xwf4zgcKi8MPMnjxMbPjg+hidXcUsH5NXwAIgA93AshNXFI0+p91gh2JeRmb2B/XT9/20xmolCPUf
	ThKijOwYY30m3zoxXkgc1C0GBF35lxFk8rMrz1cDFvVNz4+0WbHyo7xQ905kmvx+LCKaTP+oEseu+
	ychSwDYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljTn-00000001BIP-0zFX;
	Fri, 30 Jan 2026 08:03:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljTl-00000001BGo-01Pr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FEDC40624;
	Fri, 30 Jan 2026 08:03:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0C9C4CEF7;
	Fri, 30 Jan 2026 08:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769760224;
	bh=euq3DIZBTE4qM2eqOaDtKndvOwdKebOXy4NoVSox5u0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=aL8/6tXGmAYMFT4YxVmeA6am6EToZctkR2rUa7nKbvv8MtX/pvq5Fqc6Vc5m06Jps
	 PEh3FbMbG6w1GUNMbesDU+jxUZzfRgmDVoJum4dUNjakaQCBxU21EaI57XkoIMZ/Va
	 TWzbqsFya5T3U2gV0qoqrIozOuxAPELnpRvtdSZQUDSEpcQTD6bzYvIH/EhA44fDjJ
	 HlrGHXoTyiLw99apzDFM0JEYGoElFGy42pA/dhdhG3ks86feBrvJsGTmc8baC6FWuN
	 PjzAozsSsKRUHnpHMsO6fhTalWL5RDlKpvBON0e96q/CqKsvOUO1j7Miq0S9jWuTJY
	 mO6LIK6s5p1dA==
From: Thomas Gleixner <tglx@kernel.org>
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>, Neal Gompa
 <neal@gompa.dev>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: interrupt-controller: apple,aic2:
 Add AICv3
In-Reply-To: <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
References: <20260128-irq-apple-aic3-v2-0-b4bc8e16c997@jannau.net>
 <20260128-irq-apple-aic3-v2-1-b4bc8e16c997@jannau.net>
Date: Fri, 30 Jan 2026 09:03:40 +0100
Message-ID: <878qdfmsrn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_000345_082795_B72F4BC4 
X-CRM114-Status: GOOD (  13.18  )
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

On Wed, Jan 28 2026 at 09:57, Janne Grunau wrote:
> AIC version 3 as found on the Apple M3 (t8122) is very similar to AICv2
> in its base functionality. It can use the same device tree bindings as
> AICv2 so add it to the AICv2 bindings.
> This interrupt controller is used on all Apple SoCs starting with M3 up
> to at least M5.
> The only apparent difference is the increased IRQ config offset. Apple's
> device tree codes this new offset as property of the "aic" node but the
> value stayed constant for all SoCs with "aic,3". Since the SoC specific
> compatible "apple,t8122-aic3" will be used in the driver this offset can
> remain a driver implementation detail.
>
> Signed-off-by: Janne Grunau <j@jannau.net>

Can the device tree folks please have a look at this?


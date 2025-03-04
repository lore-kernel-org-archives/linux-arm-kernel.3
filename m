Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3701C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPmYBoeGATCCv2VEhfHoVQiVkvWkgyA9jYrrvRoXKV4=; b=o0eR3b0Vs6V224aTM2oLTzuC4x
	Vxvj1slcHXO0a6UhDICByu2BS9zrnpgDAEV4cRZS9w/BZqj2A2MGYTZkvE5q0eLEyFn2qs73RK0Vd
	PBR5feBboZ81D5nqtQiyfChQb8NG+ZNU+Isp2XrpbH62lUNdigEteTxYpduBvs1Jo+ybLxZT5irGg
	l3AJ4EeWrMsDxS0vzcnQin5HUD34c5y3W7+gLBTACQ906tFj9TmBdU8UU2mpedeSZGctT66yoP3fE
	Gpe7K/dBaCXzOSLOTZyHMLUiFNH6nKBSFX8q3Ob8i5CMh9L/PMJ3sxRNlNOgOJOp/PzlAyRefgHpq
	oq2Jm8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRlO-00000004hFu-3jcN;
	Tue, 04 Mar 2025 12:52:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpRf8-00000004g5k-2RZ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 12:46:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AA5845C4947;
	Tue,  4 Mar 2025 12:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C53C4CEE7;
	Tue,  4 Mar 2025 12:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741092377;
	bh=hZV0kE8HoZAQPzIo6cy2S7FlcfwAWIMzw3HFqDgdCyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZfaSJwYQ8q2OyZKnda1/E9qpJ5XBbeIOvZiXHa1AFQ1wxkEP8lkN9xWDeLgUTzPRL
	 QA1g41frBWJdwPC+s733y8YwcNlXjUxJBLdOSYtVO08EOFfG/v8JrrjW6T4166F9SN
	 6hIdXtWpvN96OiGbyULwFZd8/oqh8XSPUoCXJKQLaYwRxCDw7IV7uaUcB6famTXJwY
	 PjGWmY5nR+NFeAYBSeeqZ0FjAVnLpfR4XnzfDI762rKYNtcgbuhFC6O5Q3w0Vd+Txs
	 dAFGuRek13BM46tJosWAe+gEgD3TLEeUZ3v7UC7sObOQlGYjmMjAfXE61xPZujWfo6
	 pFHwyyukJMk9g==
Message-ID: <6ae42224-74cf-4d2e-88fb-f766279d3525@kernel.org>
Date: Tue, 4 Mar 2025 06:46:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] ARM: dts: socfpga: Add basic support for
 Terrasic's de10-nano
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <cover.1738600838.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_044618_659908_7C00B06C 
X-CRM114-Status: GOOD (  14.60  )
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

On 2/3/25 10:46, Uwe Kleine-König wrote:
> Hello,
> 
> The only change since v2
> (https://lore.kernel.org/linux-arm-kernel/20250130074553.92023-2-u.kleine-koenig@baylibre.com):
> is that I added patch 1/2 that is supposed to fix the warning that I
> failed to notice with the testing I did. Thanks to Krzysztof and Rob for
> their patience with me. I hope I got it right now.
> 
> Best regards
> Uwe
> 
> Uwe Kleine-König (2):
>    dt-bindings: altera: Add compatible for Terasic's DE10-nano
>    ARM: dts: socfpga: Add basic support for Terrasic's de10-nano
> 
>   .../devicetree/bindings/arm/altera.yaml       |  1 +
>   arch/arm/boot/dts/intel/socfpga/Makefile      |  1 +
>   .../socfpga/socfpga_cyclone5_de10nano.dts     | 95 +++++++++++++++++++
>   3 files changed, 97 insertions(+)
>   create mode 100644 arch/arm/boot/dts/intel/socfpga/socfpga_cyclone5_de10nano.dts
> 
> base-commit: 00f3246adeeacbda0bd0b303604e46eb59c32e6e

Applied!

Thanks,
Dinh


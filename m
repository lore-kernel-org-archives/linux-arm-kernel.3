Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6676AE6B255
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 12:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F7j294T/wX4UOYsogdD2OmaVwvEX8QrXGUez/c4DjgE=; b=mkZq2KqC8w7+reepHQ0DvM+Jh0
	iV5r4Xbd7EjJ5aZr/jWv7teXLfTmXjsimIMe8QV9RD7vBjrmJoFKXlbFii3Yf8CTDJ4nFnmQkOxIS
	EN40JEL04/91W27Ry52dSAH0c9Lu2dSujAzm1n+GGsrdIWAgz7FZSvot3Z4qL/Z0jBRkfjvoT9H2D
	bii/pB1EblPoVF3XFphV7MG32ld+TE3pUTfgEyCA8OcXL2WrqXJ0xnWh/nbZqs+nYadZKblmxfVJL
	F9eWkysez7uVhrksyOa3pxTu5Z+Illg7aWmmSKTDz+JpK+wDLF+1nTbCvHi5CnsR/HpM7apMjCBP9
	9pa57QTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qzT-000000074yx-2boP;
	Fri, 01 Nov 2024 12:42:59 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6qxo-000000074ms-2WuX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 12:41:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id D8ED843470;
	Fri,  1 Nov 2024 12:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1730464874; bh=1tyJN7tpj71GsXPgw1vXVuu1pL6JI3AXiNqruHLtMhI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=Kv6tcbiCwdREWMYqnVNGYwJkOnH3T7Y4RD5xN+XUWZu1/YP70sS7x6O+xFjNisQOg
	 vH2QXCmbnrR5W/JPhK9fFYxPHM1gMVzfx3YhFaiyefi+ErqO8klh97X12MaF1EJBTk
	 ADwUMjkkbk9wFVAhp4koK3Go71UkQnZx7ZPZk/w50LDUCROrcp6DK8zAtc1rBZzkTa
	 s24sfplZWNRjGJepQGKamyZxHnV/qLo4NA753pdPB9seElIU2nZsBM1qdpTguM7mve
	 o927WZoRBCx+r6VeEHobSEhNHfp4SfpDhoQv+t98gIE5pic/zuV2nm/4SXpRJrH1hp
	 gy7Ip2ha3Dy2w==
Message-ID: <23074410-ffe2-4f68-a983-67cec430f68f@marcan.st>
Date: Fri, 1 Nov 2024 21:41:13 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH asahi-soc/dt 00/10] Add PMGR nodes for Apple A7-A11 SoCs
To: Nick Chan <towinchenmi@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241029010526.42052-1-towinchenmi@gmail.com>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <20241029010526.42052-1-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_054116_827366_9DDCE02F 
X-CRM114-Status: GOOD (  12.08  )
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

On 2024/10/29 10:03, Nick Chan wrote:
> This series adds the PMGR nodes and all known power state subnodes for
> Apple A7-A11 SoCs, along with the associated dt-bindings.
> 
> ---
> Nick Chan (10):
>   dt-bindings: arm: apple: apple,pmgr: Add A7-A11 compatibles
>   dt-bindings: arm: apple: apple,pmgr-pwrstate: Add A7-A11 compatibles
>   arm64: dts: apple: s5l8960x: Add PMGR node
>   arm64: dts: apple: t7000: Add PMGR node
>   arm64: dts: apple: t7001: Add PMGR node
>   arm64: dts: apple: s8000: Add PMGR nodes
>   arm64: dts: apple: s8001: Add PMGR nodes
>   arm64: dts: apple: t8010: Add PMGR nodes
>   arm64: dts: apple: t8011: Add PMGR nodes
>   arm64: dts: apple: t8015: Add PMGR nodes
> 
>  .../bindings/arm/apple/apple,pmgr.yaml        |   5 +
>  .../bindings/power/apple,pmgr-pwrstate.yaml   |   5 +
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   4 +
>  .../arm64/boot/dts/apple/s5l8960x-common.dtsi |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   4 +
>  arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi  | 610 ++++++++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  13 +
>  .../arm64/boot/dts/apple/s800-0-3-common.dtsi |   1 +
>  arch/arm64/boot/dts/apple/s8000-pmgr.dtsi     | 757 ++++++++++++++
>  arch/arm64/boot/dts/apple/s8000.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s8001-common.dtsi   |   1 +
>  .../arm64/boot/dts/apple/s8001-j98a-j99a.dtsi |  26 +
>  arch/arm64/boot/dts/apple/s8001-j98a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-j99a.dts      |   1 +
>  arch/arm64/boot/dts/apple/s8001-pmgr.dtsi     | 823 ++++++++++++++++
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/s800x-6s.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/s800x-ipad5.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/s800x-se.dtsi       |   4 +
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-handheld.dtsi |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   1 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000-n102.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-pmgr.dtsi     | 641 ++++++++++++
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  14 +
>  arch/arm64/boot/dts/apple/t7001-air2.dtsi     |   1 +
>  arch/arm64/boot/dts/apple/t7001-pmgr.dtsi     | 650 ++++++++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  13 +
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t8010-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t8010-n112.dts      |   4 +
>  arch/arm64/boot/dts/apple/t8010-pmgr.dtsi     | 772 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8011-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8011-pmgr.dtsi     | 807 +++++++++++++++
>  arch/arm64/boot/dts/apple/t8011-pro2.dtsi     |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  22 +
>  arch/arm64/boot/dts/apple/t8015-common.dtsi   |   1 +
>  arch/arm64/boot/dts/apple/t8015-pmgr.dtsi     | 931 ++++++++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          |  21 +
>  43 files changed, 6246 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-j98a-j99a.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s8001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7000-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t7001-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8010-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8011-pmgr.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/t8015-pmgr.dtsi
> 
> 
> base-commit: 5c9de6f45db36b8a74c12e448cf9db87c97bf1e5

I'm not going to review the actual pmgr spam (I assume you did the usual
thing and autogenerated it with the m1n1 scripts and then fixed some
things up by hand, as we do), since really the only useful way to
validate this is testing and I don't have these devices (nor am I
familiar with any peculiarities).

Skimming the rest of the changes it looks reasonable, so:

Acked-by: Hector Martin <marcan@marcan.st>

Would be nice to get at least a cursory review from the DT folks, I'll
apply to the SoC tree after that (please poke me via direct/non-PATCH
email if I miss it, those go in a different inbox).

- Hector



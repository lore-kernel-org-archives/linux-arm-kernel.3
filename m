Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B06BC02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 23:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pk38UllpiRJ5HjBfUpqXeVrQFPBZtVwvcteXVNjXhwQ=; b=U+yNDVfM6FwA2Iq6yi1LsHJGUC
	6XJVNUDqKf91YaIo8K9s4Lp9WCxBWNCqE2vwBN8AJ4FCxLXGlabEWLErU3URjJG5ovCXK3K+s01Y7
	Okar/+HlXXCDk3hVab/17wuqBoQiTi7q2T56MEKAwNZJ6JGskzy2pHDJpWlQnimzIc4VvnNuASXi+
	7hlG2AFt/SAJaJ5rNFY/6OUac45PUsHc4yiMVqYXSzWMrAvpB0ueBYtqKBZvawEA3T694/tFBogcB
	nUQjM5D6GIKNPyK6X1FgCm3opztwaDeyPbPcXlbAKy1+alGEkYY0Plv3RPk0Ss8eQnwhn/Om69++q
	dloTNMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgBJL-00000007nDZ-2SZU;
	Thu, 06 Feb 2025 23:29:31 +0000
Received: from marcansoft.com ([212.63.210.85] helo=mail.marcansoft.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgBHw-00000007mrL-2WpY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 23:28:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: marcan@marcan.st)
	by mail.marcansoft.com (Postfix) with ESMTPSA id 7D3F54459F;
	Thu,  6 Feb 2025 23:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=marcan.st; s=default;
	t=1738884478; bh=QlOTyoQRutUhDbYeblAFtLa22VXCRSrxf7eaRid7ykc=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=GhBU9aw8TGPLHWJwo9N0ckjDZgW1uwyuWtksqgpUtCx8KQNNOsZejU9RC9RabqwyN
	 ETkVWPzO698bkB6blKlA2VidgfiBi5QfGYrYx1j3cjFbvy5lP7O47IC3m/szYHWsH2
	 7EzcLroSI+bVqFwk+hJWCZdBnyi8sCa51pAnU6D/957oyXyI9G5ujq3SoAnCwP6inr
	 2BImm1PmeSWvnM8sJolcqzYd9woCsW1IbKosJ06rIJjCvfqYeFbiEv+0teZANlnuQE
	 H3ZS8Vc5V4K/AijhK0HIrsXR1fSE7UGEdhbOHCeeLz1ahX80pFD+U4I9o0RGCYu8Ys
	 8FtbzunZ3tjiA==
Message-ID: <ecd655ca-61e7-4ef1-81ad-606c9ce95df4@marcan.st>
Date: Fri, 7 Feb 2025 08:27:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND 0/9] Add Apple A7-A11, T2 SoC cpufreq nodes
To: Nick Chan <towinchenmi@gmail.com>, Sven Peter <sven@svenpeter.dev>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, soc@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>
References: <20250203124747.41541-1-towinchenmi@gmail.com>
From: Hector Martin <marcan@marcan.st>
Content-Language: en-US
In-Reply-To: <20250203124747.41541-1-towinchenmi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_152805_039170_2C1371BD 
X-CRM114-Status: GOOD (  11.33  )
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

Hey Nick,

I'm not sure if we're still waiting for DT reviews for these, but either
way, please send DT and drivers/soc/apple changes to soc@lists.linux.dev
going forward (or perhaps they should go through ARM64?), as I am no
longer a maintainer for Apple DTs/SoC stuff myself. [1]

[1]
https://lore.kernel.org/asahi/CAEg-Je_SSTiiq5R9hce-7j5W02GaQqNUj=bFH+FwgjjxWugFqQ@mail.gmail.com/T/#t

On 2025/02/03 21:43, Nick Chan wrote:
> This series adds performance-controller and operating-points-v2 cpufreq
> nodes for Apple A7-A11, T2 SoCs.
> 
> Dependencies:
> 
> - arm64: dts: apple: Split s8000/s8003 SoC DTS files
> https://lore.kernel.org/asahi/20250203113949.14760-1-towinchenmi@gmail.com/T
> 
> - Device Tree for Apple T2 (T8012) SoC devices
> https://lore.kernel.org/asahi/20250203114417.16453-1-towinchenmi@gmail.com/T
> 
> Note, this will have conflicts with Apple A7-A11, T2 PMGR nodes [1] due to
> both of the series adding things to the same part of the .dts files, they are
> unrelated, so keep both of additions.
> 
> 1: https://lore.kernel.org/asahi/20250203121831.36053-1-towinchenmi@gmail.com/T
> 
> Nick Chan
> 
> ---
> Nick Chan (9):
>   arm64: dts: apple: s5l8960x: Add cpufreq nodes
>   arm64: dts: apple: t7000: Add cpufreq nodes
>   arm64: dts: apple: t7001: Add cpufreq nodes
>   arm64: dts: apple: Add cpufreq nodes for S8000/S8003
>   arm64: dts: apple: s8001: Add cpufreq nodes
>   arm64: dts: apple: t8010: Add cpufreq nodes
>   arm64: dts: apple: t8011: Add cpufreq nodes
>   arm64: dts: apple: t8012: Add cpufreq nodes
>   arm64: dts: apple: t8015: Add cpufreq nodes
> 
>  arch/arm64/boot/dts/apple/s5l8960x-5s.dtsi    |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-air1.dtsi  |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-mini2.dtsi |   1 +
>  arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi   |  45 +++++++
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi       |  10 ++
>  arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi   |  45 +++++++
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi       |  10 ++
>  arch/arm64/boot/dts/apple/s8000.dtsi          |  53 +++++++-
>  arch/arm64/boot/dts/apple/s8001.dtsi          |  59 +++++++++
>  arch/arm64/boot/dts/apple/s8003.dtsi          |  53 +++++++-
>  arch/arm64/boot/dts/apple/t7000-6.dtsi        |   4 +
>  arch/arm64/boot/dts/apple/t7000-j42d.dts      |   4 +
>  arch/arm64/boot/dts/apple/t7000-mini4.dtsi    |   4 +
>  arch/arm64/boot/dts/apple/t7000.dtsi          |  46 +++++++
>  arch/arm64/boot/dts/apple/t7001.dtsi          |  52 ++++++++
>  arch/arm64/boot/dts/apple/t8010-7.dtsi        |   8 ++
>  arch/arm64/boot/dts/apple/t8010-ipad6.dtsi    |   8 ++
>  arch/arm64/boot/dts/apple/t8010.dtsi          |  86 ++++++++++++
>  arch/arm64/boot/dts/apple/t8011.dtsi          |  79 +++++++++++
>  arch/arm64/boot/dts/apple/t8012.dtsi          |  83 ++++++++++++
>  arch/arm64/boot/dts/apple/t8015.dtsi          | 123 ++++++++++++++++++
>  21 files changed, 773 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8960x-opp.dtsi
>  create mode 100644 arch/arm64/boot/dts/apple/s5l8965x-opp.dtsi
> 
> 
> base-commit: a14d9039c2aea103eeedc5602ebab731ef3eb73e

- Hector



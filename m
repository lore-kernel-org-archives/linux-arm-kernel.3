Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF254E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lxxzjk5q9y8P40HonOtBn4D8FlGW4zff9yqkOXlj+5Q=; b=UsAF+0RVsREoNS3h2E9TeG0TnZ
	eVHYwcqst/7hvdbrawfMkNEXb1ieJPx9Hi/FKoAivk06h7soXtic12Uj3LYfJi8/+nbokHZWAEt5y
	M1kOyiFVvC1REiz5kB7C3XNcEPf5BZPJ3JBNEytWoaYiz+SmFktAzCw2TlhRLJrC9NNjJm4mMiFOX
	oTeeGjk548fNR+m/O18knK4KqINFqcLLoiF2Qmjw4cw+G9IevLE3FGCvW1XvleMdO98UQRKC0l3lk
	LbKDjL4cg8qEBGlGkSZHxxY7KhnkMgWlJDbugQHbPWdjh9+tL/0Igl4o+wiS7sDKBTsJToUgDBFTK
	bR0orm3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY4O-00000001gis-3gs1;
	Fri, 06 Dec 2024 13:08:32 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY3M-00000001gZM-3qss
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 13:07:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 36090A4423E;
	Fri,  6 Dec 2024 13:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070F7C4CED2;
	Fri,  6 Dec 2024 13:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733490447;
	bh=+MOizm4Hi8EsvmrUseTAmqGt2xqTmOXTLu/gHyRBzzI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mU+H7rdrruunhHauD8KabWFkDgYtiRl5h8hqJ3eeUBdjW66fE1mm0d3YAyQLvBGR6
	 ILXSzv7P5kFnVokBWaz8X3ThUYPtj1xh5GPQZ1U+FC8freyFfR40+Zzrl7CXU2oayg
	 1bRTwTJXbnLJjUoV7T/Wle3GPJBydDsMEK633JPUKlrdEY1lzgdeIxD0s3eDjsQF80
	 bUZRhdY9GScL1UDO1Ci38EX9CB00vjinBR6n8QUyqEAHIVy/etb5baRuaVyFOlSfvA
	 iy0mzywF09QEW9qrbpmmfCxO4o10TwgO9TB7RLgC0Kn3GYt+C6yl5rvC88/J8qXCeT
	 aNXedLzEaEPKQ==
Date: Fri, 6 Dec 2024 14:07:24 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Umer Uddin <umer.uddin@mentallysanemainliners.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	igor.belwon@mentallysanemainliners.org
Subject: Re: [PATCH v4 0/4] Add minimal Samsung Galaxy S20 Series board,
 SM-G981B and SM-G980F support
Message-ID: <dpby4tvamvsk6437kngv4d6diq6pqh5fquptwy7p5325e6hb3j@ot6eaurn4bun>
References: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203080327.4751-1-umer.uddin@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_050729_081904_CC74B3A6 
X-CRM114-Status: GOOD (  22.39  )
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

On Tue, Dec 03, 2024 at 08:03:22AM +0000, Umer Uddin wrote:
> Hi folks,
> 
> This series adds initial support for the Samsung Galaxy S20 Series and also
> initial board support for the Samsung Galaxy S20 5G (SM-G981B)
> codenamed x1s.
> 
> The S20 Series feature a lot of similarities in their configuration
> and internally Samsung named the common devicetrees in their
> downstream kernel 'hubble', please note hubble excludes the
> S20 FE series and Note20 series. To accomodate this, I've
> now named the device tree common's matching the codenames
> (x1s-common).
> The device trees have been tested with dtbs_check W=1
> and results in no warnings.
> 
> This initial bringup consists of:
>  * pinctrl
>  * gpio-keys
>  * simple-framebuffer
> 
> This is enough to reach a shell in an initramfs. More platform support
> will be added in the future.
> 
> Just like SM-N981B, the preferred way to boot the upstream kernel is
> by using a shim bootloader, called uniLoader [1], which works around
> some issues with the stock, non-replacable Samsung S-LK bootloader.
> For example, the stock bootloader leaves the decon trigger control
> unset, which causes the framebuffer not to refresh.
> 
> Device functionality depends on the patch series from Igor Belwon:
> "Add minimal Exynos990 SoC and SM-N981B support"
> 
> [1] https://github.com/ivoszbg/uniLoader
> 
> Changes in v4:
>  - Rebase from krzk's kernel tree to accomodate
>    for the merge of r8s
>  - Rename exynos990-hubble-common.dtsi
>    to exynos990-x1s-common.dtsi


What else happened here?

b4 diff '20241203080327.4751-2-umer.uddin@mentallysanemainliners.org'
Checking for older revisions
Grabbing search results from lore.kernel.org
  Added from v3: 9 patches
---
Analyzing 29 messages in the thread
WARNING: duplicate messages found at index 3
   Subject 1: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
   Subject 2: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 4
   Subject 1: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 (x1slte)
   Subject 2: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 5G (x1s)
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 1
   Subject 1: dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
   Subject 2: dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
  2 is not a reply... assume additional patch
WARNING: duplicate messages found at index 2
   Subject 1: arm64: dts: exynos: Add initial support for Samsung Galaxy S20 Series boards (hubble)
   Subject 2: dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
  2 is not a reply... assume additional patch
Preparing fake-am for v3: dt-bindings: arm: samsung: samsung-boards: Add bindings for SM-G981B and SM-G980F board
ERROR: v3 series incomplete; unable to create a fake-am range

Working with these series is a pain.

Best regards,
Krzysztof



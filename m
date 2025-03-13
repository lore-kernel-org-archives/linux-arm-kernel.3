Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97F5C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsraXg0fxkFjzQY88Fh2lk47iycKRhTpzuZNO4npsTY=; b=nTV/yGO39R7zp1PTxhMseGSp9Y
	dzmedkwP/ESQ2K4o+xOZ9TU5yJIPEBw0J4zdv+GTK+No0AAl1+KNbfahmMsN/4LpjeQ2SNwqakPz4
	gk+imyn620IWmwvZ4+HMVpn7HzdQX7u5jaULXSy7j/Q2c0tAe9ugV/6X/tg5ZFyWQ/gIfG/1Yhh3d
	lzVGHAG+6Cc+3YSW9wiFbWsmee37wCyJ3UxWSFgiDgy0d+8OV79AQaDQYj5z1WMNMoNGTm+s5NcZN
	76JRIPCgNlBtYwdwVg+pmd9ohqKborg4WXDT4cKe7vEuB/dm20o04jKHMEe4GIJMcJZPnRRJOSYrT
	nkbKwODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiZU-0000000BNkk-0Zko;
	Thu, 13 Mar 2025 13:26:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiVP-0000000BN8U-2Jxe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Mar 2025 13:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zsraXg0fxkFjzQY88Fh2lk47iycKRhTpzuZNO4npsTY=; b=AhaFgjOBWIyJxoshc+kWpFJg4q
	ysQdDAfkcyOBn02jrz2Fb0QoX5MIpDgjhgXW5jt7MJT6yi6GeZWRmPSkx9EJcbsL6nVOwBkxGX4gh
	n4ijv27l2T77SEQXpWFZjnI7uK13/nnBgC4iDz7KLbTUsDSkuLJrcuivDN+sURJ7ogzeeiwCxajdc
	LKhReTc6PzTU7vwPSCkr+pCt/0RzIwHjTxIsQtraSyf9KAyzPi6KPXltjOpackjyxYS+v63KjOByz
	WuAGLjTMICed1PK5fccCi3lVkpX39UxWfJSEAb1gHspE7dYJNJj/aN6IiHgzunsdvQWiy+lXxrenD
	J11e93Uw==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiVM-00000002dfp-11dU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 13:21:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D96D9A47299;
	Thu, 13 Mar 2025 13:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E84C4CEE5;
	Thu, 13 Mar 2025 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741872102;
	bh=fF2QQTE+2YlxG3sB1lZ42t5C418bXvGhFBRVwKr1Kpg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hs5puAaaFMdqwgfIqkKwLHW6ZeRgfcbUzR8YNU2CaYJ3WLY9ZVVODoiotmphYWUj9
	 zE+qKbmvtmdAUMM1ujxlvrtLaa74rV+r7IoDOvoj9TSZ2bZjLpZc1OSXP8ffRrY68/
	 jlLrLDxKwlL48GKa6lnMvNmZuuJZUTYgLcEiWIzNvbNCyaePBZ8yT5qzQPp4ByZdqq
	 i9Eflcvo1pUQUmOHh5Wtve8cU2BjKVfl1xn4GxNWl1edLCPtyte7lpL1r6Ky9/9A2W
	 qMHSbZ08UEwQOXFptifHfzCQk1aB45s9mj+T5t4n/93/2EXTxFAAUXTxSQR+qQEMeB
	 TDndXATAWJ41g==
Date: Thu, 13 Mar 2025 13:21:36 +0000
From: Lee Jones <lee@kernel.org>
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	~postmarketos/upstreaming@lists.sr.ht
Subject: Re: [PATCH v6 00/10] mfd: bcm590xx: Add support for BCM59054
Message-ID: <20250313132136.GC3616286@google.com>
References: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250304-bcm59054-v6-0-ae8302358443@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_132144_598530_8D7D40C8 
X-CRM114-Status: GOOD (  27.35  )
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

On Tue, 04 Mar 2025, Artur Weber wrote:

> Add support for the BCM59054 MFD to the bcm590xx driver and fix a
> couple of small bugs in it that also affected the already supported
> BCM59056.
> 
> While we're at it - convert the devicetree bindings to YAML format
> and drop the bcm59056 DTS in favor of describing the PMU in users'
> DTS files, as is done for most other MFDs.
> 
> The BCM59054 is fairly similar to the BCM59056, with the primary
> difference being the different number and layout of regulators.
> It is primarily used in devices using the BCM21664 and BCM23550
> chipsets.
> 
> This patchset has been tested on a Samsung Galaxy Grand Neo
> (baffinlite rev02; DTS not in mainline yet) with a BCM59054 PMIC.
> Testing on a BCM59056 would be appreciated.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v6:
> - Rename mfd/brcm,bcm590xx.yaml to mfd/brcm,bcm59056.yaml again
> - Use PMU ID value as device type
> - Rename rev_dig and rev_ana to rev_digital and rev_analog
> - Link to v5: https://lore.kernel.org/r/20250221-bcm59054-v5-0-065f516a9042@gmail.com
> 
> Changes in v5:
> - Make regulator binding descriptions reference mfd/brcm,bcm590xx.yaml
>   instead of mfd/brcm,bcm59056.yaml
> - Move regmap type enum to common MFD header
> - Link to v4: https://lore.kernel.org/r/20250215-bcm59054-v4-0-dbfb2d76a855@gmail.com
> 
> Changes in v4:
> - Fix yamllint warnings in DT bindings
> - Address miscelaneous review comments related to DT bindings
>   - Note that I did not end up moving the regulator refs from
>     allOf compatible matches; I explained my reasoning in [1].
>     [1] https://lore.kernel.org/lkml/ab853605-859d-44c6-8cbd-44391cd677e6@gmail.com/
> - Add PMU ID/revision parsing to MFD driver
> - Fix instances of regulator data not matching vendor kernel for
>   BCM59054
> - Use different voltage table for BCM59054 VSR reg based on PMU
>   revision
> - Link to v3: https://lore.kernel.org/r/20250131-bcm59054-v3-0-bbac52a84787@gmail.com
> 
> Changes in v3:
> - Split out regulator DT bindings into separate YAML
> - Use tables of regulator info instead of get_XXX_register, reg_is_XXX
>   functions
> - Drop "regulator: bcm590xx: Add proper handling for PMMODE registers";
>   it adds unnecessary noise to the series and will be submitted separately
> - Link to v2: https://lore.kernel.org/r/20231030-bcm59054-v2-0-5fa4011aa5ba@gmail.com
> 
> Changes in v2:
> - Fixed BCM59054 ID being passed to BCM59056 function in the
>   regulator driver
> - Dropped linux-rpi-kernel from the CC list
> - Link to v1: https://lore.kernel.org/r/20231030-bcm59054-v1-0-3517f980c1e3@gmail.com
> 
> ---
> Artur Weber (10):
>       dt-bindings: mfd: brcm,bcm59056: Convert to YAML
>       dt-bindings: mfd: brcm,bcm59056: Add compatible for BCM59054
>       ARM: dts: Drop DTS for BCM59056 PMU
>       mfd: bcm590xx: Drop unused "id" member of bcm590xx MFD struct
>       mfd: bcm590xx: Add support for multiple device types + BCM59054 compatible
>       mfd: bcm590xx: Add PMU ID/revision parsing function
>       regulator: bcm590xx: Use dev_err_probe for regulator register error
>       regulator: bcm590xx: Store regulator descriptions in table
>       regulator: bcm590xx: Rename BCM59056-specific data as such
>       regulator: bcm590xx: Add support for BCM59054 regulators
> 
>  .../devicetree/bindings/mfd/brcm,bcm59056.txt      |   39 -
>  .../devicetree/bindings/mfd/brcm,bcm59056.yaml     |   76 ++
>  .../bindings/regulator/brcm,bcm59054.yaml          |   56 +
>  .../bindings/regulator/brcm,bcm59056.yaml          |   51 +
>  arch/arm/boot/dts/broadcom/bcm28155-ap.dts         |   68 +-
>  arch/arm/boot/dts/broadcom/bcm59056.dtsi           |   91 --
>  drivers/mfd/bcm590xx.c                             |   75 +-
>  drivers/regulator/bcm590xx-regulator.c             | 1289 ++++++++++++++++----
>  include/linux/mfd/bcm590xx.h                       |   28 +-
>  9 files changed, 1366 insertions(+), 407 deletions(-)

Besides my one comment, the MFD side looks okay.

So you still need ACKs from Mark and to rework Rob's suggestion.

-- 
Lee Jones [李琼斯]


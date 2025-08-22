Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF0EBCA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yjDaQyPgYqGebRjvxpL8l2neia8BuLCnzPQdpLeVTM=; b=RLJXXIZCqUXqpEhmBIZWtfQZD3
	6Jxyw4yFKpj9/KaI5m5e7ZW6nGBLB1oejgSpUqq+XtlKwdktssPQI/hgJ/I0V06OjTYnbeOjUDH8d
	U7sw0BqVeqOp8gUPjqnPEh2YkQ8vSNosf/4fzl7q8d9mlwJ6LhrOeGrRhUiQp4A+ZPhqYLQzQ931Q
	vmtrZe8hMJNr5kDqncYfbMFO/5jn+t98Ls9quOQtY81SJ6M93fMwk4kPs3jgAsYTPIiTeZANB/Uyr
	Y57QeSDCa4uSFZFFOV5V95aOUEiBMZrnL+cyv0l+66SlhljsbyY5dDDHPrW2Que6HxS3ayMDMlkhb
	8YII9rgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphpQ-0000000446e-0plr;
	Sat, 23 Aug 2025 06:34:16 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOVK-0000000280s-0E11
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 09:56:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=+yjDaQyPgYqGebRjvxpL8l2neia8BuLCnzPQdpLeVTM=;
	b=T4DxzR7tcHi98ViJJbeBYKPBhulpgzrgyRYi9kbKin+yVnymIXkjdpdEyJqEMs
	i88NIHdHaTxrjy1l/JGbjWcw5++tAVsZAgeYppk1DK17rMyoGTv5N8OQMBnjBT/C
	yx1sRWoDEVkTcJwmtCzSPokv6ddQ7nIikD1bnHNh6ObVc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHFG6vPqhobTYWAw--.11247S3;
	Fri, 22 Aug 2025 17:56:01 +0800 (CST)
Date: Fri, 22 Aug 2025 17:55:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH v2 0/7] ARM: dts: clean up most ls1021a CHECK_DTB warning
Message-ID: <aKg-r76oH34VAH1i@dragon>
References: <20250820-ls1021a_dts_warning-v2-0-2e39648a32b7@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820-ls1021a_dts_warning-v2-0-2e39648a32b7@nxp.com>
X-CM-TRANSID: M88vCgDHFG6vPqhobTYWAw--.11247S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw17GF4kXFyfWryUXFW3Awb_yoWkuwc_WF
	43tF4xGF4UCrW2ka15GFyqvryvk3yqyFsxGFy3Cwn8JF9xJF13Wan0y3Wjq3WjgrWFv34q
	9r9rCr42q34FyjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8VwZ7UUUUU==
X-Originating-IP: [117.81.240.235]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIhIAZWioPrISGQAA3S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_025614_389856_0C9354CC 
X-CRM114-Status: UNSURE (   9.85  )
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

On Wed, Aug 20, 2025 at 12:36:50PM -0400, Frank Li wrote:
> clean up most ls1021a CHECK_DTB warning.
> 
> Old uboot check esdhc@1560000. The new uboot already switch to check both
> esdhc@1560000 and mmc@1560000. So we can rename it now.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - squash rename to flash patches
> - remove duplicate patches already post in
> https://lore.kernel.org/linux-devicetree/20250725061339.266125-1-alexander.stein@ew.tq-group.com/
> - Link to v1: https://lore.kernel.org/r/20250818-ls1021a_dts_warning-v1-0-7a79b6b4a0e2@nxp.com
> 
> ---
> Frank Li (7):
>       ARM: dts: ls1021a: Rename node name nor to flash
>       ARM: dts: ls1021a: Rename 'mdio-mux-emi1' to 'mdio-mux@54'
>       ARM: dts: ls1021a: Rename esdhc@1560000 to mmc@1560000
>       ARM: dts: ls1021a: Rename node name power-controler to wakeup-controller
>       ARM: dts: ls1021a: remove big-endian for mmc modes
>       ARM: dts: ls1021a-tsn: Remove redundant #address-cells for ethernet-switch@1
>       ARM: dts: ls1021a-tqmls1021a-mbls1021a-rgb-cdtech: Remove fallback compatible string edt,edt-ft5x06

Frank,

Could you rebase on imx/dt branch?

Shawn



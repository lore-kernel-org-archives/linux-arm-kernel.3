Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82684C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 16:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2nXd/EXnbT4TqG0x3mbCSCdNuDpRUUskDuzgRjU52iY=; b=seu7xSt8i2wEndKDSttghlIKSl
	cYJWuU19/J98LCd94g2bnJCk1pd7aDbPoPfLIUFdokJx5dm7bjbckp4Rpf8b5bgBROPYy77woL6zy
	9In6OL24pvaBvJ19ubpuBCW2bKjZJ/6S27UOpQLFHdQcWfl8x/qYTStLB5VHQG25UsObSdjveDWOa
	9klMzGYdzV+FBLK3DyBkr5ECVdESxyZAgns8vYZPRxV5nNx+3SJWaYa2txycyd1ZCTi2HX1k2G7el
	qKK30ipHeXBaGPNIhYgb8Egbuz/66b4BcoGYCtn2BRvjrRpShp3doucLh/vG27HW4555Fbakox88g
	/n+FKCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWZs-00000000VAg-3gNI;
	Mon, 10 Feb 2025 16:24:08 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWYS-00000000UoR-3OtC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 16:22:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 81057A41965;
	Mon, 10 Feb 2025 16:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F2BC4CEE6;
	Mon, 10 Feb 2025 16:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739204559;
	bh=UT/78BR2tAyyzFGH2npZWxW5hNSCyp7d3rnhQpVN6iI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=b7n6IUv72dkvCZEDwaA47QdPLbfeIfJaR0lwF/ejKiMkPdSsK5qABjH3YjdW6QcXA
	 Kun3rTfRL9iEVrb0nU6aor0O4R6j76DmG28rbFsDLmWRFHDroh4Jbd6t7asgD2DFFb
	 RDzZVLbXR+MfyUoqeopqJ4c0hY55LWYHjC9tn9SOYtUp+TNLGi0ud0zHnaSpio+AJF
	 +oCTW+nrNWOLbdZrtw5qVJihdrwDThykyFdPas+NqFcYhjyYYiWXcVEYrC5OJUUzTV
	 x4FVXKv/PyLWGrUeTB25wNrJl4L5aLLE6Npf0BI/T6AJZW+Uw9V9utzKkdiXBawQo3
	 4I9SOP9geB2hQ==
Date: Mon, 10 Feb 2025 10:22:38 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Jassi Brar <jassisinghbrar@gmail.com>, 
 daniel.lezcano@linaro.org, devicetree@vger.kernel.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, peter.griffin@linaro.org, 
 vincent.guittot@linaro.org, Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, willmcvicker@google.com, 
 linux-samsung-soc@vger.kernel.org, andre.draszik@linaro.org, 
 Catalin Marinas <catalin.marinas@arm.com>, ulf.hansson@linaro.org, 
 Peter Griffin <peter.griffin@linaro.org>, Will Deacon <will@kernel.org>, 
 arnd@arndb.de, kernel-team@android.com
To: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
References: <20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org>
Message-Id: <173920411592.476427.15574016492470186426.robh@kernel.org>
Subject: Re: [PATCH v4 0/4] arm64: exynos: gs101: add ACPM related nodes
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_082240_972429_4627DF98 
X-CRM114-Status: GOOD (  17.93  )
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


On Fri, 07 Feb 2025 15:56:42 +0000, Tudor Ambarus wrote:
> Define SRAM, mailbox and ACPM protocol in device tree.
> Enable the mailbox and ACPM protocol in defconfig.
> 
> Bindings for google,gs101-acpm-ipc are proposed at:
> Link: https://lore.kernel.org/linux-samsung-soc/20250207-gs101-acpm-v7-0-ffd7b2fb15ae@linaro.org/T/#mb557ee342de628b1a8e462d4fb7c3ac6eb8be4e4
> 
> Changes in v4:
> - rebase on top of v6.14-rc1.
> - describe in the cover letter where are the ACPM bindings.
> - Link to v3: https://lore.kernel.org/r/20241220-gs101-acpm-dt-v3-0-642d64daa5d1@linaro.org
> 
> Changes in v3:
> - ACPM: don't specify the channel ID and type in DT: the channel ID is
>   discovered at runtime and the channel type is always DOORBELL for the
>   ACPM interface.
> - mbox: update #mbox-cells = <0>;
> - rebase on top of v6.13-rc3
> - Link to v2: https://lore.kernel.org/r/20241212-b4-acpm-v4-upstream-dts-v2-0-91b7a6f6d0b0@linaro.org
> 
> Changes in v2:
> - update nodes based on the bindings updates
> - update mailbox and power-management (mailbox client) nodes to specify
>   channel type (doorbell or data) and channel ID.
> 
> v1:
> Link: https://lore.kernel.org/linux-arm-kernel/20241205180200.203146-1-tudor.ambarus@linaro.org/
> 
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
> ---
> Tudor Ambarus (4):
>       arm64: dts: exynos: gs101: add SRAM node
>       arm64: dts: exynos: gs101: add AP to APM mailbox node
>       arm64: dts: exynos: gs101: add ACPM protocol node
>       arm64: defconfig: enable ACPM protocol and Exynos mailbox
> 
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 25 +++++++++++++++++++++++++
>  arch/arm64/configs/defconfig                 |  2 ++
>  2 files changed, 27 insertions(+)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20241220-gs101-acpm-dt-6dcde166530a
> 
> Best regards,
> --
> Tudor Ambarus <tudor.ambarus@linaro.org>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/exynos/' for 20250207-gs101-acpm-dt-v4-0-230ba8663a2d@linaro.org:

arch/arm64/boot/dts/exynos/google/gs101-oriole.dtb: /firmware/power-management: failed to match any schema with compatible: ['google,gs101-acpm-ipc']







Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5178BC2BA1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 20:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zTq75GcUmqvorQnG6XMOND3nHNp34uxAp+xF68eVmdM=; b=mwYw1u7eVNXSE6eHiWQtUq92VM
	lMyx1IgavKVtO5bDGHWHT6WVpbMHKGeYw6u947v3yoVDvLCY4u8Szt+FGmKsTlD9fqW12vxCJMjHj
	mi9ZCIOJqGi5oFq9A+sOnBU5rKv7zMF3L5S4Au6tbBoyE6kiMNu/9hvg/454PuTpezoFvrNw13Tcw
	OrjC7dPcjBngCS0aRo/GLN6/YZwr+u2nZg9yGSbZGRBfIC8BG1AYTk0AtK7fpQZAN5UE4zHeCyQtE
	tbCsWzv+rhHsiMYjbq8aGHsOXaJkNplL7HcubkpfiFva1ZFXRtvqBqqBLcluhpmYN28lugFEC/djy
	sudCZysg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trjba-00000003rEH-1jfN;
	Mon, 10 Mar 2025 20:20:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trjUp-00000003pHx-405V;
	Mon, 10 Mar 2025 20:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 998205C5EAC;
	Mon, 10 Mar 2025 20:10:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75E97C4CEEA;
	Mon, 10 Mar 2025 20:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741637587;
	bh=pwT39giEdOzrATke/Go754xjWmqpTejDczTvTc4LmLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PvFJaMHd1RdC/g5djtx22/46v3J0qj+Yc9d2cSCc5paDGT9IqCAr9+Qtb3VpOwbJP
	 qU/BwFi1nA67/u6vFnq63ncp06yks3dG7bCewpylTwre3m2YOSNYu5gNYy7rjdNI27
	 c/QGUicBRGAbxLi10hU+d7deZPr0mc56WF/HJNGE/U9kFPYzShWcPDyrqN6g5y47QV
	 nm8rftZFmJzaGo0vBPBSiH5JwBjYN5yD1b5uiwUf+X7Vt2oVI3v7IOmzwMVqo9glbL
	 aD8DtcoVJUQ/Um3KuV8e5DIcFJdcz1HvSr/pOjEjWeylgPZn3B27yxybGOVqZGS0J1
	 SR13cVMqi3FfQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, linux-watchdog@vger.kernel.org, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, linux-phy@lists.infradead.org
In-Reply-To: <20250307005712.16828-1-andre.przywara@arm.com>
References: <20250307005712.16828-1-andre.przywara@arm.com>
Subject: Re: (subset) [PATCH v3 00/15] arm64: dts: allwinner: Add basic
 Allwinner A523 support
Message-Id: <174163758109.467704.5227333743858525157.b4-ty@kernel.org>
Date: Tue, 11 Mar 2025 01:43:01 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_131308_037539_87519A53 
X-CRM114-Status: GOOD (  10.31  )
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


On Fri, 07 Mar 2025 00:56:57 +0000, Andre Przywara wrote:
> this in an update to the series introducing the basic DT support for the
> Allwinner A523 SoC. It now comes with DTs for three boards, using
> slightly different packages of that SoC.[1]
> Functionality-wise it relies on the pinctrl[2] and clock[3] support
> series, though there are no direct code dependency series between the
> series. Two binding patches from there are required to pass dtbs_check,
> git put their patch IDs in the footer below.
> Compared to v2 only small fixes in the NMI controller driver: renaming
> the struct to better reflect its new usage, add adding the DS pin to
> the eMMC pingroup list. Adding accrued tags on the way, many thanks to
> the diligent reviewers! More detailed changelog below.
> 
> [...]

Applied, thanks!

[07/15] dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
        commit: 1f7af7f3c353ae3b384a66a82c5074ac28901160

Best regards,
-- 
~Vinod




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DC3D111B3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0JY0l9KILWtgurR5lkp/s4CjaE73Dq2Pe4jWzYkjNc=; b=raX5RF86XZs8/6VXNw6Wy8qpgi
	r5Xrpu80bzMEBsM0jv1DEqXsEbqnLVCM+vdk1TW65Qo48T+N2mVvEIE5o61BO4Ij2UAR3J5ipvbcM
	HObFcGda5gXEotafmYb3b2eQgefROtN9TpyWbDlj6jg/K0iC19K00rFX5hPSWNIVa+2Z2YHEaY/ve
	oNTegs2HA8a5zSTFLj6v0ruGgHBZcm6+MlSupzjj8C3IRX7qszuvXLYv17hDoA/UjRz7evGxAZ1qc
	/87L4SHtfx78zeXh4Gsby9Ae3kQH8PTIEhP3nNPbMGoiTM4wbFOjrTpxCGsPbni5gM4Aa2Tf5UklB
	OR0QrbDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rNR-0000000Cq6q-2Tj7;
	Mon, 04 Nov 2024 07:19:53 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rLk-0000000CpyB-44XE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=u0JY0l9KILWtgurR5lkp/s4CjaE73Dq2Pe4jWzYkjNc=;
	b=a6eLp7oCTvtMLCXR6x0IO4FMP8fHujOklnFcuT4b4ukhJp1m3fyVygHDpbPAJ1
	EcCK/gja+Y3oBj9oJcNInT08fPEvnT/h1qv2BxABaOohvsTvvgoVeRUnS1hP+k0s
	T2KDbPY78ReV5iwzgvHlHtNmEYVmKYvtQ8youZKYCaXgs=
Received: from dragon (unknown [])
	by gzsmtp1 (Coremail) with SMTP id Mc8vCgDHDu8ZdShnBECmAQ--.16720S3;
	Mon, 04 Nov 2024 15:17:46 +0800 (CST)
Date: Mon, 4 Nov 2024 15:17:44 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 0/3] ARM: dts: add Kobo Clara 2E
Message-ID: <Zyh1GKFk9fksLCQo@dragon>
References: <20241103135201.25615-1-andreas@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241103135201.25615-1-andreas@kemnade.info>
X-CM-TRANSID: Mc8vCgDHDu8ZdShnBECmAQ--.16720S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrZry7AFy8uw1UZr43ZrWfAFb_yoWxArX_uw
	4kZ34UCa15CFs7Kwnxtr1q9r4rKr1jyrZ3ur1kKa4SyF93ZF98uFWkX34xu34UZan0qwnF
	vF17W34kC3Wa9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8DDG5UUUUU==
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgmNZWcocJkPOwAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_231809_333424_9478D22C 
X-CRM114-Status: UNSURE (   9.92  )
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

On Sun, Nov 03, 2024 at 02:51:58PM +0100, Andreas Kemnade wrote:
> Add a basic device tree for the Kobo Clara 2E Ebook reader.
> It is equipped with an i.MX6SLL SoC. EPDC PMIC drivers
> are not ready for mainline yet.
> 
> Changes in V4:
> - fix order of pinmux nodes
> - remove some blank lines
> 
> Changes in V3:
> - removed 30MegaOhm current sense resistor nonsense
> 
> Changes in V2:
> - improved commit message about devices without binding
> 
> Andreas Kemnade (3):
>   dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
>   ARM: dts: imx: Add devicetree for Kobo Clara 2E
>   ARM: imx_v6_v7_defconfig: Enable drivers for Kobo Clara 2E

Applied all, thanks!



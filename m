Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22CDFC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 06:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nE8AnDzlAdTdSngj6L3+BpOpqe9eo0q+LJAko/lAh1k=; b=kDmqoCVvLTfaz3LI/LL+7N73iR
	UM0Z7Kk/9JQNwT5bSukaeooEn/F7vxOW1PzIiyRYagjcc5G9tRj8C8eCyL6Lfa1WM0/nzVJ2iT0fT
	DHe9sluw8HbpfZSzEaBGLKQwdy7WJJyElMpl+WBlasldpzVPkNIOF6PQUvmWGpIqvOqoDrkL9Vrwf
	SKWUJbhnJROr3qB8M76I1im5Dbchg4d+SCTE3+x6+vP89PlPrVxAQDTMCWDuSTMkNrhZscBXBxbyi
	VSiyHOOxAjWRWDciCB/sMyTKljrpTpKjuyODzLtuHyu22vfLPviCDvq1m1DuNOxlzEhilSgEp8U6p
	KRVw15jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1yt-00000004SU5-0H7n;
	Tue, 08 Jul 2025 06:39:07 +0000
Received: from mail-m16.yeah.net ([1.95.21.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ1rN-00000004RLC-3Frb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 06:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=nE8AnDzlAdTdSngj6L3+BpOpqe9eo0q+LJAko/lAh1k=;
	b=S+KJ5AK23OGLNHolHJf9c6oSpMk54xLgwdvcsRI63T+0DPKe5PFiqg602yto46
	oRgIAsQxhx5Qb0zep12adXbZ114PoRqwXZjTE2kQNvnWdCi7Sq6kWPHUkNCooQTP
	2uegxccet03BMcbpdiu/Fv4218o1vRQxoSsB5oQ08/pWI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAXt+wWu2xoWjCJAA--.42179S3;
	Tue, 08 Jul 2025 14:30:48 +0800 (CST)
Date: Tue, 8 Jul 2025 14:30:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 0/8] TQMLS10xxA DT fixes
Message-ID: <aGy7FstpQtetMZ8v@dragon>
References: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250701062500.515735-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: Ms8vCgAXt+wWu2xoWjCJAA--.42179S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrGw15Kr4DCr4xAr15KF48Zwb_yoWxXFXE9r
	yfWrn29r18Jw4Sk345Za17tayIgr15ZryUAFWag3Z3Jr1IqFy3Z3s2qryfWFyUXrs09r1D
	Zw15J3Z5XrWYgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjzwZ5UUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBGEZWhsmnlz4wAAsD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_233122_385007_935F88D4 
X-CRM114-Status: UNSURE (   6.32  )
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

On Tue, Jul 01, 2025 at 08:24:48AM +0200, Alexander Stein wrote:
> Alexander Stein (8):
>   arm64: dts: fsl-ls1043a: Remove superfluous address and size cells
>   arm64: dts: fsl-ls1046a: Remove superfluous address and size cells
>   arm64: dts: fsl-ls1088a: Remove superfluous address and size cells
>   arm64: dts: tqmls10xxa: Move SFP cage definition to common place
>   arm64: dts: tqmls1043a: Enable SFP interface
>   arm64: dts: tqmls1046a: Enable SFP interfaces
>   arm64: dts: freescale: tqmls10xx-mbls10xxa: Add vdd-supply for i2c mux
>   arm64: dts: freescale: tqmls10xx: Add vdd-supply for spi-nor flash

Applied all, thanks!



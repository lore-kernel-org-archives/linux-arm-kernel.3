Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31733C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 15:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beNsCZKtnDZ/kCW2/aDDl5S4J3i4rAjENZyUI1MLHbE=; b=mgk64ic0c6CciRUcmLlVOQqwkm
	oWzcrKN5vx+RLiMBd7QACebb4hVIH6fEbL17+5WFoDOcqpHbuKTkPwUx636uvP+yA8r0BcLnMmEji
	THrrOUsowGddL2iRXh9SFqVajmw+mVJgG1aSlQGjVb0D+ih2qcn2+XIDUKbtSOg5HSKh2f9C1vdm0
	Oi5VWusZw1BJiYa7v9UC+29RjLwV3c8uH7NU4SRKjPsiogB9n3HqcmJCiYv3MljHvLENVAwW2dt3Z
	X7RfdRSX1os9kj1Jy8m6V9nnaQTcen84X1D7fRz+tg66YUpBid8x9Y0wijhde6EiktA1ae+vGqGUs
	NA8y9lGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWcvS-00000005tHu-1Rgh;
	Tue, 01 Jul 2025 15:29:38 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbLT-00000005ZVo-0aQP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 13:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=beNsCZKtnDZ/kCW2/aDDl5S4J3i4rAjENZyUI1MLHbE=;
	b=PorNfJM/z8Oohl/eipl/U2KBmvOtCwwdC+ghH6peaAI1r7Wj/qX4co4UQC5Gr0
	s+UHkcaitA4IrawjNkgPUH7Wxj1QAUZcSvEK1V8N9kWHnckdfPGTpOQvpK7/gk11
	MFBqku7U8r0RxHwZBvpO533jAH2hzHV0d2kTQia6/iaWo=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3V+YQ52NoT3cBAA--.3737S3;
	Tue, 01 Jul 2025 21:48:01 +0800 (CST)
Date: Tue, 1 Jul 2025 21:47:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Tim Harvey <tharvey@gateworks.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2 1/4] arm64: dts: imx8mp-venice-gw71xx: fix TPM SPI
 frequency
Message-ID: <aGPnD7J43tjoHYkM@dragon>
References: <20250604225630.1430502-1-tharvey@gateworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604225630.1430502-1-tharvey@gateworks.com>
X-CM-TRANSID: M88vCgD3V+YQ52NoT3cBAA--.3737S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF18Xw4DAFWfZr4UZry7Jrb_yoW3JrX_Ca
	y7K34xJw45X3yUta95trs3XF97K34xuFyIgrWUtFW3Jr9a939avrn5X3s3Aa1a9a1UXrnI
	grZ5X3y5Krya9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1iID7UUUUU==
X-Originating-IP: [114.216.146.217]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiIBLwVmhj5xK8AwAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_064823_551324_10FE398E 
X-CRM114-Status: GOOD (  10.50  )
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

On Wed, Jun 04, 2025 at 03:56:27PM -0700, Tim Harvey wrote:
> The IMX8MPDS Table 37 [1] shows that the max SPI master read frequency
> depends on the pins the interface is muxed behind with ECSPI2
> muxed behind ECSPI2 supporting up to 25MHz.
> 
> Adjust the spi-max-frequency based on these findings.
> 
> [1] https://www.nxp.com/webapp/Download?colCode=IMX8MPIEC
> 
> Fixes: 1a8f6ff6a291 ("arm64: dts: imx8mp-venice-gw71xx: add TPM device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Tim Harvey <tharvey@gateworks.com>

Just to be clear, "b4 shazam" was smart enough to pick this v2 instead.
Still it would be helpful to leave a comment on the old version saying
there is a newer version superseding the old. 

Shawn



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C46CEB2DF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 09:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJfVlkISB8Y0Nj6NK+4jzx1o7Knv8GKqMIobgZ5NNIQ=; b=nJVaTvlf5JaOKDmx8iciQ/XCWE
	7OG/fVY2m08+0041PZIdI3cJZV/QPVDlhFcVYYd/SDUCT7cVYRdzqsPfRoUdxEmqEDmSKLjsbQesH
	HePBv6ZgQkBvHR61my9saC1Ns7snFFbD9Vu1gidP8s+h2Tjw7AafrXOCGVOh79yiDS2Ek0ib5nnZ1
	GkCUwMK7q8jFwQIWhHihR4ARql9pevremXzP2FC3X0vNkNGtpQIXyOHVCz+OSTSUsMi9AiNes1rGV
	ve33OtxRQMLDsgRl8sOzm/TVupIzLss0rMgBUHOxkOVzYXL1NLAwQb6c/Xx/qhSGtbPhJkQZwyjYJ
	Mfc08s1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nxG-00000006P4Z-1lEg;
	Fri, 01 Nov 2024 09:28:30 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nvY-00000006OjK-3pY8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 09:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=UJfVlkISB8Y0Nj6NK+4jzx1o7Knv8GKqMIobgZ5NNIQ=;
	b=ZhcAsuWKA6FfQJOMViqHZ2fL/p4u9bmQkMbppds0z/gZEFCONRwhHAHT81bJ4h
	tgBwI82/G9xDRMU70X0YzrfRLWtKBc2WI+QLfzbSELV7RFAv2wBc1rLHc25LH2Th
	pmJ6N8CBiucFC+RUp/OiIMn1mUil21YCU3qzTwUR1nfEc=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHrruSniRn7n1gAQ--.13488S3;
	Fri, 01 Nov 2024 17:25:40 +0800 (CST)
Date: Fri, 1 Nov 2024 17:25:37 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>, Frank Li <Frank.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 0/6] configure imx8 dsp DT node for rproc usage
Message-ID: <ZySekZeAgD/GEh2Q@dragon>
References: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: M88vCgDHrruSniRn7n1gAQ--.13488S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUV73kDUUUU
X-Originating-IP: [117.62.23.195]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgyKZWckdPt-HAAAse
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_022645_282552_014FA624 
X-CRM114-Status: UNSURE (   5.94  )
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

On Mon, Oct 21, 2024 at 11:52:15AM -0400, Laurentiu Mihalcea wrote:
> Laurentiu Mihalcea (6):
>   dt-bindings: dsp: fsl,dsp: fix power domain count
>   arm64: dts: imx8-ss-audio: configure dsp node for rproc usage
>   arm64: dts: imx8qxp-mek: add dsp rproc-related mem regions
>   arm64: dts: imx8qm: drop dsp node from audio_subsys bus
>   arm64: dts: imx8qm: add node for VPU dsp
>   arm64: dts: imx8qm-mek: enable dsp node for rproc usage

Applied all, thanks!



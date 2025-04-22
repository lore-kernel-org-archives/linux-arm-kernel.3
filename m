Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1174EC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s2WKQWHFaOBBiVhKURZdk+x4emLXSSQ2B7MB5TSOXFg=; b=qAmoCEh1IvJ6R8EDiO2acCCrB/
	0gZS2Z7VklFyV5442U/m/0wm0JxjjZa/2McGZuzVLC2+arIuMEbCHKhkU8eNGNdU4K4KHKlokvb1/
	Lv3ZW9EywPSVk0Oq4jqnGcn4dVUfN5ouCGKxPHfl+KPIKBhkew2FW7HBRHVEPtR7w+lDjDxXue6yn
	Q+yrcvtZNOyTVHaPqnUoaIQ164WGAhDLzmR66nI0vUMt3fkmW01Lpz+3oO8Rn2UavbKgLxajty2Gu
	MDoLr/JU9XP5rxUtX4xmuuOS8SV5wzxsxcs9PQvuA7A9ExM57HD+O1wBZtAlpfMHhJ6PiBq1fh5Sr
	hz5Cs5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u739q-00000005Ynu-0FbT;
	Tue, 22 Apr 2025 02:14:46 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u737u-00000005Yfw-4067
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:12:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=s2WKQWHFaOBBiVhKURZdk+x4emLXSSQ2B7MB5TSOXFg=;
	b=j3c2wA8tiUnKXr/gWCGn17+9XdyDs9/XezbctZh6IUY1WMWRw6YRIOqXdWz4AA
	cdYQ3/JR+e09qDaGZwZNWc6EyJYWnWbbGYH3iSMPV40qJW20oAKpUWig3ue1BwQa
	sp6sfl82ySFFPS5L/XB9DKkwtQbZqf1wbzk+uk3hNm2OM=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgB3Mz4L+wZozti7Aw--.12946S3;
	Tue, 22 Apr 2025 10:12:28 +0800 (CST)
Date: Tue, 22 Apr 2025 10:12:26 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.li@nxp.com>, Marco Felsch <m.felsch@pengutronix.de>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 3/3] arm64: dts: imx: add imx95 dts for sof
Message-ID: <aAb7CkrxVmTtsTHg@dragon>
References: <20250311163255.2664-1-laurentiumihalcea111@gmail.com>
 <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311163255.2664-4-laurentiumihalcea111@gmail.com>
X-CM-TRANSID: Ms8vCgB3Mz4L+wZozti7Aw--.12946S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUI75rUUUUU
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNA2dA2gG+w3pyAAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_191247_296098_F31B3D92 
X-CRM114-Status: UNSURE (   6.75  )
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

On Tue, Mar 11, 2025 at 12:32:55PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add imx95 DTS for SOF usage.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>

Applied, thanks!



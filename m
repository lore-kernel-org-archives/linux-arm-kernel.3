Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBA7C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mk6+yO5lZuVxi5Kmo5/UufFhj1K1prW5eaKtcGD0tz8=; b=tE1sIg6h3arjZJ/4KjxBVf8NlU
	3ZnyK47tyARpu6sY+0wC/8GAwZ2Fn8niUZeiaeeq+exwsxTq/Pxz3Hwb+snXhr5O72iuHHoV8Ihl3
	r14BGbuEjOqUlao6xr0BLBTkZj5czwlIbgdD2Sz6E7WigKQCjRMi8cohiQ5qIRiEQyfXoDW8/Yq+n
	LLrbjKU7w1cPaoqG2uicNHjnKTwHJvmZE/W1vnxJQSkBl4EXgb5QviEANdh+tBlSvxmKvYxRvYg1k
	i8ZxYdEyS748vFuc5FTTM/q78r34oVgRtF/0+/vA4/hcNPh9Tkuz10A0m1fPpiLYMQRhUCc+ub40Y
	a5abHlbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7YON-0000000AMiP-08Tg;
	Wed, 23 Apr 2025 11:35:51 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7WKa-00000009wmb-02Me
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 09:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=mk6+yO5lZuVxi5Kmo5/UufFhj1K1prW5eaKtcGD0tz8=;
	b=BziGxj4275mC1kdFACZMSlMJN2yTcVxUFQc0xfXdT0H/hnZWWGUbD2U8CNzghE
	FiW8sfnjS9mslu0kK2GbQvg3vDvlkJnv20nFv5LfzomkdJd77eyZjKrt3hHlXs3p
	zFIpKUbb0sCNZ5DCXf8Z3Vasjzps+BR9MFIBKYAtuoKUQ=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnNYyFsQhowhu5Aw--.10561S3;
	Wed, 23 Apr 2025 17:23:19 +0800 (CST)
Date: Wed, 23 Apr 2025 17:23:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, hongxing.zhu@nxp.com
Subject: Re: [PATCH 0/8] arm64: dts: imx8: create common imx-pcie[0,1]-ep
 overlay file
Message-ID: <aAixhV/TS/eZNHKr@dragon>
References: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331-imx8_pcie_ep_dts-v1-0-270ef0868ac9@nxp.com>
X-CM-TRANSID: M88vCgAnNYyFsQhowhu5Aw--.10561S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWDJFWrZFy5KFyrKw4Durg_yoWfuFX_Cr
	45W3W8X34UGw4fJ345Aan8uFy2g345Z3y3WryrWw4vga4xXFWavr4kJr1rWr18Cry3Grs8
	CFn0qw1fX3WrGjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8P73PUUUUU==
X-Originating-IP: [114.216.210.34]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQw4ZWgIdnnrUwAAsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_022348_409648_4C082E81 
X-CRM114-Status: UNSURE (   6.36  )
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

On Mon, Mar 31, 2025 at 03:02:38PM -0400, Frank Li wrote:
> Frank Li (8):
>       arm64: dts: imx8: create unified pcie0 and pcie0_ep label for all chips
>       arm64: dts: imx8dxl-ss-hsio: correct irq number for imx8dxl
>       arm64: dts: imx8dxl-evk: Add pcie0-ep node and use unified pcie0 label
>       arm64: dts: imx8: use common imx-pcie0-ep.dtso to enable PCI ep function
>       arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files

Applying: arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files
error: sha1 information is lacking or useless (arch/arm64/boot/dts/freescale/Makefile).
error: could not build fake ancestor
Patch failed at 0005 arm64: dts: imx95: add pcie1 ep overlay file and create pcie-ep dtb files

Could you rebase?

Shawn

>       arm64: dts: imx8mm-evk: add pcie0-ep node and apply pcie0-ep overlay file
>       arm64: dts: imx8mq: add pcie0-ep node
>       arm64: dts: imx8mq-evk: add pcie[0,1]-ep nodes



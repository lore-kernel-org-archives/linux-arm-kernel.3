Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42E6CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FIebiWHIdHOR8V4xRaj6i5CqlzafrAmw1NlFomf5KyI=; b=ffGHx9hRePY9EYzEQ/lW5hFYb7
	H6t/ygu4nM+P3ipysVdRYDwwhmZOmmls3KJjWZvTZobWl1lf2BCflebSUDPorC6oQTf0T5bASfHeD
	O8cQMG0LUTw7xlTEkltAy3kQso/bhbvEBT73KtFxMuRkJ+H+GMNOacABOifhwjfs5wqZnG9wRMQYx
	slZhuypAYl69ol/Agt5B28C6EfSi3vj7AhpR5HTCJAjnL26hsxVQhU1Qpot3tiBlELoyTYaiNmFQu
	s/MMM/FYBa6AH4sRjxD1kfjelnIq0u5Joe++UE4LPsEEHuS0QZLrAhSRdu4DSvDTBwdEXqhJIe4qc
	B/AiEcUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWSu-00000000F7Y-3UTp;
	Thu, 11 Sep 2025 01:51:12 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwWSs-00000000F5L-2ltH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:51:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=FIebiWHIdHOR8V4xRaj6i5CqlzafrAmw1NlFomf5KyI=;
	b=BSVDzRFH0Umy7SvEDJO7JZWBTtZLSY2uMEWDjTtgp6PH0qq0wUnD6LVfz79zk8
	rHr11E9uiwQeo15rt56V0iP6MOQahZUfSM0aTB/ZcSsWJGOmfPf2NLnuh06la43W
	DdJrSf3/BNFp3xMVQAGC5E3AX54ECHIBoYNMZUg+T56oI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3Fx4DK8Jo74lfBA--.16446S3;
	Thu, 11 Sep 2025 09:51:01 +0800 (CST)
Date: Thu, 11 Sep 2025 09:50:59 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Josua Mayer <josua@solid-run.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yazan Shhady <yazan.shhady@solid-run.com>,
	Mikhail Anikin <mikhail.anikin@solid-run.com>,
	Jon Nettleton <jon@solid-run.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 2/3] arm64: dts: add description for solidrun imx8mp
 som and cubox-m
Message-ID: <aMIrA7UMhJXXuWzM@dragon>
References: <20250823-imx8mp-sr-som-v3-0-a18a21fbebf0@solid-run.com>
 <20250823-imx8mp-sr-som-v3-2-a18a21fbebf0@solid-run.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823-imx8mp-sr-som-v3-2-a18a21fbebf0@solid-run.com>
X-CM-TRANSID: Ms8vCgD3Fx4DK8Jo74lfBA--.16446S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrWw4rJrW8Cr43tr4UZF1kZrb_yoWxGrX_XF
	98KF43Xw4xJF9aya1kKr45KFyI9a1kKr95ur4ftrWfX34fC3Z2yFZ7Jayrur4jvrs3tFn2
	gwnxGF18Ar1xKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU1sNVDUUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhLFZWjB-SpoYQAAsX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_185111_033359_7DF5CA7A 
X-CRM114-Status: UNSURE (   9.05  )
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

On Sat, Aug 23, 2025 at 05:28:22PM +0300, Josua Mayer wrote:
> Add description for the SolidRun i.MX8M Plus based System on Module, and
> the CuBox-M.
> 
> The SoM features:
> - 2x 1Gbps Ethernet with PHY
> - eMMC
> - 1/2/3/8GB DDR
> - MIPI-CSI Camera Connector (not described without specific camera)
> 
> The CuBox-M is a complete product with enclosure featuring:
> - 1x 1Gbps RJ45 Ethernet Port
> - 2x USB-3.0 Type A
> - HDMI connector
> - microSD connector
> - microUSB connector for console (using fdtdi chip)
> - IR receiver
> - RTC with backup battery
> 
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Applied, thanks!



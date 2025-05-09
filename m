Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F074C3ABCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8W4x/SOfsK5KukV+9m2Wm8bOWGZZSROVtNjLW9SKw4k=; b=pgK11mlq87mVU0LQJ2aJw5k5HE
	O2p/CTaLx/3y3BgJ5igbzAGOWDzlGVAJdDLyEdTO9B96+UtAVEdQVFyq8MT37suuJSAS1I06cOEBH
	PhLjF+WiBjn3JwKbmBS4njW40x2mYDASqaHta0aASqJJXc20i1fn5QcEgNMMj1rAhVqOW6GMX9q2/
	UcYES84zgQnyXYmDonbfzfQPBlOU0bnNXC/jI96qmUs2W6scRORNEc2vLOuX6O9vJzK0Fs52zEnlQ
	fPYlDoKnSpVXKC7FcnLd6RC/eh8lMxlzerX5FvR5PBkaVER+hCUm364u3NbobGWvcAgRQO/hB0YPg
	h24BKCLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDU80-00000004jKH-2GSu;
	Fri, 09 May 2025 20:15:28 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDP2m-00000003zU2-0hut
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 14:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=8W4x/SOfsK5KukV+9m2Wm8bOWGZZSROVtNjLW9SKw4k=;
	b=nlZ1ey9rhYWL6MQoeMZvKJ82l7lMwUfcl4SMECr6vhmuhYlzbO0cjPQ09gA1JP
	StjMYyYrWNnXXMOBviGbhJsMasN1x2YBCDSMHJE4Y3kn5dFBsv9MoqWXLSwLoqX+
	85821j/DVP1Ck5AwgZjnFKG2lqZjeIwkYwbQEWpGmegGU=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBnL_HwFR5oMpOoAA--.26367S3;
	Fri, 09 May 2025 22:49:21 +0800 (CST)
Date: Fri, 9 May 2025 22:49:19 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: shawnguo@kernel.org, tarang.raval@siliconsignals.io,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: imx8mp-var-som: Fix LDO5 shutdown causing
 SD card timeout
Message-ID: <aB4V76XU9Cyl48pl@dragon>
References: <20250505055828.4160-1-himanshu.bhavani@siliconsignals.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505055828.4160-1-himanshu.bhavani@siliconsignals.io>
X-CM-TRANSID: M88vCgBnL_HwFR5oMpOoAA--.26367S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7WryUKw4kJw48Ww47trW8WFg_yoW3Xrb_Wa
	18tanru3y3Ar9avr1rt3WxKrWSqw4qv3W7J3yUWrWqyFy2vay5JwsI93yrAw4rt39xtF1q
	q343Xw4UWF1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjOVy7UUUUU==
X-Originating-IP: [117.81.80.76]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAQVIZWgd+-h1qQABsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_074944_643372_1846FD10 
X-CRM114-Status: UNSURE (   9.21  )
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

On Mon, May 05, 2025 at 11:28:27AM +0530, Himanshu Bhavani wrote:
> Fix SD card timeout issue caused by LDO5 regulator getting disabled
> after boot.
> 
> The kernel log shows LDO5 being disabled, which leads to a timeout
> on USDHC2:
> [   33.760561] LDO5: disabling
> [   81.119861] mmc1: Timeout waiting for hardware interrupt.
> 
> To prevent this, set regulator-boot-on and regulator-always-on for
> LDO5. Also add the vqmmc regulator to properly support 1.8V/3.3V
> signaling for USDHC2 using a GPIO-controlled regulator.
> 
> Fixes: 6c2a1f4f71258 ("arm64: dts: imx8mp-var-som-symphony: Add Variscite Symphony board and VAR-SOM-MX8MP SoM")
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>

Applied, thanks!



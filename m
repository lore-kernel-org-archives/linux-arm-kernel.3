Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B4BCAC58E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 01:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4k5/JPOBUxwbc4K+iaUVIBbHlgzzxXGM8UQoWVaZokQ=; b=VtLfUzHgp1ZCu4EAYflM+UtvMA
	cwluzVhD04itBUEiY/jILU/eRGyXhI6ZEqsUwGmq5NN+7gvf2pegCmiLq82LD/+3J/LUbp9JUL98F
	Yuh21gE5df6zHBVJWl0lkB1aKtDPqEBAcf3AtUBdFu6Z3iB29ctXVqTvrYGqY4mJ0O4yxsoAbDzOs
	6upNFZeh166J1lUqqix+Su7vG0QxLcRaks0pTVlSuaAcom+7LEfY4nIxk23txQrpQRlvr6T9hSi+n
	Kw3MFSTI2yRp96RU3C9ucw1xDX8Y90oPtctnZIeelBr/eRWVTCD3msVEe1ylqwMtztaEruccx1wDX
	BJdvwwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVuV-000000006PI-3kLz;
	Thu, 11 Sep 2025 01:15:39 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwVuS-000000006OE-3LsM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 01:15:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=4k5/JPOBUxwbc4K+iaUVIBbHlgzzxXGM8UQoWVaZokQ=;
	b=S4N2q8btx7USS4KJ2EKqMceSqcD7brZbf/0+Sws0iffcUe0hYFZaJkmmAJ/nGd
	p/V5wMfX0PKxixZHY11vNbQrvsvz4SlHab12bkoK3G6eqyrvJh4z6UXKOJ6ZoJ+f
	/NfGRgJxRCTM6GQhGcMNALXg6oHt9vTPNS61WX+bdupCw=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDHX52YIsJo9NhFBA--.59011S3;
	Thu, 11 Sep 2025 09:15:06 +0800 (CST)
Date: Thu, 11 Sep 2025 09:15:04 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 1/1] arm64: defconfig: Enable Marvell WiFi-Ex USB
 driver
Message-ID: <aMIimFUa6p4Zqfg7@dragon>
References: <20250826141356.2572830-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826141356.2572830-1-alexander.stein@ew.tq-group.com>
X-CM-TRANSID: M88vCgDHX52YIsJo9NhFBA--.59011S3
X-Coremail-Antispam: 1Uf129KBjvdXoW7JF4xtrykuF1UZFy5JrW8WFg_yoWftFc_tF
	48X3s7Zw4UXFW2kw15XFsa9rySk3y5WFy5Gry5tFyfW3W0gFZ0vasxtrZ8Ja4q9wsYk3s8
	J34DZr1Ykw13XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjD5r5UUUUU==
X-Originating-IP: [114.216.146.49]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEhjFZWjB-SpQ1gAAsS
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_181537_147889_833CD7C2 
X-CRM114-Status: GOOD (  10.45  )
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

On Tue, Aug 26, 2025 at 04:13:56PM +0200, Alexander Stein wrote:
> MBa91xxCA (imx93-tqma9352-mba91xxca.dts) features a soldered,
> non-pluggable USB attached WiFi module. lsusb says:
>  ID 1286:204e Marvell Semiconductor, Inc. Bluetooth and Wireless LAN Composite Device
> Enable the corresponding driver.
> 
> To: Shawn Guo <shawnguo@kernel.org>
> To: Fabio Estevam <festevam@gmail.com>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: imx@lists.linux.dev
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>

For future posting, I suggest you put these below ---

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---

... here

> Changes in v3:
> * Explicitly mention the onn-pluggable USB WiFi module
> * Added Krzysztof's R-b
> 
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)

Applied, thanks!

Shawn



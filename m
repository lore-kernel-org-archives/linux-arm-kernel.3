Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244B4C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 08:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAIATOjAFIlfdECkmuMV7fShBSNKlp8OzqEdVUlOvEk=; b=BMV3lmJJTs7z96+yag4u8XY1cG
	FMLCiby32idxpfEEvh/bs/csH24pMVpgYrioBtPXsfes7FcBUcYsmPlj+ChSCVEIo2ed1QnVfGadZ
	X+wTsJ3sVQkKvmKStMWrXkecvI/bRhRDGp9A9fTshXKJXZNKqOr/DdMJhhXKzFYucyRV5JlSDUZa6
	h64ozy8SVlj8gc3NgfA5QwYTJOLAcv9cjSw7gRJWBh175+RvB3uHPKYTNzPRW8WV3nTbl+dk1cno4
	UASj2jAFBHu+/BZz0FYY03dWNZY6H4eGDP5Q1UehF3p1xmg/ljH2oL9xO31aRZaSvSV+2m1jDokYT
	y8NxVhDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm7CY-0000000AfAc-3zHj;
	Sun, 23 Feb 2025 08:19:02 +0000
Received: from mail-m16.yeah.net ([220.197.32.18])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm7B5-0000000Af1U-0nUl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 08:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=CAIATOjAFIlfdECkmuMV7fShBSNKlp8OzqEdVUlOvEk=;
	b=jnFE7BXYztlYs6iPiIaO4A08FKdJVr3Ra2nY7ZcQtPdFJ9u+1YhyPNmMPf8t+W
	xmM/xFOKCsPRnu7viACG8RlzaPfov26+LXlTnt3gwP2iODm1C2vwsZqHNB7ojkEI
	PXAclUfi3w0dKoM2T7DwxDtOJhREunkvZnpJHKtzoyP6E=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgAnso2N2bpnXhGMCQ--.21668S3;
	Sun, 23 Feb 2025 16:17:19 +0800 (CST)
Date: Sun, 23 Feb 2025 16:17:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andrej Picej <andrej.picej@norik.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, upstream@lists.phytec.de
Subject: Re: [PATCH v3 00/15] Update PHYTEC's i.MX8MM DTSs
Message-ID: <Z7rZjdXwN2W+Y2Bd@dragon>
References: <20250218074156.807214-1-andrej.picej@norik.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218074156.807214-1-andrej.picej@norik.com>
X-CM-TRANSID: M88vCgAnso2N2bpnXhGMCQ--.21668S3
X-Coremail-Antispam: 1Uf129KBjvJXoWrZrWUuF1xGF18ur15KFWrAFb_yoW8Jr1DpF
	W7X347KrWDtr48uF1DXanrtay5G34UGF13uFy5ArWvv34qyFy3AF45Kry5Wr4UGr129FZY
	yF47GFyDCa4rXrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jzc_fUUUUU=
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiERX8ZWe6kszsgQAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_001731_615153_3516F5A5 
X-CRM114-Status: UNSURE (   7.73  )
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

On Tue, Feb 18, 2025 at 08:41:41AM +0100, Andrej Picej wrote:
> Andrej Picej (3):
>   arm64: dts: imx8mm-phycore-som: Fix bluetooth wakeup source
>   arm64: dts: imx8mm-phyboard-polis: Set RTC as wakeup-source
>   arm64: dts: imx8mm-phygate-tauri-l: Set RTC as wakeup-source
> 
> Dominik Haller (1):
>   arm64: dts: imx8mm-phycore-som: Add overlay for rproc
> 
> Janine Hagemann (1):
>   arm64: dts: imx8mm-phyboard-polis: Add overlay for PEB-EVAL-01
> 
> Teresa Remmet (5):
>   arm64: dts: imx8mm-phycore-som: Keep LDO3 on in suspend
>   arm64: dts: imx8mm-phycore-som: Remove magic-packet property
>   arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10
>   arm64: dts: imx8mm-phycore-som: Add no-eth phy overlay
>   arm64: dts: imx8mm-phycore-som: Add overlay to disable SPI NOR flash
> 
> Yannic Moog (3):
>   arm64: dts: imx8mm-phycore-som: add descriptions to nodes
>   arm64: dts: imx8mm-phyboard-polis: add RTC description
>   arm64: dts: imx8mm: move bulk of rtc properties to carrierboards
> 
> Yashwanth Varakala (2):
>   arm64: dts: imx8mm-phycore-som: Assign regulator for dsi to lvds
>     bridge
>   arm64: dts: imx8mm-phyboard-polis: Assign missing regulator for
>     bluetooth

Applied all, thanks!



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E68AC021B6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 21:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAP8eop3O7GR+A6CqIyEeQtqDRTGSTC0Z9XT4Ce5THE=; b=bCp9zqocIUtTwolU/3ddl1MpwH
	2n6artilL6wQkgBLHx45MxBXSGr7qMzMcbyLZ7NU/ocC4KkAkNu5UqPkFyKLcEBlxr5Ab0lwID+3d
	vBK634JRXD8MpySAtXsqWAghiqEEhwsbLCc1q/Nqyu6mNVyU9PncoGtbz/ixG7AYG6J8QAVnl2LRh
	K0pa/QC7UCsVf+SNzGbtGGbeKwEfxvCQLcyvI9x9bHKq1VEmuCoThXFcN0T1YenXevMwFl2eCJyc9
	UAzHniT2rEyW6iK0ZcdGfeE48amsG6M664cizq3HMlohFWZj+lVdmaBIQ4tk1OFnUQ6khr0RHKEVM
	AwbbB9ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaz1-00000006xbW-2aJC;
	Fri, 21 Feb 2025 21:54:55 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlaxY-00000006xL5-2Bq0;
	Fri, 21 Feb 2025 21:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kAP8eop3O7GR+A6CqIyEeQtqDRTGSTC0Z9XT4Ce5THE=; b=aLBk2VrcsBJW7jnMYXuwVda+aV
	Hbzk6iKeWjoj80LZKAtwRv/tgEfohDTqbwsOClXGFp/7UGhfjYsi1SHSgrhFQqVP9++C+G19KjSNE
	GHBlk4BVHMJvenE1hStXZzQl4bELedpgC1H8YUihOjRNBbh32PQ+EnUf5aT9l7Z44qCXdi0lN8L5k
	rLHEVQb8v/+vV9urCzb3lpKzoUSs5BHvmgyK6DrMElRx9SeO7Pudy3M3tumYD/iGsLwDPVrF6k19R
	o92lBFDg/k7amU0VBayeEhFsoSA/d40ueZw0doZpAG08hEDwmWCyTwyTl1Iv3AauZfATN23ITONN2
	7I1iMFxQ==;
Received: from i53875a87.versanet.de ([83.135.90.135] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tlaxV-0000xw-Ha; Fri, 21 Feb 2025 22:53:21 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Quentin Schulz <quentin.schulz@cherry.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH v2] arm64: dts: rockchip: add usb typec host support to
 rk3588-jaguar
Date: Fri, 21 Feb 2025 22:53:20 +0100
Message-ID: <18716872.sWSEgdgrri@diego>
In-Reply-To: <c50c6053-4569-44b0-943d-5450960be147@cherry.de>
References: <20250218211044.2256762-1-heiko@sntech.de>
 <c50c6053-4569-44b0-943d-5450960be147@cherry.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_135324_586414_3B802063 
X-CRM114-Status: GOOD (  27.94  )
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

Am Freitag, 21. Februar 2025, 17:43:08 MEZ schrieb Quentin Schulz:
> Hi Heiko,
> 
> On 2/18/25 10:10 PM, Heiko Stuebner wrote:
> > From: Heiko Stuebner <heiko.stuebner@cherry.de>
> > 
> > Jaguar has two type-c ports connected to fusb302 controllers that can
> > work both in host and device mode and can also run in display-port
> > altmode.
> > 
> > While these ports can work in dual-role data mode, they do not support
> > powering the device itself as power-sink. This causes issues because
> > the current infrastructure does not cope well with dual-role data
> > without dual-role power.
> > 
> > So add the necessary nodes for the type-c controllers as well
> > as enable the relevant core usb nodes, but limit the mode to host-mode
> > for now until we figure out device mode.
> > 
> > Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> While the USB functionality does work for both ports, and the 
> orientation is properly reported, it seems like there may be some issue 
> with how the PHY or controller interacts with that info because I do not 
> get USB3 speeds when the device is inserted in reverse orientation, 
> while I do when it's in normal orientation.

I've tested both ports and saw the issue too.
Interestingly on the usbdp-phy side, orientation detection seems correct
and also the sbu pins are set accordingly.


> I assume that's the case for the Rock 5 ITX and Orange Pi 5+ as well and 
> probably has nothing to do with the DT?
> 
> Should we go still go on with trying to merge this patch knowing that? I 
> mean USB2 is still better than no USB at all :)
> 
> +Cc Chen-Yu, owner of an Orange Pi 5+, who may be able to confirm the 
> issue is widespread.
> 
> Cheers,
> Quentin
> 






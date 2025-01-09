Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6E2E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcaRzf1RZiP/gm4yLAggbk3sbQOwg2d/qtzzehpcOxk=; b=BfVk9v236GEDm1OX3nEAtkCQbL
	EpOOwsJeVd5Bt5u9kboXT4mRXtZm4jK4UrdBOdDm69pFqxMAjfBdF6LVsvmGdn3OF8gb4sFIozXeR
	OjWODjTHUaBcX+bvD501EWOQ3EBN6G01gXteEpxvn9y/rwl1AQZBAwMwsYbf7KS/R3az24CGtVwIJ
	biVLOjHf9Yomx7CxSv8oDkiHuUc7DPTs8Xhloq9lTTt6qxjeEfaWbn6T4R2vrxX7VS5skgQ2uz+Nh
	UwQxoE23RRdzKZF2NynTe0DJMC4xQE8cW63uLonLFXtdyb2axbALCG4sav+/ymHErnAD34cYUo8iG
	YixlmRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuUf-0000000CTxh-3jdn;
	Thu, 09 Jan 2025 15:30:46 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuTR-0000000CTg0-3R27;
	Thu, 09 Jan 2025 15:29:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=wcaRzf1RZiP/gm4yLAggbk3sbQOwg2d/qtzzehpcOxk=; b=MK0ZJC8W5UcLMhS3mEZHKpkP5j
	jcsIassyc/rfjr2EjrAMMQHB7Nb2vg8/skeP/V5yyjfMd/0QSWIEETM8DhVJztGwcyh7t9ad/Qhgq
	6F6NXhYb8ZJ0UtlaYAbbmQ6VQiY2/cTJIGHTB3/XsFJjufqaln3BBsehb7Pb7ghGJ9FzQfCb2pC/n
	d0OeknWls6OHOLJtsS2YAZ3Glp7BPrvltxCRrnfz8sX2lwsphvKQumtejtI1MoFoNJBkQ3TuJ7LF3
	22WYO0zQ0POflmMsm/mkDlcv8VxO1iep/HpIwaNOgUPcmKOJc4EFhO9Yw1aTpv2Ej+NECmTY77q7S
	uqJlzNuQ==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tVuTN-00034G-R7; Thu, 09 Jan 2025 16:29:25 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 Frank Wang <frawang.cn@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 william.wu@rock-chips.com, yubing.zhang@rock-chips.com,
 tim.chen@rock-chips.com, kever.yang@rock-chips.com,
 Frank Wang <frank.wang@rock-chips.com>
Subject: Re: [PATCH] arm64: dts: rockchip: add usb related nodes for rk3576
Date: Thu, 09 Jan 2025 16:29:24 +0100
Message-ID: <2261019.ZfL8zNpBrT@diego>
In-Reply-To: <20241210085053.64294-1-frawang.cn@gmail.com>
References: <20241210085053.64294-1-frawang.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_072929_877696_5328D997 
X-CRM114-Status: GOOD (  14.97  )
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

Am Dienstag, 10. Dezember 2024, 09:50:53 CET schrieb Frank Wang:
> From: Frank Wang <frank.wang@rock-chips.com>
> 
> This adds USB and USB-PHY related nodes for RK3576 SoC.
> 
> Signed-off-by: Frank Wang <frank.wang@rock-chips.com>
> ---
> The compatible string "rockchip,rk3576-naneng-combphy" in the patch
> depends on the following commit which has not merged into this branch.
>  - https://patchwork.kernel.org/project/linux-phy/patch/20241106021357.19782-1-frawang.cn@gmail.com/

just as a note to myself, Kever picked this patch into his series adding
the rk3576-evb1 board and I used the one from there.




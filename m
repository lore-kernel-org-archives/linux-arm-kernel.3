Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38AD8C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y6AR61P+JIqfzvn1/iMFMvHRsQy3bZwJcBc+BL7GPOw=; b=wceyd5maaYC23FD1L0eY612aMY
	Vcm0NzInaTJI/fPDGx9iQ8Xa6aK0Xbc1lhsURjobh6E0/awczSUv5d3cTNptsCG5tB9wvjnnGl0bP
	0aeHmupZ24QLYkX/zKg1auJe8e69kiLo4vltohHRmd7eKvRDs5ROrOUtQpMXP4bJcJ/nfbMnEqtZm
	+AzZA3glFEOdzsftlSTmnzXVAbyRfKDYm+gQkfiYx9Qwm2MxSbFuBAx7MeVtsS/mE0zGydsEuQCa7
	0AL93Dsam4aV5PyzMDBQMBke+kHCI/JZzQcCTvPYEVFTdeyplea2tMl3qZDvRNpvRiwCpKBxUSVH6
	fM8/hssg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHQn-00000002dA8-0ktR;
	Fri, 09 May 2025 06:42:01 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHO5-00000002cnv-0tvv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746772751;
 bh=y6AR61P+JIqfzvn1/iMFMvHRsQy3bZwJcBc+BL7GPOw=;
 b=eHiVOoIL8cmtQvIGIau9FEmcab4dFLBa1olpK3Pzb3vD0An46jauI1+NdtmC2kO8y3jxzOzGg
 aQsH6MIaRL46VIUQnaFqV/xZz3exTHmqgVfw91H3tA04K2vZp2QszYUGF9kVoh37L37j/uyguhd
 5GwEhJzSVsNk4op8Sh+7nmkbfu/jc/e6CoPiP1HnBAakOQQXcZVHxxyGyypEpdeLjYzzgj2tBw1
 sin2t37OtQARor85e1Bd8cylha/Km92rhmkbOeAvyui63L9gvXWTzfUtMMXDzPdq/ofyX/wv4zS
 MM8DNnQJasQdjW13Ih3WJThYu3gGFKuW8I1VLcC97RAQ==
X-Forward-Email-ID: 681da3084a62bf69f80b0c1b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1ddc77da-2355-4c41-b215-533fb23fd0be@kwiboo.se>
Date: Fri, 9 May 2025 08:38:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: rockchip: Add SDMMC/SDIO controllers
 for RK3528
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250508234829.27111-2-ziyao@disroot.org>
 <20250508234829.27111-3-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250508234829.27111-3-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_233913_494675_EC79BAC2 
X-CRM114-Status: UNSURE (   8.28  )
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

On 2025-05-09 01:48, Yao Zi wrote:
> RK3528 features two SDIO controllers and one SD/MMC controller, describe
> them in devicetree. Since their sample and drive clocks are located in
> the VO and VPU GRFs, corresponding syscons are added to make these
> clocks available.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

This has not changed since v4, so this is still [1]:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

[1] https://lore.kernel.org/r/f0ef6679-7ddf-4deb-98a3-755ac2b61a57@kwiboo.se/

Regards,
Jonas

> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 69 ++++++++++++++++++++++++
>  1 file changed, 69 insertions(+)

[snip]



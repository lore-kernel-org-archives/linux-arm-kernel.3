Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44F6C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 06:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RGGUWsD6mE/MPYlXlrelAUBFwk7Si62HhFTya0QjVbo=; b=BwOXHmW5VVZQ1BQJxz9bnVmLEJ
	i3YRncYO9Q9Avl2BgIkn62gMyunhEeqzSgxf6NdIxPZKwpzipFO4ivQXSCFw/+36lGyZUIzSXV/kb
	NiijCc44+MPJA2rRgMaWoeJhrKmTinzO0llfU6q30LnD9oTOVnwR8nbTLwQYChJuyoB1fBQ6e/QHk
	KJDBwiWbQDnF9QRrHQ7kpkGK/9MAyBJtwO8+Zkj6jmtQ8P0IQjkgq9G106r9UMyhTfy+DkZY2GqVh
	NLELpl1C5NOCzg6MYNH56z3T+wccKAKfVOQzKVwHI2A5EMgb7Yim+keF5UaF0WkfUv8ltYGmMkUFx
	q0c78UDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHSm-00000002dZ0-3j5d;
	Fri, 09 May 2025 06:44:04 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDHOA-00000002cpL-1gB4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 06:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1746772757;
 bh=RGGUWsD6mE/MPYlXlrelAUBFwk7Si62HhFTya0QjVbo=;
 b=HRPH0sdRWcqEoqOzbCIdHeWVcCrGprThINHV1cWThucwfABNZOhteQKZCrMMmOOr8g903NHhM
 D/pFpcfdVG69AhyRpXRcusHYuILPQTEGNUjxeAyz5XFCVCCoHB4kXrspp5gHVzhA7yBs0udeNxW
 kwPDyICSqF3nude6txsIobps5GXnY0+F4y1HtrL1Lc3vJGNSCfS//TDqrLIM83Neo0WkqC8G9fI
 iq9EnKzCRlRg/MxBTsnAKOag/5nZVHq0UTjWJZ0ibBLJTpUNi+Kyjmh2xV25gd5MtkeEiGdq0D2
 r+tD8dihqaLOPrbpHkFwBBdkPnve422PuYbQjF04weuw==
X-Forward-Email-ID: 681da3124a62bf69f80b0c57
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <77c35f99-eb71-4d64-a2e1-e9cf9f6ffa4f@kwiboo.se>
Date: Fri, 9 May 2025 08:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] arm64: dts: rockchip: Enable SD-card interface on
 Radxa E20C
To: Yao Zi <ziyao@disroot.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250508234829.27111-2-ziyao@disroot.org>
 <20250508234829.27111-4-ziyao@disroot.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250508234829.27111-4-ziyao@disroot.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_233918_526183_61F417E6 
X-CRM114-Status: UNSURE (   7.27  )
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
> SD-card is available on Radxa E20C board.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

This has not changed since v4, so this is still [1]:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

[1] https://lore.kernel.org/r/f19f11f7-c020-44a3-84fa-eb9ca48ed11f@kwiboo.se/

Regards,
Jonas

> ---
>  .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)

[snip]



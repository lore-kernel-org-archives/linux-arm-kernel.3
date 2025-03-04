Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E40CC282D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xjqXCgfra637s+rpk4UdFAWQVXX9B5blSLtqx3MNrXQ=; b=4OvOQFmyA3QxvQVSVEXFYiEnrY
	n9nW2s9kJU8P+m3w/VcAwVuegnVtZiOrz4asw4c2oUc6TFRx67YnIAyU+j4ylhEc+XgzdXxcruOZU
	FOrJC5EEO9n78SlqokJtJ/iLd+AUeqQGCdc7KF8/6P0YrZ9dz80aGF4oXVp9iYoCNU4/wSSCc9lJ2
	+QL6uPwiU3oHiMyylq+pFrS2xgCzNzFdhoKrGxTO7t0du8XrDPYUkzIkREXd3WZ0n1x968lRBO3OV
	As1RtwLXU7metn0dNCYcyg2s3/5PNYlha9wEaX4vBUH9VEePd2WccWHyjO76X/SZaUf+B8sc2gWAd
	Ltt1O/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpY30-000000062cw-2gQq;
	Tue, 04 Mar 2025 19:35:22 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpWlg-00000005nCK-2fxX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 18:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741111999;
 bh=xjqXCgfra637s+rpk4UdFAWQVXX9B5blSLtqx3MNrXQ=;
 b=gki35ZigkHyCu8f+oY7soeaPt+1xN4rQRpR4qjkhBY30HsZJ8zSKRpzogqXqkehH2zKwg7Px2
 FxDsugwZwDCc1Qo8gl/S9fS2JnThTVivJfCrfvk9DzaKCEf0q2Far7Q0rl6wWXjunyyGQfT6b1q
 eWhrtVbUoSvMaiqWwewlDHHwlcfsNsBCTebROlrSqyF5oj0PkHJurihx0x+V6HMCqkqkPsn/4Ty
 1VN9hlijnQJRVNvK3kFgHQ4nCZ6TtNvDaEM+sUP5Ec157gdXOcLO8HmWNtlJ3g9aCluqijPrf2c
 kKNLZVsnrhQ1M52axcz9WIKnDftTv/8IqXuhKSoIpk9Q==
X-Forward-Email-ID: 67c742bb2e5baeec949f6b1e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <03c34bdf-d470-4c99-bb06-0eb7496465a3@kwiboo.se>
Date: Tue, 4 Mar 2025 19:13:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: (subset) [PATCH 0/7] rockchip: Add support for leds and user
 button on Radxa E20C
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Yao Zi <ziyao@disroot.org>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250228064024.3200000-1-jonas@kwiboo.se>
 <174108970986.65436.4272591414898454986.b4-ty@sntech.de>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <174108970986.65436.4272591414898454986.b4-ty@sntech.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_101325_071118_F2EDCEB2 
X-CRM114-Status: GOOD (  13.01  )
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

Hi Heiko,

On 2025-03-04 13:02, Heiko Stuebner wrote:
> 
> On Fri, 28 Feb 2025 06:40:06 +0000, Jonas Karlman wrote:
>> The Radxa E20C has three gpio leds and one gpio button.
>>
>> This series adds dt-binding, driver support, DT node in SoC .dtsi and
>> gpio-keys and gpio-leds nodes in board DT to support the leds and user
>> button.
>>
>> This series builds on top of the "rockchip: Add support for maskrom
>> button on Radxa E20C" series [1].
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/7] dt-bindings: soc: rockchip: Add RK3528 ioc grf syscon
>       commit: ac32ad07a97648eb8330b2c4cb840b0ef46903ae
> [4/7] arm64: dts: rockchip: Add pinctrl and gpio nodes for RK3528
>       commit: a31fad19ae39ea27b5068e3b02bcbf30a905339b
> [5/7] arm64: dts: rockchip: Add uart0 pinctrl to Radxa E20C
>       commit: 0d2312f0d3e4ce74af0977c1519a07dfc71a82ac
> 
> Patches 6+7 depend on the parallel saradc support series and thus
> do not apply - and need too much rework to safely apply.

Do you want me to rebase/reorder and send an updated version with
remaining patches? Look like the iio saradc patches [2] is pending apply
so maybe not needed?

[2] https://lore.kernel.org/all/20250304144648.29f376f9@jic23-huawei/

Regards,
Jonas

> 
> 
> Best regards,



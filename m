Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8E2C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 09:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gPuQ7FFoVv+Rl4WcP5s1FugzEtXKc7tx/WmMwger708=; b=kG6z2WYAFHueKPNwbG6KkDwVak
	l/7WmVUEdfF1oFLD7Xj1ySis0zAyqHzSxYeaKjGTr1QZfXPdAoDpH7QgauuDPac7+geVjTXTIMsUu
	RzwiBd2SH3Nsd8TazhFxV+1FEMt/rO1MH+lgD/uic+Ot8O9ZwqbmjJvKoqz+tuvWWAbo/W7YjpeJr
	y0X/6bst5a5V0dKSNnmb/Hdw2qhOfQE1SJDITVl2Rgb2kGp8+un+dkLCcF6rWVN8ZafEIxY0OMs55
	wKwbLRpnxxyC7y9AKzgScDl2o1y+JbqIy5zLS9rWyp1vF1y9ZRF3eD6CBoaOG89YWkQxuY8IfWgKF
	PybSrkzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmvK-0000000AGBh-2YqM;
	Fri, 31 Jan 2025 09:02:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdmtz-0000000AG7D-0nEH;
	Fri, 31 Jan 2025 09:01:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gPuQ7FFoVv+Rl4WcP5s1FugzEtXKc7tx/WmMwger708=; b=ml2ASgZnV+EgGke7bor0cOJ8qu
	nqvaRXgLmq+NWJ+3UgdCWZ/Wcq12PLZ4yCJTfDaSyYe0B5UPisuBZzvRy+KEo2uYDOhkyqfAF2waw
	WyqKvqYlqt1+oWRTIcqGNXSaEoU0ES/VbanxMfXOiaLDOFWGOM12CDK16nzeBcw9SWYF6PeRzWX49
	41DVqTH3rS0IlGHVtauego7qtw7kwAzug/XlouEIvKD16oY4F9bHuCc8XfOUkOQ9FhNtFWKyNYA92
	Tju2Bj71WYzenxJFQTnDbBF0MCYSTGGlpexHOPgWC46jUXCeHksozwny1XpBGs7th0b6LGHWWRGyR
	7IS8WEMA==;
Received: from [212.111.254.164] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tdmtp-00069z-RW; Fri, 31 Jan 2025 10:01:17 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Tianling Shen <cnsztl@gmail.com>, Dragan Simic <dsimic@manjaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: change eth phy mode to rgmii-id for
 orangepi r1 plus lts
Date: Fri, 31 Jan 2025 10:01:15 +0100
Message-ID: <2910311.mvXUDI8C0e@phil>
In-Reply-To: <59e46b34e1c8f9197565fea917335d3f@manjaro.org>
References: <20250119091154.1110762-1-cnsztl@gmail.com>
 <98387508-10de-4c2e-80ad-05d0d86b7006@gmail.com>
 <59e46b34e1c8f9197565fea917335d3f@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_010127_250871_B37D28B0 
X-CRM114-Status: GOOD (  28.87  )
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

Hey,

Am Freitag, 24. Januar 2025, 07:35:50 MEZ schrieb Dragan Simic:
> Hello Tianling,
> 
> On 2025-01-24 07:28, Tianling Shen wrote:
> > On 2025/1/19 23:48, Tianling Shen wrote:
> >> On 2025/1/19 19:36, Dragan Simic wrote:
> >>> On 2025-01-19 12:15, Tianling Shen wrote:
> >>>> On 2025/1/19 17:54, Dragan Simic wrote:
> >>>>> Thanks for the patch.  Please, see a comment below.
> >>>>> 
> >>>>> On 2025-01-19 10:11, Tianling Shen wrote:
> >>>>>> In general the delay should be added by the PHY instead of the 
> >>>>>> MAC,
> >>>>>> and this improves network stability on some boards which seem to
> >>>>>> need different delay.
> >>>>>> 
> >>>>>> Fixes: 387b3bbac5ea ("arm64: dts: rockchip: Add Xunlong OrangePi 
> >>>>>> R1 Plus LTS")
> >>>>>> Cc: stable@vger.kernel.org # 6.6+
> >>>>>> Signed-off-by: Tianling Shen <cnsztl@gmail.com>
> >>>>>> ---
> >>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts | 3 
> >>>>>> +--
> >>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dts     | 1 
> >>>>>> +
> >>>>>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi    | 1 
> >>>>>> -
> >>>>>>  3 files changed, 2 insertions(+), 3 deletions(-)
> >>>>>> 
> >>>>>> diff --git
> >>>>>> a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
> >>>>>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
> >>>>>> index 67c246ad8b8c..ec2ce894da1f 100644
> >>>>>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
> >>>>>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus-lts.dts
> >>>>>> @@ -17,8 +17,7 @@ / {
> >>>>>> 
> >>>>>>  &gmac2io {
> >>>>>>      phy-handle = <&yt8531c>;
> >>>>>> -    tx_delay = <0x19>;
> >>>>>> -    rx_delay = <0x05>;
> >>>>>> +    phy-mode = "rgmii-id";
> >>>>> 
> >>>>> Shouldn't the "tx_delay" and "rx_delay" DT parameters be converted
> >>>>> into the "tx-internal-delay-ps" and "rx-internal-delay-ps" 
> >>>>> parameters,
> >>>>> respectively, so the Motorcomm PHY driver can pick them up and
> >>>>> actually configure the internal PHY delays?
> >>>> 
> >>>> The documentation[1] says "{t,r}x-internal-delay-ps" default to 1950
> >>>> and that value already works fine on my board.
> >>>> 
> >>>> 1. https://www.kernel.org/doc/Documentation/devicetree/bindings/net/ 
> >>>> motorcomm%2Cyt8xxx.yaml
> >>> 
> >>> I see, but those values differ from the values found in the
> >>> "tx_delay" and "rx_delay" DT parameters, so I think this patch
> >>> should be tested with at least one more Orange Pi R1 Plus LTS
> >>> board, to make sure it's all still fine.
> >> 
> >> This patch has been tested on 2 boards, and we will do more tests in 
> >> next week.
> >> 
> > 
> > Managed to test on another board and looks so far so good.
> > (Working network connection, no packet drop)
> 
> Sounds good to me, thanks for the additional testing.

I assume that means there are no more open issues, right?
At least I got that impression from glancing at the thread :-)

Heiko




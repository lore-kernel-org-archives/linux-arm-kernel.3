Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BE6E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 15:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Uz3RBCjW4hTXkTqvJiMamrdz2U3hXjJKipJRlE2Pho=; b=yS9UKseJdJbAfgpPynLieeafCN
	gu8LenqtBBdF2ZhQoUASBvTo+IGL0IwZXzTHnhsOncobDmsOx3e+vcAE2nA4djZ44sOuMB3FpxP2X
	1DTC5/JdQ8KD+A/RfUjG/yZkMM3ATms/gBJBtWz9mdwSluj5iJOKKuWwGo95gbMxtnveb31jd0T4x
	W9Dj5liWr2sV75umXR8EDOzd+Wr+Eq2P+X5bvvENoMe1+1iK5a0k/miTeCgwSiGWVry8pLmptscmJ
	xdTyF0EUBcOuUl3hTWYTRdA1Ls4AtRRb73hd0cvaCcgn+SaFE1KENDqoNtW66EBcG9jV85I5jW17f
	5DFUhy8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOZd-0000000FFdE-3FqV;
	Wed, 11 Dec 2024 15:24:25 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOXz-0000000FFIZ-3j68;
	Wed, 11 Dec 2024 15:22:45 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1733930561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Uz3RBCjW4hTXkTqvJiMamrdz2U3hXjJKipJRlE2Pho=;
	b=gNCgA/hy7bBhuOnxGoWwdf7jTRf+7S40WV/lIzIe9dEO8PvQN08nZJyGZ6pwKzb+G77zp/
	AQHh2jf/b1NUzIT9XrcxXhP3DuB7gpOzsARZ0aPSfjFO78q2M4uJ13vYeZ576zae0huxSK
	kAgSwa+V/SpGVRtipim8PdjrXpiA2A12T08Uks+iVSQ4P6rdaHuIvjngoF9daQrQUHn8TA
	WGXZ6fydRQEFWDjH/aTfpOl3VRCS5cjs6BaCKqZQuzrbfIZAwk8BO1BCKPL7EodglZTRQ2
	IZ5r9dHTzapqitKboIck7M8q7PIoopUX4OEKvmIhI7xW17SLQIrS7TuT8GLWDQ==
Date: Wed, 11 Dec 2024 16:22:41 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Peter Geis <pgwipeout@gmail.com>
Cc: linux-rockchip@lists.infradead.org, heiko@sntech.de,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Delete redundant RK3328 GMAC
 stability fixes
In-Reply-To: <CAMdYzYpnx=pHJ+oqshgfZFp=Mfqp3TcMmEForqJ+s9KuhkgnqA@mail.gmail.com>
References: <e00f08d2351e82d6acd56271a68c7ed05b3362e8.1733901896.git.dsimic@manjaro.org>
 <CAMdYzYpnx=pHJ+oqshgfZFp=Mfqp3TcMmEForqJ+s9KuhkgnqA@mail.gmail.com>
Message-ID: <eb3ab82527b8c5bfa746894837661b1a@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_072244_229446_5388CDBE 
X-CRM114-Status: GOOD (  14.60  )
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

Hello Peter,

On 2024-12-11 12:26, Peter Geis wrote:
> On Wed, Dec 11, 2024 at 2:29 AM Dragan Simic <dsimic@manjaro.org> 
> wrote:
>> Since the commit 8a469ee35606 ("arm64: dts: rockchip: Add txpbl node 
>> for
>> RK3399/RK3328"), having "snps,txpbl" properties defined as Ethernet 
>> stability
>> fixes in RK3328-based board dts(i) files is redundant, because that 
>> commit
>> added the required fix to the RK3328 SoC dtsi, so let's delete them.
>> 
>> It has been determined that the Ethernet stability fixes no longer 
>> require
>> the "snps,rxpbl" and "snps,aal" properties, [1] out of which the 
>> latter also
>> induces performance penalties, so let's delete these properties from 
>> the
>> relevant RK3328-based board dts(i) files.
> 
> You may want to include snps,force_thresh_dma_mode in this group such
> as on the rock64. It's even more limiting than snps,aal.
> 
> Otherwise,
> Acked-by: Peter Geis <pgwipeout@gmail.com>

Thanks for your suggestion and review!

I'll add "snps,force_thresh_dma_mode" to the set of redundant DT
properties deleted from RK3328-based board dts(i) files in the v2
of this patch.

>> This commit completes the removal of these redundant "snps,*" 
>> properties
>> that was started by a patch from Peter Geis. [2]
>> 
>> [1] 
>> https://lore.kernel.org/linux-rockchip/CAMdYzYpj3d7Rq0O0QjV4r6HEf_e07R0QAhPT2NheZdQV3TnQ6g@mail.gmail.com/
>> [2] 
>> https://lore.kernel.org/linux-rockchip/20241210013010.81257-7-pgwipeout@gmail.com/
>> 
>> Cc: Peter Geis <pgwipeout@gmail.com>
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
>>  arch/arm64/boot/dts/rockchip/rk3328-a1.dts                | 1 -
>>  arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi        | 1 -
>>  arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi | 1 -
>>  arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts         | 3 ---
>>  4 files changed, 6 deletions(-)
>> 
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts 
>> b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>> index 824183e515da..24baaa7f1d8c 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-a1.dts
>> @@ -110,7 +110,6 @@ &gmac2io {
>>         phy-supply = <&vcc_io>;
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&rgmiim1_pins>;
>> -       snps,aal;
>>         snps,pbl = <0x4>;
>>         tx_delay = <0x26>;
>>         rx_delay = <0x11>;
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
>> index f9fab35aed23..d5f129e304e5 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi
>> @@ -142,7 +142,6 @@ &gmac2io {
>>         phy-supply = <&vcc_io_33>;
>>         pinctrl-0 = <&rgmiim1_pins>;
>>         pinctrl-names = "default";
>> -       snps,aal;
>> 
>>         mdio {
>>                 compatible = "snps,dwmac-mdio";
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi 
>> b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>> index 181ec6de0019..9ec93f61433e 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi
>> @@ -113,7 +113,6 @@ &gmac2io {
>>         phy-supply = <&vcc_io>;
>>         pinctrl-0 = <&rgmiim1_pins>;
>>         pinctrl-names = "default";
>> -       snps,aal;
>> 
>>         mdio {
>>                 compatible = "snps,dwmac-mdio";
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts 
>> b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
>> index 3e08e2fd0a78..59dead1cc503 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
>> +++ b/arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts
>> @@ -153,9 +153,6 @@ &gmac2io {
>>         phy-supply = <&vcc_io>;
>>         pinctrl-names = "default";
>>         pinctrl-0 = <&rgmiim1_pins>;
>> -       snps,aal;
>> -       snps,rxpbl = <0x4>;
>> -       snps,txpbl = <0x4>;
>>         tx_delay = <0x26>;
>>         rx_delay = <0x11>;
>>         status = "okay";


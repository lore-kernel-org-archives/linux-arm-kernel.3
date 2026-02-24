Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C7AEEC2BA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jcc+Bm636zbBsjTNZ3EK3Eue5zZ9zHiTiOlMdsEG1Jc=; b=qz58ntbIAHkW5baXXW93xqVVd7
	uFtAIBekBXP2fiXCkE7c9SW3OGoigGrNBKnd2TRyHgG8HUxGgv6IR4kZRM1sijJH3QaB1d6enWXAf
	9NAndPREdIYB0zmDZDdw0J5xxFcUWXtjJV2/ZW3QDosSigvYTcTVvIPPkHikYvTMbLK0PPNvGeVAn
	4E8hYLHZ6/q971FmbBtud94sksBtTSG8Rs0J/C42/s78WTMUfM70rPKO2hlLwkR4bQwWNjBmMCIqM
	d6n9AHS4NhAO4cxJN7WtCRtu7q1ca13ljMydPTRLFG8aEgfCJmmdHXTtNxhJuZXkcugTSENGZ32Xg
	brZf6wpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhRv-00000001Hzm-07Sb;
	Tue, 24 Feb 2026 01:42:55 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhRr-00000001HxC-2ZGx;
	Tue, 24 Feb 2026 01:42:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=airkyi.com;
	s=altu2504; t=1771897343;
	bh=Jcc+Bm636zbBsjTNZ3EK3Eue5zZ9zHiTiOlMdsEG1Jc=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=VcOSGa3qsRmuOcmKvj/Dke3MbVeXFPDmIjSGVU/Uh6YJvGQCanaHUr5/1on2LicyJ
	 xMbVFeZhHSWDm0Y/Kj6L6EHz06BcVGIAd/DAu7Uka80a9GHaeHzPw/GwhIJFGOAz69
	 hg/Wlslts+7lbalHKhRWitnyNwjWsEgVGicTHcLU=
X-QQ-mid: zesmtpgz3t1771897338te0671743
X-QQ-Originating-IP: VxWANHq/kQn9OZsEiJ4CYippYDR23qbKKQHdJan0+js=
Received: from [127.0.0.1] ( [58.22.7.114])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 24 Feb 2026 09:42:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17092131372750963368
Message-ID: <C28FA037F24F3E74+97535c93-cc16-4bd5-b436-db7cdc0bb580@airkyi.com>
Date: Tue, 24 Feb 2026 09:42:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: add node name for
 RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
 <B5000B8F1001C1D8+040b217f-8ee1-4f96-95ec-e44d140b589d@airkyi.com>
 <9cc9a3c5-55f0-32f6-f166-acfb3a34f0a3@rock-chips.com>
Content-Language: en-US
From: Chaoyi Chen <kernel@airkyi.com>
In-Reply-To: <9cc9a3c5-55f0-32f6-f166-acfb3a34f0a3@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:airkyi.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NVgUsgecbtFOUkTH+U2yxknL5s9pEbBwWrJgzv2os8snM7fa2YfLveCT
	qqRjDqwe/is7Jxgv4P97rRTMtfDOWPkXee73aeJDIGJiER1q+o0+2W4WTTMEsHnOu3d51IX
	/KLcVUrruHXWUsdosYtMicdrRv86ztzv9yRGHVYrT5XQO4bCA0bga4yUZyPKMwCk3jny7du
	sfhO5qtpbqTaem1bPoQ24OFT50Fb8N9xaAN766csZjPwJTMAB0p4ghmaocFkHpOwyAG3Y7J
	akEyR+t0MZWS6dc5gr8cueCV39RGcVmcXS7BxxsUF0FsZw0CvsQrIqzcDoXMTAdRQqijzHR
	nhb2elj5XR9h2khReLcqw6HsE67rP7bQVhTRcbb5IibQ8o0bW0FE/SRSoM5LjQcP6cAn9uP
	T7zs5Q+aV3+23DCfeb0aB1I3/o6I9DvGOvHJxgKgh26vf+3mRr2GFtDolyWDr/u+C/9vh0k
	ipvovA96nAkPOfN4TN0OrSKgm/D8xqnkx/KEGL+aotkDRRSCc7i7Q23HPTpiGG+rIUvu/nu
	IzigGEb+B2Lt6c/MdZ2WFjO64W+dYxvGEoiVhQQjq+ab5MaPjSnH0ubJje6RPSlgmdoRj0G
	klR8Sdn64MEdkEB/1Buaf5Suc/8pw1wqo15z//TMzWvqQBq8lpg7Vpn/AtGCAkaEOcjJad5
	kf2eSUPG5LgtqKi1qRUw4VxjX5XCab1xEuGnxWoRZVknrVCtHdIu6eVf3xyqppoVLAlMVa2
	5Rvx4lzkDRI1kzymShHdHi23dHXyhxkHFxrJO7MO7bYaRe490iC4i+Z8Mv5iBrcZq2c4/EY
	Y3uDnongwLGurOPR+2COojNi+TLBjX9iWS2k61lJaZmzibD10S0/xbAk6k2ScYvPK2pO3Cz
	zsOcD8qAifg82b9RvFAj6z49kRV75Fnri3dye/GMGOXpoUmAB2ya+TP0d3jqASLKyBzpJU9
	Xu81tADr/Ls4x6aPia0vNdMIkGhYyeVyV8Bma1PAjsBmmf1IAkvshVHhEaDkVWScZY1Ey8H
	ZH77PbpbFoOi1EFwYztkyKz/VvXLw=
X-QQ-XMRINFO: M/715EihBoGS/VAi3I5lh1UT7FCdJekTaA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_174252_172135_28D7D96A 
X-CRM114-Status: GOOD (  18.92  )
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

On 2/13/2026 7:11 PM, Shawn Lin wrote:
> Hi Chaoyi
> 
> 在 2026/02/13 星期五 18:32, Chaoyi Chen 写道:
>> Hello Shawn,
>>
>> On 2/13/2026 10:35 AM, Shawn Lin wrote:
>>> Thus the board dts files could add property for these nodes.
>>>
>>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>>> ---
>> You should also add pmdomain driver.
>>
>> I've encountered a similar issue before.
>> Finley told me to use the new PMIC, and that would solve the problem.
>> Maybe you're using the same old PMIC as I did :)
>>
> 
> I don't know what does new PMIC mean? New RK806 driver or new RK806
> hardware?

It is new RK806 hardware. According to Finley, end users are currently using 
this new type of PMIC.


> 
> The problem is these power domains rely on voltage supply which could
> be probed late after pmdomain driver, then the system enables the PD and
> access the IP without PD actually enabled(even w/o voltage supply
> enabled).
> 

If I'm not mistaken, the new hardware will automatically powers up the supply
corresponding to VDEC/VNEC.


> 
> 
>>
>>>
>>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> index 7fe9593..4fb8888 100644
>>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>>> @@ -907,7 +907,7 @@
>>>                   #size-cells = <0>;
>>>                   #power-domain-cells = <0>;
>>>   -                power-domain@RK3588_PD_RKVDEC0 {
>>> +                pd_rkvdec0: power-domain@RK3588_PD_RKVDEC0 {
>>>                       reg = <RK3588_PD_RKVDEC0>;
>>>                       clocks = <&cru HCLK_RKVDEC0>,
>>>                            <&cru HCLK_VDPU_ROOT>,
>>> @@ -917,7 +917,7 @@
>>>                       pm_qos = <&qos_rkvdec0>;
>>>                       #power-domain-cells = <0>;
>>>                   };
>>> -                power-domain@RK3588_PD_RKVDEC1 {
>>> +                pd_rkvdec1: power-domain@RK3588_PD_RKVDEC1 {
>>>                       reg = <RK3588_PD_RKVDEC1>;
>>>                       clocks = <&cru HCLK_RKVDEC1>,
>>>                            <&cru HCLK_VDPU_ROOT>,
>>> @@ -926,7 +926,7 @@
>>>                       pm_qos = <&qos_rkvdec1>;
>>>                       #power-domain-cells = <0>;
>>>                   };
>>> -                power-domain@RK3588_PD_VENC0 {
>>> +                pd_venc0: power-domain@RK3588_PD_VENC0 {
>>>                       reg = <RK3588_PD_VENC0>;
>>>                       clocks = <&cru HCLK_RKVENC0>,
>>>                            <&cru ACLK_RKVENC0>;
>>> @@ -937,7 +937,7 @@
>>>                       #size-cells = <0>;
>>>                       #power-domain-cells = <0>;
>>>   -                    power-domain@RK3588_PD_VENC1 {
>>> +                pd_venc1: power-domain@RK3588_PD_VENC1 {
>>>                           reg = <RK3588_PD_VENC1>;
>>>                           clocks = <&cru HCLK_RKVENC1>,
>>>                                <&cru HCLK_RKVENC0>,
>>
> 
> 
> 

-- 
Best, 
Chaoyi




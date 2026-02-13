Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78030EDF152
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cfrrzneLGcg5FFdQQt3/q570AODDdBAE3SDOF+o9Z9w=; b=qlBZdXZppa5MGWA3KaD9lDaRO5
	TBlqNZFDpyDxgt+FlLbBvQqJ5i3qm7beNXALuBDUOqvwPZtIc9XOkCevUs+CLQQCZoxVdFuOI9hF6
	n7jU6jKN5xNe27rM0UoOiKTbpPvSe3+6JAKxgN2RyAnHSNvBHwbHGyp1TLK/BDelzRGBXzI+fKIZu
	JMmnDHwwdxOU4zd21Ebj5xOFrQ4XCWQ+HfxQwwSkA6tRpEBS6fzMq2mlvXs5GDkXAZ2/y24teLAUj
	HnUSo6Rti5ibuSqRay4misJcpAsuej7eIHoWdn4BTUzLrKIK0H6m0Vb25mUWk0flXZLsP9JyXHoeY
	r40ai/DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr5D-00000003Nbn-2FyT;
	Fri, 13 Feb 2026 11:11:35 +0000
Received: from mail-m15595.qiye.163.com ([101.71.155.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqr59-00000003NaT-0SPJ;
	Fri, 13 Feb 2026 11:11:33 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 341631483;
	Fri, 13 Feb 2026 19:11:25 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>,
 linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: add node name for
 RK3588_PD_RKVDEC0/1 and RK3588_PD_VENC0/1
To: Chaoyi Chen <kernel@airkyi.com>
References: <1770950113-19802-1-git-send-email-shawn.lin@rock-chips.com>
 <B5000B8F1001C1D8+040b217f-8ee1-4f96-95ec-e44d140b589d@airkyi.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <9cc9a3c5-55f0-32f6-f166-acfb3a34f0a3@rock-chips.com>
Date: Fri, 13 Feb 2026 19:11:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <B5000B8F1001C1D8+040b217f-8ee1-4f96-95ec-e44d140b589d@airkyi.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9c56b2d02309cckunm7939042d2d84bd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQkwfT1YdGB1KHUNOH0tMGkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUJCSU5LVU
	pLS1VKQktCWQY+
DKIM-Signature: a=rsa-sha256;
	b=OVxjcFhfxlWGbRcypca3NKULvA9k3vr8qgD28Xz3XiMdlDokms9vcLxYov5RWRz25mxArw1K+w9wlXlXj93M7OyQATK0tgzfHwbM1oLSWDzwDOO3pFiIzwjPiTYzfoMce54tR1h85ScVLxP/bRGbGcd0mF+rw7xZ/sDLBLs2CQ4=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=cfrrzneLGcg5FFdQQt3/q570AODDdBAE3SDOF+o9Z9w=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_031131_655593_A9BA9DC3 
X-CRM114-Status: GOOD (  17.65  )
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

Hi Chaoyi

在 2026/02/13 星期五 18:32, Chaoyi Chen 写道:
> Hello Shawn,
> 
> On 2/13/2026 10:35 AM, Shawn Lin wrote:
>> Thus the board dts files could add property for these nodes.
>>
>> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
>> ---
> You should also add pmdomain driver.
> 
> I've encountered a similar issue before.
> Finley told me to use the new PMIC, and that would solve the problem.
> Maybe you're using the same old PMIC as I did :)
> 

I don't know what does new PMIC mean? New RK806 driver or new RK806
hardware?

The problem is these power domains rely on voltage supply which could
be probed late after pmdomain driver, then the system enables the PD and
access the IP without PD actually enabled(even w/o voltage supply
enabled).



> 
>>
>>   arch/arm64/boot/dts/rockchip/rk3588-base.dtsi | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>> index 7fe9593..4fb8888 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi
>> @@ -907,7 +907,7 @@
>>   				#size-cells = <0>;
>>   				#power-domain-cells = <0>;
>>   
>> -				power-domain@RK3588_PD_RKVDEC0 {
>> +				pd_rkvdec0: power-domain@RK3588_PD_RKVDEC0 {
>>   					reg = <RK3588_PD_RKVDEC0>;
>>   					clocks = <&cru HCLK_RKVDEC0>,
>>   						 <&cru HCLK_VDPU_ROOT>,
>> @@ -917,7 +917,7 @@
>>   					pm_qos = <&qos_rkvdec0>;
>>   					#power-domain-cells = <0>;
>>   				};
>> -				power-domain@RK3588_PD_RKVDEC1 {
>> +				pd_rkvdec1: power-domain@RK3588_PD_RKVDEC1 {
>>   					reg = <RK3588_PD_RKVDEC1>;
>>   					clocks = <&cru HCLK_RKVDEC1>,
>>   						 <&cru HCLK_VDPU_ROOT>,
>> @@ -926,7 +926,7 @@
>>   					pm_qos = <&qos_rkvdec1>;
>>   					#power-domain-cells = <0>;
>>   				};
>> -				power-domain@RK3588_PD_VENC0 {
>> +				pd_venc0: power-domain@RK3588_PD_VENC0 {
>>   					reg = <RK3588_PD_VENC0>;
>>   					clocks = <&cru HCLK_RKVENC0>,
>>   						 <&cru ACLK_RKVENC0>;
>> @@ -937,7 +937,7 @@
>>   					#size-cells = <0>;
>>   					#power-domain-cells = <0>;
>>   
>> -					power-domain@RK3588_PD_VENC1 {
>> +				pd_venc1: power-domain@RK3588_PD_VENC1 {
>>   						reg = <RK3588_PD_VENC1>;
>>   						clocks = <&cru HCLK_RKVENC1>,
>>   							 <&cru HCLK_RKVENC0>,
> 


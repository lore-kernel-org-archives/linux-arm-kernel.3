Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D1CE7718B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 10:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV13Ub+8jid25AmeIHH2+OOK0XdtZ0k68I4uUJsLJ/Y=; b=m3AJW0AiddbdHB5+nCfC+DPNj5
	uCcaMfpQC0lJd0Qxi2S9yUCEA5dktpa41rf4n3M70gYwaq9mRISkViOFsp9e711sXI5jfUo/updcb
	6iL2orUbLt9gjEXfE3FfAms0uEb5or/5hzEbZsrrDSEKtJAiEsqPnnIpUT3b0hdUGWwTPBt/RQObh
	WmkBTLRhJ2GNaTJeneMRToPaLGRWYQPrIGWJxw8MIJ9dGv1lD9SX1PdK8htLrdNsB+108BVxHlo8c
	0zFgt3uNu/51kFkJFFcfyvoe+OcCtyGCHnxAfvLc+tuy+O/jynvMIy55G9IpIIhY7Rr4b1xwUwJuF
	7fiIOPHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPg1R-00000009oZF-2KW0;
	Mon, 23 Dec 2024 10:50:49 +0000
Received: from mail-m127150.qiye.163.com ([115.236.127.150])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPg0E-00000009oRl-2L8g;
	Mon, 23 Dec 2024 10:49:36 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 68e43e06;
	Mon, 23 Dec 2024 18:49:23 +0800 (GMT+08:00)
Message-ID: <bfd84b6b-9b19-4d9b-b0a3-cb6ed1f8084c@rock-chips.com>
Date: Mon, 23 Dec 2024 18:49:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dts: arm64: rockchip: Add rk3576 pcie nodes
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Finley Xiao <finley.xiao@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>, Rob Herring <robh@kernel.org>,
 Liang Chen <cl@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Elaine Zhang <zhangqing@rock-chips.com>, linux-arm-kernel@lists.infradead.org
References: <20241220101551.3505917-1-kever.yang@rock-chips.com>
 <20241220101551.3505917-4-kever.yang@rock-chips.com>
 <i54jjqt7uaxrurdapsyxwmb5iokiwzgm5cvlaamlggycrpyd3v@azhmfwgetrzm>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <i54jjqt7uaxrurdapsyxwmb5iokiwzgm5cvlaamlggycrpyd3v@azhmfwgetrzm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkhLSlZOTkgYTxoZTkkaHhhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a93f322c9a803afkunm68e43e06
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MTY6Mio4HDILLgECNy8#Dx82
	NwIwFC5VSlVKTEhPQk5LQk1PQkhJVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKTU1PNwY+
DKIM-Signature: a=rsa-sha256;
	b=jPUVWrsgyzKi94L9A8rKusVeSNeYfH7N6p8iP3gNWad+4NpdkFj6cn7s91hmeDuM6sCh0VBHf9h6oj6jDopFv+rZ4wkLpHWMmy/OxyVnp1pZDPHa6ks2evflHT1JziZs7SkZjHRSsAwnPppEVGBBoZXyiqIPY1zDMp+XBmKNxWA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=PV13Ub+8jid25AmeIHH2+OOK0XdtZ0k68I4uUJsLJ/Y=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_024935_159118_54A393B2 
X-CRM114-Status: GOOD (  13.00  )
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

Hi Krzysztof,

On 2024/12/22 14:38, Krzysztof Kozlowski wrote:
> On Fri, Dec 20, 2024 at 06:15:47PM +0800, Kever Yang wrote:
>> rk3576 has two pcie controller, both are pcie2x1 used with
>> naneng-combphy.
>>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> ---
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>
Will update with arm64: dts: .
>> Changes in v2:
>> - Update clock and reset names and sequence to pass DTB check
>>
>>   arch/arm64/boot/dts/rockchip/rk3576.dtsi | 109 +++++++++++++++++++++++
>>   1 file changed, 109 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> index a147879da501..df7dfe702221 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
>> @@ -1016,6 +1016,115 @@ qos_npu_m1ro: qos@27f22100 {
>>   			reg = <0x0 0x27f22100 0x0 0x20>;
>>   		};
>>   
>> +		pcie0: pcie@2a200000 {
>> +			compatible = "rockchip,rk3576-pcie", "rockchip,rk3568-pcie";
>> +			bus-range = <0x0 0xf>;
> Follow DTS coding style in properties order and everything around here.

I can do it for most of the properties, but is there any other rules 
other than sort,

eg. compatible and reg in the beginning and status in the end?


Thanks,

- Kever

>
> Best regards,
> Krzysztof
>
>


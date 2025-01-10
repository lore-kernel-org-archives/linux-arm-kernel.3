Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16EFE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ePfcZ2p/T1m/EvSrH7frcAMuiJufoadhcrRBzNxT72g=; b=QqbVYv/uJam6hq5aAekS8L2ZV+
	Zlfc0jIsvHmiajgaV3/h7Lwq3b0XdcWMnz31D/ge3KbjTHrUKiUMANPUJJoa+ZLdQARWNE2w+sCQi
	ejdF8nFDYaG4CFUfB3rt+JTv8M0ko92K4LQRK/u5ammCa0xMm/sBrPPqaFXq2h3JkRYkwXqxRbxDW
	Q4+6aQhuaBg0maC2lY+urwxbETxaRA48CS1/b47jb7TlS+qDpe7xUF1rwUSyLBwoPZjDx0aQlhIhG
	0aF6sRZtyo26DhMY6uyqp/NPA+UcS19WE3zwUbwSZrlgbeg8UNl+tQJm4pGxGk5K1W2V1lMCyUY3J
	8jE2+6fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9xu-0000000ESOM-3QXm;
	Fri, 10 Jan 2025 08:01:58 +0000
Received: from mail-m155100.qiye.163.com ([101.71.155.100])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tW9wg-0000000ESFy-3T0y;
	Fri, 10 Jan 2025 08:00:44 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 851fbfa0;
	Fri, 10 Jan 2025 16:00:38 +0800 (GMT+08:00)
Message-ID: <b4df8a73-58a2-4765-a9e4-3513cb2bc720@rock-chips.com>
Date: Fri, 10 Jan 2025 16:00:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 03/17] dt-bindings: mmc: rockchip-dw-mshc: Add rk3562
 compatible string
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Ulf Hansson <ulf.hansson@linaro.org>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
 <20241224094920.3821861-4-kever.yang@rock-chips.com>
 <13860713.uLZWGnKmhe@phil>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <13860713.uLZWGnKmhe@phil>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pCS1YdThlPQxlPHR5DSBpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a944f3ac48a03afkunm851fbfa0
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRQ6LTo*OTISOQ8oIhYhESo0
	LB9PCUtVSlVKTEhNT0JNS09LSU9PVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFKSk5CNwY+
DKIM-Signature: a=rsa-sha256;
	b=ac3gz2WAq5OUJlbH0VXidvDlgJ29scrwRqUnnOQXeZRh/XMPCGCiBVj7R+Pfe75GTH5wKDH7hAZK7+JFEskSZ7z8gC55pv8cgvHUm8uto0wBQ/SSCj0iIU6fG2wbgW2yQgJWlEfjNZ1M+vxI48sw16vlhbx5GnQlk0BjE8n/ipc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=ePfcZ2p/T1m/EvSrH7frcAMuiJufoadhcrRBzNxT72g=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_000043_058581_3CC2FAA9 
X-CRM114-Status: UNSURE (   8.08  )
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


On 2024/12/26 08:39, Heiko Stuebner wrote:
> Am Dienstag, 24. Dezember 2024, 10:49:06 CET schrieb Kever Yang:
>> Add RK3588 compatible string for SD interface.
> 	^ this still says rk3588
Sorry, will update in next version.

Thanks,
- Kever
>
>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> ---
>>
>> Changes in v2: None
>>
>>   Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
>> index 06df1269f247..772f592291bf 100644
>> --- a/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
>> +++ b/Documentation/devicetree/bindings/mmc/rockchip-dw-mshc.yaml
>> @@ -38,6 +38,7 @@ properties:
>>                 - rockchip,rk3328-dw-mshc
>>                 - rockchip,rk3368-dw-mshc
>>                 - rockchip,rk3399-dw-mshc
>> +              - rockchip,rk3562-dw-mshc
>>                 - rockchip,rk3568-dw-mshc
>>                 - rockchip,rk3588-dw-mshc
>>                 - rockchip,rv1108-dw-mshc
>>
>
>
>
>


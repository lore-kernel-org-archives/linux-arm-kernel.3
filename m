Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C65F5E77198
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dY7cGRSnsKC1U8wn2NYn8pujnABECXqtMmusYeeylE=; b=Jvt17R/FPvnlJ1rbdMG/yJLtbk
	cY3ZhsKEg2Whlk4gxLrrkAIksQSQlhAhKqOBVSPImT/AWuItXIAEB6ysH6Hh5LxHGwnQgXlkfkuvJ
	43j40JzwnZOnbquCZd65vkW1t1BOE7K/sGsdRE+as6FLbCx0+Lj3mE+LdNbEUZ65tCzRNqUdj1+3J
	WdHqsOIR25LvV8cdubmiBE/Vg8928ia1xiLLk2C+iLW8vkVsKRbbHX6TG5a8GU58QVxMIkbMcWDlq
	dJEwtNKxd8XsDwQLazm1sRGW2dl17feGRzSnkIZsIBWjPJMkWc95ToK1KDshShUi0Er4gRzTClMkJ
	MlisJFUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4LG-00000003noG-3Tkp;
	Tue, 07 Jan 2025 07:49:34 +0000
Received: from mail-m15573.qiye.163.com ([101.71.155.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4Jx-00000003nX9-0npp;
	Tue, 07 Jan 2025 07:48:17 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7f39843f;
	Tue, 7 Jan 2025 15:48:08 +0800 (GMT+08:00)
Message-ID: <82848f35-73d8-4254-a818-59495f96bcf2@rock-chips.com>
Date: Tue, 7 Jan 2025 15:48:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v3 2/7] dt-bindings: PCI: dw: rockchip: Add rk3576 support
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, heiko@sntech.de,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Simon Xue <xxm@rock-chips.com>,
 linux-rockchip@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>
References: <20241223110637.3697974-1-kever.yang@rock-chips.com>
 <20241223110637.3697974-3-kever.yang@rock-chips.com>
 <173495701750.480868.16123444058526675248.robh@kernel.org>
Content-Language: en-US
In-Reply-To: <173495701750.480868.16123444058526675248.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ08ZSVYaThhKGhoYT0NDTkJWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	NVSktLVUpCS0tZBg++
X-HM-Tid: 0a943fbc3d6a03afkunm7f39843f
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NDY6HAw4EzIXVhMwIjJISE02
	GCtPCgxVSlVKTEhNSUhNS0JLT09LVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFJS0pNNwY+
DKIM-Signature: a=rsa-sha256;
	b=StPlvgmgCk5NjJLGBsbH6e3x0WpRSjrU469Y9tqJ9Aq67rrJyxLlDernhB6kB+Sl0M+l6f4NjPGze89Qz1Vx/j6HzIh4b6iCY2k8Wm3hLVy4kb/z90+aLL4LYWcARNQue3FGR2L34kCCkBsaq4HBomb0fOpCWsyymIo/uDADHEU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=7dY7cGRSnsKC1U8wn2NYn8pujnABECXqtMmusYeeylE=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_234813_763366_DCD02273 
X-CRM114-Status: GOOD (  17.91  )
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

Hi Rob,

On 2024/12/23 20:30, Rob Herring (Arm) wrote:
> On Mon, 23 Dec 2024 19:06:32 +0800, Kever Yang wrote:
>> rk3576 is using dwc controller, with msi interrupt directly to gic instead
>> of to gic its, so
>> - no its suport is required and the 'msi-map' is not need anymore,
>> - a new 'msi' interrupt is needed.
>>
>> Signed-off-by: Kever Yang<kever.yang@rock-chips.com>
>> ---
>>
>> Changes in v3:
>> - Fix dtb check broken on rk3588
>> - Update commit message
>>
>> Changes in v2:
>> - remove required 'msi-map'
>> - add interrupt name 'msi'
>>
>>   .../devicetree/bindings/pci/rockchip-dw-pcie-common.yaml      | 4 +++-
>>   Documentation/devicetree/bindings/pci/rockchip-dw-pcie.yaml   | 4 +---
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/pci/rockchip-dw-pcie-common.yaml:85:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

Sorry, I'm not so good at the yaml grammar, I will fix it in next version.

But when I run the make dt_binding_check, I can't find this warning in 
my side, maybe the tool has version required?


Thanks,
- Kever
> dtschema/dtc warnings/errors:
>
> doc reference errors (make refcheckdocs):
>
> Seehttps://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241223110637.3697974-3-kever.yang@rock-chips.com
>
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
>
>


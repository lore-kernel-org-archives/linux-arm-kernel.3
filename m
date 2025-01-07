Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9558E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7Waz4qoMm7Thy7CdWwhTSGFNbjxkVcZlwArb6siD10=; b=AR76NWR2Ajb149nAqzo91QumW/
	ljgJ+C3UNpcuYQZSOZogYw36p6G0EHnPQ1dYc2Cab0kYVK6wL9LcpIivAJvq/e959bDQOnWEZ30t7
	vXqWyt9D8YMmW5O9zzkYqi5oG+93TqZyEZumVnTbdgp9vx7yW6/OtgI2D5pMhlVmhiuC44JTzKBXa
	EofOhAVDzNNRy51cXAjS9uD/zWqoKaveGSSDqw0jix+4AfjEnS2ynqngXId9o8oE35D8Nsw80d08A
	2j282wshRwJI1lEVmjEL3EQWhqr3cwTTcEFSZzN51US8yhj9YNFNiYn27CQrFA6SWFzg/97J0yZnW
	q8P/RImg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4MS-00000003o0d-3slc;
	Tue, 07 Jan 2025 07:50:48 +0000
Received: from mail-m49228.qiye.163.com ([45.254.49.228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4KA-00000003ncn-4A6v;
	Tue, 07 Jan 2025 07:48:31 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7f39847a;
	Tue, 7 Jan 2025 15:48:22 +0800 (GMT+08:00)
Message-ID: <1f75f634-5de1-4fd7-949c-123b44a770f8@rock-chips.com>
Date: Tue, 7 Jan 2025 15:48:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Kever Yang <kever.yang@rock-chips.com>
Subject: Re: [PATCH v3 5/7] dt-bindings: arm: rockchip: Sort for boards not in
 correct order
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>, Rob Herring <robh@kernel.org>,
 Dragan Simic <dsimic@manjaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Tim Lunn <tim@feathertop.org>,
 linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andyshrk@163.com>
References: <20241223110637.3697974-1-kever.yang@rock-chips.com>
 <20241223110637.3697974-6-kever.yang@rock-chips.com>
 <dzrmlapgca6vwqpfxi7sub37z4taerinslfthqwqi7jltb4xxh@wtry22ybpd2r>
Content-Language: en-US
In-Reply-To: <dzrmlapgca6vwqpfxi7sub37z4taerinslfthqwqi7jltb4xxh@wtry22ybpd2r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGR1NS1YYHUkZS0NNT0MdQkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	JVSktLVUpCS0tZBg++
X-HM-Tid: 0a943fbc743603afkunm7f39847a
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Ni46HTo*SDIVORM#FDEuSE0*
	PgtPFAlVSlVKTEhNSUhNSktPSE5LVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFMTE03Bg++
DKIM-Signature: a=rsa-sha256;
	b=gepdztKqe2bERtuGHBs4iUoDmWFbxRAHq74BJzuNjZScZCckT2jVZtz9xN1Z5eqBgsthK+VNQdE93chKMSn71rIagS5b1JhFtzAxtNGPQw3yD/t8or3MpIcvXfZ/tNDKXcGHUfk+71cM7CQEwPBuX74GnPIx6mrm7G7Mvlg/DcM=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=W7Waz4qoMm7Thy7CdWwhTSGFNbjxkVcZlwArb6siD10=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_234827_242517_8257FCFE 
X-CRM114-Status: GOOD (  10.94  )
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

Hi Krzysztof

On 2024/12/23 22:58, Krzysztof Kozlowski wrote:
> On Mon, Dec 23, 2024 at 07:06:35PM +0800, Kever Yang wrote:
>> The board entries should be sort in correct order.
> And what is the sorting rule for this file? Board name? SoC compatible?

This is sort by the description msg, which should be easy to find out if 
look at

the content in the file instead of the patch.

Will update the commit msg.

> Explain this in commit msg... and please test your patches before
> posting. Public infrastructure is not replacement of your tests (see
> failiure reported by Rob).
I do run the test in my side, but the tool does not show this warning,
not sure if because of my tool not up to date.

Thanks,
- Kever
>
> Best regards,
> Krzysztof
>
>


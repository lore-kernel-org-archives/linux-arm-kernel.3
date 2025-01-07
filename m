Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B11EAE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W7Waz4qoMm7Thy7CdWwhTSGFNbjxkVcZlwArb6siD10=; b=W+LnO0BMPz94BDV54A5mMPwAZh
	XFYDrokD6mPUX+2hehUwifjzh0StAu+7zHH9fSvlFBb+DLify5rvPnV7jB0rKaK8U/FxdKYzTKQ3J
	XRfyWWFj1PMxWaASGJeflJceTQ8NQDTCvOcvMwzgf4maCsr7e+WVqWLBcN+Y2JHkM6+I6JWl9xzFH
	9GhwTWZk65YnseZK+F5tZ08c9gZkz7U5r/b64zlYTWc5XhOILNWBIHQ0Zwycq88msY86BgJATS5W4
	mdupsO6x5+dQ7q26VVtTavF571Wx8l+ZTRNc3u0X7+YmF9zsz/h1tXGEss09DTbj6BOUHxLzY/PoS
	ckO5Aw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV42v-00000003lLb-0JYZ;
	Tue, 07 Jan 2025 07:30:37 +0000
Received: from mail-m15598.qiye.163.com ([101.71.155.98])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV417-00000003l2B-1DS5;
	Tue, 07 Jan 2025 07:28:49 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 7f2e6f8d;
	Tue, 7 Jan 2025 15:28:41 +0800 (GMT+08:00)
Message-ID: <df8983a4-5e0f-4eae-b163-05788b2bc7cd@rock-chips.com>
Date: Tue, 7 Jan 2025 15:28:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <dzrmlapgca6vwqpfxi7sub37z4taerinslfthqwqi7jltb4xxh@wtry22ybpd2r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGkJMSlZJHxlMGUpLSxlLQk9WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	JVSktLVUpCS0tZBg++
X-HM-Tid: 0a943faa6dca03afkunm7f2e6f8d
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NhA6Cgw6NjIQExMCSxMuMU4K
	DQMKFCxVSlVKTEhNSUhPQklJTUhKVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFMTE03Bg++
DKIM-Signature: a=rsa-sha256;
	b=fFCSiGMiQG14SsmasmUq9Z2NiXJPBN9ENW4gZ8eVH++l8WiemtuurIUtbnrKpS3ut+xS0hrKcV43Nx+AEi4OB5U288HibqvS/M4t+NDtFwF4Pbu7Yl1DhD+uxpeWTnz3qiN4+j8ouxQc82bp3JfkRyuAHnGSjLJ6vH9HnbKbAgU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=W7Waz4qoMm7Thy7CdWwhTSGFNbjxkVcZlwArb6siD10=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_232845_526190_5BB8ED26 
X-CRM114-Status: GOOD (  11.42  )
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


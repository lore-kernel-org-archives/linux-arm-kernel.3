Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1C7D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/koKqKLg/7iKIRz0/xXpKx2QEcRUr9ViN2Ai3lqXZ+o=; b=ROTTzpsO6XX9MQ/oG96OLFH0Ry
	i4ZYz4XIuiYwCjpDudxRVliNxkeQP4ovjg2/ylv+s/tLIIoTffrJ4YEA2ub8ROHWiQ+zq16u5Rn/p
	SBLUSBcXoYLKdrBIwzOVQ4ZsURE9zO1+0bZJoav/RBHLJtVEdZqVhccFNzXQshpSkVIoHZj5azkFr
	CLzF5eFaQqqTs+wVRCzkgXiESw5WuFHrL//uI2QDpn2tet60ifTYbQZEdWz3BatZWH5YCJz4uxsXU
	ptql9ePvd+2PyEyfa/hokFPlZdEvLtLEeKUqdY3uNmCUyic+cDVJHmjmxY+i8++pYlqNqxG5Cf9LT
	IdAkMwnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVO5S-00000004jh6-3iSh;
	Tue, 16 Dec 2025 05:59:06 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVO5Q-00000004jgj-0svI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 05:59:05 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Dec 2025 14:59:01 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id D75D82069FC4;
	Tue, 16 Dec 2025 14:59:01 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 14:59:01 +0900
Received: from [10.212.247.110] (unknown [10.212.247.110])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 342A410A00E;
	Tue, 16 Dec 2025 14:59:01 +0900 (JST)
Message-ID: <668f273b-5214-4f2d-b532-265e4fc6aaef@socionext.com>
Date: Tue, 16 Dec 2025 14:59:03 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: PCI: socionext,uniphier-pcie: Fix interrupt
 controller node name
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251215212456.3317558-1-robh@kernel.org>
 <3f1b7852-1494-4a73-8783-b578f9ad5d40@socionext.com>
 <CAL_JsqJKpQRMEac4e1T-s+6HWbR9mOZXRQCHVeTCnHqJYa=TYg@mail.gmail.com>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <CAL_JsqJKpQRMEac4e1T-s+6HWbR9mOZXRQCHVeTCnHqJYa=TYg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_215904_381048_D3F88DF1 
X-CRM114-Status: GOOD (  16.67  )
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

On 2025/12/16 11:18, Rob Herring wrote:
> On Mon, Dec 15, 2025 at 7:21 PM Kunihiko Hayashi
> <hayashi.kunihiko@socionext.com> wrote:
>>
>> Hi Rob,
>>
>> Thank you for pointing out.
>>
>> On 2025/12/16 6:24, Rob Herring (Arm) wrote:
>>> The child node name in use by .dts files and the driver is
>>> "legacy-interrupt-controller", not "interrupt-controller".
>> After your change commit bcd7ec2cd720 were merged, it was a long time
>> before I realized I needed to fix it.
>>
>> "interrupt-controller" is included in the list of Generic Names
>> Recommendation. Would it be better to apply (i.e. restore) this,
>> or fix the PCI driver and .dts?
> 
> It's an ABI. So we are stuck with it or have to support both names in
> the driver forever (and backport the driver change).

I understand.
If allowing "interrupt-controller", should allow both names in the
driver and bindings.

At this time, it's preferable to align the bindings definition to
remove mismatch warnings.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi


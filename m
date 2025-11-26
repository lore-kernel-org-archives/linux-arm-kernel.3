Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA9FD116E1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 23:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mAh/9vM7Pm/mIku5jqVDyLYqYlyxjYJprDKgq8r/Rmo=; b=alsRolpeMKAye/jBaPPih8Eunm
	QKrgNK6fzW+fSqT1nR/vn2uGqPT5RvY2eMZme4E1enIfFPRY0tlO19jtVD0WFZ2OXPS/FQXpaU9uM
	YCsNU8ckA1pIsU9mZCUDfwtWOq/3t7qvJ7QXOttGjeUZ4vhkFP/Ar674m9b5YzHuTLAXkWt9hbwQ/
	2e6dhE8C84ivoMfigDkA0Xo4f7mvQOUPYtq+2w7Xzz7WemUNJd0lRfohQWU0M2sGEkShkHwlKdQqP
	l3b+5oaZNW2RE2HL8BpJ00V6AIoUd5rfLLbuyZ1i9LuGA5PiAytKlGXcFmZiNGMM2tOR8Ho8Z2fgE
	/iHyFwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOP3o-0000000Fli2-2zNc;
	Wed, 26 Nov 2025 23:36:32 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOP3m-0000000Flh2-0oMM;
	Wed, 26 Nov 2025 23:36:31 +0000
X-QQ-mid: zesmtpip3t1764200140t26c1d66f
X-QQ-Originating-IP: hgMl6M65ccjvhNfvtBjTl6QJMNwIooehNHyypEk8E9k=
Received: from [IPV6:240f:10b:7440:1:c95a:801a ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Nov 2025 07:35:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3508264673174158136
Message-ID: <A528C970F1441854+e82f1fbb-b82e-436c-9336-7b34f515b67b@radxa.com>
Date: Thu, 27 Nov 2025 08:35:37 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] PCI: dwc: Revert Link Up IRQ support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Niklas Cassel <cassel@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Lin <shawn.lin@rock-chips.com>,
 Krishna chaitanya chundru <quic_krichai@quicinc.com>,
 linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-arm-msm@vger.kernel.org
References: <20251111105100.869997-8-cassel@kernel.org>
 <mt7miqkipr4dvxemftq6octxqzauueln252ncrcwy6i2t7wfhi@jtwokeilhwsi>
 <aSRli_Mb6qoQ9TZO@ryzen>
 <7667E818D7D31A4E+cf7c83d4-b99c-469d-8d46-588fc95b843f@radxa.com>
 <pbcemex3hdu4ryw2r7iy6xxt3chwaytlm2eina7mm4ukjfcagt@x4777z7ral26>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <pbcemex3hdu4ryw2r7iy6xxt3chwaytlm2eina7mm4ukjfcagt@x4777z7ral26>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz4b-0
X-QQ-XMAILINFO: N0mS+7D7RQfjFYYGJptHmc9BX10V8/GiKGnkFoMyqJq3T/FWSSBisagX
	UDta+xTFuX9m+ncgk+oglFqAJ1E8Yq2IdnpxtreKYOqjdEjytpC78BAXPRfAIyB+X111Dyy
	8pMZ1vSD5RArFx0OoZa/9ACQmopa1R6iPdpQmG7vK0VYLvfzzCCh9JgqjFtiKHyxOm6Tlk5
	3pj/ws7aeyOj4iuOYUPjgKsr/J6IpZnT57neijWcn/JvA/IuH01wn1Gf/QhYswQUJ05NvZ6
	zicSaBPrs/JYuyXtPGGlmGWMUBfS0fihXKjINFolqMM4KjtNe1/fM2jP/DbhZcANZjbsDMU
	Rp5NFCt55Y3doM9xSZaA3ckxfcZD9zgKRjuuWxRsIm876nepQ/4KuLdQCc2gJw1yj1hnlZ+
	FL6gFEWMAcdmewLj98figUNn1x10mFyQHL0wzvd1NxLHYjsBu0aIOj/o/+LN7bZkWkvRprt
	zygFKiNkoH321ZKlvYUx1w7oiWqdTE32LO+9AJOPkZc7BUuVWoqf72SAKO5guoRSgdWDr+B
	O58Xuj41xsGCJOxaUqtlRnNdX4twjFKdHbPJXnOFvWKj953wgj/K4Q6viwIHRLvNtFWaOlE
	yp0xBRYZcD921M7o+enVGKTAdEmOTHCk5Sm67kTaLlsiLlMByajHhfyLf+CtB+iOsfy1+VS
	MPwGOHP4OxN8AjX7r5EnO3CcNy5dZ+N+a3Br5XyW1sDRfM2omcMq9OPXN+tbv66t5RctJ9u
	BJw1uokOm/3O/Jmv7lEob5u4bk/g5IFjvWJJiM/VMvOLQymJ8VzXrFmfVp6VRcXExHdIGde
	Vpwe40plfglZIR5fQKInfcTaj6SAbOEpP8Y1Uy2thLWbB/6Y2KbtrhnsPhm19j2bzrtIByy
	zf3qFi5dixqqpLM75IMELwse2F3cAQ29sre9tJDJWEApW6v2Ty9dsOnd0EvFWqS0tW0/0BO
	sMNx4u3FiSTwWFi59vOm3OczPmrQvRGeDLTGvtCt68WHMWtHsIrxtn70DE+baKf6qrNt5j/
	N4qa7i+Q==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_153630_704061_8B7C694C 
X-CRM114-Status: GOOD (  21.92  )
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

Hi Mani,

On 11/26/25 22:54, Manivannan Sadhasivam wrote:
> On Wed, Nov 26, 2025 at 10:30:06PM +0900, FUKAUMI Naoki wrote:
>> Hi Niklas,
>>
>> I apologize for the delayed response.
>>
>> On 11/24/25 23:02, Niklas Cassel wrote:
>>> On Mon, Nov 24, 2025 at 06:07:44PM +0530, Manivannan Sadhasivam wrote:
>>>> While I suggested to revert the link up IRQ patch for rockchip earlier, I didn't
>>>> expect to drop the support for Qcom. The reason is, on Qcom SoCs, we have not
>>>> seen a case where people connect a random PCIe switch and saw failures. Most of
>>>> the Qcom usecases were around the M.2 and other proprietary connectors. There is
>>>> only one in-house PCIe switch that is being actively used in our products, but
>>>> so far, none of the bootloaders have turned them ON before kernel booting. So
>>>> kernel relies on the newly merged pwrctrl driver to do the job. Even though it
>>>> also suffers from the same resource allocation issue, this series won't help in
>>>> any way as pwrctrl core performs rescan after the switch power ON, and by that
>>>> time, it will be very late anyway.
>>>>
>>>> So I'm happy to take the rockhip patches from this series as they fix the real
>>>> issue that people have reported. But once the pwrctrl rework series gets merged,
>>>> and the rockchip drivers support them, we can bring back the reverted changes.
>>>
>>> FUKAUMI Naoki, just to confirm:
>>>
>>> Neither my suggested approach:
>>> https://lore.kernel.org/linux-pci/aRHdeVCY3rRmxe80@ryzen/
>>>
>>> nor Shawn's suggested approach:
>>> https://lore.kernel.org/linux-pci/dc932773-af5b-4af7-a0d0-8cc72dfbd3c7@rock-chips.com/
>>>
>>> worked for you?
>>
>> Yes, I re-tested the two methods mentioned above, separately, on v6.18-rc7,
>> but neither of them resolved the issue in my environment (ROCK 5C +
>> ASM2806).
>>
>>> If so, I don't see many alternative but for Mani to apply patch 1 and
>>> patch 2 from this series.
>>
>> I believe applying patch 1 and patch 2 should be sufficient.
>>
>> ----
>>
>> Incidentally, (probably) while applying patch 1 and patch 2, I have
>> encountered the following issue several times:
>>
> 
> Do you see the below issue *after* applying the patches? I don't know how to
> interpret "while applying".
>   
>> [    1.709614] pcieport 0004:41:00.0: of_irq_parse_pci: failed with rc=134
>> [    1.710208] pcieport 0004:41:00.0: Unable to change power state from
>> D3cold to D0, device inaccessible
>>
> 
> Looks like the device was seen during bus scan, but then it went down
> afterwards.

Sorry, I meant "after". But I guess it occurred with vanilla kernel in 
the past:

  https://lore.kernel.org/linux-pci/4487DA40249CC821+19232169-a096-4737-bc6a-5cec9592d65f@radxa.com/
  https://gist.github.com/RadxaNaoki/b42252ce3209d9f6bc2d4c90c71956ae#file-gistfile1-txt-L551

This time I unset CONFIG_PCI_DYNAMIC_OF_NODES, but this error occurred 
at same location when kernel oops occurred.

It might be a problem with ROCK 5C, (or *my* ROCK 5C), so I'll test 
again with ROCK 5B.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> - Mani
> 



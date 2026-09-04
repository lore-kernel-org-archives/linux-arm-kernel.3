Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102A7C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 16:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NfI3sXa25YFWPfyRn+wgSyK1ek+FDv+B1YGaaHsijuo=; b=1+c2v/cjY68X5rXND+UKANboCD
	9tl23k3A1RRmsrv3/Ltb+N+ToFqJkEncm3aIQAvrLNWPQftGHFnJmbpB3Kmw5ZoiI/zKf0VC8FNVx
	n3xl/gDh6iS1wtXYc3HXidGev7Xxisyn8IcHDCI/amiUF+z3fYSPB4hs3cOY1ysAdMvQ3gC9KcOuT
	bbbHGPejLqqCCeNE4+5feojMSuKXW1DDNQT5olSP5Vkdjga0Bvm/W6QwphWGqjdZ+N40C3/4WFhpQ
	uxdl39Or7DlBTYhuFZPL65dMrcotNEzB3zkm9bxV8kVxbyAcjaUUce196vonskM3x8hbPQ3SO2sYJ
	zJ+MoHAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WzP-00000002lA0-1VP7;
	Fri, 04 Sep 2026 16:42:07 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WzL-00000002l9B-3TKV;
	Fri, 04 Sep 2026 16:42:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:To:
	Content-Type; bh=NfI3sXa25YFWPfyRn+wgSyK1ek+FDv+B1YGaaHsijuo=;
	b=U4uu4KTaIEW+h9cMnkm1PY9BQufllSyQ7cQiXgrk2hXim0Drm1nI8I9ZJo9O/c
	bod4GATPrp8wqC1ARVrUosUrAHvRGVy10KYIg6pki8EOWxIsJ9Xhohw328A/Arnc
	X7Dt/3kjIErd7eSbl/2s3QwUAqDFy1n4pRmxkv23ZIMVE=
Received: from [IPV6:240e:b8f:91b3:d000:cb89:e59c:b7d0:5b84] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAXZJmq9JpqJYjJQw--.64773S2;
	Sat, 05 Sep 2026 00:41:15 +0800 (CST)
Message-ID: <1a193cc9-38c8-470c-9041-fdf1dad5b6e3@163.com>
Date: Sat, 5 Sep 2026 00:41:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 0/2] PCI: Configure Root Port MPS during host probing
From: Hans Zhang <18255117159@163.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: bhelgaas@google.com, Manivannan Sadhasivam <mani@kernel.org>,
 lpieralisi@kernel.org, kwilczynski@kernel.org, heiko@sntech.de,
 yue.wang@amlogic.com, pali@kernel.org, neil.armstrong@linaro.org,
 robh@kernel.org, jingoohan1@gmail.com, khilman@baylibre.com,
 jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, cassel@kernel.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260622171448.GA678675@bhelgaas>
 <72a058fd-5781-43bc-9148-180140929ecd@163.com>
Content-Language: en-US
In-Reply-To: <72a058fd-5781-43bc-9148-180140929ecd@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PigvCgAXZJmq9JpqJYjJQw--.64773S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CFykGr13tF43Jr1rArWDJwb_yoW8uw4kpF
	W5Xan3ta1xKry3CF1qqw1Fyr1jqa48tFy3XryDtryayFn0vr15XF1I9wsYkrn7Wr1xGr12
	9r1Uta4xXrn0vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ucdb8UUUUU=
X-Originating-IP: [240e:b8f:91b3:d000:cb89:e59c:b7d0:5b84]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7AuoTGqa9KsUEwAA3r
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_094204_290378_E4862A67 
X-CRM114-Status: GOOD (  13.02  )
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



On 7/14/26 19:06, Hans Zhang wrote:
> 
> 
> On 6/23/26 01:14, Bjorn Helgaas wrote:
>> On Fri, Jun 19, 2026 at 11:29:39PM +0800, Hans Zhang wrote:
>>> On 5/6/26 22:00, Manivannan Sadhasivam wrote:
>>>> On Fri, Nov 28, 2025 at 01:09:06AM +0800, Hans Zhang wrote:
>>>>> Current PCIe initialization exhibits a key optimization gap: Root 
>>>>> Ports
>>>>> may operate with non-optimal Maximum Payload Size (MPS) settings. 
>>>>> While
>>>>> downstream device configuration is handled during bus enumeration, 
>>>>> Root
>>>>> Port MPS values inherited from firmware or hardware defaults often 
>>>>> fail
>>>>> to utilize the full capabilities supported by controller hardware. 
>>>>> This
>>>>> results in suboptimal data transfer efficiency throughout the PCIe
>>>>> hierarchy.
>>>>>
>>>>> This patch series addresses this by:
>>>>>
>>>>> 1. Core PCI enhancement (Patch 1):
>>>>> - Proactively configures Root Port MPS during host controller probing
>>>>> - Sets initial MPS to hardware maximum (128 << dev->pcie_mpss)
>>>>> - Conditional on PCIe bus tuning being enabled (PCIE_BUS_TUNE_OFF 
>>>>> unset)
>>>>>     and not in PCIE_BUS_PEER2PEER mode (which requires default 128 
>>>>> bytes)
>>>>> - Maintains backward compatibility via PCIE_BUS_TUNE_OFF check
>>>>> - Preserves standard MPS negotiation during downstream enumeration
>>>>>
>>>>> 2. Driver cleanup (Patch 2):
>>>>> - Removes redundant MPS configuration from Meson PCIe controller 
>>>>> driver
>>>>> - Functionality is now centralized in PCI core
>>>>> - Simplifies driver maintenance long-term
>>>>>
>>>>
>>>> For the series,
>>>>
>>>> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
>>>>
>>>> Bjorn: Could you please take a look? This series has been floating 
>>>> for a
>>>> while...
>>>
>>> Hello Bjorn,
>>>
>>> Any chance for this series to be applied?
>>
>> It's too late for v7.2; we're already more than halfway through the
>> merge window.  We can look again for v7.3 after v7.2-rc1.
> 
> Hello Bjorn,
> 
> Gentle ping on this series.
> 

Hello Bjorn,

Would you have time to take a look at this series? If there is anything 
else I can do to improve, I will do it.


Best regards,
Hans



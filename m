Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 246E3C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 16:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0zrM8W2TbSsSIHvT1Fq4IVGHy7WN7Km4fk5n2KCsDZg=; b=GTfU9S+gKbm0hyjW+cI3ADd3er
	5U7dRaSdmYJJ2FVTKfN8A+WLwgnfJKrkt22kGzS9PhioZQ+uSvIgpENy6C5l/sDt8/fa0aWDpVS8E
	UGXE0ykvOAcOWmDAR2Apv2DSdelho2jWcTrunXO2iEb27WKalgCGiMnY/38I08M9gvRV0V68KMas3
	CQ4QxUN1l70L9RE1rvUNO2MmN2lznIYKfsY+AhQbGHNl8EVQINKnHvf0mzmqfKPlNyLaAJiI9UZao
	Qypuw3v6JxkZv0l7KwIuFEHdKwQtP4oeGv+x8bsgXkX4Cq+afBd3eSreDfmC6zYngVVL9T4o4rxzx
	2OY8YmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeXF-0000000G83E-3lzO;
	Fri, 20 Jun 2025 16:24:13 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSe8x-0000000G4Yw-2e3p;
	Fri, 20 Jun 2025 15:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=0zrM8W2TbSsSIHvT1Fq4IVGHy7WN7Km4fk5n2KCsDZg=;
	b=J4fitMSVfCyFl9sFMsejJfExQJjX5ak/mbOya/qJbysx2L2x6nfErZb0HeEn2t
	4u1d8czktvXwNmZTtXizOgBTIs59ATRW7ZbUk2LowXejD5t/XYtNA2K9GobExCeh
	pOIIK2ouvF0xt8SkVj2G249iaVqK5g0eiYGF+rwejVsLQ=
Received: from [IPV6:240e:b8f:919b:3100:8440:da7c:be7e:927f] (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnzAA9hVVoKwqyAA--.25131S2;
	Fri, 20 Jun 2025 23:58:54 +0800 (CST)
Message-ID: <4bfc8c05-c6e6-4246-960c-ee5802840523@163.com>
Date: Fri, 20 Jun 2025 23:58:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] PCI: rockchip: Remove redundant PCIe message routing
 definitions
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: lpieralisi@kernel.org, bhelgaas@google.com, kwilczynski@kernel.org,
 shawn.lin@rock-chips.com, heiko@sntech.de, robh@kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620154202.GA1292011@bhelgaas>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20250620154202.GA1292011@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: QCgvCgCnzAA9hVVoKwqyAA--.25131S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw1DWF4xAF4xCF1kCrWfXwb_yoW5Jw4rpr
	WUXayFyF48Jr43ua4aqan3XF47XanrtF4jgr1I9w4fKF1fWryrWa4Yvr45Grn8XrW8Xrn2
	k390ka4DKFZ8J37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UntxhUUUUU=
X-Originating-IP: [240e:b8f:919b:3100:8440:da7c:be7e:927f]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/1tbiWxVyo2hVgqRJRAAAsJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_085907_998463_64C0E980 
X-CRM114-Status: GOOD (  12.42  )
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



On 2025/6/20 23:42, Bjorn Helgaas wrote:
> On Sat, Jun 07, 2025 at 11:49:13PM +0800, Hans Zhang wrote:
>> The Rockchip driver contained duplicated message routing and INTx code
>> definitions (e.g., ROCKCHIP_PCIE_MSG_ROUTING_TO_RC,
>> ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTA). These are already provided by the
>> PCI core in drivers/pci/pci.h as PCIE_MSG_TYPE_R_RC and
>> PCIE_MSG_CODE_ASSERT_INTA, respectively.
>>
>> Remove the driver-specific definitions and use the common PCIe macros
>> instead. This aligns the driver with the PCIe specification and reduces
>> maintenance overhead.
>>
>> Signed-off-by: Hans Zhang <18255117159@163.com>
>> ---
>>   drivers/pci/controller/pcie-rockchip.h | 14 --------------
>>   1 file changed, 14 deletions(-)
>>
>> diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
>> index 5864a20323f2..12bc8da59d73 100644
>> --- a/drivers/pci/controller/pcie-rockchip.h
>> +++ b/drivers/pci/controller/pcie-rockchip.h
>> @@ -215,20 +215,6 @@
>>   #define RC_REGION_0_TYPE_MASK			GENMASK(3, 0)
>>   #define MAX_AXI_WRAPPER_REGION_NUM		33
>>   
>> -#define ROCKCHIP_PCIE_MSG_ROUTING_TO_RC		0x0
>> -#define ROCKCHIP_PCIE_MSG_ROUTING_VIA_ADDR		0x1
>> -#define ROCKCHIP_PCIE_MSG_ROUTING_VIA_ID		0x2
>> -#define ROCKCHIP_PCIE_MSG_ROUTING_BROADCAST		0x3
>> -#define ROCKCHIP_PCIE_MSG_ROUTING_LOCAL_INTX		0x4
>> -#define ROCKCHIP_PCIE_MSG_ROUTING_PME_ACK		0x5
>> -#define ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTA		0x20
>> -#define ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTB		0x21
>> -#define ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTC		0x22
>> -#define ROCKCHIP_PCIE_MSG_CODE_ASSERT_INTD		0x23
>> -#define ROCKCHIP_PCIE_MSG_CODE_DEASSERT_INTA		0x24
>> -#define ROCKCHIP_PCIE_MSG_CODE_DEASSERT_INTB		0x25
>> -#define ROCKCHIP_PCIE_MSG_CODE_DEASSERT_INTC		0x26
>> -#define ROCKCHIP_PCIE_MSG_CODE_DEASSERT_INTD		0x27
> 
> Thanks for doing this!  In fact, these definitions are not only
> redundant, they're not even used at all.
> 
>>   #define ROCKCHIP_PCIE_MSG_ROUTING_MASK			GENMASK(7, 5)
>>   #define ROCKCHIP_PCIE_MSG_ROUTING(route) \
>>   	(((route) << 5) & ROCKCHIP_PCIE_MSG_ROUTING_MASK)
> 
> And neither are these ROUTING and CODE definitions.

Dear Bjorn,

Yes, this driver has too many unused definitions. I can delete the other 
unused definitions next. For this series, I just delete the similar 
macro definitions in drivers/pci/pci.h.

Best regards,
Hans



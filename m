Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED3CC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 17:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JoiCvAoObANggbvCxlH2pC3tiGIdLdTH2E7i+CtOu60=; b=be2MLj2FmYDerFuwTs4/8S7LmA
	rR8MOKLE/iuQyv4WqYd63rSILhhCzC/qPfciPlYthJWsgBo/KaVbzdm1id98L/n4e6s2CFLhO00Rn
	Lgz7TRCgxjziAKCoXX98umf/Fsw0XqFjQ662bFL+4u/qj7TJW2VRiB22gbF0mc0qmEd55TibiQ2QZ
	auyAnJKEEcPI39Q4Nb6hQa37zEx0MR46fflBboJtcTpZPopypiqAPTqwxA1U50wdnhV6gYdB1P7QD
	IAJ6Ps0swMDmuJOXOwPj19DrN0so7Ls2gCIhVpn8XCjLsJmov054YdnZDaSU0+Q9pNLDkVzanlJWY
	hjDyXaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pS0-0000000HE0r-1Nlk;
	Fri, 18 Apr 2025 17:24:28 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5pQ2-0000000HDao-41O3;
	Fri, 18 Apr 2025 17:22:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:From:
	Content-Type; bh=JoiCvAoObANggbvCxlH2pC3tiGIdLdTH2E7i+CtOu60=;
	b=NhI7IWfEufQdqZ9Fi8LAbN5Tm277ipnd/At1S8RBJWu98rFgfvXXYFegTA2jHp
	3kS8NQq6jvS9nchsAhBGP9Derv4ViJBIF0I+DhJ1ms625shs/L5Q+E7ysqz9ymvV
	M/eHYoIO9iFutl8OxXN5/poWMaDCMrF6K5wC0FynLMd6A=
Received: from [192.168.71.89] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wDnr+8yigJoVSsGBA--.55761S2;
	Sat, 19 Apr 2025 01:21:55 +0800 (CST)
Message-ID: <8af8a418-b808-4a14-9969-1c6d549e1633@163.com>
Date: Sat, 19 Apr 2025 01:21:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: dw-rockchip: Configure max payload size on host init
To: Niklas Cassel <cassel@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: Shawn Lin <shawn.lin@rock-chips.com>, lpieralisi@kernel.org,
 kw@linux.com, bhelgaas@google.com, heiko@sntech.de,
 manivannan.sadhasivam@linaro.org, robh@kernel.org, jingoohan1@gmail.com,
 thomas.richard@bootlin.com, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250417165219.GA115235@bhelgaas>
 <22720eef-f5a3-4e72-9c41-35335ec20f80@163.com>
 <225CC628-432C-4E88-AF2B-17C948B3790B@kernel.org>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <225CC628-432C-4E88-AF2B-17C948B3790B@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wDnr+8yigJoVSsGBA--.55761S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZr45tr4fGF1xGr4xJFW7CFg_yoW5Xr48pa
	y7Kay8Ar18JFW3JF4kAF109F9Yy3ZayFWj9w47GrZ8Z3W5tryfCrZxtr45t3s7GrsF9Fy3
	Z3s5JFyUJFnIvFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuyIUUUUUU=
X-Originating-IP: [124.79.128.52]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbBDwozo2gChB3CFgAAsy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_102227_427596_0703F1CD 
X-CRM114-Status: GOOD (  22.34  )
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



On 2025/4/18 22:55, Niklas Cassel wrote:
> 
> 
> On 18 April 2025 14:33:08 CEST, Hans Zhang <18255117159@163.com> wrote:
>>
>> Dear Bjorn,
>>
>> Thanks your for reply. Niklas and I attempted to modify the relevant logic in drivers/pci/probe.c and found that there was a lot of code judging the global variable pcie_bus_config. At present, there is no good method. I will keep trying.
>>
>> I wonder if you have any good suggestions? It seems that the code logic regarding pcie_bus_config is a little complicated and cannot be modified for the time being?
> 
> 
> Hans,
> 
> If:
> 
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 364fa2a514f8..2e1c92fdd577 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -2983,6 +2983,13 @@ void pcie_bus_configure_settings(struct pci_bus *bus)
>           if (!pci_is_pcie(bus->self))
>                   return;
>    +       /*
> +        * Start off with DevCtl.MPS == DevCap.MPS, unless PCIE_BUS_TUNE_OFF.
> +        * This might get overriden by a MPS strategy below.
> +        */
> +       if (pcie_bus_config != PCIE_BUS_TUNE_OFF)
> +               smpss = pcie_get_mps(bus->self);
> +

Dear Niklas,

Thank you very much for your reply and thoughts.

pcie_get_mps: Returns maximum payload size in bytes

I guess you want to obtain the DevCap MPS. But the purpose of the smpss 
variable is to save the DevCtl MPS.

>           /*
>            * FIXME - Peer to peer DMA is possible, though the endpoint would need
>            * to be aware of the MPS of the destination.  To work around this,
> 
> 
> 
> does not work, can't you modify the code slightly so that it works?
> 
> I haven't tried myself, but considering that it works when walking the bus, it seems that it should be possible to get something working.
> 


After making the following modifications, my test shows that it is 
normal. If the consideration is not comprehensive. Could Bjorn and 
Niklas please review my revisions?

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 364fa2a514f8..5b54f1b0a91d 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2951,8 +2951,7 @@ static int pcie_bus_configure_set(struct pci_dev 
*dev, void *data)
         if (!pci_is_pcie(dev))
                 return 0;

-       if (pcie_bus_config == PCIE_BUS_TUNE_OFF ||
-           pcie_bus_config == PCIE_BUS_DEFAULT)
+       if (pcie_bus_config == PCIE_BUS_TUNE_OFF)
                 return 0;

         mps = 128 << *(u8 *)data;
@@ -2991,7 +2990,8 @@ void pcie_bus_configure_settings(struct pci_bus *bus)
         if (pcie_bus_config == PCIE_BUS_PEER2PEER)
                 smpss = 0;

-       if (pcie_bus_config == PCIE_BUS_SAFE) {
+       if ((pcie_bus_config == PCIE_BUS_SAFE) ||
+           (pcie_bus_config != PCIE_BUS_TUNE_OFF)) {
                 smpss = bus->self->pcie_mpss;

                 pcie_find_smpss(bus->self, &smpss);


Best regards,
Hans



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47BFEA4E28
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RSQdPhN9oVhNY3UYyEfe+K/nlo15sOXkFONrZofQjoI=; b=a/IGoCM+3p2IRpJ4G+VPX23EUw
	0aZmW/vpHrxIRrBciSdCg+IAJdonkNxTfpLRGvxZjUKpxNtxmr2e0qZaYdyJ9+nWU1F22Dnu72tLy
	iupE7GjApsCWamvmyPrAMDVwKVdTdTJMr5gL03at1y4vh7kMJNtbDqCdmmdBLROGD5XIh1YY9Ubhq
	hXbLM2W/iHn7n0yZ8CVD0kHixOC9T4OPVF7NmXJefBMRKEEVP4p61eT8WDGAccelJwiJHPztjQ7KL
	ooTaevtNsKtb7GIS/mHfLjbHuDbkoVUq4hPSvh9aHdfoXW5elsZZQKIbnZZPyqt5V4WXCb6Rjo9fh
	u3b9KLzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5hh-0000000DReL-1mgE;
	Mon, 02 Mar 2026 16:01:05 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx5hd-0000000DRd2-1XEk;
	Mon, 02 Mar 2026 16:01:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=RSQdPhN9oVhNY3UYyEfe+K/nlo15sOXkFONrZofQjoI=;
	b=ScKWJQaU/8+qKpd6w6655Aggq4gH+zKQfLlUg34hpn09zkSK1vpltgjGprZtEe
	JfcgbQpUFduz+6QExa7WM0GWyByiVhC3/w537KO9Olo7dZ7jBBZoQCs86jQPMqAl
	HPvtEPOLXjdIxWifwm2J1AV84Yks5geT8EipO+IUAGhYs=
Received: from [IPV6:240e:b8f:927e:1000:4390:9d39:cacd:606d] (unknown [])
	by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id _____wA3Jwv8s6VpeXz2NQ--.21625S2;
	Mon, 02 Mar 2026 23:59:57 +0800 (CST)
Message-ID: <53c62d0c-cc5e-4ae3-82ce-03d408217837@163.com>
Date: Mon, 2 Mar 2026 23:59:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] PCI: dw-rockchip: Enable async probe by default
To: Anand Moon <linux.amoon@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Heiko Stuebner <heiko@sntech.de>,
 Niklas Cassel <cassel@kernel.org>, Shawn Lin <shawn.lin@rock-chips.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 "open list:PCI NATIVE HOST BRIDGE AND ENDPOINT DRIVERS"
 <linux-pci@vger.kernel.org>,
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>
Cc: Grimmauld <grimmauld@grimmauld.de>
References: <20260226101032.1042-1-linux.amoon@gmail.com>
Content-Language: en-US
From: Hans Zhang <18255117159@163.com>
In-Reply-To: <20260226101032.1042-1-linux.amoon@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: _____wA3Jwv8s6VpeXz2NQ--.21625S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw1fZrWDGw4fAr47KryfWFg_yoW8Ww43pa
	1DAF17Ar95Gr4SqF4xGaykuFyYqanrA3yDJ393W34a9Fyayr15K3sIgF9Iqrnrtr42ka4F
	kw15tF9rGa9IvrDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRtKs8UUUUU=
X-Originating-IP: [240e:b8f:927e:1000:4390:9d39:cacd:606d]
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7B7vk2mls-446gAA3d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_080101_898249_696296F6 
X-CRM114-Status: GOOD (  16.83  )
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



On 2026/2/26 18:10, Anand Moon wrote:
> Rockchip DWC PCIe driver currently performs synchronous link training for
> combo PHYs (PCIe 3.0/2.0 and SATA 3.0) during boot. This process waits for
> the link to be fully established, adding several milliseconds to the boot
> sequence. To optimize boot time, this change enables asynchronous probing,
> allowing link establishment to proceed in the background while the kernel
> continues probing other devices.
> 
> Cc: Grimmauld <grimmauld@grimmauld.de>
> Cc: Niklas Cassel <cassel@kernel.org>
> Tested-by: Grimmauld <grimmauld@grimmauld.de>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Reviewed-by: Hans Zhang <18255117159@163.com>

> ---
> v3: update the commit message to describe the changs.
>      added tested by Grimmauld.
>      https://lore.kernel.org/all/20240809073610.2517-1-linux.amoon@gmail.com/
> v2: update the commit message to describe the changs.
> ---
>   drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 5b17da63151d5..c31e0e9848327 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -746,6 +746,7 @@ static struct platform_driver rockchip_pcie_driver = {
>   		.name	= "rockchip-dw-pcie",
>   		.of_match_table = rockchip_pcie_of_match,
>   		.suppress_bind_attrs = true,
> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>   	},
>   	.probe = rockchip_pcie_probe,
>   };
> 
> base-commit: f4d0ec0aa20d49f09dc01d82894ce80d72de0560



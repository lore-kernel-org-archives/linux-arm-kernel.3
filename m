Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96235CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 16:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mvJ9JYAwkeLIZ1GL81Io1BB6HraIW5Q9sbUzoU9J5AQ=; b=fqtMs+CrSdMiHvYLo1zvX7etgQ
	dBfyyVzk36MjPh4HQzQezQLtVojvqoYJJ+Uf5Aoireu4OKWJL1gJ5Nt1MM31d/skAjmTeAbe5nu2a
	1E2q6/oOVc2lYfXOC/dAr9F2RX/YQwIzi8iL9OCH7VQfQDARutTzr2DZiM4dtE0fByCQxgIdsW7q0
	+u3tKLLRnUCjsSci8qg7Q9YNy1kh0WgjPEgpTa/v2/YSYqNp0drz+p3tq3F4vIeDihfoUexQRDwfR
	NZlNqi2pDqlQcnaoW7u/HBxQR4BuyID+TQzN9933G/tkssThVcs24LC8FZwKOxAjLou5c0nLigDx1
	Dq+z+AIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfUS-00000001ZF3-1Tmx;
	Wed, 06 May 2026 16:52:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKfUR-00000001ZEX-1nXz;
	Wed, 06 May 2026 16:52:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3D7BC433E7;
	Wed,  6 May 2026 16:52:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC42EC2BCB0;
	Wed,  6 May 2026 16:52:44 +0000 (UTC)
Message-ID: <bd0f4589-b586-4f01-b12c-6ae5c19ec21b@tuxon.dev>
Date: Wed, 6 May 2026 19:52:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] PCI: rzg3s-host: Add 100 ms delay after link
 training
To: Hans Zhang <18255117159@163.com>, bhelgaas@google.com,
 lpieralisi@kernel.org, kwilczynski@kernel.org, mani@kernel.org,
 vigneshr@ti.com, jingoohan1@gmail.com, thomas.petazzoni@bootlin.com,
 pali@kernel.org, ryder.lee@mediatek.com, jianjun.wang@mediatek.com,
 claudiu.beznea.uj@bp.renesas.com, mpillai@cadence.com
Cc: robh@kernel.org, s-vadapalli@ti.com, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260506152346.166056-1-18255117159@163.com>
 <20260506152346.166056-9-18255117159@163.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260506152346.166056-9-18255117159@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_095251_493164_F71EADBB 
X-CRM114-Status: GOOD (  14.23  )
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

Hi, Hans,

On 5/6/26 18:23, Hans Zhang wrote:
> The Renesas RZ/G3S PCIe host driver currently does not enforce the
> mandatory 100 ms delay after link training completes for speeds > 5.0 GT/s,
> required by PCIe r6.0 sec 6.6.1.
> 
> The driver already has a 'max_link_speed' field (derived from the device
> tree). Add a call to pcie_wait_after_link_train() in
> rzg3s_pcie_host_init() after reading the link status, ensuring that the
> delay is applied before any Configuration Request is sent downstream.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/pci/controller/pcie-rzg3s-host.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/pcie-rzg3s-host.c b/drivers/pci/controller/pcie-rzg3s-host.c
> index d86e7516dcc2..6ab59c5464cf 100644
> --- a/drivers/pci/controller/pcie-rzg3s-host.c
> +++ b/drivers/pci/controller/pcie-rzg3s-host.c
> @@ -1390,6 +1390,8 @@ static int rzg3s_pcie_host_init(struct rzg3s_pcie_host *host)
>   	val = readl_relaxed(host->axi + RZG3S_PCI_PCSTAT2);
>   	dev_info(host->dev, "PCIe link status [0x%x]\n", val);
>   
> +	pcie_wait_after_link_train(host->max_link_speed);

There is an msleep(PCIE_RESET_CONFIG_WAIT_MS) after 
rzg3s_pcie_set_max_link_speed() call. Shouldn't that msleep() call be replaced 
with your pcie_wait_after_link_train() ?

Thank you,
Claudiu


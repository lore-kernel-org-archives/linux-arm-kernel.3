Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981A4106FD91
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 07:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3xm6U44fEGSntAWOFNv+gR52dvtb+FgLKg5beQSpUM=; b=o8LoIX/ljE+gZ2lgwPnQE9MpDv
	xlcJuYwVJDXoT+FjZ2AriVVv3w3/fV58ZyPOCOaFZ812Wr2LH6YTE8pvDhuHNCkBnl6NMVgqI+quR
	XD+VS3gfBzi1sW0COH+kg2gpvgAAD4EMo5Td+81ITr9ykZtrULyDcEYt0HDAE/lgU4Bu6swpIGVr8
	DIxwWhTxSQg2b1Yh+Sz28qEOvNVwu9UXzKQcQ6QzqBHnW8qamYeLoS9zinbohZQUMCMryS5d+df1e
	eplyeE1+nwH4Z6LFAb1xKWr93oYzSNcrxfG7qrWitNhJ3FAzm/o0FlFDCdQC7dV3Kd3rdKFBVNjfD
	SyllmmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wa9-0000000GxkP-2W3s;
	Fri, 13 Mar 2026 07:05:13 +0000
Received: from mail-m21471.qiye.163.com ([117.135.214.71])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0wa5-0000000GxiY-3agm;
	Fri, 13 Mar 2026 07:05:11 +0000
Received: from [192.168.61.151] (unknown [110.83.51.2])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36d232d0a;
	Fri, 13 Mar 2026 15:05:00 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, robh@kernel.org, ilpo.jarvinen@linux.intel.com,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-renesas-soc@vger.kernel.org, claudiu.beznea.uj@bp.renesas.com,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/5] PCI: of: Remove max-link-speed generation
 validation
To: Hans Zhang <18255117159@163.com>, lpieralisi@kernel.org,
 jingoohan1@gmail.com, mani@kernel.org, kwilczynski@kernel.org,
 bhelgaas@google.com, helgaas@kernel.org, florian.fainelli@broadcom.com,
 jim2101024@gmail.com
References: <20260312163652.113228-1-18255117159@163.com>
 <20260312163652.113228-6-18255117159@163.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <44e74dff-c321-7cfe-e304-a21644ac7787@rock-chips.com>
Date: Fri, 13 Mar 2026 15:04:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260312163652.113228-6-18255117159@163.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ce603472b09cckunm7514b9b4e3126
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCQ0IZVkpPSxpIGhgZSUtLS1YVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSktVQ0hVTkpVSVlXWRYaDxIVHRRZQVlPS0hVSktJT09PSFVKS0tVSk
	JLS1kG
DKIM-Signature: a=rsa-sha256;
	b=JzZpZOrhxa/p+OxsGMsQFBDF5BmwYT/jD9es/4d2sYQDihM0+OEkYVO2RfHRWGr/vm5MJ0hubEDkQvQa38A1Dfuf1ZAa/0pUGvHKzllpRUYyZ1dmGteisUVSGQW/Qo2e8A0b7YOZgSX9+IObi8GJtscky6tOipCyAPIfkGeTA28=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=f3xm6U44fEGSntAWOFNv+gR52dvtb+FgLKg5beQSpUM=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_000510_481190_CA116488 
X-CRM114-Status: GOOD (  22.00  )
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

Hi Hans

在 2026/03/13 星期五 0:36, Hans Zhang 写道:
> The of_pci_get_max_link_speed() function currently validates the
> "max-link-speed" DT property to be in the range 1..4 (Gen1..Gen4).
> This imposes a maintenance burden because each new PCIe generation
> would require updating this validation.
> 
> Remove the range check so the function returns the raw property value
> (or a negative error code if the property is missing or malformed).
> Callers must now validate the returned speed against the range they
> support. A subsequent patch adds such validation to the DWC driver,
> which is the primary user of this function.
> 
> Removing the validation from this common function allows future PCIe
> generations to be supported without modifying drivers/pci/of.c.
> 
> Signed-off-by: Hans Zhang <18255117159@163.com>
> ---
>   drivers/pci/of.c | 12 +++++++-----
>   1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> index 9f8eb5df279e..fbb779a94202 100644
> --- a/drivers/pci/of.c
> +++ b/drivers/pci/of.c
> @@ -875,8 +875,9 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
>    * of_pci_get_max_link_speed - Find the maximum link speed of the given device node.
>    * @node: Device tree node with the maximum link speed information.
>    *
> - * This function will try to find the limitation of link speed by finding
> - * a property called "max-link-speed" of the given device node.
> + * This function will try to read the "max-link-speed" property of the given
> + * device tree node. It does NOT validate the value of the property (e.g.,
> + * range checks for PCIe generations).
>    *
>    * Return:
>    * * > 0	- On success, a maximum link speed.

Thanks for the patch. However, after applying it, I noticed this part
still seems off. There is a detailed comment in the file saying this
function checks if the max-link-speed is invalid, just a few lines below
your change. Could you please take another look at that comment and
adjust them?

> @@ -889,10 +890,11 @@ EXPORT_SYMBOL_GPL(of_pci_supply_present);
>   int of_pci_get_max_link_speed(struct device_node *node)
>   {
>   	u32 max_link_speed;
> +	int ret;
>   
> -	if (of_property_read_u32(node, "max-link-speed", &max_link_speed) ||
> -	    max_link_speed == 0 || max_link_speed > 4)
> -		return -EINVAL;
> +	ret = of_property_read_u32(node, "max-link-speed", &max_link_speed);
> +	if (ret)
> +		return ret;
>   
>   	return max_link_speed;
>   }
> 


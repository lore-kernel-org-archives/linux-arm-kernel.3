Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DDAD132C0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6nouysTNh3Zd326+1kv3PE2U0GwzyP8B1+4gO04hKIQ=; b=EjNXeJraCfU9/OPfId/ATmLOX3
	4qw39aelziiF/jvk180UAOYu+5Zabl+PDKwqmYMisFAnKm1NWUbnPR+zmuxfYCo2G1V4AlyPzUOOi
	aNDW+uUjOkXHRtncZvCKYbJTyV85e1ay/MmpQ3ACHsNxo/+gqJCQZdV0UyFZJVm5JWZJ8wd5Qzu7+
	5zy2vlWRzc4h47Y1j1kGxSnYyZ9Tg95XRnUdMxm+OUtgNrCrB4o2Sc2bFZO3+0UZPb+sgqUMlE2Eh
	uAarvUfik6u/HQ93IutJy7XoFwWqdvNVuEtI9z/3PsYMYD1mZ6lrBu/UPPR2a8//+lKDbbYsqEwLR
	eO9//tYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wsP-0000000Dngx-31Bb;
	Mon, 04 Nov 2024 13:12:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7wqg-0000000DnKn-0wiv;
	Mon, 04 Nov 2024 13:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730725823;
	bh=9HrB0hRfb9MPWXWPeZXQEXRRgtlF7QfDTCZF/aQwKS8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GbGCE6C8wudOGBSfu79muvMfKAR2yVIJY6fKZ3raaCqVJIaEX6fTCGnObJv5S9xT/
	 LVcV69AQ/8Ic/fjsFUkOGpfUa3ye/hkVUzvgxHf635JfVvPj5givJN5R5OfiwMp2og
	 oaMIEKQMW9AhQOWlVCztjeRseIPGGqaMZNn1ZUxi0LSKrqvvhbl+PFidY8kbPL9EkL
	 gzC73UaJQr/1jJgT+Q1E8BDKjvymTZgHsGT1U2WBKNzN2cyPugLZUWGYIekG3XEJFQ
	 Ni+VH9w3FQR2vuUZVrhyehfa3m76omIpOFcT3SmARcIwp93kKL4J75Yj1VI9Y74iFI
	 1uM9UR5RxPozA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3BBBB17E3630;
	Mon,  4 Nov 2024 14:10:23 +0100 (CET)
Message-ID: <f8ca0f82-2851-40d9-983b-2a143b44263a@collabora.com>
Date: Mon, 4 Nov 2024 14:10:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] PCI: mediatek-gen3: Add support for setting
 max-link-speed limit
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org
Cc: ryder.lee@mediatek.com, jianjun.wang@mediatek.com, lpieralisi@kernel.org,
 robh@kernel.org, bhelgaas@google.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 fshao@chromium.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
 <20241104114935.172908-2-angelogioacchino.delregno@collabora.com>
 <D5DF0QIO2UZQ.29U999LYCC05M@rocinante>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <D5DF0QIO2UZQ.29U999LYCC05M@rocinante>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_051026_457469_97D2C75D 
X-CRM114-Status: GOOD (  18.50  )
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

Il 04/11/24 14:06, Krzysztof Wilczyński ha scritto:
> Hello,
> 
>> +	if (err > 0) {
> 
> You could drop > 0 here.
> 

I have no strong opinions about that, would be fine for me.

>> +		/* Get the maximum speed supported by the controller */
>> +		max_speed = mtk_pcie_get_controller_max_link_speed(pcie);
>> +
>> +		/* Set max_link_speed only if the controller supports it */
>> +		if (max_speed >= 0 && max_speed <= err) {
>> +			pcie->max_link_speed = err;
>> +			dev_dbg(pcie->dev,
>> +				"Max controller link speed Gen%d, override to Gen%u",
>> +				max_speed, pcie->max_link_speed);
>> +		}
>> +	}
> 
> I wonder if this debug message would be better served as a warning to let
> the user know that the speed has been overridden due to the platform
> limitation.  Thoughts?
> 
> Also, there is no need to sent a new series if you fine with the
> suggestions.  I will mend the code on the branch when applying.
> 

A warning seems to be a bit too much and would appear like something to worry
about (or something unintended)...

Perhaps a dev_info() would work better here?

Thanks,
Angelo

> 	Krzysztof





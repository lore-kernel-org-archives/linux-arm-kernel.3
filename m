Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91506C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 19:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFTu49OcoFU2MNqhD13fTc84uxSJ3zdV8FqsYNvRr9M=; b=B3QFffCshZVgUhETX8WmGIN1L+
	Aul7kz7j0SY3rpjCHnzulB1Ve2a3KzXw3ara9yjen94cF1KB6h9d8Q3SRxuHnNBmOTlKNedo1gbfS
	I9t/FwMfmOVMMLPTgl+JLNxbW832IitVmMO6TzMNzCTf2b1UMsHOebK/fiRtFR+YNW1L6yN+AZUp1
	2mrNdl6NoQHtMSlyTJ8zaCku8LowqylfaTVtTP57P8HX+RryE022Sxaf7nH7m8pHW/iAOK/FfgQLz
	0jP+C7FF3o9ZtZHmKkfY2pI8X+yl6OyHvGOzAq9x5/v05DqfNh3pqrvIRSVjNyFVWnj7biUrKgyKO
	LwGdiKUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ToX-0000000DACP-3dMs;
	Tue, 01 Sep 2026 19:06:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ToW-0000000DAC8-0LA3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 19:06:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A38340F51;
	Tue,  1 Sep 2026 19:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E30081F000E9;
	Tue,  1 Sep 2026 19:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788289591;
	bh=pFTu49OcoFU2MNqhD13fTc84uxSJ3zdV8FqsYNvRr9M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hndb1yFhIuNwm7aONHjx++9wFUwCYpwvIBPkXjxpLTEUp2PUAEwec2+XBT2/8QrOC
	 +m8PWXhVywXt6pd6lTbd5w0Z+/HFsiNbT8sEE9kpAgls5Cgi6/QR/MWbMQpuxS423Q
	 4+6GmWqEOnb4BGGVGsjWYHaPypcvIXQKTL6uZ7cVvlQICpAF6O0rHVYlXzDRND6GKH
	 fO0JpaDp9YDtJ0UO/DsQTj1xITo24/zyn1Z6vgNArZFPL086aRpX0cAYBgDxMJd1/e
	 pnTseL9lx7gLBjjqp6zslAzoIwr7wpARhQAsDbpwhdsOYI04eqcb2fHKyhHSP+VQSG
	 P6Af8MnvHQrBQ==
Message-ID: <05070c4a-6e78-4649-b1c4-32093fbfa80e@kernel.org>
Date: Tue, 1 Sep 2026 21:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/19] thunderbolt: Add Apple Silicon support
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Andreas Noever <andreas.noever@gmail.com>,
 Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat
 <YehezkelShB@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
 <20260830-b4-apple-soc-tbt-v1-16-44bc9348683c@kernel.org>
 <20260901100925.GF106095@black.igk.intel.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260901100925.GF106095@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

thanks for the very fast and detailed review! Will address those points 
for v2, some comments below:

On 9/1/26 12:09, Mika Westerberg wrote:
> Hi,
>
> On Sun, Aug 30, 2026 at 10:19:34PM +0200, Sven Peter wrote:
>> Add a platform driver for the ACIO host router complex and Native Host
>> Interface (NHI) found on Apple Silicon SoCs.
[...]
>> +
>> +	/*
>> +	 * The firmware samples the ring configuration when the valid bit is set and E2E flow
>> +	 * control never engages when configured afterwards. Write everything at once like macOS.
>> +	 */
>> +	writel(flags | e2e_flags, options);
> I think we can do this flow in the generic parts too. It makes the driver
> follow the CM guide more closely.

sure, I can adjust that as well.

>
>> +}
>> +
>> +
>> +
>> +	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(42));
> 42?

42! don't ask me why but that's the number of address lines they hooked 
up. I'll add a comment.

[...]
>> +
>> +	anhi->nhi.tx_rings = devm_kcalloc(&pdev->dev, anhi->nhi.hop_count,
>> +					  sizeof(*anhi->nhi.tx_rings), GFP_KERNEL);
>> +	anhi->nhi.rx_rings = devm_kcalloc(&pdev->dev, anhi->nhi.hop_count,
>> +					  sizeof(*anhi->nhi.rx_rings), GFP_KERNEL);
>> +	if (!anhi->nhi.tx_rings || !anhi->nhi.rx_rings) {
>> +		ret = -ENOMEM;
>> +		goto err;
>> +	}
>> +
>> +	anhi->nhi.dev = &pdev->dev;
>> +	init_completion(&anhi->nhi.domain_released);
>> +	anhi->tb = tb_probe(&anhi->nhi);
> You do need to setup device links for the tunneled protocols as well. Have
> you checked if they describe these in DT? I would expect so.

I'll look into that, the DT already has the ports which I'll need for 
notifications to PCIe and DP later anyway and I should be able to add 
the device links then as well. Right now only USB3 tunnels work (by 
accident: I'm not following what macOS does and will probably need a 
notification once I get to suspend/resume as well) but I'll see if I can 
already add device links. Either way, the dt-binding already has enough 
to describe the connections to dwc3/pcie/dp through the graph 
ports/endpoints.

>
>> +		tb_domain_put(anhi->tb);
>> +		wait_for_completion(&anhi->nhi.domain_released);
>> +		goto err;
>> +	}
>> +
>> +	mutex_lock(&anhi->tb->lock);
>> +
>> +	if (!anhi->tb->root_switch->drom) {
>> +		dev_err(anhi->dev, "No valid host DROM in the device tree\n");
>> +		ret = -EINVAL;
>> +		goto err_unlock_tb_domain;
>> +	}
>> +
>> +	cap_apple = tb_switch_find_vse_cap(anhi->tb->root_switch, TB_VSE_CAP_APPLE);
> This should not be done here. It belongs to the CM.
>
> We can do it in tb_start() for example, because only Apple silicon has the
> cap.

Ok, I'll find it in there and just expose it to apple.c somehow then to 
be able to write the cable info from here.

[...]

>
>> +	case TYPEC_THUNDERBOLT_SWITCH_TBT:
> Probably cannot affect these anymore but if can then _TB instead.

That was only introduced in the first patches but after Heikki's review 
it'll go away anyway. I'll make sure to TB instead of TBT anywhere else 
though!



Thanks,


Sven



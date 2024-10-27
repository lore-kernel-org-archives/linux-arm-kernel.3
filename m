Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CBEBD13578
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 18:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRsfm+4ttOXL38doVebOwSAVzLny2y4gp7NYq/iRAnA=; b=KA+rn4cKcTcbHoIuv7qUPdpyCi
	7hlXzni243EuNWBP6PZjg+e/Waa2FboEnfbc9jNNVSxpWSFDo1cy39Q0XKLSOFYqGQhfGQ+pwOVf5
	wgRrVEcHBtDotkbgvFV7l+5TdkgOAest1C4Ue9UK0JDtt3cpkCSoSxpryUJVfBnKlJ4Wd7hpZgwqc
	3iVtcC9VtYbPsOJ4kJt7huVse6VAsQ7C6fjH5u/T8fVrE2DFBm+DqBXAe3yGnKn7RrFJKKcKGSW6R
	oL9Ng7IrAgcuCbQhpXtZDLpK46qAN6Whq1pJjTb7f52tXLC7glmFHL9NATd4zGhhiaqHscs9F4QxZ
	3L+W0W3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t57fL-00000008eEy-1dJy;
	Sun, 27 Oct 2024 18:07:03 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t57cP-00000008dg3-3aa7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 18:04:03 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id C96F4A0472;
	Sun, 27 Oct 2024 19:03:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=SRsfm+4ttOXL38doVebO
	wSAVzLny2y4gp7NYq/iRAnA=; b=T0imSiSUi8SfNPL3bjugdvFvHZv0geCXp1UH
	tLJC9zzHCUbFBmSTSzNuX3u9vjmk5iv+0bRVo2/ibFTsMlEWKjaVE2WudqxhfFv4
	f56qeQPcs/to3UffaXZAbTBl0h2VA1S9FyklHvPOonMnodO42Q9mpbAnTv9TgFto
	bALV1hqIrxhoAiF8KL7cnb0qDZERcOZQ+L1KEDLgXvt+Yg59eCUfF+L+syiUcXGc
	/9MTdHgZFJMTqZbkiCEXsL3E0CbTvLvE5E+H87eYgn7raQZvaoyjAEA3o4VgU/cl
	avmn6OfVx8xejypNAS2oDgoz6BBMDjSg4nvnpJ5Q8bkIurZYENjTvHrW7IUBfmGp
	9Z2XopKN6iPHA4gIsQtm5yOam03Z0sxRLvRpCfPQryhhUVGFuthXBy2zIKa9N7EF
	gJGukIFEMIwYNjcBd+chqW6OqJehE4guSM8cKIEDlFkcrMcSjk7QewH7TPJwyTMS
	rA4znpTmmfbgjRrQzJOjw2Docgon+u21NJbgvuLrdULZ3gwA21n5abAm+c8yvqBJ
	eo5vQcCJSiRpNms1TB7h8nmKtyZyVHUzaeZEBPU2OOAGvEfiIILv8mqxps1I3YkT
	d+leQUWXBMgiFaTsXCJlyOu8r7ATBcT9DH7aT2/wGDq41+e7e6ZkqqbgEPiusQp8
	Q1AvVeM=
Message-ID: <4b614d6c-6b46-438a-b5c3-de1e69f0feb8@prolan.hu>
Date: Sun, 27 Oct 2024 19:03:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/10] dma-engine: sun4i: Add has_reset option to quirk
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
 <20241027091440.1913863-2-csokas.bence@prolan.hu>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <20241027091440.1913863-2-csokas.bence@prolan.hu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.253.3]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94855677C61
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_110402_412325_41585485 
X-CRM114-Status: UNSURE (   9.46  )
X-CRM114-Notice: Please train this message.
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



On 2024. 10. 27. 10:14, Csókás, Bence wrote:
> From: Mesih Kilinc <mesihkilinc@gmail.com>
> 
> Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
> has this bit but in order to support suniv we need to add it. So add
> support for reset bit.
> 
> Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
> [ csokas.bence: Rebased and addressed comments ]
> Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
> ---
> 
> Notes:
>      Changes in v2:
>      * Call reset_control_deassert() unconditionally, as it supports optional resets
>      * Use dev_err_probe()

I missed one, namely:

> +		dev_err(&pdev->dev,
> +			"Failed to deassert the reset control\n");
> +		goto err_clk_disable;
> +	}

For now I'll resubmit just this patch, and then wait for more comments 
that may arise during the week, then resubmit the whole amended series.



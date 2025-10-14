Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33525CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LJSSO4opn67AmxAlbg/fcji5MqiidXlUjILTzkntaEI=; b=sJ+E5zK1ckxcxnzSRyxYQOvz+P
	aeFN5GtVJTfoEeUMi5Fn+K8aUTmlq7ICFSw4GiYziS4a4SrwP00b/wsEAWw6la+GDTnXRrMNAAKJm
	810lVhOYaVmLDLpcsfxadFOv/GpkH55H9Q9MylST7Itfnd2xkcqxT4CLzovySGuLEwF/Ew/k4GSPv
	2OgwlUW7oKdHbjjDZbOd6uyqfdKcMwS1xI3R7FHqfpDXBIJwWjAqgSfjH9E1DeMXkcuUExJj9vObl
	X9yxI2UEiNpY1sV7T/dwUFbCW8G6Y7rE53N7ooBgAUqrpcQlft+Rf3HEDRKiZhWsRJ9/pFXqlxN7l
	v6/IeuQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aUo-0000000Fd3I-0Slm;
	Tue, 14 Oct 2025 08:35:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8aUn-0000000Fd2T-1VVd;
	Tue, 14 Oct 2025 08:35:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B169862209;
	Tue, 14 Oct 2025 08:35:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E38A8C4CEE7;
	Tue, 14 Oct 2025 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760430900;
	bh=gGnn14nn19buRMsFjRJqbyXn30qMIF3FN4EV6y6JEeU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tHIx0SgodJOeDzujA35S/7ES7yp8Uk7ESghpMUhqxByViRCSIo/KXvI42CANg9ojV
	 x5iuVbl3u8GQtJdgi6aO169pFVNI4XcitOjhjh0+fphsg5qYezqLGl5mNiA1IOWGlA
	 41yekkmBZA3g0d6LSK/wCe1sQwe8UHBn9THRA5oa3IG0b3t7XSs0at/YJgplO0hwlc
	 /74/GdNCXcKlwOmOLWqca9l4E5ZwMuCNZ1BMz9q5pJ5CSJYp3fs4nVbzqX+I6Coery
	 7WXQYedgVZGYfhgyL+B5MfjgGpLwvOL5tfiaDkLa4D4H8IxBK6/SAHOp1p6qHf2hjJ
	 uk6KpDJfrDgxw==
Date: Tue, 14 Oct 2025 09:34:55 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v3 2/3] net: airoha: npu: Add
 airoha_npu_soc_data struct
Message-ID: <aO4LL8racazLjjzk@horms.kernel.org>
References: <20251013-airoha-npu-7583-v3-0-00f748b5a0c7@kernel.org>
 <20251013-airoha-npu-7583-v3-2-00f748b5a0c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013-airoha-npu-7583-v3-2-00f748b5a0c7@kernel.org>
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

On Mon, Oct 13, 2025 at 03:58:50PM +0200, Lorenzo Bianconi wrote:

...

> @@ -182,49 +192,53 @@ static int airoha_npu_send_msg(struct airoha_npu *npu, int func_id,
>  	return ret;
>  }
>  
> -static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
> -				   struct resource *res)
> +static int airoha_npu_load_firmware(struct device *dev, void __iomem *addr,
> +				    const struct airoha_npu_fw *fw_info)
>  {
>  	const struct firmware *fw;
> -	void __iomem *addr;
>  	int ret;
>  
> -	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_RV32, dev);
> +	ret = request_firmware(&fw, fw_info->name, dev);
>  	if (ret)
>  		return ret == -ENOENT ? -EPROBE_DEFER : ret;
>  
> -	if (fw->size > NPU_EN7581_FIRMWARE_RV32_MAX_SIZE) {
> +	if (fw->size > fw_info->max_size) {
>  		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
> -			NPU_EN7581_FIRMWARE_RV32, fw->size);
> +			fw_info->name, fw->size);
>  		ret = -E2BIG;
>  		goto out;
>  	}
>  
> -	addr = devm_ioremap_resource(dev, res);
> -	if (IS_ERR(addr)) {
> -		ret = PTR_ERR(addr);
> -		goto out;
> -	}
> -
>  	memcpy_toio(addr, fw->data, fw->size);
> +out:
>  	release_firmware(fw);
>  
> -	ret = request_firmware(&fw, NPU_EN7581_FIRMWARE_DATA, dev);
> -	if (ret)
> -		return ret == -ENOENT ? -EPROBE_DEFER : ret;
> +	return ret;
> +}
>  
> -	if (fw->size > NPU_EN7581_FIRMWARE_DATA_MAX_SIZE) {
> -		dev_err(dev, "%s: fw size too overlimit (%zu)\n",
> -			NPU_EN7581_FIRMWARE_DATA, fw->size);
> -		ret = -E2BIG;
> -		goto out;
> -	}
> +static int airoha_npu_run_firmware(struct device *dev, void __iomem *base,
> +				   struct resource *res)
> +{
> +	const struct airoha_npu_soc_data *soc;
> +	void __iomem *addr;
> +	int ret;
>  
> -	memcpy_toio(base + REG_NPU_LOCAL_SRAM, fw->data, fw->size);
> -out:
> -	release_firmware(fw);
> +	soc = of_device_get_match_data(dev);
> +	if (!soc)
> +		return -EINVAL;
>  
> -	return ret;
> +	addr = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(addr))
> +		return PTR_ERR(addr);
> +
> +	/* Load rv32 npu firmware */
> +	ret = airoha_npu_load_firmware(dev, addr, &soc->fw_rv32);
> +	if (ret)
> +		return ret;
> +
> +	/* Load data npu firmware */
> +	return airoha_npu_load_firmware(dev, base + REG_NPU_LOCAL_SRAM,
> +					&soc->fw_data);

Hi Lorenzo,

There are two calls to airoha_npu_load_firmware() above.
And, internally, airoha_npu_load_firmware() will call release_firmware()
if an error is encountered.

But should release_firmware() be called for the firmware requested
by the first call to airoha_npu_load_firmware() if the second call fails?
Such clean-up seems to have been the case prior to this patch.

Also, not strictly related. Should release_firmware() be called (twice)
when the driver is removed?

>  }
>  
>  static irqreturn_t airoha_npu_mbox_handler(int irq, void *npu_instance)

...


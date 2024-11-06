Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B32ED44D6A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 13:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8nObiL/xV5PweP4Pq0IstHPE+IZR2yrzLVjQ95NGox0=; b=kdmQxsVXDpXBuR6MMEYSUW5z0j
	Iv5d1yTgnSrunUmmLuRehI3z749U+ykyQqmw06vXOj1cq7K7++o5Sir/tOJGpXoDopy1Ip6ETDEj3
	0SehxRXzCvD9gO4nAPyAp2fjZeK+mrRDw6WpYaJ1O/X7y6zsj3tVk4iFh4tWkil7Ms2LExi72Lrz/
	KMDw//WsN7/qSlE1lvOXQaZUwOh8cL1NoslDRZmP7cX+pCjL+yQ5ptztTK37LGLZLGKxYqih1x8zG
	/nRBBiGa6aR/Iec2tU62EWYUtxShcdRuhpPKRAY4vLHDmmytDTfByCm7mp0v36riSwh/M9glyCQBO
	t12BNJwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gSF-00000003UoB-1Zbt;
	Wed, 06 Nov 2024 13:52:15 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8g6G-00000003Q6m-0sPI;
	Wed, 06 Nov 2024 13:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730899770;
	bh=fVNkLpFzLkJsXQDVFwWhgGwWb8WzrbwjQ1RM/7ZwYPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AVJoO+oeMmm6+03UpFQIcu/uxg08bLNLx3b7YD2da7REpGSSjwKsSCYY9orX7+GLa
	 +lEPCi5Wa3UjHuyTQuDiE+qUuIRHPefudnng2qA5oVp/NObxK2okD+nu4KW8raVwPA
	 Ru8ku58XniWkPi0/f3AH5ZQWfPm8IubNRnTdIpf6hLESLuGRLYi+JWSnfpZVjLvNv3
	 yUiYriF2uZhLxtpG2jl9rLQGmPoNkO94ickQYhoKkW3SKLeefU54klvGizPyMFKC1Y
	 cvWPhVTrnbzVACKrdK2tBGK/iDvOp1fE7KTDaA71YrmhLbk27D95OmIbHk7DuuFDQe
	 oMQtWCMeVGMJg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C6A2F17E3637;
	Wed,  6 Nov 2024 14:29:29 +0100 (CET)
Message-ID: <e2e41af9-ed09-4ac5-9481-e605d1340b3d@collabora.com>
Date: Wed, 6 Nov 2024 14:29:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] PCI: mediatek-gen3: Add support for restricting
 link width
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
 jianjun.wang@mediatek.com, lpieralisi@kernel.org, robh@kernel.org,
 bhelgaas@google.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel@collabora.com,
 fshao@chromium.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
References: <20241104114935.172908-1-angelogioacchino.delregno@collabora.com>
 <20241104114935.172908-3-angelogioacchino.delregno@collabora.com>
 <20241104132046.GA2504924@rocinante>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241104132046.GA2504924@rocinante>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_052932_442688_2F265E7B 
X-CRM114-Status: GOOD (  18.17  )
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

Il 04/11/24 14:20, Krzysztof Wilczyński ha scritto:
> 
> Hello,
> 
>> +	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
>> +	if (ret == 0) {
>> +		if (num_lanes == 0 || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
>> +			dev_warn(dev, "Invalid num-lanes, using controller defaults\n");
>> +		else
>> +			pcie->num_lanes = num_lanes;
>> +	}
>> +
>>   	return 0;
>>   }
> 
> If you were to handle non-zero return value as an error here, perhaps the
> property has not been set, then we could reduce the indentation here.
> 
> Something like this, perhaps?
> 
>    ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
>    if (ret) {
>            dev_err(dev, "Failed to read num-lanes: %d\n", ret);
>            return ret;
>    }
>    
>    if (!num_lanes || num_lanes > 16 || (num_lanes != 1 && num_lanes % 2))
>    	dev_warn(dev, "Invalid num-lanes, using controller defaults\n");
>    else
>    	pcie->num_lanes = num_lanes;
> 
> Does this make sense here?  Thoughts?
> 
> 	Krzysztof


Sorry I've just seen this email.

There's a problem here: this property has to be optional - and if you change that
to return like that, you're breaking compatibility with older device trees, which
are not specifying any "num-lanes" property.

Please remember that of_property_read_u32() returns:
  - 0 on success
  - -EINVAL if the property does not exist
  - -ENODATA or -EOVERFLOW

Please either keep the error checking like I wrote, or alternatively you can do..

ret = of_property_read_u32(...)
if (ret != -EINVAL) {
	dev_err(dev, "Failed to read num-lanes: %d\n", ret);
	return ret;
} else {
	if (num_lanes == 0 || ..... etc etc)
		dev_warn()
	else
		pcie->num_lanes = num_lanes
}

Cheers,
Angelo


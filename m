Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4A74CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7dD5h28xKbQRr4UxUrtkq65CsMUEulbT/0T72CNnVQA=; b=TNFkVnCz4bUhmU9OZtBerzZh7F
	cUVQdBqHt6KWUFpfkxThaOcnT4G57AMENWj0vCVxGRnuUEhrs07wJjREpi+lCS5NuTgIaH1aI/hfB
	sF12+tXFosW/0OGZICJeqFP05q7oIDQD7/A4/c0Q3VY2my/jkz5CKaHmhzQLebJjIxQwmn+mAT05t
	K1G+kA5rzgbCbxu5G2pUK/WuBt3w+MS/ZmGXQOsVGtkR7JJd1U3r4W18Eog4TTL4kGz6u946S6FNK
	gXxtm2MeWrF8Xu1UAsH2cfbb7hoDtwOsYY31djFW0NSUCHVzMZPhH0rl0M/wP9R5u7wFcMXujGimG
	JPvI/+aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upL7q-00000001gAm-2p3u;
	Fri, 22 Aug 2025 06:19:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upGgB-000000019aD-05rw;
	Fri, 22 Aug 2025 01:34:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62F6E44AF5;
	Fri, 22 Aug 2025 01:34:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE5ABC4CEEB;
	Fri, 22 Aug 2025 01:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755826494;
	bh=wHqz9Wlbaf83KFOlw1iiLIpVVifApaYUExlNAiJWEIU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CQjccp9xKj95HCaGjGGp1ZHlHJNZmyeuYOjvHWWIEZt6jk6Q/08/c5kSClzkOpD5i
	 OqcNYTMoCT7uZitvmp46UfY5J6OGfN1Oe10hqx3MCTnR22siIKXwJsVgZVbvDNUyC7
	 OiVmADEd7ejDBxFZ6ZKTGTJ4zr43U+WS3EPbV89hwXZ+2qoiBKlFhVshQypb9avmNV
	 oEVHJyXzrYOxLSCYrvQL1tEK1W8eKgOhmQr6vScb8MxkZIqnThdpfv2Mo6VbS6ifNE
	 p7aUWcZQJQ1G0FDCKl8/8GkE4qg/D/+u6oO/Onf/gFXkKoCR5Ojw0ZYVASO5UPfWty
	 EUn04eWFEg4xw==
Date: Thu, 21 Aug 2025 18:34:53 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 2/3] net: airoha: Add airoha_ppe_dev struct
 definition
Message-ID: <20250821183453.4136c5d3@kernel.org>
In-Reply-To: <20250819-airoha-en7581-wlan-rx-offload-v1-2-71a097e0e2a1@kernel.org>
References: <20250819-airoha-en7581-wlan-rx-offload-v1-0-71a097e0e2a1@kernel.org>
	<20250819-airoha-en7581-wlan-rx-offload-v1-2-71a097e0e2a1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_183455_083260_CF4EBE72 
X-CRM114-Status: UNSURE (   9.42  )
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

On Tue, 19 Aug 2025 14:21:07 +0200 Lorenzo Bianconi wrote:
> +	pdev = of_find_device_by_node(np);
> +

did you mean to put the of_node_put() here?

> +	if (!pdev) {
> +		dev_err(dev, "cannot find device node %s\n", np->name);
> +		of_node_put(np);
> +		return ERR_PTR(-ENODEV);
> +	}
> +	of_node_put(np);
> +
> +	if (!try_module_get(THIS_MODULE)) {
> +		dev_err(dev, "failed to get the device driver module\n");
> +		goto error_pdev_put;
> +	}


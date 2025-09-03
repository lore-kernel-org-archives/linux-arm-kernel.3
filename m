Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD31CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=078pFd/Wdz2/ANWhtssdAEuutIYNAQNHN+OsZ9Wb9nk=; b=py7RNU4AN8VZ/M
	rkRa93IQ6dDvBL6ezvleLhTJpAGz5WHzh8m9fewT/lvSOOr01U/y9Qjbu05nVyGHGyig+Z7zD+awU
	TmXdPSqoTaNO+aD8QaIoRpZc5lsIOECnPPoEHZkeErPznqOkXfEK5ZRrDM2VhBWlhs+9l5zkJXerk
	DnRXPXlm6smyzr1WooM6NNhKXqtfAeoMzRzD/UwvXRjcqWWYx0FcxRouVnft8QIeY9r5h/10fqwmR
	NkFQH3CgXfIXyP1p1Hfl0QnpRgqY0r1R88BDIjVVvuL82ffpsg6TpyuzbPKLTm5svj8OzWabBTNdy
	0avLpwlUUHqzx121tTJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utsn1-00000007P06-2YZj;
	Wed, 03 Sep 2025 19:05:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utoOx-00000006iyr-2KSo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 14:23:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B7B4260237;
	Wed,  3 Sep 2025 14:23:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8677FC4CEE7;
	Wed,  3 Sep 2025 14:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756909434;
	bh=RH0JXllZP6MZUtbdIyvnSL6xOTZGtSyzuKbcwgJZhZ8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uGiphPDg6pqRYghg8mQ3iJf9rZTGTJvVgt56Ntji54toOVqzoEMmxeFzOPC0It7R8
	 33TOcKwEnNxlz54A8OS7qkEGg/j5U7pOgUnTYAJ6lnjSQGSjv5hb240/CXNXCQCxND
	 5W9UEdnq33hwParQ+7Ynp9e0qFQPgl1z1gs+Bkrm8B+Kc5kqNQHMJXaOEgp4Tkb34D
	 lejn1a6pGiHPxyVsO5l6uTwf2ROY+9cfxMLtdZlud4b9vFoLCpGkUP3BuA6FmrHVOk
	 6HT2/7tKocLDXCApRo3xnxsNBwxsj7IHGMT9FXqqmU80u9FtnyHtjTQ/vY3TU30Bkx
	 yQjRdEjmbZcFQ==
Message-ID: <9c2a863c-0c8a-4563-a58d-d59112ac45a8@kernel.org>
Date: Wed, 3 Sep 2025 16:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 2/8] dt-bindings: remoteproc: k3-r5f: Add
 rpmsg-eth subnode
To: Andrew Lunn <andrew@lunn.ch>, "Anwar, Md Danish" <a0501179@ti.com>
References: <20250902090746.3221225-1-danishanwar@ti.com>
 <20250902090746.3221225-3-danishanwar@ti.com>
 <20250903-peculiar-hot-monkey-4e7c36@kuoka>
 <d994594f-7055-47c8-842f-938cf862ffb0@ti.com>
 <f2550076-57b5-46f2-a90a-414e5f2cb8d7@kernel.org>
 <38c054a3-1835-4f91-9f89-fbe90ddba4a9@ti.com>
 <6e56f36f-70fd-4635-b83f-a221780237ba@lunn.ch>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <6e56f36f-70fd-4635-b83f-a221780237ba@lunn.ch>
Content-Type: text/plain; charset=UTF-8
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
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org, linux-remoteproc@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Fan Gong <gongfan1@huawei.com>, Xin Guo <guoxin09@huawei.com>, Lei Wei <quic_leiwei@quicinc.com>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>, Lee Trager <lee@trager.us>, Jakub Kicinski <kuba@kernel.org>, Mengyuan Lou <mengyuanlou@net-swift.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Roger Quadros <rogerq@kernel.org>, Lukas Bulwahn <lukas.bulwahn@redhat.com>, linux-arm-kernel@lists.infradead.org, srk@ti.com, Paolo Abeni <pabeni@redhat.com>, Tero Kristo <kristo@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, MD Danish Anwar <danishanwar@ti.com>, Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>, Parthiban Veerasooran <Parthiban.Veerasooran@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 03/09/2025 16:06, Andrew Lunn wrote:
>>>>  	mboxes = <&mailbox0_cluster2 &mbox_main_r5fss0_core0>;
>>>>  	memory-region = <&main_r5fss0_core0_dma_memory_region>,
>>>>  			<&main_r5fss0_core0_memory_region>;
>>>> +	rpmsg-eth-region = <&main_r5fss0_core0_memory_region_shm>;
>>>
>>> You already have here memory-region, so use that one.
>>>
>>
>> There is a problem with using memory-region. If I add
>> `main_r5fss0_core0_memory_region_shm` to memory region, to get this
>> phandle from driver I would have to use
>> 	
>> 	of_parse_phandle(np, "memory-region", 2)
>>
>> Where 2 is the index for this region. But the problem is how would the
>> driver know this index. This index can vary for different vendors and
>> their rproc device.
>>
>> If some other vendor tries to use this driver but their memory-region
>> has 3 existing entries. so this this entry will be the 4th one.
> 
> Just adding to this, there is nothing really TI specific in this
> system. We want the design so that any vendor can use it, just by
> adding the needed nodes to their rpmsg node, indicating there is a
> compatible implementation on the other end, and an indication of where
> the shared memory is.

I don't know your drivers, but I still do not see here a problem with
'memory-region'. You just need to tell this common code which
memory-region phandle by index or name is the one for rpmsg.

> 
> Logically, it is a different shared memory. memory-region above is for
> the rpmsg mechanism itself. A second shared memory is used for the
> Ethernet drivers where it can place Ethernet frames. The Ethernet
> frames themselves are not transported over rpmsg. The rpmsg is just
> used for the control path, not the data path.

It is still "shared-dma-pool", right? Nothing in the bindings says that
all memory-region phandles are equal or the same. Just like phandles for
clocks. Some clocks need to be enabled for entire lifetime of the
device, some are toggled on-off during runtime PM.

Best regards,
Krzysztof


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3490DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1lMiU0snf/HWUkj0h1u5DaKHqk1zmLXzrCIr1tt1R4=; b=s8wAbDV9SckGqWl7K1OLEhnDAY
	ZmSLLbWtyjtnUKf6r4G2Rb/7opK83gygMfNaSP6z9RvaZqyiAi95ByGHwkeDFVlirexnOtesIWoJL
	TLQTIEyM/q2fA3fvzWKqSq6Ax6Cvy4b/7OuEgqiHKbP0eRxQheSCNDUoP2I5+9gqmY/OY+E0Vd2ey
	riU+pvIMe7t/OAw8+oFrfgqRmLt9ThfkiQdBU5ggl6tGMBSjf5eAXXSjb3neqDXEwa/1t6+KKiKEW
	TBhX70BhyxTAG7OWxqBc0F/zY/5vuoiZVyHRBkaq8yArd++sQcL34+M86ZNkq88U2tR4SYhpSXihz
	MVxIBH5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJRD-00000007OSB-3qeX;
	Tue, 18 Feb 2025 08:58:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkJPk-00000007O79-2VtZ;
	Tue, 18 Feb 2025 08:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739869030;
	bh=2vE8L5fJp+dtJyWdQbSVt0omOCEQO0xF00KJ3QonoKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HTLwXxO+GyF1AD8FucYG29B1fK/lOd5HKGq+eU7n3INbr/PXWBliw6JzFvF7421MN
	 hVl6i6IzO7bTIAGbQBFDLUT7fwRd+wMWhA/ik1ULEcoU3kUkh93PXjephjguDhySuM
	 CmC+GdxgZnokHX8UesfiDF5xgtbjPcm7Dj2nL+pPVXXNToAMwvbGnC/mHMXLUMjw8u
	 sVlYbD3RVIg1eNGMndq6XgRtwqk6xqPJRO1XiSfd4/M1Msj0oMhtB8QKotY/eBsEOs
	 cgA1/9SBpKX7ROGTANvw32SiSHRG3t7JX+9w7gTTqKUzm1M2HpOYcQxaYqZlbcmcX9
	 qN67gFS9gcYog==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E178217E0657;
	Tue, 18 Feb 2025 09:57:09 +0100 (CET)
Message-ID: <b26294cf-c751-4507-ae01-4f510cb4834a@collabora.com>
Date: Tue, 18 Feb 2025 09:57:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] dt-bindings: usb: mtk-xhci: add support mt8196
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mathias Nyman <mathias.nyman@intel.com>,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <20250215100615.808-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250215100615.808-1-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_005712_815400_2EE71720 
X-CRM114-Status: UNSURE (   6.92  )
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

Il 15/02/25 11:06, Chunfeng Yun ha scritto:
> There are three USB controllers on mt8196, each controller's wakeup
> control is different, add some specific versions for them, and add
> a new compatilbe for mt8196.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



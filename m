Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C18CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37Kw17UEYD3zWagV65YKz/ft27RncDaMvdFGGXjJVMQ=; b=Dg3GjGiLauByOEgRevvsl8MdyO
	NMJgt/xY1bcgk6+Oz877eQDUQIYq3ngNYrd/DoD6KTQc7FqU/gXy5NQDC/U20/+4Cy/R4J1ApvzVc
	bEXIsxSwuiKqhIAvoEaEPW8h+WKV1EaaKEsQeC7ZWFnSalH3CZHOf1ndpiqgUWFeRJ5JTAzxUx+lJ
	Pgfr1Rxw7ogo4sB8LfXt/0KvWPJa8QpLrn4os9UHNbEvTUeWDcXg/uljfwiHJW5WXNwM2ym9iEDiZ
	xA+VcvvyCLsgwQClPyqMeJsfCudm36Gx0MgK8+ti/7e52vvP2+/C30/PrJIzPpqk8eue8JWvlfBhz
	eXECYztQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Arn-000000026YP-233t;
	Mon, 29 Sep 2025 10:12:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3Arl-000000026X0-0NwT;
	Mon, 29 Sep 2025 10:12:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759140739;
	bh=blyUVP/L7aV6tYV54t02hLhWyL0FwdsLZ5jlMROWX78=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iQa7GANJ7eWc7Lvjeez0qCr/Z0sZ0hmu5S/3ErjNfDYEqUGfuqajPhlFjxHQLNbEQ
	 o6V4aMv17COS0Vh0mIuUOrVrROD9Dgk6pJXF1wZPoQfUrgXeMfRPcU+/RZaf/bJUZV
	 UAQ3OOj/HUywAIk3OwvrZuXWdQosJ5djzFKVEWuB1uzLZ5CnG5isWP6D2RVYMvoGcZ
	 xAfIV4+TN5mHAIC+7acdhL4ou4O4IrWWyGdILsqfTNfG5VUymwmVNoTzz+cSu3jv1t
	 4LZm4jf+FPQ/eHR0bFHrBRMI0W/wK4Px0HaYAiktvxrD3CRouEO/qKJKBVijukqNAh
	 bZx0ATNJCRKaQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C45C17E0125;
	Mon, 29 Sep 2025 12:12:18 +0200 (CEST)
Message-ID: <2ae6bf56-54d2-48c7-a6e9-d378d41f40df@collabora.com>
Date: Mon, 29 Sep 2025 12:12:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] PCI: mediatek: add support for Airoha AN7583 SoC
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 upstream@airoha.com
References: <20250925162332.9794-1-ansuelsmth@gmail.com>
 <20250925162332.9794-5-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925162332.9794-5-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_031221_284738_88748ECC 
X-CRM114-Status: GOOD (  10.08  )
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

Il 25/09/25 18:23, Christian Marangi ha scritto:
> Add support for the second PCIe line present on Airoha AN7583 SoC.
> 
> This is based on the Mediatek Gen1/2 PCIe driver and similar to Gen3
> also require workaround for the reset signals.
> 
> Introduce a new bool to skip having to reset signals and also introduce
> some additional logic to configure the PBUS registers required for
> Airoha SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




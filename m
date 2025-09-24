Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D16CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgH3mRAmKAPsyrnQbbiNJ3RYBy7qC5ALKa2jB9tm4zc=; b=ZWpApsexGakKPDbRp1MTsLjI3+
	I9vhmWW/+pu5dSh6gvQhCzm38iTRMgxb7nZL78n1iZJZ9G+nM8tdVnhd/89T45qs1oxTPp7KQqn++
	xxB73LN4ZA5SP3zn3hT9iVToMOtCQ1LxehDKweximJLXABk3ML0UAe3fXF1n9VTQU+uwBZMySVJVN
	VAjhR3jUepM+NGAxCz7FFk5758dRk38MrIBwb3rneQOYIt9SPNqaPtnIFK3d18U8wzTSMidB/uDTR
	0msa0/+KftyUyA5GyoVlQiAgmnahe1wucgXuaR+XEMvuohysjXC7WB+k8g/U5WSxsHKPtXwbPfrtm
	riBY/E1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1L3c-0000000Fuyo-1B0i;
	Wed, 24 Sep 2025 08:41:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1L3Z-0000000Fuxv-2abv;
	Wed, 24 Sep 2025 08:40:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758703255;
	bh=gXC0TIrjtt2H2hnirLrmLxXWil8GQdYIzvmwDbexWv4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BoycKNLxBpKS7o7K2G6u08bk0AR1/6FDaoLq4ouUHT8QbBwgx4d26LmjoT/bO82g0
	 1Rch6X9SMSIdwBFJKcI2pBeuWgqhXojAyS5e6e0Evon/rc4tB07sIfIxp8IAo1FXs6
	 H2aQVi/TMEbFnx+Lkb9jsFKCngH4iEUNFV5Rr/DlJKGoRBGyYe45j6IjcX6ieC3W1M
	 0kNgKzPTkqpuNiEIHERnXlPLBNI/0uczTtIxRM4iDytO0urEBQe71zqlUSBDCgIRdE
	 pWpQtV46syHtpRg5o43gP2l37ISIhLYQOMeT/m/IKXuXefmJqYdQ1KfXY71hY+qlbN
	 AQsLsPZAepXTg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14BD517E0237;
	Wed, 24 Sep 2025 10:40:55 +0200 (CEST)
Message-ID: <d2b9fae6-eb73-4484-9048-67c0c8507171@collabora.com>
Date: Wed, 24 Sep 2025 10:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] PCI: mediatek-gen3: add support for Airoha AN7583
 SoC
To: Christian Marangi <ansuelsmth@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, upstream@airoha.com
References: <20250923190711.23304-1-ansuelsmth@gmail.com>
 <20250923190711.23304-2-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923190711.23304-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_014057_811747_62678488 
X-CRM114-Status: UNSURE (   9.06  )
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

Il 23/09/25 21:07, Christian Marangi ha scritto:
> Add support for Airoha AN7583 SoC that implement the same logic of
> Airoha EN7581 with the only difference that only 1 PCIe line is
> supported (for GEN3).
> 
> A dedicated compatible is defined with the pdata struct with the 1 reset
> line.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62CC9CAC5B8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k3OI8dqzCXAlrwcNBsODFWErW6N73sg9XsAnuc/ZS70=; b=CAIhgOcOTxPmcUP3vnhJba0d5j
	lstT0Pw5Z0m0usHWE8vZibwwiI/TE7Xub3xFlrpWynuyN1yeWKESWgtiFzDL6xsMPpqxnb+PGHmCA
	AbxL8S67m9c1FQZrqCCO1jsG5AzPm+MeA3YO2NQoxgmw/5yKbtnLqlasl8jv0oA/jTApj+0vbwDEu
	LE0ETHg+VxCJiABm9DlP38pCZs0loIawEKd+0QukDSw2X8Tdh3OER98agP93arKN8lXbOY2GxS+oQ
	/RwPk24M3v1wt3s64nwFCWyET3y+q1+2DR8V1EouMUcwFhxSfYzesofM5PAzylfNPJjgdRyRN8mIM
	vfbXXckw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GdU-0000000AHFU-28ut;
	Thu, 02 Oct 2025 10:34:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GdR-0000000AHDw-40Gu;
	Thu, 02 Oct 2025 10:34:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759401243;
	bh=yCHwgWNVGCTxuuG33TUZ1dUtpx+S65GKZJdMcIKh/u4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FEqpewgygAdLWN4GejD4G3au5APVkAWwxzYwAhqQsX2cH/YoAk3f9fY4fY3gNKWq5
	 OVvREIT4CCMYz/9wa9KCofWUZPRRK+brp6ezfunnU6T7wPHotA8CkgpAiTSSVSw/jq
	 qvK+7tE73h/XLy2gaKlozS55gI4oU6ecw2ugERVwWAyXATBFrDomxfL5myXbZQWjYt
	 2acwSwCEtPjjA2SUqtXq31uNWhSukDtRhzmy+ed45eUe1PzL+uxWFgxwxqg57LqSMN
	 QLgxCy3BghLFGm7kaDyXI7uqPkJnHo7QlpANJ+3eu7qUcFDryOg82GTlTQFqYFdzQb
	 5K0eO1mkRU8SQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C0FED17E02B0;
	Thu,  2 Oct 2025 12:34:02 +0200 (CEST)
Message-ID: <e584b589-e9f0-48cf-9e75-a6ed64d9f7a3@collabora.com>
Date: Thu, 2 Oct 2025 12:34:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/2] mailbox: mediatek: Add mtk-vcp-mailbox driver
To: Jjian Zhou <jjian.zhou@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251002084204.15898-1-jjian.zhou@mediatek.com>
 <20251002084204.15898-3-jjian.zhou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251002084204.15898-3-jjian.zhou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_033406_161254_26307878 
X-CRM114-Status: UNSURE (   5.96  )
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

Il 02/10/25 10:41, Jjian Zhou ha scritto:
> Add mtk-vcp-mailbox driver to support the communication with
> VCP remote microprocessor.
> 
> Signed-off-by: Jjian Zhou <jjian.zhou@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91BAAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 07:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xM5Vp0ejvQLakNL67klFnSYqmCFYMtTTByxp+2HpAfk=; b=3QF3BSMbt/E530wd5Bw3VccJ58
	Ee52ASksG80nMhea+OY/e/8gcuayPCKZPL3Egd+lEMnuel7SiapuvOWn9tuyipTbumKLp7lS5RrMu
	fo5wTlaGqzTMDUgkbVHsw2Nkn6RUt0mZe/yBxdBMgl96R5HML2muSQQNHGIaOTO+0KwJBJiaC2py8
	QelQR0WjXDoX47BlDuLenpWPmXKPOGCx34GbvbLIVbIyGIgz3ZPK6Se1GUjn+4M6wwwSoaxZb+p1v
	57w/Kn1tW5ySeYYL6TWcBE8nG1XzwZCLkd1zmSxrqgJw5qciVWd7a4ustRBcL9Zl9cgjoNyTLJElE
	t1w3aV1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucfA0-0000000BqEg-1spa;
	Fri, 18 Jul 2025 07:05:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uceq9-0000000Bnnc-103P;
	Fri, 18 Jul 2025 06:45:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752821103;
	bh=Flu8f5EEMoareDycOibeeDu3AxB1XnSACgaMHVsyW1w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DwS0PG5m6sy8pPsSDEEPkvprigDV/c5LttouP7znEuzfmyNRglSTvLZd07oracBng
	 jDnOTaXFvrL/l83ZUOCpI+KHO6ojM9yqDnTB/Cu1qGRtDwKiKriNdFcAcvU+3KYsJS
	 igv6SR0FFKXofVtRVWudolGkdWUVlSuKzIChIOyosFoLFE082xvIYgseM/JndxKVas
	 9ubYc4UpQhpMMzc5Z6vFXwIyHKXNSuMOX+tUHDXuPqosjKabEIkvlrO3Jk1wtAE/Oe
	 4JV6uYUYheU3Lh7d505ApkMOVsBDaA0ZFEe6GKjOLU2CbrD+E0ohcP0Wi1aZILexk9
	 erbIGHatW5WhQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0455417E1544;
	Fri, 18 Jul 2025 08:45:02 +0200 (CEST)
Message-ID: <409ef1d7-1339-4089-ae28-37a7c032d15c@collabora.com>
Date: Fri, 18 Jul 2025 08:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: mediatek: Add support for
 mt8189
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Lei Xue <lei.xue@mediatek.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Yong Mao <yong.mao@mediatek.com>, Wenbin Mei <Wenbin.Mei@mediatek.com>,
 Axe Yang <Axe.Yang@mediatek.com>
References: <20250711094513.17073-1-ot_cathy.xu@mediatek.com>
 <20250711094513.17073-2-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250711094513.17073-2-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_234505_429614_1A68781A 
X-CRM114-Status: UNSURE (   5.86  )
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

Il 11/07/25 11:44, Cathy Xu ha scritto:
> Add the new binding document for pinctrl on MediaTek mt8189.
> 
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDCEE77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1I13lWmYyz3lcb7t1Bm62ddpGsn+ruZJv5ADU7rxo7c=; b=qoA1rgh9MDYYuMW8kGV4RScCV3
	pw9e6ctNiyg0QIrQWzILVP6lWSdGsQbNgiauHtpjY3eGOMDDkcUrujNxruKwk12rcZw9WVh/SpkFw
	K9cjSBg7lXcoYfDoMohpRR0bAqwlrXlVtTMfoXCJcd8BzEIiJD5ZMuFHnoKsqZpd+gvDoYikk0Uza
	povTm93MDd262+qdxleipHeWJhuM9NFPjrwOfWBzjAiIJeym+XH2r0mAPT2mOrH4GtYED8Fxw1Sge
	8jCI09pBxIhB6Tpl/xGNnjjdH+BXT6uK3zw24xJk0OLSgJx+a4UamH+e8TLlFxMgcEU3xmyLvwEh8
	kiPcUl6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqce-0000000BhOL-33VX;
	Thu, 09 Jan 2025 11:22:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqZq-0000000Bgw0-2qbF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 11:19:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421588;
	bh=MYB0yAjxoyhbDi50XtUpsGNrWVikNTnxxJs1VA0CsbI=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=iWroFgmDaUTpLUd/8EIbk7IAg3CIGCAnaZsv3NRCD2+VrnXKIHLbosH5aqXEeg/V4
	 yNHSOKSWXGqYFCCWhbMN0eZxPnY5zChZnn0zqfM3+IATOdJtsZizNWaQ4n39DTvm99
	 /CJd9kPdfpxcl21X70waImqyrCXSNCqU2Wo0nam5Lfde3eVl5K8+oGZkGcctX+Pwej
	 ndy+AF9omDIwmBdKM3UBdV6kjg6pMpUaMbUeLte6MN8VzlrV3ChckLSvjfKLNjyrHn
	 sdmVt41fdGmTLwovY5X6D5TxKeVN//bqIgE9QRKqV0u55jZtEhSqh2sEv/o3LnbXiE
	 MqyM3xsDLnwFg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E98C317E1569;
	Thu,  9 Jan 2025 12:19:46 +0100 (CET)
Message-ID: <1e442fd4-1361-40d5-a152-adb16704a982@collabora.com>
Date: Thu, 9 Jan 2025 12:19:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Bara <benjamin.bara@skidata.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_031950_890428_69028C48 
X-CRM114-Status: UNSURE (   8.63  )
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

Il 07/01/25 14:10, Krzysztof Kozlowski ha scritto:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For iTE IT5205:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




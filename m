Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B4A1CCA468
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nq6jhWhqFYu86W0WPvq5nngq+igyEPYcUkXesgVhfaw=; b=KHpiWMJJqPfDoSCO8kSk1oSuPi
	UxN8gZbvXp/c+fyiAQoHtcWv0hFHVFzv4os8NzsGAeYGJmfX2a+oiGxuoX8qZ1Qxvspu6bC0YQA5H
	I+6eo6rY3gM9ZomxLHfQ+v85oS+fMsbop+IKtaDrYj1Hx1KZqQZH0rE0FxbPjI4mf4oc5CXH+8La2
	tCExZF+8K/sg42FT4moeiqiqheJPOHBQBbKn5QZRDaqKvG/CLt30lrtOMtTj2hWBuwWwXqFWTsPac
	nH+alBWM7Zhw+W7UDWOPM/TeXnSiALC7lGMWAxgYeQn6DOGDYSvl24bbQEdpuQqouCbw8qVmsu1jv
	6WObnbFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AqP-0000000262c-2QEX;
	Mon, 29 Sep 2025 10:10:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3AqM-00000002625-2JuK;
	Mon, 29 Sep 2025 10:10:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759140651;
	bh=oOq/K7RTeSRws70Trwj2HjoDrovM9ft5yZ0P7I05xrw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=btlpg6OccvX6sm6yAdU5r0isl8r5hNC5dQcMow5Y2wBFpXXp86cTCxmNF9X3EgQWb
	 8uuWVuphWoD0MNJ+LaWccoPE5Y8z+AUvQj9b8FaF8mJg+met5EfmkAZJbmcUwOKoK8
	 V148lh+aYG0nk8zV/AFgVbHDaQE1mW4lFuuPIc6MHZ/za4FHTkLM6MVrxx6XpvIJGJ
	 gp1OXGDV+hWRaDwg52EQ8jAviSp9gPBqp3vvruYgdEvqYrwJ2uzWQ5VvjTl3xnaFP5
	 K9ZRRf91E9rdcW5mMPI0NUl35ac/5H+zQMrQg6iONIts417VRJL10H/SqCv2L2DrHX
	 /38M5hwnFc9oQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F60817E003B;
	Mon, 29 Sep 2025 12:10:50 +0200 (CEST)
Message-ID: <38e03c8d-a038-474a-b62a-897694299642@collabora.com>
Date: Mon, 29 Sep 2025 12:10:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/4] ARM: dts: mediatek: drop wrong syscon hifsys
 compatible for MT2701/7623
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
 <20250925162332.9794-2-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250925162332.9794-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_031054_753484_29D6317D 
X-CRM114-Status: GOOD (  10.48  )
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
> The syscon compatible for the hifsys node for Mediatek MT2701/MT7623 SoC
> was wrongly added following the pattern of other clock node but it's
> actually not needed as the register are not used by other device on the
> SoC.
> 
> On top of this it does against the schema for hifsys amnd cause
> dtbs_check warning.
> 
> Drop the "syscon" compatible to mute the warning and reflect the
> compatible property described in the mediatek,mt2701-hifsys.yaml schema.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




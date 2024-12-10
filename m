Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD25DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 08:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wn0GSYmONmbslt7dO8ydqzTbIRd55hIrQYVYc6W7YU=; b=kEUY9egfLAt82/g69jKsD9F9xc
	481lCIy7ppCuP/ABnccrSZabCX7pVJVHLZq1/9MSKRjC2NKCqaA+2Dl+jJPuHLVvkqrpH4EOYC1cK
	qqusE7p/YAEk4XnummYm832xRtFo1KyzpP+NnEEYCm8cvsjRQ2AlNhneFg/e4fXqSCnXgA+uawGoj
	+ORiCHciYjmEZ3USmGv1XhxQwgbncD+A8A7KdqG0SVkiQ3USIhHT+TknGDXKT94PFIWdBq6CEy5Ba
	n9yzGEEDwIjfs323ao08ugeFiGLpkj4TajavuRT0vTZep1qS++PIV2ttpXdgdRcNwPimKtxtePg2f
	3FgbqdMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvii-0000000AjKa-3zML;
	Tue, 10 Dec 2024 08:35:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvdR-0000000AiII-0P47;
	Tue, 10 Dec 2024 08:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733819422;
	bh=D/akYzP1UwzneFmaGWcaSpwJggtt+UsOpmWeS6mis/c=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OtaEKcFobIeglbDwbkmFobtAfnmBovLhDxJUjjWL/t6PVvSZuaXLtSI52sIOfl4cC
	 UtbFmBpoY+yxn4c8d1awEsyTc9Kdcth6HFh0F1y/u4R8CaksvsMz4RvNHL2RrHhX57
	 R1yxriioWrVYsJPnfSOV4DKmdVltVeho0r3k3M8FsMNW03tJlKqku+I7YB1FGxVm8F
	 1SClMyOrznX+s7HdGlCiHVPv7vOiRtSAlsixBXyO+i+yxTHf5IlPyetUcBArbByBgp
	 Hb8dlc39gcCQllZNMZ/XLD8FqbJQx4zan8YaIzkhqbPdSBV7dXoVCDltf7oKH+/hGv
	 wjV2Oa0q/wdog==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BE24217E14EA;
	Tue, 10 Dec 2024 09:30:21 +0100 (CET)
Message-ID: <ad1ac38c-6a04-4f84-a8fc-998d97c542e5@collabora.com>
Date: Tue, 10 Dec 2024 09:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] soc: mediatek: Add command for APU SMC call
To: "Karl.Li" <karl.li@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Chungying Lu
 <chungying.lu@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 chien-chih.tseng@mediatek.com, andy.teng@mediatek.com
References: <20241030013533.855696-1-karl.li@mediatek.com>
 <20241030013533.855696-2-karl.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241030013533.855696-2-karl.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_003025_305776_4AE37CE6 
X-CRM114-Status: UNSURE (   5.83  )
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

Il 30/10/24 02:35, Karl.Li ha scritto:
> From: Karl Li <karl.li@mediatek.com>
> 
> Add command for APU SMC call.
> The APU microprocess's start and stop sequence will process in ATF.
> 
> Signed-off-by: Karl Li <karl.li@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



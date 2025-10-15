Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EE1CCD194
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf2YweQa1RNMSfzptNEFCt+FG2nffbQxA90unWGKtSU=; b=hLuTFMi2Ues0uPbvxYAWmi3yob
	xgNVQ5yAKsToIS21nTVqVOCNhPCZjZ6x9NnChZg8vMT+/gH0ilgJIbxKGYyxOHnvCO4bXXpGg5Ssm
	7wJ0LdH+sLBwTrQIjomPPsoHW6CmSlcX5IfGAvFDbnLFCK+d6Te8n1gp5l1OnA/d9lGPV4txQ04V8
	mHU+yHYsq8ciQMF3AHScJjfEwktwtfJYHB1ZDd2kNC2RBoAw1mJ6NWLjhOQi2imlkSEhZITjEcF3u
	hl7ugZWG2drnGEoa7KxG3FjflZh55cTevaZxD8MsLDvxt7QI8I2dv7E+9JAdxmfxGHeKuKdw5MJ92
	vrAHhGaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92xd-000000020aU-1YND;
	Wed, 15 Oct 2025 14:58:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92xZ-000000020Z0-45IO;
	Wed, 15 Oct 2025 14:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760540314;
	bh=fDOmNPkc8pzUUHIPZufp/adQkxap2A2ApP7//urC4X8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jCLw79ygkzloTeEZD5dC8uB5ZcSc4KljWGAySBYCDiPK4BM3N8J65Odjs2n4qQS3C
	 GieJ458Pa6vGj7dM+AE4nHV59H8xb7mUSVndmIbtj4WzQKhshO9YIsx2MK/NkBhLgi
	 pEoS5cxtbItV7+t3UbIX05yzIqIQqjzwe6gT07bgX7+UmC7Pckw8yOBGDONIxiql/p
	 hvxBsKIkUDk5/0axuKto//arbq2E7B2QaOznaTiEd2XgFQWQxfBjNFdw5PdXr+VSMm
	 5XX4ZO45S0Op7fPwfBJxNDk3+ks4faSW2kmafT4CTVOlEC/uCXIlC7xboCvWITYpun
	 oDorU67v0Frbw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7F61E17E00A3;
	Wed, 15 Oct 2025 16:58:34 +0200 (CEST)
Message-ID: <c7a2bf5f-a4e7-4b2b-94c7-b39bd69b78ba@collabora.com>
Date: Wed, 15 Oct 2025 16:58:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mailbox: mtk-gpueb: Add missing 'static' to mailbox ops
 struct
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Chia-I Wu <olvaffe@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com,
 kernel test robot <lkp@intel.com>
References: <20251013-mt8196-gpueb-mbox-fix-v1-1-d7de0cb20c36@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251013-mt8196-gpueb-mbox-fix-v1-1-d7de0cb20c36@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_075838_164724_7E7C74FA 
X-CRM114-Status: UNSURE (   8.44  )
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

Il 13/10/25 10:09, Nicolas Frattaroli ha scritto:
> mtk_gpueb_mbox_ops should be declared static. However, due to its const
> nature, this specifier was missed, as it compiled fine without it and
> with no warning by the compiler.
> 
> arc-linux-gcc (GCC) 12.5.0 doesn't seem to like it however, so add the
> static to fix that.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202510100629.3nGvrhEU-lkp@intel.com/
> Fixes: dbca0eabb821 ("mailbox: add MediaTek GPUEB IPI mailbox")
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




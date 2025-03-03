Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71662C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewqjOqaFVyuPmmmHVQjjsuN9Wd75eY+3izMspYmndiY=; b=eA95AidMQ4p2FsJpVXRM6gkkmK
	7eaA2ZKujzSC7ynEjTTmbFvNn+IfuYxZ5L9/BRfzh4TkXjUn27CkpbvnoIhMpZMXZvFmT8Cw/B8cp
	BgiEWTZa5lGZU20Nyk3rjJRrx5UFXyIMoG1ZRKuHhqJz7yELBpT1BJc/nD1noi0Dgr6sx3Sx4VM4u
	zfm4YYCBAYTJqQqBtvdEQHzeA52ie8mk5x7GO0+8lv24n/9rveqNMWB+eVp21pE0grISItD14Fyz/
	diWclFXn+nUesvzFKFe6fzoR6WNcylR6an0aMEiuLA4194boPimkhcsup32HnzIvEMvhvBsPOwm/s
	NyPqETHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3xf-00000000Yhu-0eBt;
	Mon, 03 Mar 2025 11:27:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3fI-00000000TCm-0QLm;
	Mon, 03 Mar 2025 11:08:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000130;
	bh=U0Tos3mMbe1iGpS/MgjqLP6xsa3P3UW2Uj91/mf+ZQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TYFf6SKlzAbTzNorERlOlv2Cj6AT3jZ9vY3bXJXQv4O5mkfqFuQN+AGjHuE3YnTT+
	 dZU9VdG0+X+EmKUJLumiKcmyOqhe6lWyOuXxPwZqE6XRTfpco1mUbApXwDsMLWpUcG
	 uN0UX2Mw1MNs3ZQfx3i/VcApJcVscZJxByTO/13Kc6sNhC/VpA4KGMMKS8onCahXKT
	 9lE4XKgZIrDXEsQ8HwPPKFFJBK47f6qTHk6EJqBxMJTIKouo1P9KJW94NIbq8VHtPX
	 mtggs32TH4anjiE1ZiH0KkKop7lAzTG6iqrMU9vhkExolrK/gj5W/AAemplAj+gHPe
	 V90xI4YKyb+2Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 86C7517E068F;
	Mon,  3 Mar 2025 12:08:49 +0100 (CET)
Message-ID: <0a003d4c-6302-46f1-9f49-7ea8dc7cd049@collabora.com>
Date: Mon, 3 Mar 2025 12:08:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 18/20] ASoC: mediatek: mt6359-accdet: Always use EINT0
 IRQ
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-18-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-18-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030852_282221_DCC50AB4 
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

Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> The ACCDET block can generate two distinct EINT interrupts: EINT0 and
> EINT1, and which is enabled is currently determined by mediatek,eint-num
> property in DT. However, only EINT0 is used on the boards that are
> known to have working ACCDET. Since there are no current users of the
> property, remove its handling and instead always enable EINT0. The
> property can be properly introduced in the binding in the future if it
> really turns out that other boards require EINT1.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021C8C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfNwGEebCzi4P+YubCzpRa+dGakIpTAv+r26R0B8N9I=; b=zEoR9kNx+cKYXzFPPwqxLT89E0
	uhn4pY6Grw5pccxy7m7SBbVommdwHGRooVZJTfuq+9ERvR4L2r3r1zxnhUFe+mvhwV2B2iDGDc+aa
	7P8/wm2Nr6bxl+nzqtpGm2klOeSXUrym9yammqHZdT8B1nAuLDOBJOP48/CTuQJu0MvQWXwp/ssWq
	2pyydS5mL8OxZ5IA7/VqMRDRxvSio/8nDMCnk/UwXE9ywkjSFRrP1wGCRpKJ5b6uJ1cuYpIWo0kUC
	fswy4WUwAZHIStovzJJOSckE1sWLsy6qncPHLJHpwkPSReDFR9/iWrxLQiJSnSJWZf9aqIOeK+HzN
	FPf9ePPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp40l-00000000ZTq-2Hqb;
	Mon, 03 Mar 2025 11:31:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3fr-00000000TNG-0bI4;
	Mon, 03 Mar 2025 11:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000165;
	bh=UlYDQTcQHBFCTW4vDwKseNxVoKFZraiVmwlJtLTanV0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qpfo1opYNbKxaBM0tLBtIm92R21KRGzSajcyvY7e7PDCArZlL2NRYjiLvLfggs/wJ
	 kdCpUbbMisG4C/XISDP2x3ZBTU5zXexEts3gJO0HVsTUl0XzVKVOgef7t0XOwaIZ0H
	 CDKzpHrTA9ceWzo+iTyJcYbWSxKT5I42qOL6q4DXEq3Ysz0sxNt9uxWNS13bltN7KE
	 ToYaayPfGwK4lkjmTdq17elmoOQDprYmiSkqHAf2WOKrceTnvZ692ojJIdHyyu13eJ
	 2aUGmNbl8MIy+pkbuWNVQRA2fZycSY3jejECB09xG7EdMCzr/lKJ9DCiiZVMm7/VlD
	 +T8JgG7xbuWpw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECA1317E068F;
	Mon,  3 Mar 2025 12:09:23 +0100 (CET)
Message-ID: <746eaa07-6682-4088-ab20-f1536e4cb106@collabora.com>
Date: Mon, 3 Mar 2025 12:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 20/20] arm64: defconfig: Enable MT6359 ACCDET
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
 <20250302-mt6359-accdet-dts-v2-20-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-20-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030927_353117_6B5B2A76 
X-CRM114-Status: UNSURE (   6.90  )
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

Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> Enable support for the ACCDET block in the MT6359 PMIC, which provides
> jack detection capabilities to MediaTek platforms.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




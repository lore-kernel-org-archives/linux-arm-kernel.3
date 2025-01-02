Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071BDE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TMthsjIBrdC8jiAc12hETL1ZH06NxQprfQcke9vXXHM=; b=FLVL1xgThplNyv29cjsN9IeOyr
	rlAe4YjtxYju5Nbvtyt5Y90O7NefmJKdXT4s1w67bXS6KV+1Yqr+tVMKIQl9ZzxHcf82uYpUiDWSF
	W+w2wnQb/42BIFZKxq//fG5x3qQc64qWYADdKlP5SKRY6YrOSD70oC+FiLRM+RvhKSJ6c+ebIYVz+
	C/Z42lFvj7YY3DiCe/rXvEoctRVWUcQQsjtLIOFMcH6yt/gYZTbTsIvP3uLvbDQBcnKqfpQJoZPmO
	UVlOjzkCTmVWL7N9M1En07MqXfGxYCs3z1kn66PW3zZbs4DqvWlQBHJoxwSvNBh/0avzt64ppFC/A
	Lo2N8c8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTISP-0000000A98E-17nz;
	Thu, 02 Jan 2025 10:29:37 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIOu-0000000A8Z9-0mm8;
	Thu, 02 Jan 2025 10:26:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813558;
	bh=g3uOhxGhdR27AA2G951/fppRBjpoR1zt9a4A7UgaIhY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oxOW8IWArLK9a2Gm/2Iq4bcXJGnL6Sx8Lua9oOfy4PKcP+LMTVliPd7qTDNSfeJib
	 jLnVpTy5KhxGgRlK7MMbPnA1oDeCbX/thb8HmsSmHEpaedkPU87hx8sXb+bhs82Ui/
	 bCSkctTgqpx2xVze2/uvibzY/11obQjdMGf7Q1cHQL3s3DYiOat4N0Lr+A38S7yS3C
	 j7KS4xAVDlgqCEi+AoCOnRzjLVjKz33Uo1rC4xgl4rEvN1l8k95+9RTajNXBsX+DId
	 Mhdm3uuUhwYfVuSNYinewJ4ha+65Yt53kMUBIzRgB9AZsIpnCMfUEWkTN2FkJD5KJa
	 t9pbPoOz7XVrQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8AAFC17E154F;
	Thu,  2 Jan 2025 11:25:57 +0100 (CET)
Message-ID: <ad1a74e4-6714-480f-b516-feef8ea0f908@collabora.com>
Date: Thu, 2 Jan 2025 11:25:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] input: keyboard: mtk-pmic-keys: add MT6392 support
To: Val Packett <val@packett.cool>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Javier Carrasco <javier.carrasco.cruz@gmail.com>,
 Fabien Parent <parent.f@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-8-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241226050205.30241-8-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022600_369716_5FF89BC0 
X-CRM114-Status: UNSURE (   7.38  )
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

Il 26/12/24 05:58, Val Packett ha scritto:
> Add support for the MT6392 PMIC to the keys driver.
> 
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




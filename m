Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28C95E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SgAiWDC5NIvYqH5Z9+SK70escYmFlf3ly6hy8L6ae2Q=; b=WCfJBOzgCPVHxS4u6xvRiSfJyp
	tlQMJh54OW6WRIk82/JIJp3J4xb0H/SQV5cwnm0l+iyPH61LOAxO3zyjgBlpnary/KuTM0OCCO2hf
	TGss0J3Rwe+W13FAMi2h9aJ1nS94R6/98UN28oybq8M/0GtQTEKgW9tiz9+PFYrHZZwB0/9WVaRJ/
	ODJaDNIp2SBhdruUsfKgVwH/62m1dHbVA1mpAr2XZ0HNJkbEkitIgFNYBeREgCczET/vc7Y27HdFn
	XkHEArZx0U7o4FD8xobsn3CjZessT3L+Nu8XQMfO9paMGEjHTTovdFDIrlpzdgUwpZll6ZseAB8F6
	XlPXbkyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIRF-0000000A8w4-1N8x;
	Thu, 02 Jan 2025 10:28:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIOt-0000000A8Z4-4899;
	Thu, 02 Jan 2025 10:26:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813557;
	bh=vh+43YniS6Ugh2sXp2QxZgxf26XqzpzMRNyItfYPoHM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=o+VSF47gC0Wqe8H1tsm3Zz2GmXFTmB4fqAcT5gPx/okxIWqo0HWezRMr0x86HfX9i
	 KcOm6MpK47mAWAruWI5OcKXsKSa6WZjY65UrK32WzChrYVewkGFgIQo1Bjza8H88qa
	 TLkPpEK2iye6eJtVvDIWBBu0xhwjgvya+b5tppKyBdj8dD1CYAlJtCBKCxDhTBKzL0
	 u3ZyMpxkFWARHpSxpMzhE41cyuumyERQDFN9URi1I6fefJGWCCViG4tggjEuFTDmgl
	 /3TmAN+1ELMxijBEPg5X67IZyaHEmYdgo/YmsHVA9rljwMA5ndbv/831qG7mYft6jF
	 Jwv1rJBemM/xA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0321717E154D;
	Thu,  2 Jan 2025 11:25:55 +0100 (CET)
Message-ID: <45b41817-554d-43af-98b7-ccc0d0e6dd5d@collabora.com>
Date: Thu, 2 Jan 2025 11:25:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] rtc: mt6397: add compatible for MT6392 PMIC
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
 <20241226050205.30241-9-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241226050205.30241-9-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022600_169478_7D8C7601 
X-CRM114-Status: UNSURE (   7.70  )
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
> Add a compatible, using the same data as the MT6397.
> 
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



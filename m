Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97199E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 10:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNIId3EI2r4nGKzCSOHWFwCmeisPM+00kDkijCEULuM=; b=M/lN34g39f7QofsS1qjU8eFlHg
	IgsFjeKHof3cOxx2Jlf+kxjXS5EJssjFxMDxSPJZmfzdf7/x/kFVjkciJQXXgojZDlfvK8CTrd45s
	OEQfl6dJq2SfM3l+w6ZueQUJybEHd18ZxZ55kqXq6E4LyTh7aojjE3ShOfLwANkXpytoihJX30FlI
	4aGT2LpuVFRMahA5S0yCcVQbjoliSsHTwGgd353Bz0d6MajlBB+dt56Tn/X16UED7zkm/iaDmNOPi
	cnbgkxAxtMWq/cTBHrLNucxVTDrFvEh9KrFvD1NrLdemOPntXjWNW37CWxhoaCgs4MDMHJ8ZsztPL
	4+b5kaxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIX6-0000000AA0J-3EPk;
	Thu, 02 Jan 2025 10:34:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTIP1-0000000A8bH-19OL;
	Thu, 02 Jan 2025 10:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735813565;
	bh=ykJuvkkfSPLUvUQaNqnjAoimIgJBLgUoIdS4Mduzc6I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LNHwV93GuGolKA/Xp7D0d4fm6xYKC6ai2DD4iQW8e/Gfg6F7sUvKlYlmED7aGzwwM
	 LvcwkwWBUufowhuNe/0QoRuetd1rCB3mxLbDx9qCMN8fAaNWacclhdTlZbQ5wBAItg
	 Q2xE3ETWG02IIwYjSSNIgWwNBQLtDzlFDAfnFsOsH+gvawTN/UE2kXtPMSa+mRL/zW
	 xy65xJVtlsxwvvIsd+/pyVmAl793ssQSA9gpiRppmmjsqS8RpFOdDgu82c32AnpwBi
	 Iw77BM2oO/OmIWh4/UU+KiNMu9w96tNLzxqyX6qtiAJssrqsFl5xLMaHJWZjdQX9ML
	 QyXWpByh/lkmg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AA84A17E1556;
	Thu,  2 Jan 2025 11:26:04 +0100 (CET)
Message-ID: <2183cbe1-e60c-4bb6-89ab-aa0c4da79afa@collabora.com>
Date: Thu, 2 Jan 2025 11:26:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] soc: mediatek: mtk-pmic-wrap: add compatible for
 MT6392 PMIC
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
 <20241226050205.30241-6-val@packett.cool>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241226050205.30241-6-val@packett.cool>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_022607_461034_EB657668 
X-CRM114-Status: UNSURE (   7.55  )
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
> The MT6392 PMIC is equivalent to the MT6323 in terms of pwrap.
> Add the compatible to use the same configuration.
> 
> Signed-off-by: Val Packett <val@packett.cool>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




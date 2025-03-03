Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFAE9C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lX1RGmg1uBds2wwvzOo6gkglItDyZNfsrf0D9qOYQ7s=; b=BkGA5h0mVB4LlsItEaeB2arHmG
	Rf8NM5qoowy5wBiKvhCujFeEI9v2FwacMSJeYkmNkml8oWTCs/brrVOjnugqCJaZ3Nvr5XCqDiThU
	Tt8rx5PbhxHEMssYUOB4zj8XZXUt93e9opqTsrPsypkWJFfXDEA0I5PgjeZOWclQAfZamltz63x4p
	gw8XWXFV/T+jb+OcEuKMMWdnvOVnUZEPYg4HmRnSK3Sj/1nnH6AtNpgXmmWBk8dYcQU2wCJiM/HyM
	5xb/iMJOesDW0sJuqgEwVkt91W3YWdUmKGqw36YCeY51Wdwl5IPCk6VErYVkdMFrp9heMQK6LghF3
	AO5x5KKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3i8-00000000U3Y-079x;
	Mon, 03 Mar 2025 11:11:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3dU-00000000Sbv-1Jc8;
	Mon, 03 Mar 2025 11:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000018;
	bh=b3+Xdqb81IiwLAoh7b8p9zmgG4Hhtw3o80AXe+lcmaE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Oa72sakPA+mY6MuNMvym/Ulzf+1mMz2H2MhjVi4CmH7uXN8cEhwtxBa6zF8cEKwwu
	 L04nLgulUTfSEmz9eQc8BAz95oJUYoD83IJq901oUwch4eRe+gVKtPb2/F0DMPaCtN
	 Porxm168SjeUtFnJDHn1OP1+G/r4lj8/D9iw8cwL76A2Ov5UEGrMlaV8JYvZFosigE
	 r0v252gRC7hhqm+pFQjJM8ZbAnNxKsaafwsIQfhE+2m0Ykucry/ZU0CWSkRzekk1CV
	 DptyICCuMskSCb4/o2YH8oYlOusbWsnC9IsX5hCAoH2SL0GiTK3Tn/KmoiMlXPvqHZ
	 APcWLj3q5oq1g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A549617E0E91;
	Mon,  3 Mar 2025 12:06:56 +0100 (CET)
Message-ID: <d9b64bb7-d4b1-4817-8d14-14ebabf40e88@collabora.com>
Date: Mon, 3 Mar 2025 12:06:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 15/20] ASoC: mediatek: mt6359-accdet: Always set
 micbias1 to 2.8V
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
 <20250302-mt6359-accdet-dts-v2-15-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-15-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030700_523757_73FAE965 
X-CRM114-Status: GOOD (  10.95  )
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
> The driver currently reads a mediatek,mic-vol property from DT to
> determine the micbias1 setting to configure in hardware. Since there are
> no current users of the property and the default value (2.8V) is known
> to work on multiple boards, remove the code handling this property and
> instead always configure the micbias1 to 2.8V. The property can be
> properly introduced in the binding in the future if it really turns out
> that different boards need different configurations.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D729C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBp16lYPpn5Rne4lC84h0Me75MFRzOUXd1cDLRjZSXw=; b=RiBFkQRg9iV4Pq1XPUAp97y4ym
	kWzNsYQCuFuE0CrqVN+p7NsVTBr2lWc1qkHs1jXQ5IV1wx3rviaepKklHqlKJY3eqNU0/83vluDaK
	aWnvIYX2zRFpZBY8cAJJ0SEjjbTe9MIVcfBa1NyXCw/hjR+w6k4uSyH4ZF+4w2bvoyk0umwj075bG
	6XH+8sxwLkqH73K4YrtGSCzRIppzV0pYZrxomNAPWzl2sDnc5lqCJ1A49/KnBxQltVsSc0irjxvSC
	3geVvkV6kM5J8K6R0tQqq/UPSLoYxUpPuGkisvd51xbvkHwmLh9OsxOwDg8oA0Tjmhi6ivc6n0Zxa
	Zc60zD2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiP7-0000000CSHv-2ttH;
	Wed, 19 Feb 2025 11:38:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkiGn-0000000CP7L-2C6g;
	Wed, 19 Feb 2025 11:29:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1739964575;
	bh=fLHhSMY8IxHecTeaQUcHlc18bPsMku9zr3x/eSmTnW0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jLm6FONHH0WpJHdbkHANqFxBABrZT6hs8sd7lukpE18QIcsNUOZxsI16oMi84mYj4
	 RVg4j/POgbHqZGbj30EsNVpmUePSkMgwsIvxlgzjWhMVZl+a8yK8cwalo7zyb+XuNi
	 fV/2vr1T2KSdN7619ma7rT36NNUvaS+Aing51hB56OlYYQtqbJusBJpqO72CGgxMWZ
	 t8BZJ3B3G3Idkp+XALtAHMROqeoV2slFsVOaKiofiBvmPnaPwSfwVscJwj7EbI20o0
	 poYIFG8YmD3TkJFiwp+6nlJ/1YIGGjcnkXl8dc3BzXTxRQ6ERKl/QDQ3kXWueZaVjC
	 AhsPielz1Zdag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 041BC17E0E92;
	Wed, 19 Feb 2025 12:29:34 +0100 (CET)
Message-ID: <ef5b7292-5036-41f5-9410-5e7394a1f583@collabora.com>
Date: Wed, 19 Feb 2025 12:29:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] ASoC: mediatek: mt8188-mt6359: Add DMIC
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 parkeryang <Parker.Yang@mediatek.com>
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com>
 <20250218-genio700-dmic-v1-5-6bc653da60f7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250218-genio700-dmic-v1-5-6bc653da60f7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_032937_740385_461E95BE 
X-CRM114-Status: UNSURE (   8.08  )
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

Il 18/02/25 21:52, Nícolas F. R. A. Prado ha scritto:
> Add the DMIC backend, which connects to the DMIC DAI in the platform
> driver, as well as a "AP DMIC" mic widget. On the Genio 700 EVK board
> the dual DMIC on-board are wired through that DMIC DAI.
> 
> Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Since you have to send a v2, perhaps you can also change the title to read

ASoC: mediatek: mt8188-mt6359: Add DMIC support

After which

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


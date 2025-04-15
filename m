Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085C1C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 07:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WtGRxiYBOHbHtCGEWe236bmQC0xc32IE8CLlgwkl18=; b=EM9lz+GqlaNcBberJo0p14OeYq
	GB5LuALQDnRBy9UoMYBAwi/1/SSIgk7gHGu6VqRYL89EweceipNaOJ6ECXxc2H6LWDcMMqzfCmyCC
	q7kaA1Qe38G0uw0/t/ow7XgT2B+OAmn40420o5ou1c3w9WYcxai1Fi5mFgdHlcQDIC4XQHSu7jM1o
	Jb5Z9IihOHO5wC8N6pkhtV8H+vsurIal0Wc48eNkd1nb0iRQDEjUQJ8Mw542C8GypFXmQtchWm3ag
	96JqlhRI2HKewpnO6VsM0Hpj8ctljzdIAcqBqQ++tq79lASKcNPwxbKAvNnnCK93yNBl66eWab6XD
	LEZwT2Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ai5-00000004njs-2yHy;
	Tue, 15 Apr 2025 07:27:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4agH-00000004nSu-1uQD;
	Tue, 15 Apr 2025 07:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744701963;
	bh=gexzkna3532lP1292T+3u7k+7579AwNhCBaiG48e/ig=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VfLwaAOTqt0rkldA6m+sC5Leio/nx3iXCEvQFuLaWHwme2tzURuBSfEPJ2uvppO6P
	 6a6ykFP5VgDHggJlvD38OIRr8wmldySQ5UpLHL6t4y4akogGbesn6RhwCU/jvlC83M
	 FSSrxmBZrVeQNJqYl9zfBcWUDa+HDVhllFq1HH24v9g5d1kMHM+FLBUx4H6jTdlKJ6
	 szTsWU6stkPLJyPwcVhSQnyNzgTpJbfRXgDhyKV81L5PIC+7q3KYhAE+UxzkceL6RE
	 rZaaGhEB6DwH2da/ZAegGq92JRYimsPcRrWieBO9NnltEIUlMTGVEYyw0ofxJsdBpm
	 lQkVJsqsWZ6Og==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 10CC117E0CA7;
	Tue, 15 Apr 2025 09:26:03 +0200 (CEST)
Message-ID: <af9ce106-474c-468c-87fe-8305708a4d11@collabora.com>
Date: Tue, 15 Apr 2025 09:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8390-genio-common: Add jack
 detection with accdet
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250304-genio700-accdet-dts-v1-1-86d77c5cc745@collabora.com>
 <174462439206.45420.6727023772221653939.b4-ty@collabora.com>
Content-Language: en-US
In-Reply-To: <174462439206.45420.6727023772221653939.b4-ty@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_002605_645396_8DFEB0D8 
X-CRM114-Status: GOOD (  10.68  )
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

Il 14/04/25 11:53, AngeloGioacchino Del Regno ha scritto:
> On Tue, 04 Mar 2025 18:43:49 -0300, Nícolas F. R. A. Prado wrote:
>> Enable audio jack detection for the Genio 700 and 510 EVK boards. This
>> is handled by the MT6359 ACCDET block, which on these boards has the
>> HP_EINT pin pulled high and connected to a normally open 3.5mm jack.
>>
>> Add a phandle to the accdet in the sound card node so the machine sound
>> driver can initialize the accdet.
>>
>> [...]
> 
> Applied to v6.15-next/dts64, thanks!
> 
> [1/1] arm64: dts: mediatek: mt8390-genio-common: Add jack detection with accdet
>        commit: 691712b065d349bde7d5561aa8e1857d38b7c65a
> 
I dropped this as I have just acknowledged that bindings were not accepted.

Cheers,
Angelo


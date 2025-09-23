Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8E9CAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jmXU0PR5u2O7zQhDDdq7LZEkXsIs24tM1mliLq3AixE=; b=co3TtZf+gSN6mEoH+X1NS3VbQK
	y8vE6x2zgJTwM47izzGdnPh9OD4k0uaSEJU4d9QNtQ4cPRSmXyzd1Ljopt64EWZTswOWrmZuaHNn8
	Xhm7Ue7EaFiJO+yk77ZEe0K6UUpgAJmBPGgi05osz+1p7bHkvVEyZIOT5axMxNFIVPlbFim6gsLY2
	gwLYOZYBpHu5ZLQ4v+a2sbDs2Z5csbHm2m3o8DE2tjcAFcb7NaQPSTS1IjNAn2x0BV1klaOCez12V
	xRhHWVwp0X1uTjF41RObbrNkvTs7vL3EYdBR/0kosQyYeXa/VJveCvLlY9aqdj+XElQqMFvQVPe1K
	RxZwaICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0z5B-0000000CuPH-0kWk;
	Tue, 23 Sep 2025 09:13:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0z58-0000000CuOY-2n2A;
	Tue, 23 Sep 2025 09:13:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758618783;
	bh=IjPHyUs+/qi+cj9v3JJ8bxTkTPkvKjgFnFOqLC1M2G8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T04R9PGNcMlBc0OEdNVti89foPGVnPMcEqdCz/ASgtoNlOFI9lad76nZQs20wR7JT
	 bnWWKDXH28heCcgtMlQnJoSLqOt0rm44VcEcTmDOmBMTlyVagTyRDP50xTnwsZoici
	 nKanuWPCJOOdSTWtLELjOd/BEXg5VjSpzKx8dF8aTH94iBeDtDevjMCRfniUSJpytk
	 qS7t0ljvRTXje4BxL+OjQsxMYZniz/zAeo0Tpo5BbIsOxDuG5HqFpz8fzn3NwzyUg6
	 yzZFfG+6sFH5HzazGB58eozCBVVxmlwE2sHB75aktXaXFnWS0cdShJrewmkzkFIayN
	 mIXpNdwoU8Quw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 938AC17E032F;
	Tue, 23 Sep 2025 11:13:03 +0200 (CEST)
Message-ID: <7649cf04-3f0c-4d28-b7da-fc7dea5fefa0@collabora.com>
Date: Tue, 23 Sep 2025 11:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: set default off flag for MT8195 AUDIO
 power domain
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250923-mt8195-pmdomain-audio-fix-v1-1-782190385f46@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923-mt8195-pmdomain-audio-fix-v1-1-782190385f46@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_021306_894739_4CD38AB3 
X-CRM114-Status: UNSURE (   7.66  )
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

Il 23/09/25 10:52, Louis-Alexis Eyraud ha scritto:
> In MT8195 power domain data array, set the KEEP_DEFAULT_OFF and
> ACTIVE_WAKEUP flags for the AUDIO power domain entry to avoid
> having this domain being on during boot sequence when unneeded.
> 
> Fixes: 0e789b491ba0 ("pmdomain: core: Leave powered-on genpds on until sync_state")
> Fixes: 13a4b7fb6260 ("pmdomain: core: Leave powered-on genpds on until late_initcall_sync")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Not sure if those Fixes tags are acceptable - but for the sake of backport
AUTOSEL this is correct.

For the code:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




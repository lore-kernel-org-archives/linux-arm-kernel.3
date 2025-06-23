Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7774BC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FysJsdERAXLKzj90/qFOovdUryahJXjdxyKVlKnU02w=; b=yDLcgizreEv70ZO3WGbVSF35Zy
	Fuk4fDSgXSvrOV58+KT/d9IPlbCXm+zKTWXH+SUqKfOBD70AFqSsGkZeUcSm51TZN3KHrkHLVgbJN
	vhqUMk9JGZ0N+USaQvi8tfQURda335HRirt54SOZsihoQ77mwos6tCnb+pH5CsfxtnS0HA/LR5KlT
	4v49oYitH1vmRzdCULA86MsBhDmXcUOaeL1TRO7s7XgtwMLyi8JmiuSbZ49vsmoQOnh/V3MfutZ44
	nb2k7hH9bhu4d7pSSv1B/VnLdkwuMLqnCL+RowWgcgeHIcJaNuuvW5dJKazwGI6l9kAbv5ISgIJtt
	/rTHBOsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeQp-00000002Lmu-0Byl;
	Mon, 23 Jun 2025 10:29:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdvD-00000002G8g-0Wwn;
	Mon, 23 Jun 2025 09:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750672621;
	bh=U7XIW8hy4Y2hgCabhIOAkmUThrnJnj5hGEjrn7p2UNc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BkyQmY627azdUczLx7oZc3igZbN0MsdTraBo/0pVjbZuOdw5mpSQ4zlCh2Gxb7qs3
	 ShQVrFvbYRj2O9Gfm5SZk2JNDiv+hQrEFCCFFM8oGfcSjTvg6gJJ2wK+1fl11YUu6F
	 /R5+C/eHWX6uaDf26ohy4DBQPaWOhfx7LOApKDQyDWcm2Y/AgAUu/6OeX1fP8oz+Pr
	 8lFjROw5L08Q+p8GnF68Qxygy1v/YcMCibXVC4fM288GhOKa7jNOFjku2lgKr79erh
	 uf2JhZHGniRMqAJOn82nwe0QskP9Grnn47MpisOqJKX79T36P0ay195xdrZZeTuUsf
	 gqXvREbwpkoUw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B34E717E0CE6;
	Mon, 23 Jun 2025 11:57:00 +0200 (CEST)
Message-ID: <b0bd3ac2-7698-40a4-966f-25a06a15c9ff@collabora.com>
Date: Mon, 23 Jun 2025 11:57:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mmc: mtk-sd: disable auto CMD23 support for mt7620
To: Shiji Yang <yangshiji66@outlook.com>, linux-mmc@vger.kernel.org,
 Chaotian Jing <chaotian.jing@mediatek.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <OSBPR01MB16708176FE57F691359D0943BC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
 <OSBPR01MB16701142441CAA0F2D12A843BC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <OSBPR01MB16701142441CAA0F2D12A843BC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_025703_332907_0F96C746 
X-CRM114-Status: UNSURE (   8.46  )
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

Il 19/06/25 07:35, Shiji Yang ha scritto:
> MT7628 ProgrammingGuide indicates that the host controller version
> 3.0 and later support auto CMD23 function. However, it doesn't
> define the SD command register BIT[29](Auto CMD23 enable bit). I
> guess the legacy MIPS MT762x series SoCs don't support this feature
> at all. The experiment on JDCloud RE-SP-01B(MT7621 + 128 GiB EMMC)
> shows that disabling auto CMD23 can fix the following IO errors:
> 
> [  143.344604] mtk-msdc 1e130000.mmc: msdc_track_cmd_data: cmd=6 arg=03B30101; host->error=0x00000002
> [  143.353661] mtk-msdc 1e130000.mmc: msdc_track_cmd_data: cmd=6 arg=03B30101; host->error=0x00000002
> [  143.362662] mtk-msdc 1e130000.mmc: msdc_track_cmd_data: cmd=6 arg=03B30101; host->error=0x00000002
> [  143.371684] mtk-msdc 1e130000.mmc: msdc_track_cmd_data: cmd=6 arg=03B30101; host->error=0x00000002
> [  143.380684] I/O error, dev mmcblk0boot0, sector 0 op 0x0:(READ) flags 0x80700 phys_seg 4 prio class 0
> [  143.390414] mtk-msdc 1e130000.mmc: msdc_track_cmd_data: cmd=6 arg=03B30101; host->error=0x00000002
> [  143.399468] mtk-msdc 1e130000.mmc: msdc_track_cmd_data: cmd=6 arg=03B30101; host->error=0x00000002
> [  143.408516] mtk-msdc 1e130000.mmc: msdc_track_cmd_data: cmd=6 arg=03B30101; host->error=0x00000002
> [  143.417556] mtk-msdc 1e130000.mmc: msdc_track_cmd_data: cmd=6 arg=03B30101; host->error=0x00000002
> [  143.426590] I/O error, dev mmcblk0boot0, sector 0 op 0x0:(READ) flags 0x0 phys_seg 1 prio class 0
> [  143.435585] Buffer I/O error on dev mmcblk0boot0, logical block 0, async page read
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>

Chaotian, could you please confirm that MT7628 does not support AutoCMD23?

Thanks,
Angelo



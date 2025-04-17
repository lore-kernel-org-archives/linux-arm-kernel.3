Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1870C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 10:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZIImdBF6Fv2PqOqVaoCYXWrVdNDqmePwkS+9TxGTGU=; b=u82X6dobwh1RTLJGMd3/AATuRE
	yzIR3Aq+qb8pPIKPsfd7wIAAQpLDjpJvc9BBR3GWkZbIs/7b8A1wVKScOBgdkZJJ+D0L4Gz+1PVYn
	Bg6xRnHQnUHDoNsdEnRFb7seFbz9+otIHeSsRP5GtXR10l9SRaEuXqx+sI2/EhiSrZZOR02WQMotO
	39GNzEDF11LSR6Bcdzli28Kx7nDnomL4wkuo+N7PdwDhEEwmymfHJN3Y91BNfWgUi5vOT4hUdnmRh
	WJWMIK9dry9ptaKeVmwnQWDls5OW590K3W3mvR2J8xwG7jB5LlL0hlenkFaU4egNt1PSPSuffl9tz
	mqDT3rjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MgB-0000000CfcD-1Ne1;
	Thu, 17 Apr 2025 10:41:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5MMC-0000000CcI6-2c4f;
	Thu, 17 Apr 2025 10:20:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744885231;
	bh=+WkyrsRKTLB8Y1Td4ts2zSCtGOAP9ZmKPqOfMp7GonA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HjAzWHqhJcSQLU91IPL++HDfDs1FW9Qq2+Sla02k3lWySpoAYuYMTDH3ACSPldtf1
	 kRya3XjRYbeNAYLbpU40vkz2g7ZCYlxuHJCSMDSBEZ8Wk9v2M52FwumCYeZsjn4na+
	 iztLVQ6XCLyx0SixoyFzpiqIF4TzDUQ6eMmoXYUBj4mEGrbgZmxtcQ0QUVpZP72re4
	 dwkdqov0n/OXlq6DMYjxDFmSy+mXSnPBOS4fXoBWVnLVbtLhqW+y3dLLTj4vafiaJX
	 wsyXar9HLqTvmG/eIg0FkLUD2ibbB5rdbBbrrKtEH2YqbIflFVdyogb+kO0yRh7AfZ
	 zL3a2axBo945w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5D31517E0F85;
	Thu, 17 Apr 2025 12:20:30 +0200 (CEST)
Message-ID: <2fd29a45-5b4d-4465-8ec7-dd7cecd8b9fa@collabora.com>
Date: Thu, 17 Apr 2025 12:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] ASoC: mediatek: mt8195: Set ETDM1/2 IN/OUT to
 COMP_DUMMY()
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Trevor Wu <trevor.wu@mediatek.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250417-mt8395-audio-sof-v1-0-30587426e5dd@collabora.com>
 <20250417-mt8395-audio-sof-v1-2-30587426e5dd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250417-mt8395-audio-sof-v1-2-30587426e5dd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_032032_808502_65A7D1E0 
X-CRM114-Status: GOOD (  10.47  )
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

Il 17/04/25 10:44, Julien Massot ha scritto:
> ETDM2_IN_BE and ETDM1_OUT_BE are defined as COMP_EMPTY(),
> in the case the codec dai_name will be null.
> 
> Avoid a crash if the device tree is not assigning a codec
> to these links.
> 
> [    1.179936] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [    1.181065] Mem abort info:
> [    1.181420]   ESR = 0x0000000096000004
> [    1.181892]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    1.182576]   SET = 0, FnV = 0
> [    1.182964]   EA = 0, S1PTW = 0
> [    1.183367]   FSC = 0x04: level 0 translation fault
> [    1.183983] Data abort info:
> [    1.184406]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    1.185097]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    1.185766]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    1.186439] [0000000000000000] user address but active_mm is swapper
> [    1.187239] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    1.188029] Modules linked in:
> [    1.188420] CPU: 7 UID: 0 PID: 70 Comm: kworker/u32:1 Not tainted 6.14.0-rc4-next-20250226+ #85
> [    1.189515] Hardware name: Radxa NIO 12L (DT)
> [    1.190065] Workqueue: events_unbound deferred_probe_work_func
> [    1.190808] pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    1.191683] pc : __pi_strcmp+0x24/0x140
> [    1.192170] lr : mt8195_mt6359_soc_card_probe+0x224/0x7b0
> [    1.192854] sp : ffff800083473970
> [    1.193271] x29: ffff800083473a10 x28: 0000000000001008 x27: 0000000000000002
> [    1.194168] x26: ffff800082408960 x25: ffff800082417db0 x24: ffff800082417d88
> [    1.195065] x23: 000000000000001e x22: ffff800082dbf480 x21: ffff800082dc07b8
> [    1.195961] x20: 0000000000000000 x19: 0000000000000013 x18: 00000000ffffffff
> [    1.196858] x17: 000000040044ffff x16: 005000f2b5503510 x15: 0000000000000006
> [    1.197755] x14: ffff800082407af0 x13: 6e6f69737265766e x12: 692d6b636f6c6374
> [    1.198651] x11: 0000000000000002 x10: ffff80008240b920 x9 : 0000000000000018
> [    1.199547] x8 : 0101010101010101 x7 : 0000000000000000 x6 : 0000000000000000
> [    1.200443] x5 : 0000000000000000 x4 : 8080808080000000 x3 : 303933383978616d
> [    1.201339] x2 : 0000000000000000 x1 : ffff80008240b920 x0 : 0000000000000000
> [    1.202236] Call trace:
> [    1.202545]  __pi_strcmp+0x24/0x140 (P)
> [    1.203029]  mtk_soundcard_common_probe+0x3bc/0x5b8
> [    1.203644]  platform_probe+0x70/0xe8
> [    1.204106]  really_probe+0xc8/0x3a0
> [    1.204556]  __driver_probe_device+0x84/0x160
> [    1.205104]  driver_probe_device+0x44/0x130
> [    1.205630]  __device_attach_driver+0xc4/0x170
> [    1.206189]  bus_for_each_drv+0x8c/0xf8
> [    1.206672]  __device_attach+0xa8/0x1c8
> [    1.207155]  device_initial_probe+0x1c/0x30
> [    1.207681]  bus_probe_device+0xb0/0xc0
> [    1.208165]  deferred_probe_work_func+0xa4/0x100
> [    1.208747]  process_one_work+0x158/0x3e0
> [    1.209254]  worker_thread+0x2c4/0x3e8
> [    1.209727]  kthread+0x134/0x1f0
> [    1.210136]  ret_from_fork+0x10/0x20
> [    1.210589] Code: 54000401 b50002c6 d503201f f86a6803 (f8408402)
> [    1.211355] ---[ end trace 0000000000000000 ]---
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>
> Fixes: e70b8dd26711 ("ASoC: mediatek: mt8195: Remove afe-dai component and rework codec link")

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




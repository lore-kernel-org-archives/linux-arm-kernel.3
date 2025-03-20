Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F39CCC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 12:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uczEBqYijGJrUi7KC/PRd2N/Pf1wR/HIuoACYkbLDCk=; b=I7F8elv3fp16POUFBSlZ3HoETp
	ys9UVkitwdAEhNGx6JYLkkEYnnNFr/ZOUNFzb5QmRBp7mSn/Lv1KbLjkhMOcNZ/mT6CJLB9OBziIV
	aHFTCKeJ6oOp8tepakufVDiLebMZOewq3bsieo1Pf0bPrWsiyAXz/P72L0EtK3qhbZjbJrt2j2eLS
	1g2NoTGrL/AxwYy078FNsZUdmjV6EOkcP7fygW6mrW4uRgm+sG+bDQ4RWHWHSjkuiP7dHkO7bOmhr
	j9p0sQS3qEn7jn1A1L3mPvwhGw7DWVYZBdvWKrsy48w1oHhYAw+P+f696FaGXy8TZhxvh2hi5miVW
	SnEhAGLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFDf-0000000C8aB-3cgk;
	Thu, 20 Mar 2025 12:41:55 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFBy-0000000C8Qz-0oG9;
	Thu, 20 Mar 2025 12:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742474408;
	bh=dSb1rGkUWH+O9PKTS5kcXjpzSzAoMTGvjKFlYsZAbIU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cDZSPhtQdKCk9SSLCW0czIQ9yP7K095pjew+9ZpZDJDKONmX5x2jONkHAlQJtx4uQ
	 o9rfqITPbXCkGRMBj5CPsl9zPbzVAFNf5J51mFB6gXfQEC7CsBSJuzqDFEJ1eG7/zc
	 S2UrL16vN+bnhKwO8Aw19KtICy+DvbAixpJV9bTxx8MhMn94/lGhyKUIybjqBfXAbM
	 sS1tXxCwunamUN2EYuHcvT8TPTAauxN+LIoRdkFVi3h+NPOdSoivheZMvA6k0lveEF
	 3oQp00h1eyvJ+wXw689tq3XyK7UJ5xcEqhMUpk9X3o7m2R78dQEG8NfaGj3znYDaSb
	 n+wIi0IOQ2rRg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4A62B17E0607;
	Thu, 20 Mar 2025 13:40:07 +0100 (CET)
Message-ID: <204c40d5-de0f-42d0-bc86-d17606c4929f@collabora.com>
Date: Thu, 20 Mar 2025 13:40:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: SOF: MediaTek: Add mt8196 hardware support
To: Krzysztof Kozlowski <krzk@kernel.org>,
 "hailong.fan" <hailong.fan@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sound-open-firmware@alsa-project.org,
 linux-sound@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, Jjian.Zhou@mediatek.com,
 Xiangzhi.Tang@mediatek.com
References: <20250320031753.13669-1-hailong.fan@mediatek.com>
 <20250320031753.13669-2-hailong.fan@mediatek.com>
 <20250320-cocky-adventurous-rooster-be2abd@krzk-bin>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250320-cocky-adventurous-rooster-be2abd@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_054010_418900_445F1CAC 
X-CRM114-Status: GOOD (  18.07  )
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

Il 20/03/25 08:52, Krzysztof Kozlowski ha scritto:
> On Thu, Mar 20, 2025 at 11:17:24AM +0800, hailong.fan wrote:
>> +
>> +void mt8196_sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
>> +{
>> +	/* set RUNSTALL to stop core */
>> +	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_HIFI_RUNSTALL,
>> +				RUNSTALL, RUNSTALL);
>> +
>> +	/* assert core reset */
>> +	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, ADSP_CFGREG_SW_RSTN,
>> +				SW_RSTN_C0 | SW_DBG_RSTN_C0,
>> +				SW_RSTN_C0 | SW_DBG_RSTN_C0);
>> +}
>> +
> 
> Drop stray blank line.
> 
>> diff --git a/sound/soc/sof/mediatek/mt8196/mt8196.c b/sound/soc/sof/mediatek/mt8196/mt8196.c
>> new file mode 100644
>> index 000000000000..364069ce9954
>> --- /dev/null
>> +++ b/sound/soc/sof/mediatek/mt8196/mt8196.c
>> @@ -0,0 +1,650 @@
>> +// SPDX-License-Identifier: GPL-2.0
> 
> Look here
> 
>> +/*
>> + * Copyright (c) 2025 MediaTek Inc.
>> + * Author: Hailong Fan <hailong.fan@mediatek.com>
>> + */
> 
> ...
> 
>> +
>> +static const struct of_device_id sof_of_mt8196_ids[] = {
>> +	{ .compatible = "mediatek,mt8196-dsp", .data = &sof_of_mt8196_desc},
> 
> Bindings are before users.
> 
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(of, sof_of_mt8196_ids);
>> +
>> +/* DT driver definition */
>> +static struct platform_driver snd_sof_of_mt8196_driver = {
>> +	.probe = sof_of_probe,
>> +	.remove = sof_of_remove,
>> +	.shutdown = sof_of_shutdown,
>> +	.driver = {
>> +	.name = "sof-audio-of-mt8196",
>> +		.pm = &sof_of_pm,
>> +		.of_match_table = sof_of_mt8196_ids,
>> +	},
>> +};
>> +module_platform_driver(snd_sof_of_mt8196_driver);
>> +
>> +MODULE_LICENSE("Dual BSD/GPL");
> 
> And here Hm? Don't fake the licensing.
> 
>> +MODULE_DESCRIPTION("SOF support for MT8196 platforms");
>> +MODULE_IMPORT_NS("SND_SOC_SOF_XTENSA");
> 
> Is this correct?
> 

The import namespace you mean? yes, that's for sof_xtensa_arch_ops :-)

Cheers

> 
> Best regards,
> Krzysztof
> 




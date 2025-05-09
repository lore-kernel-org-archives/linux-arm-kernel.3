Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C22AC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/Eq7JvpxuQbytALETignqsCp5qjux+UBock55sW198=; b=R0SuxQ41R3bMr8u/KqEHfX8aNe
	yUH6513vAgJ++cLywg9+s102PRfTwE/z6AFw+v0mOT+Pj2UNzx0sT2KQQuMWHPK6aNqjlhNVcNOii
	xwPsJw3r5ZLNra3girqvyXv599cZP2E1li948dN4/OuuBrp/3eroNO4HRG99txeIWkHWk0IZFTx2p
	OzwzS24WGCw6Q9HONyjcGDN6FCuH6wdaI50pFmqOR6iEkDMXMxk0CJSrN/HqbDU27ei77eAFZ/cHy
	3aRVRPVldEWmhzuvR4YRxJLOXeEAEXAbfBEwqsGIbywSRyZrk48WfezCfBa1+p7vgfYnrqr9tJ0L7
	/rhsGNPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDKmg-00000003EvD-3JXy;
	Fri, 09 May 2025 10:16:50 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJuF-0000000357q-0E5l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 09:20:36 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zv3FQ06s9z9t7B;
	Fri,  9 May 2025 11:13:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s8onC-g13dbh; Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zv3FP6VrMz9t2V;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D63998B776;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fVWNjZv3ZZLW; Fri,  9 May 2025 11:13:13 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 21FC18B768;
	Fri,  9 May 2025 11:13:13 +0200 (CEST)
Message-ID: <bc561703-bf34-4c99-aaad-1b1aad5ced12@csgroup.eu>
Date: Fri, 9 May 2025 11:13:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: fsl: fsl_qmc_audio: Only request completion on
 last channel
To: Herve Codina <herve.codina@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-sound@vger.kernel.org
References: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
 <5cffeb220617584a5e4bc03067cc10e6cdcfc25e.1746776731.git.christophe.leroy@csgroup.eu>
 <20250509104544.5c375f05@bootlin.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250509104544.5c375f05@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_022035_247842_B1F6CF6F 
X-CRM114-Status: GOOD (  22.13  )
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

Hi Hervé,

Le 09/05/2025 à 10:45, Herve Codina a écrit :
> On Fri,  9 May 2025 09:48:45 +0200
> Christophe Leroy <christophe.leroy@csgroup.eu> wrote:
> 
>> In non-interleaved mode, several QMC channels are used in sync.
>> More details can be found in commit 188d9cae5438 ("ASoC: fsl:
>> fsl_qmc_audio: Add support for non-interleaved mode.")
>> At the time being, an interrupt is requested on each channel to
>> perform capture/playback completion, allthough the completion is
>> really performed only once all channels have completed their work.
>>
>> This leads to a lot more interrupts than really needed. Looking at
>> /proc/interrupts shows ~3800 interrupts per second when using
>> 4 capture and 4 playback devices with 5ms periods while
>> only 1600 (200 x 4 + 200 x 4) periods are processed during one second.
>>
>> The QMC channels work in sync, the one started first is the one
>> finishing first and the one started last is the one finishing last,
> 
> How can we be sure about that?
> 
> The mapping on the TDM bus has to be taken into account.
> 
> chan 0 -> TDM bits 0..8
> chan 1 -> TDM bits 16..23
> chan 2 -> TDM bits 9..15

In interleaved mode, the QMC will not allow that. You can have 
TS0-TS1-TS2 or TS1-TS2-TS0 but you can't have TS0-TS2-TS1.

In non-interleaved mode we mimic the interleaved mode so I don't expect 
it either.

> 
> In that case chan 1 can finish after chan 2.
> 
> qmc_chan_get_ts_info() could be used to get struct qmc_chan_ts_info
> and [rx,tx]_ts_mask field in the struct give the mapping information.
> 
> The channel that ends last is the one with the highest bit set in the
> mask (rx_tx_mask for capture and tx_ts_mask for playback).

That would be right if the channels were starting all at exactely the 
same time. But qmc_audio_pcm_write_submit() and 
qmc_audio_pcm_read_submit() are calling resp. qmc_chan_write_submit() 
and qmc_chan_read_submit() one by one.

Even if that happens it shouldn't be a problem on its own as there are 
only a few microseconds between each Timeslot (a full cycle is 125 µs). 
And also because calling snd_pcm_period_elapsed() doesn't have any 
destructive effect on ongoing processing.

So I wouldn't make it too complicated. Here the benefit is real and 
worth it.

Thanks,
Christophe

> 
> Best regards,
> Hervé
> 
>> so when the last one finishes it is guaranteed that the other ones are
>> finished as well. Therefore, only request completion processing on the
>> last QMC channel.
>>
>> On my board with the above exemple, on a kernel started with
>> 'threadirqs' option, the QMC irq thread uses 16% CPU time with this
>> patch while it uses 26% CPU time without this patch.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---



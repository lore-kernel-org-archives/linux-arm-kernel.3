Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B794FC3ABD9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SyxChBA+d+I3ViLgnsP60/dj4azpOkMd+snSzYzQLzg=; b=taI3zBz6uffb9XsCCNtJsi3nG1
	DN3X6DkoZzzNSBHC9leTlof/LuuWJJThu/ToQxyYwu/NheQJuLut+nxGaryyfOhoZJen8CYssz7N3
	fA+IWl607eIXTAcLOrwn86w0DiFdR1+Yo9zoMmiHzjMKg3ERzMl8+FsgmN5nE4fy6tPZb6OMfvo5J
	Nq2v3d2cTyQ08IReIdrCeFvTt3YH7PcXpOoMD10A4DkwDsk75XCA8jOwofM9Ap5K2ey6U0e+ZGYuo
	UVcJH7WBYL+bZEe6Rxi3TTGnIuB1qdqo9hg7sw+JEybJIqBUItK3yHROj6z1PKxwBiqzTIddaZpjY
	S2KEjhlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7zJ-0000000Eb8H-2U6j;
	Wed, 14 May 2025 09:01:17 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7Oq-0000000EUOX-08kR;
	Wed, 14 May 2025 08:23:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747211014;
	bh=TBytcNs6FKDZ35AsCgJO/0ul5mShvUrDsvFdhjjy6J0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E+A7igkFqNNN53OBFsXGTmN+URMDOWMnwhBRLkWwbOwqjzNX0Nz5Q2iuezPyVt4wq
	 Awb6Vd1u/esp2YL//5HJ5A7XChXdFaUvrR842Gxuj969r0xWVlGSSzI/CflKTn39WC
	 DlVJlbgbKJ10ZVp6ceP9MDZa0PO4U3lbmbyq4W9mhWQYD61fCnOb67O+uMXeXpCYVx
	 AcnaB0CHXkvhxjB9NcyDGRrvfio53S+qCVYxQYYjxbTYRhe6xHMAqkY5yxjWT47gaR
	 X8WexRE+AZkU3Y/+TjIpiKm0Ld+Xv9K6mWt97ru/WqI6mczXifCnXjpPNkp9z3EZPP
	 5uLT1Zpc5d3yw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3EF9D17E05F0;
	Wed, 14 May 2025 10:23:34 +0200 (CEST)
Message-ID: <ed7ad534-a517-4005-b61e-c8f2e82f1b27@collabora.com>
Date: Wed, 14 May 2025 10:23:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.16
To: Arnd Bergmann <arnd@arndb.de>, arm <arm@kernel.org>, soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250506091736.125733-1-angelogioacchino.delregno@collabora.com>
 <7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <7e8718b0-df78-44a6-a102-89529d6abcce@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012336_223619_8DB483B5 
X-CRM114-Status: GOOD (  20.75  )
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

Il 09/05/25 22:54, Arnd Bergmann ha scritto:
> On Tue, May 6, 2025, at 11:17, AngeloGioacchino Del Regno wrote:
> 
>>     - Since SCP firmwares are available on linux-firmware, the
>>       necessary nodes for the dual-core SCP were added to devicetree
>>       along with the firmware-name property in mt8390-genio-common,
>>       enabling hardware video encoders and decoders on the MediaTek
>>       Genio 510 and Genio 700 EVKs.
> 
> This looks wrong to me: the devicetree should never care about
> particular file names in a Linux repository.
> 
> Usually what happens is that the device driver must work with
> a particular firmware version, so the driver is the one that
> constructs a name based on what firmware is knows and what
> hardware it is running on, so a newer version of the driver
> can attempt to load a newer firmware that may be incompatible
> with the old driver.
> 
> The other patches in the branch all look fine to me.
> 
> Can you resend the pull request without these patches and
> try to come up with a different approach?
> 
>       Arnd

Uhm, I'm not sure if there was a misunderstanding - not only the MediaTek
devicetrees do that, but also Qualcomm ones are doing the same with their
adsp, cdsp, modem and adreno zap firmwares...

....not sure, should I drop those commits for now?

Thanks,
Angelo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D85DC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 11:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5NzCenS4ThMhULbTOxKU7LEXTJ+78n8WGiskeywJs/k=; b=Bi8TjRXXT5pwU1BhldxAK/a5A+
	8Xw4ngVLz56lw976lI+MtonZsBNaNZsxPe9TSfO5xkPxJ1HZGZ00Y9oyRPSH+TGiQBKuckG689KQz
	Xo2N2KhhZhlCJthHwD0ORpLRfMHV/+w7rofR8t12EYiVgyd41k27zvaJ5SXuF4HeNP3TugbvbovCn
	fn6HERQMYB0+3PWnrVQgJ/s5piQgtxNFXwUzjtcNclGWyJ4QPsepDoBynNRNbFl31UhDWICF9w8jb
	UBtZp9N2u5wXDR/x2htuY2EGLYW5i/6DuG+ktrqqLIWaqSGZAQMmgP40ml/zHg8RLhDHxOpW1uivW
	nnKNc/Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3pv-00000000WID-1wVm;
	Mon, 03 Mar 2025 11:19:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3dq-00000000Slc-38fJ;
	Mon, 03 Mar 2025 11:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000041;
	bh=CpJfq3S1+X8ONFH2yRFiUWGqiFMtXwOfwjmYSN63tck=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DvJDubH7pcfRMyNZUukFQ9x2863DM9mnq0eNM3tAYR6ZWG5xC/17mgJqpx2hzWW0L
	 U925ZhMJMsUAqX30mrSi15gSMXSj+YVkBp8JQDIC3EesS+OnbOP5Q+U4SCBpFsmOLv
	 Z24jIGSx5cfGY2Kr1iVwppqNgptLHZO7bBfPxlRhd6bbY3KsFqNVVRkd3MEQw/O/MJ
	 5zYvBFTFRVolifnmxXevB3ve8n1+W096FuWjlrdIjGQDlI8OLMsdX8Ab3AYvUBT0/P
	 1C/gCHrSN8gi2pVZtF9Jdo0qQanT5g0AjQQAFCpgP7WXxznb1vvklqnpU3KTVuNqkN
	 TbEHwop1VtzGw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8467F17E09B5;
	Mon,  3 Mar 2025 12:07:19 +0100 (CET)
Message-ID: <e6d45582-6631-4f90-bc1f-8f70f974aebe@collabora.com>
Date: Mon, 3 Mar 2025 12:07:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/20] ASoC: mediatek: mt6359-accdet: Drop unused
 moisture variables
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
 <20250302-mt6359-accdet-dts-v2-11-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-11-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030722_975383_7D82E293 
X-CRM114-Status: UNSURE (   6.39  )
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

Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> The dts_data struct contains several variables for moisture
> configuration that are simply never used. Drop them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




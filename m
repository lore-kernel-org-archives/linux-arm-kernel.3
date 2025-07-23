Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC95C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olMtrJnLhEjWHgL/HG3oGrg4NlZ32OtAMmwdF/ifXOs=; b=i+Lg0DsroYv2UaiG1JtovKKJuI
	99vev9D/OtLX/30l7JIBdGWOq+FTmVns4VSIC6vH61D/2Q8gktDWq0PksN1L0Ci+gZvnmxbhT3k0L
	ecvRxA/mft3qTFw8Pd1NTUppzWzeLfWlRPU3fdoQQu0iesDxSHVis1+6tRJuFER19kZCUdOVJVpLF
	x3Tk3mBITjG4g3UdKsVOhG2DQcNbMGcZB6HLshmL6JnzcuwJnojZSW1908E2ZdGEO8BDXlJUKP7LO
	n7CNQmH3ItUVrT54QgI97/M48upMzUQAuRcKEhsdJnqESBaWUMJcP++uMNhrdqK95FXSfnfcQItcy
	aL9dRDIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUvV-00000004O1B-1j6Y;
	Wed, 23 Jul 2025 08:34:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUY9-00000004L54-3Or3;
	Wed, 23 Jul 2025 08:10:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753258204;
	bh=EdhV/HoC6xZnX2bnuCV2/LzTZIEfyRdVxGCTzPm+bK0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BL+gnleZ794iAZx7tLA6dt0FfFB0Q2Rry3uLk1sG7yLLhffct61DNXSoRs1cQgUZK
	 4Qw3EgNGeV0zUItANc/V4ytSOX65TwPojnYtzpZunG6rteQWx5buVSEEeiKupwvrKE
	 0l155W/3aZOxY0DNpNIJVfO5F90N/pKQu2lirmfNXgOXOgzhNSTLBOyhDVpDRq+emY
	 kgvq6bQa99iUXtmlgGB3aKpR9FkSVhXIqnieSa2Lcx1EsNcUppCYv4Je87Doa3n9hB
	 /phYF0vawpq5rbJtDl8LGOadDEkNX5CD8KGZpUpc3eCq37VmXIbWGl+8hLvOV+teW4
	 N3FxYLUOoiP6w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E48DD17E0CE6;
	Wed, 23 Jul 2025 10:10:02 +0200 (CEST)
Message-ID: <f1589156-7e4a-4f47-88a1-8c51f6594366@collabora.com>
Date: Wed, 23 Jul 2025 10:10:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] dt-bindings: ufs: mediatek,ufs: add MT8195
 compatible and update clock nodes
To: =?UTF-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 =?UTF-8?B?UGV0ZXIgV2FuZyAo546L5L+h5Y+LKQ==?= <peter.wang@mediatek.com>,
 "chu.stanley@gmail.com" <chu.stanley@gmail.com>,
 "robh@kernel.org" <robh@kernel.org>,
 "James.Bottomley@HansenPartnership.com"
 <James.Bottomley@HansenPartnership.com>,
 "bvanassche@acm.org" <bvanassche@acm.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "avri.altman@wdc.com" <avri.altman@wdc.com>,
 "martin.petersen@oracle.com" <martin.petersen@oracle.com>
Cc: "macpaul@gmail.com" <macpaul@gmail.com>,
 =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?= <pablo.sun@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 =?UTF-8?B?UmFtYXggTG8gKOe+heaYjumBoCk=?= <Ramax.Lo@mediatek.com>
References: <20250722085721.2062657-1-macpaul.lin@mediatek.com>
 <20250722085721.2062657-3-macpaul.lin@mediatek.com>
 <b90956e8-adf9-4411-b6f9-9212fcd14b59@collabora.com>
 <845f204b2b2e39b794cdb9c0f3293dc8cba7286a.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <845f204b2b2e39b794cdb9c0f3293dc8cba7286a.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_011005_999564_8581A177 
X-CRM114-Status: GOOD (  14.29  )
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

Il 23/07/25 09:33, Macpaul Lin (林智斌) ha scritto:
> On Tue, 2025-07-22 at 11:39 +0200, AngeloGioacchino Del Regno wrote:
>>
>> External email : Please do not click links or open attachments until
>> you have verified the sender or the content.
>>
> 
> [snip...]
> 
>> The unipro mp_bclk really is the ufs-sap clock; besides, the standard
>> has clocks
>> for both TX and RX symbols - and also MT8195 (and also MT6991,
>> MT8196, and others)
>> UFS controller do have both TX and RX symbol clocks.
>>
>> Besides, you're also missing the crypto clocks for UFS, which brings
>> the count to
>> 12 total clocks for MT8195.
>>
>> Please, look at my old submission, which actually fixes the
>> compatibles other than
>> adding the right clocks for all UFS controllers in MediaTek
>> platforms.
>>
>> https://lore.kernel.org/all/20240612074309.50278-1-angelogioacchino.delregno@collabora.com/
>>
>> I want to take the occasion to remind everyone that my fixes were
>> discarded because
>> the MediaTek UFS driver maintainer wants to keep the low quality of
>> the driver in
>> favor of easier downstream porting - which is *not* in any way
>> adhering to quality
>> standards that the Linux community deserves.
>>
> 
> Oops, it is sad to hear that.
> MediaTek will raise an internal discussion and hope
> we could get the more specific requirements back to you soon.
> 

Thanks for that.

Cheers,
Angelo


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB57CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 12:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCS4Peea+QwDxxv2INYOTDMSnN32Ds0EesZfQ/Pzh3I=; b=K/d8XsINrepttwtMA3YHAfVD9U
	S129EQRF9V+Iu3ilVQF5PGlHblG6/+xsVEAm+khZUOern9MshusbNjBJ2yNZP9N/FnXKQtYbBbCF/
	LhUhWZYrinyuoTfMBDY+O6NdQ4dBFFGsLdDSWgsI85YtqakMenTA3mAXfodLEWFacJouni8C4tWYv
	XPNRyCqFxmaXtI59bmkxVU+I7uM+ral8niG3Hyut51Y3oUq0/p865OB9D/sYuVya7CO9znKPblSV/
	wYlMnTCAD9bmBKJ6odKIBhLX7GoWfPXxhI5lqnBn/7cF5SiewaVXbjSbhlHNjiT94PdVtuY97u5P5
	wql+4HqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfb2-00000004VXL-2I5b;
	Wed, 20 May 2026 12:00:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPfaz-00000004VWn-220d;
	Wed, 20 May 2026 12:00:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779278414;
	bh=eJsuDBXfnaLF6D4L64VZ7eXC4sIgQoPF5eqTtmWx8Jk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BmuDi27HZC6NSgE7XtdgzNVEhrJ40Md5H+LnJYwAV6eXQQyE6UBDx6LiE7maAT71Y
	 PzE9itXp+v+uzO3RnfLLCL5oId/dod4yNon2EeyWe28S7fh61Dj7ejdLEkcKrAGO5u
	 JLFIyQWrcK6iM7nYKM/j0EDel9u8CC9fOQ/VEPuzpdsRk27qNFZdabR7jGJ4O7Z5RB
	 Gl3rxpIKUCWT3c+yO3IjFLAHxwlySO1sKCAhLixM2zusMzxa2PDaYDiKKzoeQh+tBz
	 cqeDrIaTxAYOSXV/xD9yv76G87t/Q2y5CRdkX70RjtWQIxLhQO9fa47PUWGh7iuf9M
	 fviSspxr3CQmg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6311817E040C;
	Wed, 20 May 2026 14:00:13 +0200 (CEST)
Message-ID: <ff184540-be24-47ed-838b-18e9fd260161@collabora.com>
Date: Wed, 20 May 2026 14:00:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
To: Mark Brown <broonie@kernel.org>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 lgirdwood@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, wenst@chromium.org
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
 <agKBkUBVM81Y6MUk@sirena.co.uk>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <agKBkUBVM81Y6MUk@sirena.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_050017_678837_24616BA0 
X-CRM114-Status: UNSURE (   9.42  )
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

On 5/12/26 03:25, Mark Brown wrote:
> On Mon, May 11, 2026 at 12:13:50PM +0200, AngeloGioacchino Del Regno wrote:
>> Changes in v12:
>>   - This is a partial resend. MT6373 regulators and MFD patches were not picked.
>>   - Rebased over next-20260508
> 
> Is there a reason why this is a single patch series, are there any
> interdependencies here?

Just showing the full picture. Nothing else.

Btw, seen your feedback on the other patches, will fix as soon as I can - thanks!

Cheers,
Angelo


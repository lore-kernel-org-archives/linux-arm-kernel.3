Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D1BF30956
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 12:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxlWN5VHxU2836UMOWl//1bZU+D0OzhZKMnKSPhaYT0=; b=pNNpv83siGSzfTcWSYnkN3Pmdo
	iJdjdi1lL6Nh5HBXXmH96GONf3V75vlAXQlojICg2+o1q9e6JAkfQ66zCJ+SWuwtrv71etuSTcPUY
	f6v9SxBHHNC1fi9pOLLoeir9C4hWgsAPmkKtSyrDfHb1dhQjOFxZqJcX7sdGljpumYyhhuvAmnCqu
	NwsbJkUpu3nLRhzO0TOT8nnxZ9WNcUR+uEjLORa0SxH148gT4CSiBVibfMnPujMxlps9m0Xe6aqZk
	PWCaTbqHv07wicyGFQFBBf6+FWAyDDXBs6OkiaKezxtoJh1w6K9p6oyeRih6CqkcSYOecxYBv2R47
	DcTNiuWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7hN-00000001l0G-3KWR;
	Thu, 05 Mar 2026 12:21:01 +0000
Received: from 011.lax.mailroute.net ([199.89.1.14])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy7hM-00000001kzu-1R1H;
	Thu, 05 Mar 2026 12:21:01 +0000
Received: from localhost (localhost [127.0.0.1])
	by 011.lax.mailroute.net (Postfix) with ESMTP id 4fRTCc0SNFz1XM5kW;
	Thu,  5 Mar 2026 12:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1772713255; x=1775305256; bh=VxlWN5VHxU2836UMOWl//1bZ
	U+D0OzhZKMnKSPhaYT0=; b=SZbaEMJQiSNKvzikXuJEpXYE3IOu9NrxZkkOIQu3
	Z8sRSVIzH4KxGjFNf3F34w+/bJwhaHPTavVGVcjyX2yA6D9XEPwDzGf4Z0jSCT5T
	J9mjFXvogOeF6uzEGdvo1THQ6mjcT3kUSgpxjhny46OfzmPb9kp82CtKc8OLGU+G
	yqYKJe/luExc6OMM6c18dwA8jnt9W+exne8kG3Ht2x0q2Dd9ZrhyhEFnN+DGMdGZ
	mgmZEhnrqVbJgQ1x4XhPA2hsyvFwwtDfqTBengvzCs50dr4II90r4ssu119UxKLl
	PcucoLXwh/PoRob+bSoyOUJrNEQAyyATgWpGvDj2FY10oA==
X-Virus-Scanned: by MailRoute
Received: from 011.lax.mailroute.net ([127.0.0.1])
 by localhost (011.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id USyP4OT_KOKZ; Thu,  5 Mar 2026 12:20:55 +0000 (UTC)
Received: from [192.168.132.187] (unknown [12.150.89.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 011.lax.mailroute.net (Postfix) with ESMTPSA id 4fRTCR58TDz1XM5kD;
	Thu,  5 Mar 2026 12:20:51 +0000 (UTC)
Message-ID: <f298d3f3-1382-478d-87f2-ae9b212001da@acm.org>
Date: Thu, 5 Mar 2026 06:20:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ufs: host: mediatek: Add VCC on delay for stability
To: ed.tsai@mediatek.com, Peter Wang <peter.wang@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-scsi@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260305083610.2672344-1-ed.tsai@mediatek.com>
 <20260305083610.2672344-3-ed.tsai@mediatek.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20260305083610.2672344-3-ed.tsai@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_042100_397437_123A77AD 
X-CRM114-Status: UNSURE (   8.82  )
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

On 3/5/26 2:29 AM, ed.tsai@mediatek.com wrote:
> Introduced a delay after enabling UFS5 VCC for MT6995 to ensure
> voltage stability before refclk activation.

Patch descriptions should use the imperative mood (Introduced ->
Introduce).

> +	/*
> +	 * Add a delay after enable UFS5 VCC to ensure the voltage is
> +	 * stable before the refclk enable.
> +	 */

after enable -> after enabling
refclk enable -> refclk is enabled

Otherwise this patch looks good to me.

Thanks,

Bart.


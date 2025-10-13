Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B087CCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 16:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XIAnYj3DsbpzMjwoJ0ze2gZXcXKKCVY1BDuyjjnWQmY=; b=ARWaZBDFOGjo4/zsxCvVn7s/pb
	VBIaYP6CJx6MSK8WMV0eDbX2KlFjEjyDDnRtSHbhLQC9XQ6IOsFLT+Pm4Me5MJC8XgXYqbN3hwoqD
	ZsDsH5x2P5yYi20utlFpI5pwChDSDW14Zj1FDE0ZeSltbuwDckug0Hc9pZ2L1BI+iuPhEVEb9DEgV
	s8qtQ9ZAvpcTW1fmOtXCahg9NSQjk7rZtdOiM0PVDhdl8HzCH782TVE++0hyta/r96JXKSjV0JW6I
	IzeIH4Ua68DMU/oRSxKK2QQXfDIfkTvdeVHt5hLJ946sBRhu193oaT2SVNyekbUdqgKa494dIpWMn
	/lem3Wvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LMd-0000000DrrA-3zir;
	Mon, 13 Oct 2025 16:25:35 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8LMa-0000000Drou-3I7j;
	Mon, 13 Oct 2025 16:25:34 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4cljPd4RYWzm0yT2;
	Mon, 13 Oct 2025 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1760372723; x=1762964724; bh=XIAnYj3DsbpzMjwoJ0ze2gZX
	cXKKCVY1BDuyjjnWQmY=; b=ILM36MU2MgkgaHM9E0Gy42lzYVus9Lfc1vkB3nsk
	tZU53eixYjoUtk6uZS+2mvycAAsU9Ath1C2XiLpV5FY4qGqLoFoeazbHEWq8zntM
	J/Kk++KP/vHo5ZhvFEibVRplAHPJHGT5sp/c8lVeZQwIYYUtOD+SrkCoA0O+7/90
	NL5YKk86wNlu/xvBZShQeVD9tqDGwdZ1Wtl0bxsuyW2CtYoTleGM3CuU6fvP9dPg
	6ky4MCP/knppEnsNRBxmUEWRo4BK4VdUjzFUoYE1jX+D509OAfzKVybfEYVLSExf
	3aY22m5BfNh3MNtQiywFlgJBqtbZTUYMxKYRmM0g9QmgHg==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id kU_6DtTk9V3t; Mon, 13 Oct 2025 16:25:23 +0000 (UTC)
Received: from [100.119.48.131] (unknown [104.135.180.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4cljPQ1R8Szm0yV5;
	Mon, 13 Oct 2025 16:25:13 +0000 (UTC)
Message-ID: <6a2068cc-1d4b-4a80-8a71-e491643a6c57@acm.org>
Date: Mon, 13 Oct 2025 09:25:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] *** Remove UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
 ***
To: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>, quic_cang@quicinc.com,
 quic_nitirawa@quicinc.com, avri.altman@wdc.com, peter.wang@mediatek.com,
 adrian.hunter@intel.com, martin.petersen@oracle.com
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "open list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support:Keyword:mediatek"
 <linux-mediatek@lists.infradead.org>
References: <cover.1760039554.git.quic_nguyenb@quicinc.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <cover.1760039554.git.quic_nguyenb@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_092532_901751_489E686B 
X-CRM114-Status: GOOD (  13.08  )
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

On 10/9/25 1:10 PM, Bao D. Nguyen wrote:
> Multiple ufs device manufacturers request support for the
> UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk in the Qualcomm's platform driver.
> After checking further with the major UFS manufacturers engineering teams
> such as Samsung, Kioxia, SK Hynix and Micron, all the manufacturers require
> this quirk. Since the quirk is needed by all the ufs device manufacturers,
> remove the quirk in the ufs core driver and implement a universal delay
> for all the ufs devices.
> 
> In addition to verifying with the public device's datasheets, the ufs
> device manufacturer's engineering teams confirmed the required vcc
> power-off time for the devices is a minimum of 1ms before vcc can be
> powered on again. The existing 5ms delay implemented in the ufs core
> driver seems too conservative, so replace the hard coded 5ms delay with a
> variable default to 5ms setting and allow the platform drivers
> to override this setting as needed to improve the system resume latency.

For both patches:

Reviewed-by: Bart Van Assche <bvanassche@acm.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8739C5B542
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 21:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLc5NxkI8M6spKxInjbGY5A5fJLpZLq+g1FMQFSSSOQ=; b=12dSkBY4g9npEyw2YySs4lZ8Zi
	17PKHBq5AJ4ut7GU2eTc5BCEIMNUeA9R6cOxgZmWGQGrOxvrMBzSdIPcp2a+UmrpeXvG8x03KSNwj
	+jliiBrhY+IeprnYxrYWVPZAa3u5CBTzJsVZy7W+MEEgDgvitz7VV3atCXxQzSAZhndnlmgw1M8es
	w0JDJOG0+mXvcyi0EnMyFaZICAeE2IZiOzvdYHI6PG8m6SyN6Q48aiOtlrWHyJiu+yj56xtVwcn3d
	0NgPWGfD7bFrHe0iAJwNAC1a243Ssukm//5GRwZYdQF2E7Nu7VOVDSBR8xQOJGi7/ukWIFdMSMNvc
	MKzwkBTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK22S-0000000BdA8-0qiJ;
	Tue, 27 May 2025 21:40:48 +0000
Received: from 004.mia.mailroute.net ([199.89.3.7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK20J-0000000Bcyp-1kwD;
	Tue, 27 May 2025 21:38:36 +0000
Received: from localhost (localhost [127.0.0.1])
	by 004.mia.mailroute.net (Postfix) with ESMTP id 4b6Qwt4tJJzm0gbm;
	Tue, 27 May 2025 21:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1748381899; x=1750973900; bh=aLc5NxkI8M6spKxInjbGY5A5
	fJLpZLq+g1FMQFSSSOQ=; b=DavGqlezNjvN0lqUvuQ+5r9yVyOxdBlWx4RJtljG
	Aa3LRtX/nFT+4kSHpb31UMxnv3Wg4CevSpsUBs2/JanU4/RgZVN3uI2cSNU1tnXf
	Gl3kNcnVCDDR90xPK8JuVFcgkALf8G9Qo4w8xXLWbngogLlSTROy/ceMdWrsTLcI
	+MoVqXKgUU/22UHcDioPxN5TWG0fZeXgSlfsmv6lNwbXkq7f2ShIr20r7TJ1cWk5
	bjv94mDQZUnOf5U6TDijYfXyOlTDbB0fK4B73rLd3cf8gCfAOAaWqX99XAJcNKE9
	asqL9iKAYIRbn6O4EeiX4sqXekk6RPJQZ0u/XWbjH9mbdw==
X-Virus-Scanned: by MailRoute
Received: from 004.mia.mailroute.net ([127.0.0.1])
 by localhost (004.mia [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id hhLAYRg3fNIf; Tue, 27 May 2025 21:38:19 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 004.mia.mailroute.net (Postfix) with ESMTPSA id 4b6QwV5NwCzm0gc0;
	Tue, 27 May 2025 21:38:01 +0000 (UTC)
Message-ID: <ae392b24-9096-45d4-a138-a6fb64dffaec@acm.org>
Date: Tue, 27 May 2025 14:38:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] ufs: core: Add HID support
To: Huan Tang <tanghuan@vivo.com>, alim.akhtar@samsung.com,
 avri.altman@wdc.com, James.Bottomley@HansenPartnership.com,
 martin.petersen@oracle.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, beanhuo@micron.com,
 peter.wang@mediatek.com, quic_nguyenb@quicinc.com,
 quic_ziqichen@quicinc.com, keosung.park@samsung.com,
 viro@zeniv.linux.org.uk, gwendal@chromium.org,
 manivannan.sadhasivam@linaro.org, linux-kernel@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: opensource.kernel@vivo.com, Wenxing Cheng <wenxing.cheng@vivo.com>,
 Bean Huo <huobean@gmail.com>
References: <20250523064604.800-1-tanghuan@vivo.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <20250523064604.800-1-tanghuan@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_143835_526668_4A301C7A 
X-CRM114-Status: UNSURE (   8.24  )
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

On 5/22/25 11:46 PM, Huan Tang wrote:
> Follow JESD220G, support HID(Host Initiated Defragmentation)
> through sysfs, the relevant sysfs nodes are as follows:
> 	1.analysis_trigger
> 	2.defrag_trigger
> 	3.fragmented_size
> 	4.defrag_size
> 	5.progress_ratio
> 	6.state
> The detailed definition	of the six nodes can be	found in the sysfs
> documentation.
> 
> HID's execution policy is given to user-space.
> 
> Signed-off-by: Huan Tang <tanghuan@vivo.com>
> Signed-off-by: Wenxing Cheng <wenxing.cheng@vivo.com>
> Suggested-by: Bart Van Assche <bvanassche@acm.org>
> Reviewed-by: Peter Wang <peter.wang@mediatek.com>
> Reviewed-by: Bean Huo <huobean@gmail.com>

Reviewed-by: Bart Van Assche <bvanassche@acm.org>


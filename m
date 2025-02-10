Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA1AC0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 09:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tw4BfBkwY6f1HptDNeIvDAsYszDKfqvDXkBqqINUxlM=; b=kYXzitZc57n5gU2XDcu3SCrPHc
	gl1PfYnDkMZIDcmzHM3/LKAcu3RHz6PkKHi0g0TpZzkJOSVDpOOlW7jGibwQ/E3oZ0Ob8WEZwk/+I
	M/hq8wtSKzBGA8m42H5sqGAeFr8u+vv+68c8LR6F80KgCc8R/P+VPUNJBERQGLm4TLbWjbePBoMNg
	iUQvbKAs+w4YnacYj3qY2d8iKlZMRA3ck3b2PEgYb/1hMviJpXTtqeYF4GIVRVoBhtQR4u3AbwJN7
	sVu8ZHTg/W641m0jsyRlpppqZd8v/Q+hHdyf/6E/AeBZw97oJn+MaI+L9bq3HqayhaPIM+Hhkw+jG
	CM6OjX5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQZN-0000000GuAe-3HkB;
	Mon, 10 Feb 2025 09:59:13 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQWt-0000000GtpM-30nf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 09:56:40 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 45ED0A0ACA;
	Mon, 10 Feb 2025 10:56:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=tw4BfBkwY6f1HptDNeIv
	DAsYszDKfqvDXkBqqINUxlM=; b=hRAudKGelQQFHre0UjsRkMQGqidGMWp8U0gp
	ngrD0r6MPpPADTnuB10DYMqgqavqQMlMTbYdbc0q3KLL8kFDWZ3tz7auFC6Si0U9
	NtUHUtr5IXnDWt3iGPh0Q07bPRjTxk+nQlB30wtoSrweqqgWy7Tp35d8XBBjlxO5
	UamZs+9nYsFnDL1CVZ2Q8RMwwyD37QPnFD3gf/sjieDHd0oJMUNhcJhtFBHK/y5L
	0cawL1vyTTN4y+rJxI3fEcKz0xNs5Tbxr865hD/FLl0uketDEqs6a81AxotE7Zaf
	aRkNHd0tLUCms3lLpoR5X1Uunop25oC1hsTxEV45NjP4mbDsWg6nuubivZYaAdQj
	Qfxt84Ihj2wpIzF042vYRzzmxvDidwbGG0uxjiferJU/tj0Ef6/UwcdVC3Za3afk
	2T8ScnvMhpdLHsGF5llRGertsUgdCCIxjHRwssAYh/xSKUQxXtnXIU/lXKe0nIRx
	oxALyHmIguq0oPR90lHHiH+VJkCyIE2sebDArG2jEuS7rjeLzqcAbR0q+po9ChiH
	tl/ypUcxVktdZmpqLiQe3KIxjI5FoDV5UOyIxeMpbSm/LIg3/Dq9a1S4TzF18V+p
	BWLDIqlb5sxXnir4On5OA/IEdFwIAveMe1wBtP25RXZLm8woup2dlLjowWGblF/C
	tunTwj0=
Message-ID: <4c8a847d-b506-4235-9941-06e0d403cb62@prolan.hu>
Date: Mon, 10 Feb 2025 10:56:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] counter: microchip-tcb-capture: Add capture
 extensions for registers RA-RC
To: <Dharma.B@microchip.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <kamel.bouhara@bootlin.com>, <wbg@kernel.org>
References: <20250205104957.95236-1-csokas.bence@prolan.hu>
 <20250205104957.95236-3-csokas.bence@prolan.hu>
 <37bf1294-a9c4-4a6b-9e5a-b8bc54ed87e9@microchip.com>
Content-Language: en-US
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <37bf1294-a9c4-4a6b-9e5a-b8bc54ed87e9@microchip.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.254.253.18]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D9485261776A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_015639_916304_DA2C2F55 
X-CRM114-Status: UNSURE (   4.93  )
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

Hi,

On 2025. 02. 07. 9:19, Dharma.B@microchip.com wrote:
> The registers RA/B/C are 32 bit registers, hence use of u64 is unnecessary.

Correct, but the definition of COUNTER_COMP_ARRAY_CAPTURE 
(include/linux/counter.h:623) is:

	#define COUNTER_COMP_ARRAY_CAPTURE(_read, _write, _array) \
		COUNTER_COMP_COUNT_ARRAY_U64("capture", _read, _write, _array)

> The regmap_read() returns an error code, which is currently ignored. If
> regmap_read() fails, cnt remains uninitialized, potentially returning
> garbage data.

Will fix.

Thanks,
Bence



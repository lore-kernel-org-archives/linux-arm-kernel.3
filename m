Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F1A3CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbH6bq2jaTQkSKknY4A3VCJV3Z87FR57/iDoqxDCtII=; b=GS3tarx9FnQDoTrcd4gO2KSpCK
	A2ysde3ks+TMt3Oo5tEk2EVilMkI47vu8gssW+L4RYCsStX3qwJnezhupEHseTBrt6GWF9lGNb/ML
	PGOeIDwDV6Nb4xWDn5IYpZ6SOijeMzxeC7ZHZwzsc0YhzeiYpcAgsl944tLnmU7r6wplOgWjRtlpd
	HPkmsuLzjVF3m3DND/3EJaoPtIJdFi7eSnNVYGOw65CzOE61FPoTx+OKUJOJ8nOel4bDiCETBxxQo
	jmbT/TDRSwIoLLlCFHiWaXvWFuKwugjnIkLpTb/kDn/s3VjB6nurTtkw9vIKDA6piog+0VFS7EZ+d
	HJMNU6Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v6C-00000007PCM-2vZK;
	Wed, 01 Oct 2025 11:34:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v68-00000007P75-0ISM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318454;
	bh=sCNLvEDRPWHptVbnKX/kUysdeluPFhV16BLvGX1OKjk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bFNZgG1RuBZO8WwGbhs2CALa8FK5aZwsdy5Qo13LkpDRaat2aopzOOhNRlm2wH80/
	 5S4/0myiLPIYMJywsSMjB8Y0/66sR3Er+B++6R4VXCxUShX/dU6chu+RuxeTt6pDO+
	 l1nnTYBI1SHVuUuWCMVJ9y2aSvzaVTPUj3stLBEWreK7bgFg2ufYnbR4rUn76A16Rd
	 0NsHQLl0+E6JyoEuTHBg2EdodlewbUJQuIlamEVjF3aYp9DvIHsMjGr/1Tv5+xGw97
	 nTM3Qg2iyzrN+7uzsYb8rYx4xfh7ypKfsmQB+Pft2BgA3tax9Qf9ONufZp4dFQZah3
	 FIvRcSPv8hFRA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DF52F17E12DA;
	Wed,  1 Oct 2025 13:34:13 +0200 (CEST)
Message-ID: <5f04ce31-3f87-48b5-824b-88a28a5d1e65@collabora.com>
Date: Wed, 1 Oct 2025 13:34:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 02/13] spi: airoha: remove unnecessary
 restriction length
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-3-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-3-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043416_282469_FBB7810C 
X-CRM114-Status: UNSURE (   5.71  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> The "length < 160" restriction is not needed because airoha_snand_write_data()
> and airoha_snand_read_data() will properly handle data transfers above
> SPI_MAX_TRANSFER_SIZE.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




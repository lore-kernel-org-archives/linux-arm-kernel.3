Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B819C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 09:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZJ1eyF3XOpFzFTm5C869DddrpISwJi4hxuvAp4+QDrI=; b=zy/1Ftxct2iTM4UMVVBzMzBM9F
	2atG2uiOUBsAckDIIJ1KBnRCd5zmW/NcUQSrZe0wbEJqy3hHNN8p2etU3qRNs2epMIvVNHo3wFSho
	zzk9+lbNUiGbcU6FGgMWbhQMYY+EcY77UkhYUzLgpQ+3b4Kaveg4tAiqvDKKDhPHWGiVs80TCYEiQ
	tuS0e3WaG1MtdSU/VW3G4D8FzSEUpi/vy3Jl+d9J5+mgNtL0EPMYRXA1UYSr8JjvQg9D8G5mcHvzD
	+f418duJJyjJlleSo4tQ00c/AobHKx+jEgHQObZJSyRzwqVJ4U8ULJGVrVVvlGXNiGlXU4wURlzpK
	HmtpfwAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tx09P-00000005GCf-46lu;
	Tue, 25 Mar 2025 09:00:47 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx07g-00000005Ftr-1jCK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 08:59:01 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id B3220A05E5;
	Tue, 25 Mar 2025 09:58:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=ZJ1eyF3XOpFzFTm5C869
	DddrpISwJi4hxuvAp4+QDrI=; b=SONecM2yOaUTb0yUPQpex5Z4ikQkat3Y/i6Y
	Goi3EqzjgVCDo7nyfXFETvU+r9S1xPjdR8a0IZOyCfNqWO8XkthhhK+KyGDiwllA
	DaHjbdm3gG36P/zw6IDSDBda89Sw4FC7USgOBX7g6CKqeXduEg1YB/IIvdR6smgd
	AyhwAYFLG4q3N1xZPzVxoD/h99IpRbNQooQlm61rRxA2S8X9l0HaNHTWNE4JbZVe
	wHj7axEQxrC2T/qV70U+ALLO6MN04aadb2s4ILx6ov56m1Yg64dr/JKuuUM13fwE
	z515uD2H1W9TgABJlVsHzytEyjFewVYE4LpOFkzbSeXZ5OdiBud/Ye+uuyziyZU3
	jnwfyhaEMhdp9OQqr2m9MZUsY5rO2PT5ZwWXOfmG5EeYZ00mrCrh5W9FY8q5TkJV
	+ujBkOOg9M7SwNJO946a3EcQi3Xuk/bSD6MqS51DpBrvwN/eHP7ZP7H03Rb5hdwZ
	KRXtV7DhfZOo3e98EnpJ+pXZC9eOgEnr27gAwHw0MXlKCyK1FPaHOqRRjbsvpVft
	FvA53F6zZMSlppCOw8zQrSo6DWPNI2uS4otXIbLwU2++93OKmUb+OwBDVeBYL4CB
	vMURGrjpS4CBe1fhHWWl4spHxVpKR8pfxbORJJifTUN0UBhLa18Br2wqEdUgAX2v
	0NpjEgk=
Message-ID: <7afcbbee-6261-4b2f-be14-a3076746d53c@prolan.hu>
Date: Tue, 25 Mar 2025 09:58:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v6] dma-engine: sun4i: Simplify error handling in probe()
To: Markus Elfring <Markus.Elfring@web.de>, <dmaengine@vger.kernel.org>,
	<linux-sunxi@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: LKML <linux-kernel@vger.kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>, Christophe Jaillet
	<christophe.jaillet@wanadoo.fr>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
References: <20250324172026.370253-2-csokas.bence@prolan.hu>
 <92772f63-52c9-4979-9b60-37c8320ca009@web.de>
 <7064597b-caf7-42e2-b083-b3531e874200@prolan.hu>
 <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de>
Content-Language: en-US, hu-HU
From: =?UTF-8?B?Q3PDs2vDoXMgQmVuY2U=?= <csokas.bence@prolan.hu>
In-Reply-To: <7332ccd2-ebe6-4b9d-a2ae-8f33641e7bd4@web.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.254.37.248]
X-ClientProxiedBy: ATLAS.intranet.prolan.hu (10.254.0.229) To
 ATLAS.intranet.prolan.hu (10.254.0.229)
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948526D7C6A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_015900_603475_DED45996 
X-CRM114-Status: UNSURE (   7.67  )
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

On 2025. 03. 25. 9:47, Markus Elfring wrote:
> Implementation details are probably worth for another look.

What don't you like in the implementation? Let's discuss that then.

>> On 2025. 03. 24. 18:20, Bence Csókás wrote:
>>> Clean up error handling by using devm functions and dev_err_probe(). This
>>> should make it easier to add new code, as we can eliminate the "goto
>>> ladder" in sun4i_dma_probe().
> Please distinguish better between information from the “changelog”
> and items in a message subject.

What do you mean? The email body will be the commit message.

> Regards,
> Markus

Bence



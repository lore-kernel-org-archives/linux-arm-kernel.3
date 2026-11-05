Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EDA606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 08:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zU91jTw1;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=nDz7CJiN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=6+ADUqVtFDrfgQJ3OhV70TKxA4b9WrHMTSHdV9mWIWc=; b=zU91jTw15xWCQs
	ND/4HYFU7pDp5gNJycfLpn+YL8L9y1BXCMz66rbi3JssoefvE91/YpcwXckv7Fl9gbOyhUe6Don0s
	bm1Li/CrFzzSzrOIWdBalZonjEUYc1hgvrQzoTGjI658hL2rQEiuTlJZ848wrsBaca7nkT16kpxNK
	aHUWL9nyWt3Jtw5qf4xbFa+xz5IraIi/Qx9drpzbgqqSUStlbOG7t8Ol7nf1y92zPaEES7W71uQnY
	3Ea/o1B0A+oQqGtmUrVPAnGIXW/LajCsknKdA993sJUdvHro2vbP1ZB2Nllme5UFVUQztGJlyXHmJ
	4o169Y+AIRQhf+kQPe0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOslY-0000000890Y-1kY4;
	Thu, 05 Nov 2026 08:24:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOslU-00000008909-3Uk4;
	Thu, 05 Nov 2026 08:24:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793867046;
	bh=RctHusTE/ZE8d6je51Pq4bj7K1e6qmeDSw38M5NLaVQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nDz7CJiNR0D0Np06ekAx7PhNA/r85Mx7xWEW0Vj82tl82q4NpdUkm+E1cC1TzEiTY
	 93noRkqJ1HAppXU0XlTsMeRtHa/iia3BMl3YFhHf8GEVPbDbDyRdEWn3MISziq76qf
	 k8Vs7TtY1samutFJh8KJSaYUpHrI+cD+9fkijoBaU12GP9AVdKC80YCrwrKoXKJad+
	 gQVO+PbK+agADkozFxSuUB0Wxu4kcnKrYfhxNZfufoFFsLff5INcMGTgcq7qRzr2Nm
	 etW85kcIC25PvpXZcXI/kFraVgNtnYg+zQXi/tVU6koxKeav7gHgsbxXAQAvr5YEU/
	 Lxjrw/9LW6tfw==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B90AE17E0048;
	Thu, 05 Nov 2026 09:24:05 +0100 (CET)
Message-ID: <b627d513-d587-43dd-b555-584b05e7d043@collabora.com>
Date: Thu, 5 Nov 2026 09:24:05 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: mediatek: mt8188: Use
 access-controllers in the power controller
To: =?UTF-8?B?TWljaGHFgiBLb3BlxIc=?= <michal@nozomi.space>, ulfh@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261011184755.2058017-1-michal@nozomi.space>
 <20261011184755.2058017-5-michal@nozomi.space>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20261011184755.2058017-5-michal@nozomi.space>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002409_091577_3BB63193 
X-CRM114-Status: UNSURE (   7.50  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/11/26 20:47, Michał Kopeć wrote:
> List the blocks that the power controller accesses in access-controllers
> instead of the deprecated per-domain mediatek,infracfg phandles, and add
> MFGCFG, which the power controller needs to enable the GPU timestamp
> counter whenever it powers MFG1 on.
> 
> Signed-off-by: Michał Kopeć <michal@nozomi.space>


....did you instead mean to send

https://gitlab.collabora.com/mediatek/aiot/linux/-/commit/01c35e0524c8adffb4c19f1005c5d71a347acb3b

this commit that I forgot to send for a year?

Regards,
Angelo


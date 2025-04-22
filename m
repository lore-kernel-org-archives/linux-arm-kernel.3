Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80E93C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7vrpOBzU1CNfKbjohZHM/Pmwjdmw6ezgwKO5j1s1R0=; b=aj+RXaMT//wlDe6f81TVk8fGOW
	uEW9bJ98qUJgNK7SeoIEArTQOxH7hvKjsjTdruUQHRBCKU3JHKyHUZoy7b6TlCk7UHjije6PQSjQ+
	olqoHGoTWSaMQZbwENpsUKCNNsOwG4LaIFtBJuUb8gb+pfUkXs/qeyziuGfvNR0nsSNxJIErwwRyV
	W7kBgcCVHRTQZhZG15eBiyEvWdeD16YmwWI5cWfUBKuQLdhhfZN1JyTGRgkmYS6wL0FP59PZ0zMvI
	pQduTtobNXoXjEk8T/X/DOAFbyvdeZCxoNfPQ1A3ytnN5A0DblpnPwRnVVnG7H3JEmsTxRyVbHyIE
	DtczKalA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7I8T-000000085Zo-0bEx;
	Tue, 22 Apr 2025 18:14:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E7k-00000007OS9-1W9U;
	Tue, 22 Apr 2025 13:57:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330238;
	bh=sOIwe0VS+sWfFtU7zCZZgIQ6EcmnnSJDBcSZ+saj2wY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cVwKyuQRCH48gIXlHPOJnAc1Kp33JadQEXAnwPdP1tWYP+L1CYt9+b9V/CqKzwoer
	 qIb4ErAUugPpbDsKULxUxf8ra68C8d4tidGYOxuRsLEAGqJ3T9olxc8qsxQAcB3n/a
	 xP5FEU6x0W4XKReZ4ErNgm0bg2ohKaN9Dg9plA/iFRjWLbzYmwtu+DbDnD9BWzx+CL
	 Aiw6B4TT37LG5K2+K5T39OZqwjgBda9Y8dWQDAbTuArPJUhNjlPmmXzNMkTU6ykMtg
	 okBUUchJh9sL6wJpARRYSH+0dTeNJM1yvfSxiLj8sf/1M/tlonDtCnPnVfqdm40kJ2
	 MjpuAZI4WQFjw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1999617E35E8;
	Tue, 22 Apr 2025 15:57:18 +0200 (CEST)
Message-ID: <748082be-2850-4ad3-8fba-eaaa859e8d1c@collabora.com>
Date: Tue, 22 Apr 2025 15:57:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] arm64: dts: mediatek: mt8186: Merge Voltorb device
 trees
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-6-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-6-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065720_572879_6B8D7D7A 
X-CRM114-Status: UNSURE (   9.97  )
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

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate device trees.
> 
> Merge the two device trees together and simplify the compatible string
> list. The dtsi is still kept separate since there is an incoming device
> that shares the same design, but with slightly difference components.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




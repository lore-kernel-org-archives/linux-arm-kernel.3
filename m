Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7B7D4979A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=91aNnSA4qFdNlN8Qa4xmgUqhmWxQrPHvZvS4bLkNbsc=; b=Illb6f7OdAJsL6GezkDJvAnrAK
	2MIZNGLdRHIAfNPESS3kUzv2rcdT/L9eJaie9NiuHXxiokcgYPJQO5nm7XizRWGjfjxKpSwkfs8Yn
	z8XBVRykUwi34Fe7HxjVXmanPj1lTcTLWc9dP1tHlYpm65Mt5nuppUU+0lYgO8Wftfc5KQwAdxeXV
	7/CdABusanKPkKM0wjjvDVuJHv1om5MZQ6TMm4bDCs0/KCdabKI68KwXjhw5t0TmYD4+BdgBYXKxF
	i1/kw2nIIoQnbWER+tFfqE7GdtFpa7nFn5amCGnJndTIPTIRMAJ6aA2kUqdTac9FVYLxiZtW4vCBy
	zgcCXSJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPc7-00000008zAQ-0IFp;
	Tue, 03 Dec 2024 09:54:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPOj-00000008w0p-2GYL;
	Tue, 03 Dec 2024 09:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733218848;
	bh=m+v2wzlj8p9whw1bgEUHxO6xtm0DYanxCgtzMnVEIqI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=a/ZVNgm3NYnLzgjiP99LRYtHRBeDBRvYOgaJcYdTn/xxXeokNQZ8CzdJmYk3mhwdu
	 PkGXQ1QYL64Ep7NAZ/qvNWVJtuGX+47OLXzGSB5tr1iz01Ug8gHTz1I2OU+/rDCBpL
	 6D7RSoFZlXz+sfZYG8jmlGrQAWUFXBUbjmGWY+xSpnCPHRMZc75TnHxA+H1iIRgHJ4
	 5hrOrVow0yFUyoSKUDNZe1TmDV/nLMOSDxWxzln/W2qxawKNnWRKzrH6KjM9ctfk+n
	 0db/fJsWTise/ouiG7cjdtbSyAMaPgTvzNim2sbdCvGwaMuNwvfZS+YjWLj2JBawQc
	 nLbK8OWV+9dyw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9F1A917E35E9;
	Tue,  3 Dec 2024 10:40:47 +0100 (CET)
Message-ID: <d9ca723c-300b-4f38-9a1c-125df2fb982b@collabora.com>
Date: Tue, 3 Dec 2024 10:40:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/18] arm64: dts: mediatek: mt7988: add thermal-zone
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241202122602.30734-1-linux@fw-web.de>
 <20241202122602.30734-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202122602.30734-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_014049_763546_94EA3168 
X-CRM114-Status: UNSURE (   5.40  )
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

Il 02/12/24 13:25, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add basic thermal-zone node.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



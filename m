Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BE2CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLn38j9MqxH3f8ZhXoB68NoE0lV+FvJsDUgGypMTzX8=; b=JJI1Jl7C/muetmrW/FY63PYQ5l
	svmIHTIWc76uJ5BfaWV0/K172uK1fMkP483SL/Bqz+Fn46Hk7Vk0G9QbH4zHDKgbB5l1E65Jh4Y9g
	w6g6+saKKZTWla0ZObcjK33qAdE17iXX957SvHuPuV9kadw3wmEWWQCTlaYkjClRabUvJQykG9AFs
	YQ4/z9gXYEuVGbIlJhRzsug+PwU9MtpVEsNln42Y7dXpGQjx6js7h6LS304nDgcdKe+pHRjiR9vkr
	HyXM7sU1cT3Xn+fHDCyor+JsDJoGP2pQLkTNYQHzkUjujzAA3AJnaiqdE2Wq2XsK0YSPoS7kbq9Ct
	f3mVqzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFRb-0000000Ccrj-1zwK;
	Wed, 10 Sep 2025 07:40:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwFRU-0000000Ccla-0kcT;
	Wed, 10 Sep 2025 07:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757490032;
	bh=sbTKr6Sv0EFGEa95dRZO+2Ih9nmW5u7BxTNwSFogEQM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pbYcgpW8xbv2Kj9bHUM5TRVzh6xO5raDjot9Yn3xvJfLGLkRCBq8B9nEMROV/y7Qu
	 rvk17Qbq+OwkzkVBT+DQcTurGCbxPJlx3gGfQ/ImkXK+eh/i9hdb3f1ZrkhfGYg1Ux
	 MDcoYNp7AxfdT964wGgEZh/H0v8HsOt2/U3+wkozvQHlWaLAde/naI87kd9fdDw9lD
	 RSwXS5tyvr/NCiG95Q30a63L5aPOJP/q2R2gnL5TYIUNOMQRtpKyIfezXlFzM7oit/
	 rKKtkdaVWt/CMukAC6lb4iw6yxbUChiOg4DvFJyKdA76EuFUZxLAWyic0HWYHnvsUn
	 +x0+HMoHV1VUg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 78F8F17E0125;
	Wed, 10 Sep 2025 09:40:31 +0200 (CEST)
Message-ID: <5685f861-9791-48ca-8f94-fde0a4533048@collabora.com>
Date: Wed, 10 Sep 2025 09:40:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/4] arm64: dts: mediatek: mt8390-genio-700-evk: Add
 Grinn GenioSBC-700
To: Mateusz Koza <mateusz.koza@grinn-global.com>, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com, andrew@lunn.ch
References: <20250909163052.446723-1-mateusz.koza@grinn-global.com>
 <20250909163052.446723-2-mateusz.koza@grinn-global.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250909163052.446723-2-mateusz.koza@grinn-global.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_004036_395365_FFBAE163 
X-CRM114-Status: UNSURE (   7.58  )
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

Il 09/09/25 18:30, Mateusz Koza ha scritto:
> Add support for Grinn GenioSBC-700. The Grinn GenioSBC-700 is a
> single-board computer based on the MediaTek Genio 700 SoC. Its device
> tree is split into separate SoM (.dtsi) and SBC (.dtsi) files, which are
> combined in the SoC-specific .dts file.
> 
> More details about the hardware:
> - https://grinn-global.com/products/grinn-geniosom-700
> - https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




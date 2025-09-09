Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C69B5CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yoFiKuRzZrDROHsmA+h7aAVlc9TH6J1dHFGVXzIM80w=; b=Qybf+hLk2X8vXzHjbjOoQ5s8KJ
	PgS0jiQwPDJYywyHHyOib5QcvjM5aYDA4pVt1PzYQ3eXveT2bnl4tomN4Yb9gxKFaTHvAFQ30WGz6
	a6GJIwveZhL9CDbm1xEqIjUvvMudXxvBp8w+QiTux1J5LITC5fhk0Efndyey24g9xCvqMevSjW3s+
	ggkdywg06eK2a8TjyWQz9gumsunKUFt2ROZvs87PT41LhffenOVRhXZXTcS2XHjoyX8ArCMz257Vd
	NQ2tBcihA6+UgkKkXXwEoJkwjIMGMHWsWja7PEKL0rjRABBSbJl//0pK0UBlSC2ZtQlmbENT2zEVD
	kbP8wcJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0O9-000000086yJ-3UwW;
	Tue, 09 Sep 2025 15:36:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvta0-00000005Wmo-1ybp;
	Tue, 09 Sep 2025 08:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yoFiKuRzZrDROHsmA+h7aAVlc9TH6J1dHFGVXzIM80w=; b=cO/A5CmX7xCI2kSHijk8+0CYsA
	xaWEXCFPhj/5SISo2XNm98Nktwe71XenUmwFJZVoT2U4e1WP4rw+6ume9lDtLga4QMn84l9jkuhN/
	3sew70abqKMGBPmYk69AdPSQl6gIZs28Mx0TlMN5U2SP9Hu9Jw36sNToS59cQOTAYOr9cyz8QwYjp
	pm59DrTJ3ta2LKuyUWJLBqbf6+Tpe16bbNaEuld/BE3VbeJ4Gpq2ID7YuZNFszbxkIlphPVNpnjYR
	DNoLiwyKAkHJPHE/BulIdA8YqODN1EdoLFxct3h6O87cL5kWS9AqwIyfvCUcPplBoS+k/cWbrXQUJ
	8bXUeBgw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtZx-00000005FfR-07Nt;
	Tue, 09 Sep 2025 08:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757405988;
	bh=ib10Ikrck1ITj/Qwrm0G604sOfeD+hWgdObHTi7gHMQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MonSk/cTG9nqqUyR1rBPxC8jCTrqOuYiG6IfFPameaebVNAh/5proMiievuNWlrUk
	 Xi5YZwEkY/SLR1YGCc0T1NKM19mU903KCMHyc84mnLd5t9e0RnpoyZQDaX7qYlbhTz
	 285TPvhc3PKZ3bjE1TiexqU3DJo5MY7Fhn00fsjSR9dbWWOX1Q9a62sDqhDsm9LL6K
	 0JySlBCxAGZG/CUtKpPoy8yKULtqveaBvTIHR/e6BiiguS18IHAGsmOWUFDdzIg9My
	 fOhQQYGX6/vVxjTpO02oygarybATQ2dFKX+Vu4C/zic5iwKEfIguHcHJC+M8yv6NeN
	 vOTYy89QqNEOQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F419C17E0FAD;
	Tue,  9 Sep 2025 10:19:47 +0200 (CEST)
Message-ID: <75015c6a-f054-4d13-b8fa-183c512fa52e@collabora.com>
Date: Tue, 9 Sep 2025 10:19:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] dt-bindings: arm: mediatek: Add
 grinn,genio-700-sbc
To: Mateusz Koza <mateusz.koza@grinn-global.com>, robh@kernel.org
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 marcin.czarnecki@grinn-global.com, b.bilas@grinn-global.com, andrew@lunn.ch,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250908130620.2309399-1-mateusz.koza@grinn-global.com>
 <20250908130620.2309399-3-mateusz.koza@grinn-global.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908130620.2309399-3-mateusz.koza@grinn-global.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_091953_320272_6CAF2146 
X-CRM114-Status: UNSURE (   6.29  )
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

Il 08/09/25 15:05, Mateusz Koza ha scritto:
> Add device tree bindings support for the Grinn GenioSBC-700, a
> single-board computer based on the MediaTek Genio 700 SoC.
> 
> More details about the hardware:
> - https://grinn-global.com/products/grinn-geniosom-700
> - https://grinn-global.com/products/grinn-genioboard-edge-ai-sbc
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Mateusz Koza <mateusz.koza@grinn-global.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




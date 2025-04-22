Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4FBC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kbMt1L1BOwhCgVxGj+UJaD0R9pmk3Y0rLTHSDJkQCjo=; b=dVyzmvZd0onAdBzBWWExPstsa0
	7mOJGbD24zbDzokXbjg1GKsANM63pMZgOmFRVHybOtUBrm0IpvVutBZLjCMvVkVZZG5axtp0zz1RC
	BqZhK2dOLC2rMqCFCa8BP4I/45xuAPn5QjJ1QFiqBMRfj2z8CfhmRXDKaOZRsbI6jxTSsG2oSfk/y
	/G/MOxOQGeKbXj17VSLI+Ju9Fpg7lcUk9rSOmxKwl30qfBnEcCSrRx4XbivsDhRsi+5KdfxyRspb6
	SuLgaYmhJfFIml4LI3ML0DcVA0XWaxoqC+p4lQpajrqKsjQegz9jsTUpvNIVkn5qRJX9iEx4QPEbP
	GvEbTCjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GHK-00000007rZM-3oLD;
	Tue, 22 Apr 2025 16:15:22 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Dvg-00000007M52-3x4b;
	Tue, 22 Apr 2025 13:44:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745329491;
	bh=WynR8L5BQ92M+53aOKAzVzpk7FToQpWuQOuOQxLXzcw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PMzTCiA9hbuk02gOjtxpO1b65EoMoX7GSYJyrM9J50+woyI73LBx5V2ZfD71//djs
	 bUS2BWXxkC9rfgKcgmJb8yp3G5qGq/Sfnxx4sGevmGrM6VxtvaLtY12K9+s7/e/FNa
	 2WmloGZwoDILBXMOQ/8xIThZ6+GhsrjocFsySpl1AOZWYh+3WOXH6z9UEvQxNWGwUZ
	 1QHlDJiVaJTUbUV94vjI+Vz5ZLXCxrQ7SuQ13z0T0r7D2NN5AF9IikDDKfuzIq/n2u
	 AicTOiL/M073aAdz3pBTB/34jIJnY5+Sy47w/9Vh7UzpJW7zcnkoFt63rwPmk6Ehxx
	 BXFvWcJ1Pj5Rw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 74A6517E0B9D;
	Tue, 22 Apr 2025 15:44:50 +0200 (CEST)
Message-ID: <d86e6559-3b85-43f6-a8b6-8906a7b66b0b@collabora.com>
Date: Tue, 22 Apr 2025 15:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] dt-bindings: remoteproc: mediatek: Add missing
 minItems for 8192/8195
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250421-scp-dual-core-mt8390-v2-0-c84117a959a9@collabora.com>
 <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421-scp-dual-core-mt8390-v2-1-c84117a959a9@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_064453_152392_8D291D78 
X-CRM114-Status: UNSURE (   8.48  )
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

Il 21/04/25 22:49, Nícolas F. R. A. Prado ha scritto:
> Both MT8192 and MT8195 have an L1TCM memory, so it should be described
> in reg, and therefore reg's minItems should be 3, as is already implicit
> by reg-names being three entries long. However minItems is currently
> unset for mt8192/mt8195, resulting in it being equal to 2, from the base
> schema. Fix reg minItems for MT8192 and MT8195 by setting it to 3.
> 
> Fixes: 6b55b1e2fd7f ("dt-bindings: remoteproc: mediatek: Support MT8195 dual-core SCP")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



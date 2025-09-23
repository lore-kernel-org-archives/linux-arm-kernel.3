Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2384FCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Sep 2025 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TS0iKXXDUv1pjFbntIn3YMVZGuwWZNSMsqVBBGKgrRI=; b=r14y2HQNzzf6QQtDvxXTP1/WIV
	iJ3JynIamTdh6tgYbugwnMCwE1i7em5FHkr3AquSWqvf+SATpobjeNCUR9lNaPB9KDqHLPsN3yK4x
	1+qXfBjie78Td3IecethRFxHFVjeKqbwHiMyMu2/rCR8OJpEUtoSaZUEeBiQS7cu1JET+AgBjmdwK
	CWvBba5p6841+3hjVzPBCbVH0YzMsSytnzALcNq3S9x2dbSn07c8chyyVC2XSJkX7AzHgCFMGfGlH
	1hcXUGSWNi5PF/HyhGZlilp5rgjMYDJDsPGhD9toksBDUQGFd0DDxsWVWMtSaQdXBGypqaOZ5MzjQ
	mrIxrTzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zjr-0000000CzYO-0xfK;
	Tue, 23 Sep 2025 09:55:11 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0zjp-0000000CzXS-0McM;
	Tue, 23 Sep 2025 09:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758621307;
	bh=MZWNmQROaaiEO4r35cOCMPw3NenGe2yMbo5yIUgeE44=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=e1vPxofDp0H2QyGMxhrKQ/VqWTJIn48ZIvUGHdT2CSt02BqRPzcIdg8MiL1poz9Wx
	 klbLlgYcLiWLhY7EhDEc5UmKio1aE5NShltGMmaLgMWYDSEzj/ge7e8YjlY2c67fFr
	 evQIDi4njNM+Wn6iHD99YTuAGrhDbjvKGjCNjw2tm7okuhBp+CtVe6FPqwcduEClec
	 xP8Pa9HmEefrhn5INy+7ROLk9w0L4cQxsDmfYhJwsUvAhvSVEiJ0HAjCJxmlsg1SNW
	 XvGaLJy+oFs/lvdlhyG0N3a7UcGe+AyQzrlu7vvQ98Rx8U/C7v6ZmtvWxTMEwU5pW+
	 PVaM9NxIjyj+g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 99E9F17E10F3;
	Tue, 23 Sep 2025 11:55:06 +0200 (CEST)
Message-ID: <2fb56243-1e8d-48c0-b510-8fdee489ebd0@collabora.com>
Date: Tue, 23 Sep 2025 11:55:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: memory-controllers: mtk-smi: Add support
 for mt8189
To: Zhengnan Chen <zhengnan.chen@mediatek.com>, Yong Wu
 <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20250919081014.14100-1-zhengnan.chen@mediatek.com>
 <20250919081014.14100-2-zhengnan.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250919081014.14100-2-zhengnan.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_025509_291199_507EF337 
X-CRM114-Status: UNSURE (   6.68  )
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

Il 19/09/25 10:09, Zhengnan Chen ha scritto:
> From: "zhengnan.chen" <zhengnan.chen@mediatek.com>
> 
> Add binding description for mt8189.
> 
> Signed-off-by: Zhengnan Chen <zhengnan.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



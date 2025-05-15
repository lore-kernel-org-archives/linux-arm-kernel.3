Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4366C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 14:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InvZABluBhLdde7ThOkcOclQUkcJwX6Zkqkqq0RzZPw=; b=qa6aU0ke3vc4J4WgrEpVbJ92W0
	73k2NN/tZoyZB622EWvFQ/DmNjfkna0rYJYXWdZNUoGtCOD53dgNYRsHcGOiNEq/INt2nfpR189z0
	6RWy9efojPnf1tGAsIZshLmff5wklAY/v/k9zbVrc/5tMlFi09fnELERYT0SwPsOt9Im2mJKBjPzc
	dhnOqn2Qz1XQdI+NT6uXlTALOfSotKQ0X+9biNfMKjyjHSl3+fvyqd8bKgIK+FvKkVKbgiQ01ZvIV
	g00k121Hs9wSwIAIY/IqLFfajTmgRaB/RXEuxy+o1khS6eUbZxOvexznYKJI8xoi62I9Q9BB4l26H
	JpAo/ELg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFa1v-00000000xu8-08tF;
	Thu, 15 May 2025 14:57:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFZwl-00000000wqw-1dLF;
	Thu, 15 May 2025 14:52:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747320749;
	bh=F5SNJrqSpwmsGkyY6xl7s4ci6DCAjBHoLSPwiIEcVm8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R4rW7++cWu4sO17Y7TZzoZA95tSmHEFWWIOygJXR3/vQSsIk6TljdeQCWzdRsZvgP
	 WGniK6+fgU3Djaj8LtZR1E34pA23ONj2Q5MNN4vFfzezDGdIhlSCzh+4rhNCoSj8mL
	 sa4OCADNPFp3DUHQ+g0gZXcZVBFjvbpvhUmb2kVkCEayXjxLVT26cOPYEA5fiHBBOj
	 sz4+wc0j/cn5izGI+c+CApAZ67GdEG4v0JirqDiwn8Kkdyp1Ut333IHdFKp1CmC4uj
	 ShpEo9yher2JWml+lIQjH7nTsAHXu9s+7NKWnHubTQSq1IzTYltMNsLi9ohxLXAm7Z
	 7TW+7zxvexj6w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6DC3C17E0062;
	Thu, 15 May 2025 16:52:28 +0200 (CEST)
Message-ID: <89234201-9315-41f5-ab13-68272f62c53d@collabora.com>
Date: Thu, 15 May 2025 16:52:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8188: gce: add missing
 'clock-names'
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Garmin Chang <garmin.chang@mediatek.com>,
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
 <20250515-dtb-check-mt8188-v1-3-cda383cbeb4f@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250515-dtb-check-mt8188-v1-3-cda383cbeb4f@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_075231_609986_941AD6AF 
X-CRM114-Status: UNSURE (   5.74  )
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

Il 15/05/25 15:31, Julien Massot ha scritto:
> The 'clock-names' property is required by the dt binding.
> 

I just remembered something....


...care to respin this patch instead?
https://lore.kernel.org/all/20240911104327.123602-1-angelogioacchino.delregno@collabora.com/

Cheers,
Angelo




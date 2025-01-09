Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64E3E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 11:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjSiqb6e4IBgxQll9vw8piF/UrvkRqUT25X5qnqk+eI=; b=tPDcBjKSDoMyxcaJoZ8eLj8emX
	E/0ETpBe8Jeks9/lTalQQfePGFqy77jsRRSGHUBb6bp1R1FZe5nN7TgIqhVEmpCzhtdeVgohO/oi5
	7Ezg8YUsjSMSq8qZlQrf8xKHh02Q1v9g7BpHWvsuP3fqk42jN9ZWODlbu46Ms7ugF2srKuiLTqfHP
	aqDd1om3cobCyhnakoA28YTyyuXQI6lqocPYoJBOxNvofYMwMvozlEWlA0+63iHBjMPrUpNwQEVzA
	5YkK0Sk3NonKu2EmLYA8njtWPvG/OqQ4oFFyqjRdIulbtFaaHaRH7vodQrbYXnDr/ciwUvBmmXEfw
	YO6xnRsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqjl-0000000Bj89-1q84;
	Thu, 09 Jan 2025 11:30:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVqfc-0000000Bi7W-0H4A;
	Thu, 09 Jan 2025 11:25:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736421946;
	bh=BFjD65WBExBPfvbw7B+Wz6EkV2SIH6yF0Zu5lxmDsmw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=bHPzlYqHxmIzKHxsDwer7XVhuQR2BP+c+iSDTBKf4gfSOWqOonyuONPtCOagSAKdl
	 7oTtWzfCp1fc9h27cJ1Gfstb7CEsz4NtOMmTYosaoVynbXiCW0tilPAA24MeuP5iIt
	 ZLZlMce+/ilo+t0BzAGzDgj/d4r4vSta2/jGJ/7QrtwyaP25dlRw3dSMrbimlNw65+
	 SaajaAnS0aZlN4/uGIRlF1R8geKyZDMA7l73cbvI1YIwtph7KgEtYY4ZrjJPoJg6dU
	 SAk+21yHo7Cfyx8cuTRigeRluwv1enUkCzU/bljpz1sRxPnvn9ZFBtb6JxyyfJRmof
	 5e+SkgXSUcg8A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6AA217E156E;
	Thu,  9 Jan 2025 12:25:45 +0100 (CET)
Message-ID: <578fd025-aa40-4b3d-bb4b-dbb9957db1c5@collabora.com>
Date: Thu, 9 Jan 2025 12:25:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: airoha: en7581: Add Clock Controller node
To: Christian Marangi <ansuelsmth@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Daniel Danzberger <dd@embedd.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
References: <20250105150328.15172-1-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250105150328.15172-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_032548_293614_46789207 
X-CRM114-Status: UNSURE (   6.24  )
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

Il 05/01/25 16:03, Christian Marangi ha scritto:
> Add Clock Controller node for EN7581 SoC to correctly expose supported
> clock for any user in the SoC.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




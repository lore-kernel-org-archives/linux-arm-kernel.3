Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F78D6ACD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 13:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9IZrGQXyfN5GIzoOYrcBqbhjAramRYFhigl9l64fgA=; b=nmj2wW8fnBVw4aC9GMmGx+OQdE
	eX+09jzt1a+o33fmPqjJzkfYiHp8g/P2jJbX/WZpwHDsKrFRfv0BK6U97txqmk8Q9LSPafGLnQIKS
	XazrekYY4OdmoL7y4KmpT9aWVRvXn2SwOHM6AeDrmfe66xnYpeVMjzIaTKuBZY3z+yel19lhNxl7/
	z530WBlyD4wEH4dOGVikxrj802kARnvlS4+cqlrTH7WOthBIrDqrOk0rOSoy/N9ED6cO4knhxjeYt
	FXot4i0IqK4CoX65CZfmDtUvrSfWPJ9Gt+oPIz29m7Sj1y+M6yiLH60sfGWxZq53bW5j5ufCVb6rk
	yfG4dMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIDo-0000000DFnd-2gtK;
	Wed, 27 Nov 2024 13:36:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIBt-0000000DFMY-0y2x;
	Wed, 27 Nov 2024 13:34:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732714487;
	bh=+KLv+7B67Pj73+MfMlBhlmU3H9GCiOye62ujVxuxz/Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cwZd3/8T30EANXVeNYt4ThGyscNLAqf6K+nWZd0RF/FiyxVlP8Ljl54mz9mOM7/yW
	 a0CmqQTtr5s9P8ZPQOWMIntn1wDbEttz88piUhmoV/LaQ4Tg1O05PXioXUfoR4flSz
	 mGeBz/VEqWzkGbnaDrPKtj4Ir7P3MoeX0He2x6959CyRRjJtquaapCKF3EB5eOQzAj
	 K15xwDbAQk9LWT1/Izmp+stthIdKYpashJmKbuFEwePJy9IN0zxW9kvt5hEq8ozeMb
	 g9+Z6+XdevRWGXMyYmro3pziDqUjS5mvexBe+PIS1qcVnoqCWpuQAMg2srV5gE/cMn
	 0q9CFrh69ARiQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E31817E3704;
	Wed, 27 Nov 2024 14:34:47 +0100 (CET)
Message-ID: <52d323d8-1896-45c6-a826-2e3f4832efe0@collabora.com>
Date: Wed, 27 Nov 2024 14:34:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 01/14] arm64: dts: mediatek: mt7988: add missing label
 for apmixedsys
To: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <frank-w@public-files.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20241029103937.45852-1-linux@fw-web.de>
 <20241029103937.45852-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241029103937.45852-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_053449_438992_A385FA26 
X-CRM114-Status: UNSURE (   6.61  )
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

Il 29/10/24 11:39, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add Label to allow easier referencing in dtsi and board dts.

Please add the necessary label(s) along with the addition of their users.

Don't just add them randomly like this "for later" without any valid justification
(where a justified addition is one that shows that you're adding the label and
that you're using it somewhere!)

Thanks,
Angelo



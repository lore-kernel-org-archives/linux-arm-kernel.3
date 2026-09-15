Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD895C88E73
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4s5ck+LOQCk5Jukr/SiL5s0RdiNIBl2hFKGTskyHsA=; b=eB/hBTc4oE4IPXFqhvlAZyqVFh
	wZjBBqxNCv7u9QPVJ4EtaXYvArBVFuyWkyqwMLb16Kac5Ed/PRoaKCiiziNETeMFcs+RrmJe89iKv
	xjy+eXds9GdRKg3f26vTZyVNjmTJ7XPMP76VVHQeVnBfVgl3gLeQAwV1ekZS4mS+NQ8INt0z5ljsx
	3Lggxnk2opM1He3PKlnLQc4upNt6k4YzGnaLJLUZSAl96ITXGorjoMbgpat2dT7CskkssPsbb3A5J
	mmYIkiw8Mub1fAYKuvdea0TWxzGWnqIc/Ivx53CWwuWXCGj7oqtkg3E34+BunhDQQVZ9/Ktus+CKk
	LMzxsLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PBN-00000005kYw-0a0j;
	Tue, 15 Sep 2026 09:10:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6PBL-00000005kYb-2rTj;
	Tue, 15 Sep 2026 09:10:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=q4s5ck+LOQCk5Jukr/SiL5s0RdiNIBl2hFKGTskyHsA=; b=KQPtJ2c2yDpQbPNSXiaz54EoG7
	WazqzuxLKEznGTSajoEgjX8+xgkJXyXwKE0uagekY8pv69MgGZmSlLgLyvmYoWyWmOR/+nezFE4sX
	s/S99nvKD0DYPjWgz+4iUAz03PzZ2fn6Q6nWjkDAKc3xZgx6LJF/RLprOYWXF+CNmSl+Lf1dzIccZ
	QmD9LlkrU+JJ28UtJDDLOQme5hRCCA+PLJJbSyx8UTF2QjtiOPzVqTJsvtOMdxHxE/2S86Yj48Pgo
	lslmOtXmd5PmXaQTFliX2myQD9mj0CaeKC+p+ifnqn8YquPUcyBXPES4pyKjhvR5cScmfco+epmeD
	OeDYFexw==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6PBI-00000006TxY-29c7;
	Tue, 15 Sep 2026 09:10:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789463422;
	bh=oqoN/3yz4EQxlXhOpEcskoCheM7vuoIJRO+Ry84Kz/U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OdfcTdMPuW+Kr+zHz0bsS053VjlAdz66WEMDa5967bszQUarPcPffVE4z/8hoX0CC
	 J9xlQbaMP0NLUt5glOMNlO5Vu98yIjuHq7BxXBDwBnWsF5omdGALTsVnllycbYDr8H
	 aE/W19nNntQSsG7j8IzBIPF8SO3a3qN0b0WMgzDfpask41c0sXEyS2TEV57zBtyfhj
	 goViAoBqIMQ+8Uo/mcfcath0bxMTlM0RCXlfUaF7lM7iTasxEVZhkWLy7CSeoTvz2h
	 jxCxG5/7OnnFbE61g49ROG4hJBp2DZG3iKfDyXp+Hom1mrC48F0msS2ubl8rs88N3i
	 Z3feuKnI4CIHA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 33EEE17E07DB;
	Tue, 15 Sep 2026 11:10:21 +0200 (CEST)
Message-ID: <409f6896-8d69-48dc-b784-a38f50cfb07b@collabora.com>
Date: Tue, 15 Sep 2026 11:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] usb: xhci-mtk: add missing
 pm_runtime_dont_use_autosuspend() call
To: Joshua Crofts <joshua.crofts1@gmail.com>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 stable@vger.kernel.org
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
 <20260915090223.1346-3-joshua.crofts1@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260915090223.1346-3-joshua.crofts1@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_101024_971737_CBAC459F 
X-CRM114-Status: UNSURE (   7.80  )
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

On 9/15/26 11:02, Joshua Crofts wrote:
> The disable_pm label in xhci_mtk_probe() and xhci_mtk_remove() both call
> pm_runtime_disable() on error or device teardown, but don't call
> pm_runtime_dont_use_autosuspend(), causing resource leaks.
> 
> Add the missing pm_runtime_dont_use_autosuspend().
> 
> Found using Coccinelle.
> 
> Fixes: 0cbd4b34cda9 ("xhci: mediatek: support MTK xHCI host controller")
> Fixes: 04284eb74e0c ("usb: xhci-mtk: add support runtime PM")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



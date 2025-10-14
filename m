Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B551DCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 13:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CWNyQpTWJZMvNzHiUEkZt8AFGUCv42v6ziQQlkYhwTw=; b=rpBZ0TfzikUQirgfX9rsPxSuVw
	14hRsuJw86/FGjPcFqN9GtmTVGUo/4/Op62aCFOmTEsAHUONzYvEk/K3vWaYPWihqM63Ta7lUZ7Ob
	UaRfV2kLdS7nTxF6tND2/1O+WyStfT+/xfieTXUlZJzsK1kFacDYY8Vl2c4CS+HJwrUD2QvGlTXbs
	Ykq+B4mExoOr4DnmpsYZJb3mg6jiL/TpQ9t/jwJ9tv7+3lxZbGgx8jSbCJUriWf8X1VgXeJxqkUl7
	VYiTSC38cUM1O3lADs3rz+IYsvPBtxEPjNslBDPAOzLbnT1WDCZpFdIQMrgwWe9nCreziKrQCbY4/
	VRIi2iRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eyN-0000000GSmt-28Hx;
	Tue, 14 Oct 2025 13:21:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eyM-0000000GSmS-2fd2;
	Tue, 14 Oct 2025 13:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=CWNyQpTWJZMvNzHiUEkZt8AFGUCv42v6ziQQlkYhwTw=; b=c3fZCyRxDB2DJeSxljSeIDnvfA
	tRS+AXduDd0GdPaZQvvaTf4gVxSzOs08cY1KwAUqqLwFkYQXNgsp/1cCZnqgw2F4UWuysI0SMp7BO
	sO/HkllDu1crPpRgQ890mYOMZ8IWofJpdNQv2aTEO7TBw8RhTwm9T7ZYqJgHLoMvs+Lf64N7v7DzE
	nM1KTSNIGdMLTKoiON1r92iIloaRcfPoqqyyNKczABlndhS0YW4lZtWLAKeIykW0VhKruAsdnG0dX
	I+MU+JyQ8xU3D1VaMGygHwRkQ2SZUxA3VPTPeB6nW0B/txQuw3JQ1kdTZcJuu2EkyRlPcLYB2g/Ef
	9pIBjJWQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8eyJ-00000005C9v-0bvn;
	Tue, 14 Oct 2025 13:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760448105;
	bh=zCgNIkIe81eviywn2khOOfKzvpgqFCye5+tn1JB2k8U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FDLpWcw0QdVM7FZLv7GALWkFRQzRz88Rz/7SCz38RKgob7fEVhvcWSuo/lCAJJJg9
	 uCYNCecDlFyuYrFMeQDRbTtSOCUXJ0r9p2wd1jIXqUbKVKm9FC58046YYpOmE6LS4s
	 3FBi3WNJATGPXHWd+rp5QNHTBptH6vNr+XsvbonXtkyjYnso06FwSg6lN2/zzUMHkx
	 F5pqMIX/ZLulBNiVmXsyj8uhEVaHhc1rIhBz6BhjDAYX98SiQwvGwC3cm5RU1spxGG
	 yWk5JP5TnJkvcwcYRWjtovbL+zgHKB1Q5mO7VlMAiibduOMXzioEtvLn6EQGJa/SnX
	 ustCBjyvJeQRQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BFBFF17E003B;
	Tue, 14 Oct 2025 15:21:44 +0200 (CEST)
Message-ID: <4e0d5f72-c35c-4c04-b0a0-dfcd5cb9ca59@collabora.com>
Date: Tue, 14 Oct 2025 15:21:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: mt76: Use of_reserved_mem_region_to_resource()
 for "memory-region"
To: "Rob Herring (Arm)" <robh@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250813214917.897113-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250813214917.897113-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_142147_442796_DC7EBCAF 
X-CRM114-Status: UNSURE (   5.11  )
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

Il 13/08/25 23:49, Rob Herring (Arm) ha scritto:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




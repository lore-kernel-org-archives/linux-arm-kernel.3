Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13310D3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 09:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mEiJjBcS/zmXFiMk+WTRzR8Iepm0V2q9C2V+SksDSwM=; b=lCdb5aDnZWJV8Jjz5RvQeVSYPV
	1PYw50gTrogxYarKJ7AsZscmE4BsR4WbQWTHdQkDa28UI41KkSxSaG/XYh0nanCYtYwfBkVpmPuCQ
	Kl1Z4XQZMRW72smTIalOi5PH0cqvjJg7isbtdJO9H864GzKcQPZhxZ4xqzAV84SqP1HaiBOS0hbrI
	sJoGpPec2v6Ly0TwKUMD2KcWHIvFpS4QsYlT7IR0cdS0D1tQapj/tFD/l0wInTx81EUUgn3u1KIFA
	+PwxMfkJnxLltVtCf0nhHWPpQyGYWYlxbsesk6VaTbnGCKBFmctJ6QF9UPgqEHWPMnAANSXPhLjkr
	/wEWOa8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV4v-00000007VFk-2iA1;
	Mon, 25 Nov 2024 09:08:21 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFV3x-00000007V4j-29VQ;
	Mon, 25 Nov 2024 09:07:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732525640;
	bh=EWvGbl7jxkC5nJhjdRHyih0oNCIT/8717SCJPMoO/Ic=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=QeN1hjPzd5WO3CzmPM9z0SMKXcK4PzvkANBjUmwzZ6drNaAHrVjrzcfQWQ9cWP5Oc
	 xhZQbD6BqciFI+G3ZhG2Mnyk9vAxTPGjdHiLvrBb45YOEm4J5oeeR4laxicIm9qIDN
	 N3IUABVsyH1sV37JLpSQ7OhU6X/xlwPXWWnXqI9jWhiq1rPOM7vdfCuuHce9GSN+jo
	 JQxSbN1IFM+9a4C9ZgAdpW3eUiGftYbx0GzLjgee0uLPCbZXy0makkfQpYetpmzcVb
	 SCzpJNdCz9dwXnzjdwAAlsgrkO6Yfb8ZK7tsHyvC87eH3vtDS41skGSLEYsBpZGmqF
	 i2Yv2imf0KsIg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6460117E1323;
	Mon, 25 Nov 2024 10:07:19 +0100 (CET)
Message-ID: <91b8d700-218b-4d94-98e7-7c32452efff6@collabora.com>
Date: Mon, 25 Nov 2024 10:07:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: arm: mediatek: Add MT8186 Starmie
 Chromebooks
To: Wojciech Macek <wmacek@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Rafal Milecki <rafal@milecki.pl>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241125082130.2390310-1-wmacek@chromium.org>
 <20241125082130.2390310-2-wmacek@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241125082130.2390310-2-wmacek@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_010721_701215_FB3058BB 
X-CRM114-Status: UNSURE (   7.64  )
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

Il 25/11/24 09:21, Wojciech Macek ha scritto:
> Add an entry for the MT8186 based Starmie Chromebooks, also known as the
> ASUS Chromebook Enterprise CM30 Detachable (CM3001). The device is
> a tablet style chromebook.
> 
> Signed-off-by: Wojciech Macek <wmacek@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




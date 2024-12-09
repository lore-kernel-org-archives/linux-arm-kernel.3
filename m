Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76988E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 11:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDdVTj+AKAv4xgcRjlKI2YTmT2DtuKuRkc1qMc+F2YU=; b=o4LNPa6j5WpZOu7d2PSG78ojvI
	EyCdloFh1TeBItzBFLCCyCoCOg8Y5RxYRN9ganjFzEOylnhRGEfO6PuNivb/qz7D1F+Twm9eYRlpD
	XBf+nGS/eE55IhoWBE2zqf0E5PaYbsX6uie3YqYND6EZkLW4GE9LKnzsz/+QiMMMXKDISiOWzP+vv
	a//H+HsljdioBiQYNx4e+YLl0xN4WU0jN0ThshB6lua+oRbc8KzImnUPh940oJMw4TInjvZLS7tq1
	gwafknq7UpaF1sRqaqFawVB0AshbWRZZyr+rPq8pAr18lQE9jLh8A94M6mLp8SvTeyUpSb7nwzhqG
	+rYzUvrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcK8-00000007ZPK-3Grw;
	Mon, 09 Dec 2024 11:53:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKcJ4-00000007Z2z-3v2H;
	Mon, 09 Dec 2024 11:52:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733745125;
	bh=gldmvddonv2YixS8/zmRKGr/mcQNNsmS+EIsTUQK8WY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QSMsmfGmovu3kup2pPPL1Setx5vKeDNvPLk1Yq1HhsMoHcDFNGVxoIag6X4QfmCxi
	 nYTVBJPZN7y9vcsLmU5Rw+nYQ1pV67NeU7w4gnM0tz8iX/eLMvIDKt+ktj/J45Fjzp
	 Z7nkax3k8tHkdPw6RO86aTXgyHB0SVLSW7brFTqEKIktX97rRfcy/hW6FwXmVpUt9V
	 cPKDAPp/Y7YZHmNGvL2NbhtYhnG7ayOizB4bxGOQ5G3tDpEGSV5pOzAQe1W1prVtIw
	 lGr+7rOQWkPF3jMDQnTSK8pDJVSBeMo30+zmX4tCNXQKExsRwufEiifZ0eQ+G0MHhQ
	 w8Au9n/vXrzJA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC79317E36AF;
	Mon,  9 Dec 2024 12:52:04 +0100 (CET)
Message-ID: <9b1a385e-da1c-429b-91b9-d5b5d6d5abb7@collabora.com>
Date: Mon, 9 Dec 2024 12:52:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] arm64: dts: mediatek: mt7988: add pinctrl subnodes
 for bpi-r4
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202110045.22084-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_035207_120631_FAE7458F 
X-CRM114-Status: UNSURE (   6.92  )
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

Il 02/12/24 12:00, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add board specidic pinctrl configurations on Bananapi R4.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Can you change the title as suggested in the review for the other series?
So that we stay consistent.

After which,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




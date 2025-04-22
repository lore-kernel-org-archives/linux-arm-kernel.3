Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5DFC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 16:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOP8a0zUNBSDNas30QcpFTJALpG5+AVtASrsxcpYhhI=; b=HHtNvQKaSojEDHXXHSR9kcg1N4
	n3kCKV2T3NKJBK2zrNK1329N0uFWMh0zgaUrIyD+w0erzwqd40JVOVDn60EE1m2clsB1QmtqJ7ugI
	5AMKUsmogO75XVFIoQP5h3W9HbP17N4/U10EZUUuY3KsMWGlW5QyVyX9eIXie2tqcZIFZ913Wcr20
	EUlZKjD5d6PtBzLwpTePf7jVDnkwVnj+7SG//+TbbW7Zw409TGThB9RozPGvfZhz2UEBEpt5Tn0Mm
	491b7L2eO+zI+HAynKRo4/iEnA0DnYRzW6jSjEfs1/MD/iqIdwhKePQkzm0tzjjfRqXK0k5BArAhh
	GQwvJt2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GUI-00000007uaa-3Oqu;
	Tue, 22 Apr 2025 16:28:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7E7h-00000007ORV-3k55;
	Tue, 22 Apr 2025 13:57:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745330236;
	bh=pEYZNWoFEdBBLfTxI8KEWcSIIsXy0HkCrm/lKlOqgRs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GA1kGS+axLianLnoYAw3+24QgQ4Ss+cR227t5EjGyUjm/zcczQrtALsXa8nz4TuCf
	 jM1kD4r/ZTZM2VK9yCG9blTjEFPolBsXKgq6/hnBC5AFY6fD+sBwEnGFSfOcAKXu7J
	 DJBpgXHqaolvT6CrPYr/B7dv9ftsgK22GqeLbDOkXkhQexuMN/UI45KK3BUjMyw+KQ
	 EYHsOV48jdHfXyX0zsutLEA7XJcaJjutaO/PkHLyPd+dbdMPH5a3T5j1sMyXkm1WxQ
	 drymcvxRfVxU1DSdAxx9E69Lj0pnlO2J9wm3ZssP0iPQnFmVfwFPdAAZBLPnwtcyp9
	 F2VByXFpKfOVQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 969DC17E155C;
	Tue, 22 Apr 2025 15:57:15 +0200 (CEST)
Message-ID: <71a0c25d-5168-40ae-9957-1e1782e7765f@collabora.com>
Date: Tue, 22 Apr 2025 15:57:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/8] platform/chrome: of_hw_prober: Support touchscreen
 probing on Squirtle
To: Chen-Yu Tsai <wenst@chromium.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-9-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250421101248.426929-9-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_065718_076841_A0AFA426 
X-CRM114-Status: UNSURE (   6.37  )
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

Il 21/04/25 12:12, Chen-Yu Tsai ha scritto:
> The MT8186 Squirtle Chromebook is built with one of two possible
> touchscreens. Let the prober probe for them.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




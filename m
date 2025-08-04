Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBA6CCA0EC0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 09:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RvrtrohpxYBMhZkRolIAL7D/O4cRs6GbQI5Nhxuyc0=; b=aXz146qcYG5OIsWLi7D/SNk72k
	DK3T/UTdLNQNq9eZ1A/XXfotueve2RPSniT3g7VjBFjzzpHvzGg20AXcZaAxLX64T7tJQwBNZ0334
	xm83cwBfNh9vq5zb1ZAIABy7WHM86aa9R9V2Kn7ffYAVT1fVouiWVP21VJ5Vb71RnTJpN/E8V1ZVt
	swrKvJAq/ogASwfbDtFj5WK4Z2jxhOblLd2JHr3cBoYWsBs5MP2RSaCdSoecM3OzXv8AkDudcwbj1
	3FZTdYXFfofcHoA3iRq9tNeOm7kQIr+zmRb7IXAM4fTyJRS/4eLZe5OayNfbbwuKdyF5Q8VaMdTwp
	1b9dKxMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uirSh-0000000A4fp-0KoX;
	Mon, 04 Aug 2025 09:26:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqtL-0000000A08Y-1HvV;
	Mon, 04 Aug 2025 08:50:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754297397;
	bh=naqlfPKLXvb78dqLVocaBDc2QnhdiYMy5h3X2PMZnCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HZ9NsFYaPzGXFEYCS6bOtJFzBi88MZL2y1sDBABQC9PxhjgaFgbg9jFtCpbAIMzeq
	 H6tTkbZnsBO4IGEJhbRny54r+vsng06HizbsUa840iB6F/c4hBSsM+42jUdKR7KsTg
	 Rpq0JN9hp9sl5Lkc1YQpoy5zzYZ08RzBYcruHetdwSyAKQH+6/3NaYJDEElLOyfUxd
	 2JC6+G4U5O1wJ5+IFree3ZB3qLYDttYFmBc4fOjolrbR4XcCodGDaQsGfBgvAHVI8O
	 UFJuF8F0VRtKuhPxz2t/Tcm9gDWwOAz0a3FWG9gHx0xGJ4WaQ6IGh4rapbOmQE7qhx
	 wqWtT/tDdtHng==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 66C7217E0B8C;
	Mon,  4 Aug 2025 10:49:57 +0200 (CEST)
Message-ID: <3ec8df0d-5c2e-4c2e-a48a-333f904b56c8@collabora.com>
Date: Mon, 4 Aug 2025 10:49:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] pwm: mediatek: Implement .get_state() callback
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250725154506.2610172-10-u.kleine-koenig@baylibre.com>
 <20250725154506.2610172-15-u.kleine-koenig@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250725154506.2610172-15-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_014959_534818_B2DB77D9 
X-CRM114-Status: UNSURE (   7.91  )
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

Il 25/07/25 17:45, Uwe Kleine-König ha scritto:
> The registers can be read out just fine on an MT8365. In the assumption
> that this works on all supported devices, a .get_state() callback can be
> implemented. This enables consumers to make use of pwm_get_state_hw() and
> improves the usefulness of /sys/kernel/debug/pwm.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




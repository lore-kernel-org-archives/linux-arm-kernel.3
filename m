Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32914C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 08:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fVO0FUphuUnni03GS/GgaCYXCX3IHvTXT1Ma5gPt8LQ=; b=kEBI9nt4/VCcSLZMIIKwzKWotv
	pOA2XEKrbpFeE6WkAl0joB5stAIcy61oNhQlcfYCNvC2Jslb2eZMZph9nWimTY0WpswN/jRL6iK03
	jvbVNqhffdMwy+yP1tqLyV8ObCDENGapH7Nz1DPHfFCPxvqWDXmGS/F3vvPHfe1U0+rcS0KL/3bMG
	DrA9jOKYVHRMm6zdbcouxI6OAR9zf+AfKlZp2WRlNbFEEwTXt0WuDQ042A6hox2hYjl+mZYTHA/PZ
	Hbwl6xjeoHDdBLa+IMyCSA0cgphGzJGrR3NRyTLnjq+N7xmgx52qdpQnlXdqjvqL30I8uJRzGQwC4
	qEG0Ou5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqYU-00000009wjT-0O3D;
	Mon, 04 Aug 2025 08:28:26 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiqC9-00000009tkA-1LV6;
	Mon, 04 Aug 2025 08:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754294719;
	bh=tiVkrmqya68jCQkn9+C7XNjyHLbNElH+ErQQzOmyqIQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mCjt1dDb6+2H9uFfcbbuoC9P+p4qLkx1SG9F5sOH2B5q3pkFj1RaPIvN8jNJqdyjE
	 1Ns6bAElCjy3LDry6fDmJG81p+RUSa/DLbMazHn439PoWl3UjzmQuB/7CXmLJvVHdt
	 eHeKNK11PR5glWnJHfh/JWqKsAANw2/qb2qLIYzhtYnk7IA3IzVxTndwXLIiXSujBz
	 a0tyzmwGHkNv490h79+zIe4qRh8BnL2vI2KTSJTbkGcCD65z4Fgtm4TW+8l+3W43Od
	 SEEgaqrszb/qg4CtjJm5EJETB1QgurBXfir5RRZXdJV3phOE0lpLrnCdeBClcdIAyD
	 fEkF0oHvLCkVw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 207B417E048E;
	Mon,  4 Aug 2025 10:05:19 +0200 (CEST)
Message-ID: <31dacaaa-b48c-498f-9022-44a32d383a8c@collabora.com>
Date: Mon, 4 Aug 2025 10:05:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: mediatek: mt8395-nio-12l: add support for
 blue and red LEDs
To: Julien Massot <julien.massot@collabora.com>, kernel@collabora.com,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20250801-radxa-nio-12-l-gpio-v1-0-d0840f85d2c8@collabora.com>
 <20250801-radxa-nio-12-l-gpio-v1-3-d0840f85d2c8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250801-radxa-nio-12-l-gpio-v1-3-d0840f85d2c8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_010521_515214_D56DF644 
X-CRM114-Status: UNSURE (   6.86  )
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

Il 01/08/25 15:16, Julien Massot ha scritto:
> The Radxa NIO 12L board has an RGB LED, of which only red and blue
> are controllable.
> 
> Red and blue LEDs: no need to choose, both are enabled.
> 
> Signed-off-by: Julien Massot <julien.massot@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB87EC144C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 14:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDI8gaMRhpGo8XxdfnNqCFgBVoK7PI9vZ739PbbHjyE=; b=tPKyCnZfOWbC+0ZUNhlxgFChbd
	g5B1xBTGbCPdNII96l/iRE33OzxFXaQwU2q3d27ionA+nVB/hB4vTaLW91OQQqtIUUOR2lq6kCzMf
	+22O5kMynaGz7CUie8orJ0zXLSncZLAWPBhlRjDMDMikMUzaqiZrvK5JVC0L3u8P6ILjfzcnCtvgi
	BMPrq9pLaJtEOjN0E0FwNqZ31/HCHUsQFJT6B9VqiDeXuDX9yFtBL5CvyKA6sDb0z6weitmMAZroI
	YXZqs6mBKOIG5BpNIauaJQv3XWabN9LkjgV1l/DJI5N24k8xP49MDUEAaT+SuN2WWkk17+43zJGEh
	Zos6Q+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQTK-0000000FIAS-0JRE;
	Tue, 03 Mar 2026 14:11:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQTH-0000000FI9c-48PQ;
	Tue, 03 Mar 2026 14:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1772547092;
	bh=4Fs2LOLFj3vFatS1R2AiwItYeScasVwwFnu5VG+0qtQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=NgOhU4mFBjwD/qYrXg3iGt9pKCVGWn15p5dEAT+3Lgx0UmaLEzggspRGZ1W23jWrW
	 9VXFQ+JaKEbfiCZ6ic2Tou4Rir/8GOLEz4c2sik8bx/ggyW5GYcim6KgqjtY0atlxG
	 VpANOEQhFtr9QJPynLmuPVjekpK4NY+8BZi0YJ9VsMtqn3TOXOw3QKfCEKIlShI+Lb
	 VNx72g/fVn0qQclTYDF6G7QFvhLq6sm6YFKzHzpXj7J3GIrkc2XUZNLUbo6yUOejrq
	 6pAyxGpil/evTvkvPs1Y1C9/NDCzVmCImimSU85m/q7K2wWD5rCI0mYQlftITamW0H
	 0/vZJsqKAyIDw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6F45317E0EA3;
	Tue,  3 Mar 2026 15:11:32 +0100 (CET)
Message-ID: <97d053db-83e2-4ac5-b423-2b0174e3229e@collabora.com>
Date: Tue, 3 Mar 2026 15:11:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: inside-secure,safexcel: add
 compatible for MT7981
To: Aleksander Jan Bajkowski <olek2@wp.pl>, herbert@gondor.apana.org.au,
 davem@davemloft.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, matthias.bgg@gmail.com, atenart@kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260302230100.70240-1-olek2@wp.pl>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260302230100.70240-1-olek2@wp.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_061136_188663_3DD6D2A3 
X-CRM114-Status: UNSURE (   5.79  )
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

Il 03/03/26 00:00, Aleksander Jan Bajkowski ha scritto:
> The MT7981 as well as the MT7986 have a built-in EIP-97 crypto accelerator.
> This commit adds a compatible string for MT7981.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




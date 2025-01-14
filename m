Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEEACE77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I27Cegn65QKhwpW2DxqPZRiSkkGONPx7MZRj/Q8mEN8=; b=c1zhTdeJaS4KkXYotkMCtaJh9T
	+kjc2BPi+O60a+RW77xcXRbA9K4F6S9EZYpdNsoQiXDAilgLWlC9iNW9Fk45zouaj3PbX8idOx8fp
	cJo27cCqMlUQYS1E2JvUQLaPgJGdNW1ZFhpO04qYhMrMzAiL9tL3OriGMxjzsGjuKjsNYAZ8Wz0rO
	kxyY02Bj4GZ2wvvVEcNl0iypF/MJGj9GhQqwK+iCNVKXiVBg5/yQj3fNoiC/ujd8xuVPLlIaVO7gc
	6VJ+sYdH5CwRci3+xA9WLQrzcUVeP1ifkS3kBToHylkbw/fQbyLPuzcYhS6/Q3UXi0hDtjZn29pMX
	0WiEc3vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXe3v-000000084sr-2C0a;
	Tue, 14 Jan 2025 10:22:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXe2g-000000084Sw-3OxJ;
	Tue, 14 Jan 2025 10:21:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736850059;
	bh=ve3gMUdOFTHfeWwZZ1/kwCQUX2NysdyyJy6HZ5zy5Vc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M3OGfeSfIJO/XN3FxCH4GFhy8vmUI5dRXW/gSiE4jCOqxwO3/5jdcUfsSNNgULhmm
	 lfvES6gagRwQtVJRNcEFtdTgoy7lNoABOmLIVNXvxeSZJqQ8rRbb0XZHxZ+FF+1lnI
	 FnPin/RXNrUwRUsQYXYzzN9YPWZKdI6VmYtv3pYO5tuOvp1GAn4wLVH711Q6/qBW+N
	 M3Fo7EMZV1lTSQM03y0YMUHRlzW853CEqgS6IOJV3Xjn/qDUn2rn79PTqpTaThUL2X
	 ZcR0mU8/Fa6/fXR/TMka+yIaTmmgWq00hjPxjtIsdV5TdIzas++/qA3rXfz12mPfLY
	 ExziwvceydA2g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C56EE17E0DB7;
	Tue, 14 Jan 2025 11:20:58 +0100 (CET)
Message-ID: <8707d9b4-3b7c-42a4-997e-0e65fa351fb3@collabora.com>
Date: Tue, 14 Jan 2025 11:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] soc: mediatek: mtk-socinfo: Add entry for
 MT8370AV/AZA Genio 510
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20250113-mtk-socinfo_genio-510-700-v1-0-cf5112b325b7@collabora.com>
 <20250113-mtk-socinfo_genio-510-700-v1-1-cf5112b325b7@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250113-mtk-socinfo_genio-510-700-v1-1-cf5112b325b7@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_022102_997448_70899E84 
X-CRM114-Status: UNSURE (   5.09  )
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

Il 13/01/25 17:13, Louis-Alexis Eyraud ha scritto:
> Add an entry for the MT8370 SoC with commercial name Genio 510.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




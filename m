Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE795C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ET9HXuBqGm8QMYTqqrfqk7eJofea9IEiMWUbquOY5bk=; b=e9hqyN2a90cO1BdIO3hSsaCEWs
	rYFUkC692+51waptj2lu6jcSXaZRBuh1aP7VmczuClHn6cuWSgN6aAQ9fBegxAPNlALPYw4V0eEu+
	k3ZTIzykTOC9NeAeMYoLgk9bUJgYx1nJH7/wOCnfDDAQyf9tnl1B0DOjIkw5bX00ngQlXJ6aWDo+N
	SpYgZLk7nMgzDzGFjZAkc6aVvqFSAN4qI6CctDtNWW+e27tswJfgYVrKVsWj34FdcKVZeO0yAx/aT
	Kjsvhi3cqSOrHOx3TtHpW35ARgJri4xURlNgzRZofYDbpuDi/77E4YcPRsNxgwFOF/5p4uhPvI+g6
	V715vlcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeHN-000000087V4-3lMl;
	Tue, 14 Jan 2025 10:36:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeE6-000000086pi-1d46;
	Tue, 14 Jan 2025 10:32:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736850768;
	bh=CTC+YbdW4Ewiuk5FcL00CLGEcAVWv1OsHzDignm0Dfk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PdcrG14S6Z8tQwvZqSpbmC9+EgKft7369xnEBRao/VV9sZ0L0oxqOpjnTp+j9eIoB
	 DfjnsVz/GLC0uiebelotYE0uwMBWKmxn4af9JwniStDAs6TtDGwrJ1y0oGmxcXfh99
	 fTnjmYoOLDgMUL4cL/UCk8YyGeY6f7Yw3g2XqoNArZ37WgP+cWpO8uaanwi1RFWV83
	 WjG/3L6M22xgFH0aQ3LWPzkaJk1DyspeZDm/HJCZMK0O5Zsm/BRW5yI6iTodGnhCCb
	 PExLXwiZTqZfwTj3iwghKJNrsfX+WPS+H8ZrJv1cwWAHwS19u1t+8Z+Uu6nlGylEKd
	 ZM77aX0xh2uxg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1A4D517E0DB7;
	Tue, 14 Jan 2025 11:32:48 +0100 (CET)
Message-ID: <ef8bbe7a-64fa-4e51-86f3-4f7fc0bb3760@collabora.com>
Date: Tue, 14 Jan 2025 11:32:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: add mt8370-evk board
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20250114-dts_mt8370-genio-510-v1-0-8517ee0fdbe8@collabora.com>
 <20250114-dts_mt8370-genio-510-v1-1-8517ee0fdbe8@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250114-dts_mt8370-genio-510-v1-1-8517ee0fdbe8@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023250_608026_5FB6508C 
X-CRM114-Status: UNSURE (   5.72  )
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

Il 14/01/25 08:38, Louis-Alexis Eyraud ha scritto:
> Add bindings for the MediaTek mt8370-evk board, also known
> as the "Genio 510-EVK".
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




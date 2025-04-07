Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 265A2C3601A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRZE1c/Z4NoQqyrMCVa8jOZEwizqZD6AV1xubmJksfo=; b=yOaD/7SBCDHIF7MPlJDbM6gQf2
	klxraDMtybzg5rFme7QsM/O89ciJv8jb3OEXwrNAw9ce/Y8TzCg2HjM7zaRRON5KtX4Kway+zM1rE
	6tzTYvdvlMs68ADdydvx1+oozrgrnse5iT7nAiuQ8aU3erEjRSuiCiMnN8NbtgQ6LpJ1eXPw526Wq
	NKv7l1TIfnDsfPS6xMld+kpZ6HZWJ5qrWfm1X/rV08ZuEZf7ikPvrms0e5AXDjI0LJLJnEg9oF5Bn
	y1kvlK/BLLp3/QJv6iXb7bc+0g8cd7L2bienlc6lveSqU0mvETkez0R0YJxJcmIB6em8yn+O+JUAZ
	nqxfjmaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hHh-0000000Grx5-2bCN;
	Mon, 07 Apr 2025 07:52:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gps-0000000GkVA-0gsL;
	Mon, 07 Apr 2025 07:24:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744010637;
	bh=pnzzzkDj1vh7E0qDKqGcW9a3EPHGGFmwcfOk6V7hevw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NwWz0cvYx9xVXYuHpzoHvsv5rUk09bHT7PmOea/TuNm4WhQn7zA2mD8W2ZUzdiT2G
	 G8501T8LYuDAykgdLViuJRMCHo8dEBvu7Pj1rsnESFrR90C++Qnp0XJ6ghzZ+tu8hm
	 FlPOwLwEU1Yn1Aauy2y6cK2lwovcgKC7Iw1mK9jurRcbbC62qJbiEAmI4WIkjNw4M1
	 k3iJELKMvzrfyvEeJfOfw8y72viiRVIbft+MRZU4V73Ir8TiXB3yD+SkovizTyvyP3
	 OXX/Wkfa5EaxRpOSz5gc3ZHHUANX7ou4hDl4r8z1z4stOmJQZHzXIILA2qODruq4rh
	 W3ZcMGkS3SAyg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7ABC817E07F3;
	Mon,  7 Apr 2025 09:23:56 +0200 (CEST)
Message-ID: <c44c1e89-f1d8-4774-9de2-744313c6ea73@collabora.com>
Date: Mon, 7 Apr 2025 09:23:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Add SCM for MediaTek
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250404-maintainers-mtk-scm-v1-1-95d1f0c3f60b@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250404-maintainers-mtk-scm-v1-1-95d1f0c3f60b@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_002400_388157_97369833 
X-CRM114-Status: UNSURE (   4.53  )
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

Il 04/04/25 21:52, Nícolas F. R. A. Prado ha scritto:
> Add SCM entry for "ARM/Mediatek SoC support" section.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



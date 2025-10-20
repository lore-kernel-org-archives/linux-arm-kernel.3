Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA75CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7oEjNska9xevtGQ7MpYI9LvkD/IHnnD3NXBpjVBnaSg=; b=g5lvqm7hT/De1Fh6AW7u8ysT0d
	v3k9umUuM4Oupv9NnvtSgFH0aWJPbWmNIWysNBvhXt1OLLOZAJnBx+ERNBKmySWcmHKBamVN7BSWo
	yqeLl/0ZsmCOEM6r8mZYBZ99SyjhLmNxGLVgkh8RqXf8+9TGGw6PInEde2+KgGgossiZsgwnlmawg
	UymqMAazo26F/Tp/UkghHKDp6N32I76pcNcmTxsTdyuYdATpw7Z0a348FScXfmK2yg+fSLIwRDY1A
	LBAVEyjZus1Fu6PdVJPcm+QwXbdun0CA8hePMSO7pmE1awq8UfhnLYNkhnT7bb4T98uRPLWvd8H+d
	kd0s48hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSN-0000000Cvwe-0iNi;
	Mon, 20 Oct 2025 10:49:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAnSK-0000000Cvtb-1kWB;
	Mon, 20 Oct 2025 10:49:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1760957373;
	bh=HN+/K46I16uTlwdkKLoi/UZIpe644y9JEvtjWeYfm5g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=OagfJiofzKVnRI8TJuHUmHK2AlfCvQ7EOLhzX1e1zDpTGw7C9T6qiPpXZbjbqjVqx
	 3iiMiue3mp/D5U5clj/414GfKQRVnDHfLEa9NIfnX6Q3BSB6SPm8e3pXCPEgw9rl44
	 4xl6a85YhX4gyKWlY+XIUjzlsAQ7gZYQTVTcAcoCs2cFxcrtE2O1StylFHkQCWeZr2
	 OeYq23fVNYIZdZcnGuYtjPLM/ff9LN49lqQP+Ytva32ItQA0dx4rIImjwQ+D2x/1LW
	 wl247IYVaBsbIIvg6sPHZ0+woSj32YTeqqhGNrMriSse73OsafHDukUuHTr6NA+Dgx
	 CBS3t+Y9AjypA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 43E6117E108C;
	Mon, 20 Oct 2025 12:49:33 +0200 (CEST)
Message-ID: <71a04ef6-780b-4247-ab1c-c5bbbc24bf25@collabora.com>
Date: Mon, 20 Oct 2025 12:49:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/13] dt-bindings: soc: mediatek: add mutex yaml for
 MT8189
To: Xiandong Wang <xiandong.wang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sirius.wang@mediatek.com, vince-wl.liu@mediatek.com, jh.hsu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20251020074211.8942-1-xiandong.wang@mediatek.com>
 <20251020074211.8942-10-xiandong.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251020074211.8942-10-xiandong.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_034936_637933_09DAD7A6 
X-CRM114-Status: UNSURE (   5.82  )
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

Il 20/10/25 09:40, Xiandong Wang ha scritto:
> Add compatible string to support mutex for MT8189.
> 
> Signed-off-by: Xiandong Wang <xiandong.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



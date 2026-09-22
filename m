Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6D5C98305
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjfxlXfTPJU9SPXuOG9cVS/bVGXe9/w5CBN/wlVnp8I=; b=Hptazp+5yQPEq9yssSh9t0046/
	a+j52beV+oZDHSeuu0N79+LJGAoDUUrp3Nzf8IcMg4M4VHovmvQAxOkcrfPzrN5sRvXPCIkPnHKbd
	jg5FMtdF7aEY/aGdc+DuS+2F7VAZquDryulD8utnAdQWxvBR1ijLjRCo/obEfz4VAyFSgBWhsJKE3
	MOGhzmNB0lV884HRRxOmOOVM3AOjOTNkWIWo1IxecKspZuOMO55LTo2NIOZLx4wUZezFVwZeIN800
	U1Lnr+btcfDMjvEackzehiwhWkXOP6l1eZpawb+Is8SwDvKo4GsGkIBG033OaL8eI9I3WZHKjbbzp
	y+ETos7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yr1-00000005CCy-1q8B;
	Tue, 22 Sep 2026 11:40:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yqx-00000005C8z-3XSX;
	Tue, 22 Sep 2026 11:40:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=YjfxlXfTPJU9SPXuOG9cVS/bVGXe9/w5CBN/wlVnp8I=; b=UMXoOunRqi74aiv35qwN/8iG9x
	VZNe7takyJUIPVbYq5pQpD3ti7/7JyWJgHCo4lZt9HEawlwZFZ4FncnF0aE1IFqsE3VmCAAWMC7f4
	35z0VnjFSzM1ES7zZ5r9d/lFVl8yY+1/pWTd/0ct/gt/YwTJtoP5DvDD0UDbhXLH85+lz6tmcIlYk
	tZqPVSPjEjOdUnETb+UPIbaaVertdM6u2eQ7el06Wo3n4KYO+Jrk/MwnLeUoNRnzk4Dg7P7WTJ5mU
	tgQqE7gS0xgYzPJA9X/bW9ym09R9LZiMIJ7p8nJKiCdgzB1WZWfvddjRumR5ZzVJLsXgSesNJc75k
	SsDHARiQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8yqu-0000000DV7A-20vj;
	Tue, 22 Sep 2026 11:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077193;
	bh=pi7L7sEcu1+h5k0WGFL6886sxuPYOeK2alcgcEumhis=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=KL7SKJN9W4UhzUr0Nkvfj3KJnOROhpUVUIzGfev899fApvMDKzW3JBrmRxea9wx/V
	 ioBITVQdOVTGegmNM9rNnHLI9+W+O2TZbI+N4A3uvNJE2tpoqFwhsGA9O1LbM06CYY
	 9plaYLnj3zejQDRTH2Q4k9pIjtlTNpA5mJ6vbSKOsvJp4JFLMnMfr4xM2HP1CO6iW3
	 3PinqqIEwuqt0/AR4KucaLTTF4pjFLqcEI2e7qXiv6tpvWYCnimyhfGakLSR5O8r/V
	 0bMSR6FsGnheagzBxL4Dpw9emuVYUrj64Z7HoN0s4+wRwGDD9DKNUo7EeMJPAJgirS
	 EA1lp+LHPGaHg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C21817E0A66;
	Tue, 22 Sep 2026 13:39:53 +0200 (CEST)
Message-ID: <41056327-dcc5-4252-a92b-b268357b6659@collabora.com>
Date: Tue, 22 Sep 2026 13:39:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 11/12] media: mediatek: jpeg: add jpeg compatible
To: Kyrie Wu <kyrie.wu@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bin Liu <bin.liu@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 Hans Verkuil <hverkuil@kernel.org>, irui wang <irui.wang@mediatek.com>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20260922091530.241762-1-kyrie.wu@mediatek.com>
 <20260922091530.241762-12-kyrie.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260922091530.241762-12-kyrie.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_124000_757811_DF80D71E 
X-CRM114-Status: UNSURE (   6.30  )
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

On 9/22/26 11:15, Kyrie Wu wrote:
> Add jpeg dec and enc compatible for mt8196
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



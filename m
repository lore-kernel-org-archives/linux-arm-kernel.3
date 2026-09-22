Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0231C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 11:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsUkWyyppwcLejz9XQL9IVGiWG7r5wC3thh4t8PWiZ8=; b=g3KmJALGr4hv7y/5YoOXIHq3+M
	PYxDTbh9XT03Vj5BSQRM47PQB6uOYeoJQ7WKguU84/y4qMVfe9dlpL2lPxXg224okzxlhjuZDnIY8
	w601PeenjjOhd2jA34Nd+ZHXtE07RYJBpTecuuUY34FFiUN5jzDKPMIvpDzPRY13niRN8YdVJ0qZY
	GhAzeg7Q2A2GOeXJXqfsUVekh9D3ZFxdzMB6ZGi8TFJGa73E/flYfkm6aHeuwoDeFDj+xDFi6lT2I
	w+cK7ZB4mewmA4UluIfF2uHr5ESW0xBIaFiy/GDNcw33Q0UGN4uuVDsgk6eHmJ59j0t7XdFFNZvJw
	Bsi54w6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvp-00000005Dtk-2Jk4;
	Tue, 22 Sep 2026 11:45:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8yvg-00000005Dnb-2ajc;
	Tue, 22 Sep 2026 11:44:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790077494;
	bh=O7w5n026IGBCjhsjdIg4jrMN2Kmgt8m27mA8hACD7Zk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pVoXrkX56NRRSFTs8mEurIzM1btQPZ7cNHzt9klVHEg5O66otXn3IjvRflk8/NA1h
	 4RZ4o8+gzSd3qYXGbM2fACEjF5MtsxM3Vt6JxrdOl2IJNas6FBFhQMb7WGE7HSgWMu
	 Vu4e7WYxn0uGOL/IHDce+2dYGSeN6AHcz6di7TgOa+WlcYlnUeZDxJhlGjQZ6pwo3/
	 CXXuD5kybZhJf1+MSD83QXnoknHpsqPs6nJSeynQhqjm5DIE+TTXB/QkM5g1zz1Cmx
	 9MdXlhPMhlKSpzxcoRdlwCFjkYuGB0zXHJvfj0KqpToVWdNqieJv3tbVerjf75q3Bn
	 jZxR5N3A6HIEA==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 29C7E17E0515;
	Tue, 22 Sep 2026 13:44:54 +0200 (CEST)
Message-ID: <cf0d3c85-d337-4d77-bfe2-4ba623bdf31b@collabora.com>
Date: Tue, 22 Sep 2026 13:44:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: clock: mediatek: Add MT8516 fallbacks
To: "Rob Herring (Arm)" <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-clk@vger.kernel.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260921232807.3137010-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260921232807.3137010-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_044456_813816_5026EA34 
X-CRM114-Status: UNSURE (   7.00  )
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

On 9/22/26 01:28, Rob Herring (Arm) wrote:
> MT8516 topckgen and apmixedsys nodes use the common syscon fallback
> form. Add the MT8516 compatibles to the branches that allow the
> syscon fallback.
> 
> Fixes: cd9fdd06b0e8 ("dt-bindings: arm: mediatek: topckgen: Convert to DT schema")
> Fixes: 16a146735df3 ("dt-bindings: arm: mediatek: apmixedsys: Convert to DT schema")
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



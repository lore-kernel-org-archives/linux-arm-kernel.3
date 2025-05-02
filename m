Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76851C3ABA3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 09:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y9qAg/y57ZvETqqZXocUXLnqH7h5GU7od8DjduxaozM=; b=gzbz3aqxob+uKIFvDJQdXq+l5e
	Fkg8EUxKIsI72TFgo203sgKkX0wZdkedV1kKe7xbEZHTJ15LcU2FIvCUpF+oaOJIBJxULkMwKQ2mv
	Z5rlPAT8KrkI3AbDklZiwnGyenZhFQAwbrIW2epQkW4DD4mMul+A+RPMhJG7fC1CiVDOtmrPPaHuJ
	JFGoEYv8rLxR+JMmi9buNcQ90gkq6Yoo1yHhmfRtaUIbV/qI7WZiUW/F9ha9w5pcAtI4p1b7d9vlS
	7w+xJbvpx9JWki5bYJe6R5qafSZWjSvNBSpBWFvO0qzAHf+a+idfTgDIoJfse9rxQhXuYyyVte7Yl
	mCOJEV/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAmnw-00000001MbB-2hx6;
	Fri, 02 May 2025 09:35:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAme1-00000001LNt-31hq;
	Fri, 02 May 2025 09:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B652EA4BBF0;
	Fri,  2 May 2025 09:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52B3C4CEE4;
	Fri,  2 May 2025 09:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746177920;
	bh=6q6hCP/w+PMu5oMDcYrXYJBpy4Q+Ne5Kza1OqgsuBZY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pMYtrvdzA59Nxhg7pLZBk751ciPkwbE6G2BV+L426NiTNOaEqwqUC11Fg9UNTwo7Z
	 wI95b6iO0KWel8FW0t6P49QbIm0Gvb6vevwKueo2XpE6NI3nSwLUUnkuWCTSi55b/H
	 wA6EiCEXEwke/uIh9TRXhI6P4fQiP3cLqAuuAHrraqT1e19ykZqO/XH1/6SwUpPGS+
	 k0rjMMmSlx9C9hRaCGNIsTm8AVzCVY0JvxGHS9vilZT2srvaLMTWcDOlFP2V8Pbyoi
	 vbiiWo3Vo5hEkxubhoYXgJJK7MULd3cWGMyk5HBlHTiDeBD+dXL0hbw6bGPUyyZZ5U
	 oLpw41AIgs1uQ==
Date: Fri, 2 May 2025 10:25:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 andy@kernel.org, dlechner@baylibre.com, matthias.bgg@gmail.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 krzk+dt@kernel.org, nuno.sa@analog.com, conor+dt@kernel.org,
 linux-iio@vger.kernel.org, zhiyong.tao@mediatek.com, kernel@collabora.com
Subject: Re: [PATCH] dt-bindings: iio: adc: Add compatible for Dimensity
 1200 MT6893
Message-ID: <20250502102510.05a37520@jic23-huawei>
In-Reply-To: <174527153072.2973088.9157423165074778113.robh@kernel.org>
References: <20250416120235.147889-1-angelogioacchino.delregno@collabora.com>
	<174527153072.2973088.9157423165074778113.robh@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_022521_842101_8EDE1646 
X-CRM114-Status: GOOD (  11.84  )
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

On Mon, 21 Apr 2025 16:38:51 -0500
"Rob Herring (Arm)" <robh@kernel.org> wrote:

> On Wed, 16 Apr 2025 14:02:35 +0200, AngeloGioacchino Del Regno wrote:
> > Add a compatible for the Dimensity 1200 (MT6893) SoC; The AUXADC
> > IP in this chip is fully compatible with the one found in MT8173.
> > 
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  .../devicetree/bindings/iio/adc/mediatek,mt2701-auxadc.yaml      | 1 +
> >  1 file changed, 1 insertion(+)
> >   
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 

Applied.


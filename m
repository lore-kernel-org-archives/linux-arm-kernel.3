Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F28DD6E2DD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vcoeYt8HgGkC+SHuh7P4h2pPNbheZ7bhTCxjYRa+DA=; b=2z7yZmvR096w9u3JiOhX/idJjs
	FEp2TTStRtj9QkBpZf7ZvakGl7Q909oqn5U5rUaTt8JrVKHuluet45WKFeGnCv3IgjWeQxYwJaaVh
	BNPqZoPD2F0+JSuzwZN/J5c6BtZz22+4F1tsmP+vlUuo7qCh0vqAgrnnGSH1jlpq1O7CVFdY5QMnD
	JbsRUkRtUAT1LQJT1GCshqx+miI1P6X24yCt5VZ/MWtW/U4WPu/FGjiuCMTJzmg6rhb8J4sqJRjKN
	BWugsHdsh7dEGXsvwWuNCOkec/YM0TBjGWz6ZHgREj9Dyuy6HxAwzP5ar/Nfs79x5jdxRglP/MBqY
	wTbEz1MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDggp-0000000Er8B-2bN1;
	Wed, 20 Nov 2024 09:07:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDgft-0000000Eqxq-1VzQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 09:07:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFBD65C5771;
	Wed, 20 Nov 2024 09:06:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 821B6C4CED0;
	Wed, 20 Nov 2024 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732093620;
	bh=228tLL5YvusIZ8n2D+dM7gRvmeHVb1pF88JU6BheBIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZttFMoJimtL64/vxXUtFUpLK2Wmix9LrjUq6616E7P7z205sdGwzx7rS0twwH4U32
	 QVGe6Flp+E/1AqFJ/voT69JzJxAHvOsPSMIOGm3Irj8eLhABNyu3VAyIwyEeyVqxuH
	 +d+Yeo+7CSsbv77mVs0rGSdH8vUR1cvf1NU+Ph2mFzccjvniHj02Sv3JdnWzQJcRGK
	 hhWLkwtYkomnkHrlR1ySKC60kG9dZurRGvPHNSCpFpTKKbboqEPx4q36EOUbn+Elpb
	 j4aXE3klQqiAJUyS/xm8eba6brBV2oQPFcLgby2wzgIRXHKVxN8b3ZkzMHa0B53ytb
	 V1CACEVWF+NSQ==
Date: Wed, 20 Nov 2024 10:06:56 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan.Wanner@microchip.com
Subject: Re: [PATCH 13/15] clk: at91: clk-master: increase maximum number of
 clocks
Message-ID: <274yn2xnep6hblxecoe3zm7tssj37pqwiyjwrscrweowtqhm6j@hiywf65q32nr>
References: <cover.1732030972.git.Ryan.Wanner@microchip.com>
 <cd6c8be4b476e04b2d18562bf72cc9387227e765.1732030972.git.Ryan.Wanner@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cd6c8be4b476e04b2d18562bf72cc9387227e765.1732030972.git.Ryan.Wanner@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_010701_440921_78AF0246 
X-CRM114-Status: GOOD (  11.75  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, arnd@arndb.de, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, sboyd@kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, linux-mmc@vger.kernel.org, claudiu.beznea@tuxon.dev, mihai.sain@microchip.com, linux-gpio@vger.kernel.org, dharma.b@microchip.com, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, varshini.rajendran@microchip.com, krzk+dt@kernel.org, romain.sioen@microchip.com, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Nov 19, 2024 at 09:40:19AM -0700, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Increase maximum number of valid master clocks. The PMC for the SAMA7D65
> requires 9 master clocks.
> 
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/clk-master.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

This goes with the driver change using more clocks, no? Why this is
suitable as separate patch (without the user)?

Best regards,
Krzysztof



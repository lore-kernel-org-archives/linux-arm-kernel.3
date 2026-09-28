Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F72C9833E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 07:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OoLBh6lfAWYXvbWbi9rrxy8K4duhjeCURDS3yTBgXJg=; b=I5VVbzVXdlbUnQ8ryxe2WDGhaM
	ywTQLN2RRqmcqrHye11uQ0oKEkNR/v7JAhyytQd66LrL1MutosW5mqX3UUMy7xyn3LqOFbSKu/rzy
	Du1VWwx1AAoJsSS1tbYGd6CvylmlNMEDG27Il0AG9Nd9Am3LyW2jRytqD8ox0rpW83oxOf9F8sFr/
	edZgOAlxWrVEDRLDJCqUuM13HK5wXS7Pu86Yvom9D6in4x0U5OgVwZccfF+hb1GhGSFX08zwQuHpF
	dewDDTS3W4Mr7yPLEOKC1eTubwVb5FKWtjYPcT5ZfWd9CUU+BygHsGCK7hVOEqiSYa8uACNwKlI23
	XtNKnuVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB69L-0000000HaQR-3F15;
	Mon, 28 Sep 2026 07:51:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB69K-0000000HaQC-0v6S;
	Mon, 28 Sep 2026 07:51:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D4C5601F7;
	Mon, 28 Sep 2026 07:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28D061F000FF;
	Mon, 28 Sep 2026 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790581904;
	bh=OoLBh6lfAWYXvbWbi9rrxy8K4duhjeCURDS3yTBgXJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iQCp+9zELY3KhQhoY0zQRV/A7R7sgFnlMnR2lPTBUhauoONhe0Lxc5oCFyp3BL23C
	 qsYiwU0rCBniyWAR0IAw9+9gjRxWPtVPAw9VdM8iKPoS0ggKFhdoYfaN60hjKrUW7l
	 lQeg9gpstoT8qZyTr1qnQP5iPamtvTuE5CnvukbQGb9tftYmTz/hQy31twU0clPNAA
	 JkRlIkaAmGpBfz81dDAX8EXVn6hqfk4rZrUNnt50v6ixRYsu/bIZnNtr7UZ8cRMZI+
	 aFNNHUsOoRQ6XdxR11Ldd5nX9fkS/yVM0lyY8hb7oZ1a4Ki6BIMwZ3615xzurQvRHu
	 BKFIQoZdRSTPw==
Date: Mon, 28 Sep 2026 09:51:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman Vivchar <rva333@protonmail.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: mtu3: add mt6595
Message-ID: <20260928-rapid-jovial-zebra-1f984b@quoll>
References: <20260922-6595-mtu3-v2-0-71203a362b36@protonmail.com>
 <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260922-6595-mtu3-v2-1-71203a362b36@protonmail.com>
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

On Tue, Sep 22, 2026 at 01:36:40PM +0300, Roman Vivchar wrote:
> Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



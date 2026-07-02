Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF45FC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 07:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbaFYIOViQSibxzacLKgp7bobWt4ngmZUAMzi2iTiII=; b=p9KHsgtJFONj101KxxIBdT/+pn
	KkJKi6nuEx6M04+MKvP0+AhLcxEiyoYbCdiXM3Yc+jHp7bZamd7BbFC4lpkcPanj68/O+SJvjGJqO
	g5q79373ibNsbZm7KJVFAteQpds6fz5pa+p8Cjuy8hbjDydoI24uppda9xFoVFBjWt12ekQ5W6A6p
	JMaD8J3JC/1eGCI5KIs9VYmFHKQz+mo1Cji2sQz0fCt+fAgx/lvfJ+zFnAZn+XOjN3rcxJxaUeAlp
	PBlsthSkOTyd1AZ8haCnvPUYmv8qf8G6pRQmAQRLVYErDFNRdIroCqPEzNvY9q4hhw2jQ8JAbRTx/
	TkFJwwVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBfN-00000003hlO-1D5d;
	Thu, 02 Jul 2026 07:16:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfBfM-00000003hlI-1shL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 07:16:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6394C6001D;
	Thu,  2 Jul 2026 07:16:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E63D1F00A3A;
	Thu,  2 Jul 2026 07:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782976615;
	bh=CbaFYIOViQSibxzacLKgp7bobWt4ngmZUAMzi2iTiII=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=l1iXbTVxKYxCmtxTRZOhU7/Zwb2yERfnH2mvsymV6Rh+ik1cTkXCzb4+Q07v+drdO
	 KqVQujeps3BQ3hsZsxMjtCFczTbWpWX3pRXKjsD3Z0gexanyqK4mOJ3Ax8zFYrOLlg
	 lyMzleTOntdl2yslq3C5EwRHhBpxCW8XJtbE0dqr8OzGImHIoM6L8lqFrJDD02Z4fe
	 j4XsC1xm99jp5Km8LvV+3OjhU+5GlHvqLo+vogn3d/0+aJnm23voaP/sP5UmfjO+i9
	 NwB3Ym++dviUeVGVEhbHdwqwFIndt+YpuV/xFoJIsCQ/jvsQrECxW5npHsLZRxNEK5
	 2nVocPJtN+hJA==
Date: Thu, 2 Jul 2026 09:16:51 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammad.nazim.amirul.nazle.asmade@altera.com
Cc: dinguyen@kernel.org, maxime.chevallier@bootlin.com, 
	rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org, conor+dt@kernel.org, robh@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	andrew+netdev@lunn.ch, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: arm: altera: Add Agilex5 SoCDK TSN
 Config2 board board
Message-ID: <20260702-prophetic-kickass-crayfish-1fa2d6@quoll>
References: <20260630133108.27244-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260630133108.27244-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260630133108.27244-2-muhammad.nazim.amirul.nazle.asmade@altera.com>
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

On Tue, Jun 30, 2026 at 06:31:06AM -0700, muhammad.nazim.amirul.nazle.asmade@altera.com wrote:
> From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> 
> Add compatible string for the Intel SoCFPGA Agilex5 SoCDK TSN Config2
> board variant, which uses a dual-port TSN configuration where gmac1
> operates with different MAC-side (GMII) and PHY-side (RGMII) interface
> modes.
> 
> Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> ---
>  Documentation/devicetree/bindings/arm/altera.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



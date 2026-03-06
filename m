Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FA3FCB625
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 17:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDPQ4R78d4QAe2vNvQqZ27IjqiJla9qhDYNsRAF5LJc=; b=b5AW31g+ochrBO
	ysAIQiRt2/gLTlbJiwJBiVPYvtI4XbFzIprrEZ3QcQMEk4JiD8If3KZZY8W1mUAYeEPSeGsBV72DL
	WXnarChD9GyAoYUmnA0M1DZaOLjHeIR9IhxutZTmpBiX0YymqCUJqmyrJLXcPQVvBiMzWiQgTu8++
	DKBbun+Za+1mgSWa3w3bJvYn6mQWowPgVPOXUPgnPIFbkH4t3GqA51w0g6VFjL/YWUNX4TFPPkd95
	WiYfM8lDrhlxMplB3zo6MELukTPXoOjMoaaQ6l6njat/4kbeJR8yj/hYu76EMbWmy435Z1mzYECbF
	IAsGmP8axzCMFxB9KoSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYWq-00000004C6N-3ray;
	Fri, 06 Mar 2026 16:59:56 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyYWo-00000004C60-0WOJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 16:59:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=uDPQ4R78d4QAe2vNvQqZ27IjqiJla9qhDYNsRAF5LJc=; b=dVEqJoFp0qDkeVMViNGKW524dJ
	A6o5M5b6Omq4k1mD9ARkDhKxbGgz+815e+Yi++SOM7C+2Okbh4f464HKGgrI8n0/3UIH5nROyUAaY
	zfcei1G/cDprZ68MrTHYkU4acA8qrBirOxx5glxoD2pw8d2uXHSDFImtHqC6UIvsIEeg=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:48162 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vyYWH-0002UD-Qt; Fri, 06 Mar 2026 11:59:22 -0500
Date: Fri, 6 Mar 2026 11:59:20 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, Frank.Li@nxp.com, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, shawnguo@kernel.org,
 laurent.pinchart+renesas@ideasonboard.com, antonin.godard@bootlin.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20260306115920.422ea4dc455cebafa8127194@hugovil.com>
In-Reply-To: <20260306-observant-banana-wapiti-90adef@quoll>
References: <20260305180651.1827087-1-hugo@hugovil.com>
	<20260305180651.1827087-5-hugo@hugovil.com>
	<20260306-observant-banana-wapiti-90adef@quoll>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH v2 04/15] dt-bindings: arm: fsl: change incorrect
 VAR-SOM-MX6UL references
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_085954_277916_05018946 
X-CRM114-Status: GOOD (  24.84  )
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

Hi Krzysztof,

On Fri, 6 Mar 2026 09:00:18 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Thu, Mar 05, 2026 at 01:06:19PM -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > 
> > There is no Variscite module named VAR-SOM-MX6UL, but there is VAR-SOM-MX6
> 
> And binding does not speak about VAR-SOM-MX6UL, so I find your commit
> msg extra confusing. It took me way too much time to decipher why you
> are doing this and this should be just simple correction of name to
> match the product expressed by compatible.

Yes you are absolutely right. The origin of the confusion is that at first
this patch was included with patch #3 of this serie:

Link: https://lore.kernel.org/all/20260305180651.1827087-4-hugo@hugovil.com/ [1]

I split them to satisfy checkpatch for separate bindings patches, and copied the
commit message from [1].

I will simplify the commit title and message in the next version to:

---------------
dt-bindings: arm: fsl: fix SOM name description to match compatible

Fix SOM name description to VAR-SOM-6UL to match the product expressed by
compatible.
---------------


> 
> BTW, the DTSI also has wrong name.

This was fixed in patch #3 [1] just before this one.

 
> > and also VAR-SOM-6UL, so it is confusing at first to know to which one it
> > refers to. The imx6ul-var-som* dts/dtsi supports only the VAR-SOM-6UL [1],
> > not VAR-SOM-MX6 [2], so modify comments and model descriptions accordingly.
> > 
> > Link  https://dev.variscite.com/var-som-6ul [1]
> > Link: https://dev.variscite.com/var-som-mx6 [2]
> > 
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  Documentation/devicetree/bindings/arm/fsl.yaml | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 


-- 
Hugo Villeneuve


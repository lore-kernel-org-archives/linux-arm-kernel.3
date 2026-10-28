Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89A3606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 06:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iUHrq935;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Sp+93WvI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GVHE714RG7i9OtS3pCmu1vAiNQBVPuk8379998KPX34=; b=iUHrq9355ddDhD/3zTt5qjdslI
	4/RBucrbp7yMhcsVnrM12hk+aQFNW9aFZe8q/bVcVLVKmRYZVXabza2tTbyVuFHLS/uzYdwwMtlWP
	Lv6vafV90VA3S6HoEgYAOuImUu1yQdfWN7TfJ6Yfe3Cn/07tlH9hqQLg1xLp2YUllwmMo10yFxGk7
	6ClvZp+48YjG63NiPbtWBiSn+DkCW51+wtxcfy20HGtd+7uA2H3/J/3cc24WWpGMoyQ70qE8orfcD
	onCNsqzdBqS4IMVPvUPFYcrIT1s3FgsbI2YoSniqWmULB9Yuqm0+1d8ZwLd6ueOI41Rrc3Y0mMYaM
	J+61LO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxdF-00000006RTx-1jQO;
	Wed, 28 Oct 2026 06:59:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxdE-00000006RTm-3F5F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 06:59:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 54BB941AA0;
	Wed, 28 Oct 2026 06:59:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F24D1F01825;
	Wed, 28 Oct 2026 06:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793170772;
	bh=GVHE714RG7i9OtS3pCmu1vAiNQBVPuk8379998KPX34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sp+93WvII8ZYXlCPlpMElqzLpKTJTarLzctoQWFyTwA7qi799Vp8Tf7L+ArRC38zk
	 RKQdsbWBVcU8n3/LbKDraRTkNUKR0cLYrYsVVl1FCC7UgdsbOiBl+1UIBSp8tV6BHr
	 XCS4b5c2FWUJ5qCnTuA0wNxjAgMaZaDUUH5GuwOzg+sD0EmyDWKFWyzBMp3y0pNT70
	 bPslosLMNB/CpWw/wpZAoRtgqG3BSY9iSW9EMWnUfWcSAdZb9+NdKk61oO5og1YVmB
	 IQZLH5rd2Cu7o3PgXznKQDSSjD4Q+/RbZ+yaujdcBwTu5C/ZtShCEo4l6x/BEE8LmJ
	 D/uf5ZtkfTcpg==
Date: Wed, 28 Oct 2026 12:29:27 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/3] dt-bindings: phy: ti,tcan104x-can: Document
 Microchip ATA6563
Message-ID: <auGdT2kdxwfbB_ol@parshuram>
References: <20260930214729.809649-1-marex@nabladev.com>
 <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d8c3ca76-3d93-4abc-8a78-d23e0f018975@nabladev.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 27-10-26, 18:18, Marek Vasut wrote:
> On 9/30/26 11:46 PM, Marek Vasut wrote:
> > Microchip ATA6563 is High-Speed CAN Transceiver with Standby Mode.
> > It is pin-compatible with TI TCAN1042 and has a compatible programming
> > model, therefore use ti,tcan1042 as fallback compatible.
> > 
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Marek Vasut <marex@nabladev.com>
> > ---
> > Cc: Aswath Govindraju <a-govindraju@ti.com>
> > Cc: Conor Dooley <conor+dt@kernel.org>
> > Cc: Fabio Estevam <festevam@gmail.com>
> > Cc: Frank Li <Frank.Li@nxp.com>
> > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > Cc: Marc Kleine-Budde <mkl@pengutronix.de>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: devicetree@vger.kernel.org
> > Cc: imx@lists.linux.dev
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-can@vger.kernel.org
> > Cc: linux-kernel@vger.kernel.org
> > ---
> > V2: No change
> > V3: No change
> > V4: No change
> > V5: Add RB from Krzysztof
> > V6: No change
> > ---
> >   Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > index 0cf5fa21106b6..e97b1bc0a2e45 100644
> > --- a/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > +++ b/Documentation/devicetree/bindings/phy/ti,tcan104x-can.yaml
> > @@ -18,6 +18,7 @@ properties:
> >         - items:
> >             - enum:
> >                 - microchip,ata6561
> > +              - microchip,ata6563
> >                 - ti,tcan1051
> >             - const: ti,tcan1042
> >         - items:
> 
> +CC Vinod, is this patch OK with you ?

Looks good to me, I will pick this after rc1 (monday)

-- 
~Vinod


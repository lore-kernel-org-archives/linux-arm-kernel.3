Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B00CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 03:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xT3sR+u6fuM4LUgDjjqKlDHfvPADwQODk7H4bzjwmpo=; b=Vp0v6S2J9JLLbrla98F+ZSWxKO
	6NMKeyebzRsIYVLA+7JKb2QbVs3PHXFkmlVVy3veTLTzDY7tF1xnhctJ3CfJg34tQY+RUc1XFwCn1
	FD+gSpV1GnOTOSVVsfIklAQIW3b7ITsDBJ3JgsD/qJVznfz9nOsqbTpVzrFRqWJmDoG6nq5HVN79/
	224Y/mbMHGoEyvvAnulAB+oK8L8jCeExQ0Y8zaQpc4rLMZWqiBS4Oq/ijtR8ZNTPo5yLPETVgTdil
	Gu+e0lWQj89CZY8FUF6HE6D7A1XIubJjgQi7HJulxpARxvFwr+j6wQJ4VzrcuSYccqXrE8ZDNaILS
	ygJcM1oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow7U-0000000FdUT-0N9J;
	Thu, 21 Aug 2025 03:37:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uosLN-0000000FDIQ-3OcQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 23:35:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E2C1061444;
	Wed, 20 Aug 2025 23:35:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F06C4CEE7;
	Wed, 20 Aug 2025 23:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755732948;
	bh=y57OXA2qf0ImBgIAMIygDKuxGU0lido+XJCFV2fG2rs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKcM1ibb8MR4oGQMr9Iti0vVq6ftAwMHTG7m7VQxgWzQIf+aJWsugCZci+v0gqIgN
	 NThenXhxpwjRr3sjjWbs9s5fi4o8Q3MVZ4PK2pGvjgnY3E9/rTXKyCjKue+TwQLwvY
	 4LcJbfkfPbafd/mauVtJXps5f89CcfL1RZ2UYpnQ8sW/ycGKfGSjZxyd87YYbnbV+U
	 or0dwV6f3xxcVdEoggkerG69Ijm3Ufr6Mx9dEelBFTWLOmYD874mkcUj+Y0KtYd16D
	 0p9e19/egc/sfba2OA9OFld/JbA+ZwCcAGFuEnaf5tWPZ1fGkAo2xIcyZDHLkdstfT
	 psocEQxyqFI/A==
Date: Wed, 20 Aug 2025 18:35:42 -0500
From: Rob Herring <robh@kernel.org>
To: "Kumar, Udit" <u-kumar1@ti.com>
Cc: "Raghavendra, Vignesh" <vigneshr@ti.com>,
	Harikrishna Shenoy <h-shenoy@ti.com>, neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com, airlied@gmail.com, simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org,
	tzimmermann@suse.de, krzk+dt@kernel.org, conor+dt@kernel.org,
	nm@ti.com, kristo@kernel.org, thierry.reding@gmail.com,
	sam@ravnborg.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	s-jain1@ti.com, devarsht@ti.com
Subject: Re: [RFC PATCH 1/3] devicetree: bindings: dsiplay: panel:
 panel-simple.yaml: Add Raspberry pi dsi panel compatible
Message-ID: <20250820233542.GA1691241-robh@kernel.org>
References: <20250818154746.1373656-1-h-shenoy@ti.com>
 <20250818154746.1373656-2-h-shenoy@ti.com>
 <06a9fa20-e45a-458c-971a-a6f0f1d08004@ti.com>
 <f2fff09a-376a-44b9-a421-13202b1079fb@ti.com>
 <0268561b-8a3b-4508-bd28-3b47f5a8b754@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0268561b-8a3b-4508-bd28-3b47f5a8b754@ti.com>
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

On Tue, Aug 19, 2025 at 11:22:42AM +0530, Kumar, Udit wrote:
> 
> On 8/19/2025 10:46 AM, Raghavendra, Vignesh wrote:
> > 
> > On 8/19/2025 10:24 AM, Kumar, Udit wrote:
> > > On 8/18/2025 9:17 PM, Harikrishna Shenoy wrote:
> > > > Add RPi DSI panel[0] as a valid compatible for simple-panel.
> > > > 
> > > > [0]: https://www.raspberrypi.com/products/raspberry-pi-touch-display/
> > $subject has typo s/dsiplay/display and s/dsi/DSI
> > (use a spellcheck with your editor).
> > 
> > Also follow the existing prefix convention for the file (run
> > git log --oneline to figure out the right prefix)
> > 
> > > > Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> > > > ---
> > > >    .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
> > > >    1 file changed, 2 insertions(+)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/display/panel/panel-
> > > > simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-
> > > > simple.yaml
> > > > index 1ac1f0219079..65f486f2bc9d 100644
> > > > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > > > @@ -268,6 +268,8 @@ properties:
> > > >          - rocktech,rk070er9427
> > > >            # Rocktech Display Ltd. RK043FN48H 4.3" 480x272 LCD-TFT panel
> > > >          - rocktech,rk043fn48h
> > > > +        # Raspberry, 7" dsi panel
> > > > +      - rpi,7inch-dsi
> > > Hello Hari,
> > > 
> > > Driver changes should come first to match new compatible before device
> > > tree changes.
> > No, there isnt a driver update that I can see in the current series. But
> 
> correct current series does not have driver changes.
> 
> I would expect driver changes as well, which should come before device tree.

If you rely on that, then you are likely breaking the ABI. Please don't 
submit any DT related patches until you understand that.

You must define the ABI first, then add users of that ABI. Users are 
both .dts files and drivers. It is that simple.

Rob


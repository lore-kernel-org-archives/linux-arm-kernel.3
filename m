Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A52CC77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 00:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=30QZDV7N+vFJYbr1tFKZvJElpKPZcNnpFK4WPKTb0Ps=; b=gqoqI6t+SUI1ipXfRrlUn+50Hp
	ml0k+6wbfAvAY0Ztq3E1+nejuI3ShU1YUVbtzTcvE6LzwV7RPfO8vNDOVu8uDxpin+0ouk7TdyqPW
	DRec3JN3tcYMFdtoIS7Ld8yiAy0yQL6CmjRh6xNehdn9fFlfiT7HHfGARoYpsvb9SNcipUreUSGJ7
	xJkV11ZtpwAlSAKZyOcV/p9zEW/+0nIJhHQDNlR62sb71mxHAiMnq+IstiujgQs90camqKLGpxIF3
	+LipHcDOWYZbTDfE7MCdZW8fOIZ53OdqEWsorxssZ71/FfIoYNzGTTMr+GSG9Aa6KgBYtj1PAowqA
	4WMRsnww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEKw-00000007DFt-01fG;
	Wed, 25 Jun 2025 00:50:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUEIf-00000007D5g-1CEz;
	Wed, 25 Jun 2025 00:47:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE57661142;
	Wed, 25 Jun 2025 00:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B805C4CEE3;
	Wed, 25 Jun 2025 00:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750812458;
	bh=ypeDCIqJN01knxine3UtPmHgKvFykSbRb7N69KRKmDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NI5bL/HcFPqSJkNfF4SnfVOU2a45svebC9ZckKBw6DFIkD5evGWbV274EoGTL1/ep
	 AEjlAM69HcAhO5te/SkL78jtyp6Fn+t5W71ztthOEs3wQbTlXYyPqVubhZQgl1vomu
	 ++znLaq7O/Cws6dgqf3MLrwx5B25E5BdIab2AG8/KflPR0ErH6hHzBLvk4mc0AbEsn
	 l81+N3/mME8pnAxa6ccJcw1yrJXJju7mrz8e0BETb4mcNLjVMo0aFLOsO/UkrpoRxj
	 GhKAH+Uty929qBBAQT4lOTnN1zDHAQXOerehXzlhgcm33r7QTEWVy31zb6yKrkCe00
	 oRj1eXK/qVbAQ==
Date: Tue, 24 Jun 2025 19:47:37 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: lee@kernel.org, linux-kernel@vger.kernel.org, conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
	kernel@collabora.com, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Add binding for MediaTek MT6363
 series SPMI PMIC
Message-ID: <20250625004737.GA2087299-robh@kernel.org>
References: <20250623120038.108891-1-angelogioacchino.delregno@collabora.com>
 <20250623120038.108891-2-angelogioacchino.delregno@collabora.com>
 <175068852802.3230004.1923972457454728043.robh@kernel.org>
 <480c78cc-076f-44e2-bd90-1dcc91a235ee@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <480c78cc-076f-44e2-bd90-1dcc91a235ee@collabora.com>
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

On Tue, Jun 24, 2025 at 09:27:43AM +0200, AngeloGioacchino Del Regno wrote:
> Il 23/06/25 16:22, Rob Herring (Arm) ha scritto:
> > 
> > On Mon, 23 Jun 2025 14:00:37 +0200, AngeloGioacchino Del Regno wrote:
> > > Add a binding for the MediaTek MT6363/6373 (and similar) multi
> > > function PMICs connected over SPMI.
> > > 
> > > These PMICs are found on board designs using newer MediaTek SoCs,
> > > such as the Dimensity 9400 Smartphone chip, or the Chromebook
> > > MT8196 chip.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   .../bindings/mfd/mediatek,mt6363.yaml         | 98 +++++++++++++++++++
> > >   1 file changed, 98 insertions(+)
> > >   create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/mediatek,mt6363.yaml:
> 
> Yeah, sorry about not adding the information at the very beginning (but I suspect
> the bot would still complain), but anyway that's because this series depends on the
> one that actually introduces the bindings for the regulators that are referenced in
> here...
> 
> https://lore.kernel.org/all/20250623120016.108732-1-angelogioacchino.delregno@collabora.com

If you set base-commit and/or dependencies then it would not complain. 
But really, it should be one series so we can review it as a whole. 
Examples go in the mfd schema so they are complete.

Rob


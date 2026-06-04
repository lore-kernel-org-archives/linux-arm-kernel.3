Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A7F8CD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tc8kKyhH3H2zCZNScLf6HQ5I1o056QsaSn+BN0X2LV4=; b=uPb4+F9p998cwYOa1OjC35+a3X
	NklJEFXlc5x9JzILJXtMdAckK92fkQ4v9m0rT47x7tEgFA88yXpkw4/7AiscXBEhR2V05ZttcT34X
	VJ8CHpKS1cBuSRUlfOcClEPKwstP79jqV/4zi2uewN/6aXEzBHtfGGsezJpwqPLIfHZM85JQicYR7
	5FidZ8lVPHI/OvCsH/ejCAJ26VEPA9IwULKfqtrNBkGmYqdQm4emv6Hg2oQVZ07hp08U7+pkd1+0x
	qi7ML/UM6moCBrbQBTTVeTBhZ1Zm1zQrHP3HA/5ngdw4vptymvOdeK2OxtRGiJ4vkkWqWn7PhSE9U
	YZDD6Vsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVF8E-0000000HIj4-2VOv;
	Thu, 04 Jun 2026 20:57:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVF8D-0000000HIiq-1SSC;
	Thu, 04 Jun 2026 20:57:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 12C61409C7;
	Thu,  4 Jun 2026 20:57:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B539B1F00893;
	Thu,  4 Jun 2026 20:57:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780606656;
	bh=tc8kKyhH3H2zCZNScLf6HQ5I1o056QsaSn+BN0X2LV4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=I/kbX5+MLJEmjJxCt2qQHRtCJyVEw6Zm6+jK5Fr9/Porpi9q2uHrqdSFo48U351jr
	 jJG37L5TV/PVUj8N/QaHTpUKRrpAVhrmDTDcLfHgf09XVn3r/EiCJExJTU++g5ZzZ0
	 YTq5H+0l/jNoNOxcA1PfJE/e5sP5VwtF+7emEMioSPa1XZsbtwg0SRs3rOOv6+lWf9
	 vQgbD7bosy1MUypO4kC4Vwc3dIsm9SKWZxxFKBMoh8LEMXtZAuZRFkVb6Yl1sEnVan
	 GyEUCyXR3CL97CXtj8y6ubUhILrTAuYQVa3uLobqRc6BDy2ECfbFowIMyOCekf13gh
	 Dgw3ch0j3F4hQ==
Date: Thu, 4 Jun 2026 15:57:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ninad Naik <ninadnaik07@gmail.com>
Cc: broonie@kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
	krzk+dt@kernel.org, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, me@brighamcampbell.com,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	linux-mediatek@lists.infradead.org, lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] regulator: dt-bindings: mt6311: Convert to DT schema
Message-ID: <178060665412.1220107.5361933646396949784.robh@kernel.org>
References: <20260604162624.644241-1-ninadnaik07@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604162624.644241-1-ninadnaik07@gmail.com>
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


On Thu, 04 Jun 2026 21:56:24 +0530, Ninad Naik wrote:
> Convert mediatek,mt6311 to DT schema.
> 
> Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
> ---
> Changes in v2:
> - Correct "MediaTek" in the title.
> - Drop "|" in the top-level description.
> - Remove unnecessary regulator node description.
> - Remove unused labels from example.
> 
>  .../regulator/mediatek,mt6311-regulator.yaml  | 70 +++++++++++++++++++
>  .../bindings/regulator/mt6311-regulator.txt   | 35 ----------
>  2 files changed, 70 insertions(+), 35 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6311-regulator.yaml
>  delete mode 100644 Documentation/devicetree/bindings/regulator/mt6311-regulator.txt
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



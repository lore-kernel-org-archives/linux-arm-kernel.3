Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F09E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 11:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RY+bbzrqmx4mjq27m52T9s+vjb/19nkKYhCQN5i768=; b=MsIeGQtC++lI4KvAX8PNvgoIss
	v5xYfyK68R0J524jug190Yd/qyi0jZg0AbzI1pZRXmduMeS/O1POUSZmQVs9QtxtRePYHGS3J2LxO
	QGcxITeJ4MXwpTNVF8MA6GEL+LNENdaPOnLCDFna0ReiJl8JGAri6NGkhIC8WHwbq/WUeoNGh0umM
	Sf09+/5lZ+EUPWgLYxtEV/tJV6kiQJTplRMr5UOYYPxUV+ZCK+skmTS1wF3U95ho+5h5Y1QCQe5ua
	M1cCxdx9CMNTrf47+ChQea2y73TSgYGCE3duI4y9aHYBDIiF+IPxJUnhFjSJD0HATvemqmux/7CPQ
	vG5fSRrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKnk-0000000EgAy-0TWa;
	Wed, 11 Dec 2024 11:22:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLKmg-0000000Eg3C-40oG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 11:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96363A420C1;
	Wed, 11 Dec 2024 11:19:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699FFC4CED2;
	Wed, 11 Dec 2024 11:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733916097;
	bh=DgftItvKwlAqV6VUxDwhJgPamO/iGIKYe2fBSGOS2dQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=S+kRs9zSROEKEbuf6pQXp6LKyYNbAyiEMMZeR6T/IukOtp0WJTxya8pmJRrBkU/hi
	 2lH22ehLWYRh4Rsj3/gsS2NMFEM9yPi1QlYwwYRe+PRP+8L2UOb2Kh9TP7TGKsBtmp
	 NxaDphjfl/zlxLraM34B2C+YcI8T29Pq4ha3IOXKS+NBgyyulYz0TO3LbNbdUpSc5O
	 aQGQPRYru60pQkeCjqkECmgTuvYte+ovXbs43B5/8aJdhqusyPPeuLiIViQNpInzaJ
	 ugJ0e99xDBPASPvYEaj5slqOQ2yBuvJM6EtmKW4uZU6qnNpyJlZdeaY6p7eMAeUSEh
	 nicQ5MB2EUedA==
Date: Wed, 11 Dec 2024 05:21:35 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Balakrishnan Sambath <balakrishnan.s@microchip.com>
In-Reply-To: <20241211-sound-atmel-at91sam9g20ek-v2-1-86a0e31e6af9@microchip.com>
References: <20241211-sound-atmel-at91sam9g20ek-v2-1-86a0e31e6af9@microchip.com>
Message-Id: <173391609559.2340929.13321693035546295768.robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: sound: atmel-at91sam9g20ek:
 convert to json-schema
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_032139_060453_96F34170 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Wed, 11 Dec 2024 15:16:15 +0530, Balakrishnan Sambath wrote:
> Convert atmel-at91sam9g20ek-wm8731-audio DT binding to yaml
> based json-schema.Change file name to match json-scheme naming.
> 
> Signed-off-by: Balakrishnan Sambath <balakrishnan.s@microchip.com>
> ---
> Changes in v2:
> - Add missing CODEC pin options to 'atmel,audio-routing' items.
> - Drop 'minItems' from 'atmel,audio-routing' since enum defines valid connections.
> - Add subsystem tag to subject.
> - Add blank line between properties and fix typo.
> - Add audio complex description.
> - Link to v1: https://lore.kernel.org/lkml/20240214-at91sam9g20ek-wm8731-yaml-v1-1-33333e17383b@microchip.com
> ---
>  .../bindings/sound/atmel,at91sam9g20ek-wm8731.yaml | 70 ++++++++++++++++++++++
>  .../sound/atmel-at91sam9g20ek-wm8731-audio.txt     | 26 --------
>  2 files changed, 70 insertions(+), 26 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/atmel,at91sam9g20ek-wm8731.example.dtb: sound: atmel,audio-routing:2: 'Int MIC' is not one of ['Ext Spk', 'Int Mic', 'LOUT', 'ROUT', 'LHPOUT', 'RHPOUT', 'LLINEIN', 'RLINEIN', 'MICIN']
	from schema $id: http://devicetree.org/schemas/sound/atmel,at91sam9g20ek-wm8731.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241211-sound-atmel-at91sam9g20ek-v2-1-86a0e31e6af9@microchip.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDBECD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P7CRDgQRCgbswaPyjvGXosFvqSn1cQaZz3l28dfD8pA=; b=kYNl5ELIlJmHOevIKN/QGOWjwf
	ZHAWwOTChNkAkevSm8PvW8EMnn6QxkrKM6sDZhjLSUIJ09YNXaWW4La4s2wyAi5lascMXWO9Ask2G
	lFWi4d/USLbcdRSyLuMgjbUZ+9yLKMui9IsvFPH9MmSwsLvtla1agoQWWc2gznQiZjF3c5HWvR3MN
	Gz4MWWjLOeYbGNFsxF0fZkM79V7CpBGF45yZ5WRANx9PUTNCfCJlsggLiYosSVfP4f+2jUTDHa6cv
	Jb5bS/yfBBXutTf/KCI+uY7w29iTjyDS8TuXcxX8iaX6s9KtCFicR5Ge4ZBzl5dEQAIxpYaHkNZxb
	TMX59RrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDVk-00000006xtc-1BrB;
	Wed, 10 Jun 2026 07:38:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXDVi-00000006xtW-31nL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 07:38:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 253C343848;
	Wed, 10 Jun 2026 07:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F07E1F00898;
	Wed, 10 Jun 2026 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781077082;
	bh=P7CRDgQRCgbswaPyjvGXosFvqSn1cQaZz3l28dfD8pA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aLfu2WYV9r7arf9MLaBIu2ytvYUSx9dTUD0tgLBGlvbQFBSLSkMkr+9GF41qVul09
	 7s2nk+Kiaf8Dm8YOGAWSOw2ttxjDChRHf1DtTPjZZPvVUOrLWseonB8S96DH+Et7Dj
	 3b2P9FZcn5p+YBliCxcwujDZ+zFO0UNigzY62VglAYWOkWZfzoo1jqJd4QNrhL7Kyh
	 c8RnsDAtYB1xfIjKdo+s56AqsgXJVwWgcOcnQo2DAHdGCAQjlg0HXlbISMWaD6CfDZ
	 sVfadXSbyBBUXt34cnjfIJYaAfK99SlRv863wfBOHvYbCURqP3vNFhpBuPRWpo45u+
	 iTz3pxu3dkziw==
Date: Wed, 10 Jun 2026 09:37:58 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Daniel Baluta <daniel.baluta@oss.nxp.com>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <20260610-adventurous-granite-marmoset-e0eaa8@quoll>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
 <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260605113621.1479-2-laurentiumihalcea111@gmail.com>
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

On Fri, Jun 05, 2026 at 04:36:18AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The names of the carveout regions are derived using the names of the
> reserved memory devicetree nodes, which are referenced using the
> "memory-region" property. This adds a restriction on the names of said
> devicetree nodes, often bearing specific names such as: "vdevbuffer",
> "vdev0vring0", "rsc-table", etc... This goes against the devicetree
> specification's recommendation, which states that the devicetree node
> names should be generic.

No, it does not. Names like rsc-table feels exactly like DT spec is
asking - for a name matching purpose. Are you sure you read the spec?

> 
> Fix this by documenting an additional, optional property:
> "memory-region-names". This way, the carveout names can use the values
> passed via "memory-region-names", while keeping the devicetree node
> names of the reserved memory regions generic.

I don't see how anything here is fixed. memory-region-names has nothing
to do with node names.

Best regards,
Krzysztof



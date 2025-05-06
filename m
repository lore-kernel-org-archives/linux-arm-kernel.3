Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBD2C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 02:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p2gBbpdh0MU9XUpo9IR2GfSrQFpk/4KHCIH0J7/qXS4=; b=sepJ8ct8EIkQpRabSeSWFSh7zj
	6+g62zdCJEFvqqSXhJ0W2EO2j4vftL5ERALx6mlXOTH0OmaetoYX20TPzM6VJee1+2w76MnLxAk1T
	QAfyfLELUR0s8/7SUc/oD27zQHFzgyaIDTGMqEbZz/iZvv6phCjZ1mwUW0XV7hJcjnpvN3uZcd5sh
	8WnXGR3DtEHRdYkHxABWcR50fJ+VDbuFwIrdjCrKpxuiLL4aQQOEm1vICxYKOjiRxOARQ0oxyM2cx
	wZfsou1Y4bpHds/XUiw0U1IJq64UjFqAPM0ML/4ID0uiqrCqIfW4uA4Ly/6aZPyFObLw0EItIaXmA
	sWeoHTtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCUbN-0000000DvyD-2TCV;
	Wed, 07 May 2025 02:33:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCPcY-0000000DQ0M-3iZZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 21:14:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB1AB6115D;
	Tue,  6 May 2025 21:14:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D3CC4CEE4;
	Tue,  6 May 2025 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746566073;
	bh=p2gBbpdh0MU9XUpo9IR2GfSrQFpk/4KHCIH0J7/qXS4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ANoedxDePhtZvl/6IQfyofQo7GLHiGR/KaIr7LrvkCemRtnMhlSEyT2QBHL+xfHVx
	 j3TlgGwDCt82lTPWeSzokMYT435bmV14bm7suZ3sA2SJDQu7ITsb/5YcH4hWvq+S39
	 Jr0LC++E0JvUVgBxRmiAySdjk/+ondjBshHMmZewy/l+Fpgj37M52sE3n4inzRCgvl
	 s1NvI4hhYHLBUVoxZp111sSJLYWoE95VScl96+IcJeUXLWslRvR+MSXa2cLr/H3w4c
	 cfc7uqYDlsGCF+qvNQJVSz9F54jf4iNBBzCAnFHQ+hAhTomOD35oZxMLTkrj+ms8ga
	 YvdGQenSZA2EQ==
Message-ID: <66f58453c245b08aa709cce3482ac4c0@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250503080949.3945-1-wahrenst@gmx.net>
References: <20250503080949.3945-1-wahrenst@gmx.net>
Subject: Re: [PATCH] dt-bindings: clock: convert bcm2835-aux-clock to yaml
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com, devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
To: Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Date: Tue, 06 May 2025 14:14:31 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b
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

Quoting Stefan Wahren (2025-05-03 01:09:49)
> Convert the DT binding document for BCM2835 auxiliary peripheral clock
> from .txt to YAML.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to clk-next (and dropped the label)


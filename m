Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9B0606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 11:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HC0UVo6E;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XVFhxY1U
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7ge4xhF2ujfXkwVZrVQamV67uWn0z1MILFxq9yG0j48=; b=HC0UVo6Eq6LN3ierHOXC3lX425
	cMuIXsckJcEhiHOWXp0JffunsfpIoFa9mh7Awm3jxCgpbR+DfAjUOPxaoEAGrTK4YLxQ01hYdkzSS
	fFhzVjuoixaQmrGrMzRWpPNnpX6xslt3spxNXseC+/0lnXcKnzvXS0ha2VvLGmrpT3MD5UDvfZpCS
	oOm+dPu6LmbQ0MHIbLH8O/A8DjzsuRmZfCT2NbLZf8srrXnSsOmVHXeQDejPBVfO/4pm38E9FljiK
	ffeww5Ao3J6wQyzXc6WEnC67chv34d+qr0D83uRBqiXp57pfVjGpLCK+CYZActbqXU0iDZfpsO5c7
	rwVXbKag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpq3-0000000GFO9-0tZD;
	Mon, 02 Nov 2026 11:04:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNpq1-0000000GFO3-2C1d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 11:04:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EBD24401D0;
	Mon,  2 Nov 2026 11:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E803D1F00A17;
	Mon,  2 Nov 2026 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793617468;
	bh=7ge4xhF2ujfXkwVZrVQamV67uWn0z1MILFxq9yG0j48=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XVFhxY1UjgyRi2hSOwlMwP5vymSaoqhkIKQ3Ie6kb528DKM5H+VO405Y4Zwf1lHsC
	 1F3RYrBIQNJSVHpfKgqLsJBXicpnAPu6xiJbdYBiOI0fOFwnswCXiuUkDmuqhUT81E
	 Kq8FUqpVQgDPnle5HbzW0Lwo0rceA9SYHhJWol/IPLwDUaQqO51XogniUt16Y6zMQg
	 aJvKo+ws5NUL24IO2UCW2a7eMZpcXMhd8DCiY6RLXcktSAlA12ae7eIuD1iWQgT3mW
	 l5JTENAeMXAFRa5eqwhbMQiVehdhXLEY911nGJ+E0YhMJz41sF4T6NQXj7lEe6sKQ5
	 UHnbpmLdkJGeg==
Date: Mon, 2 Nov 2026 12:04:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	shengjiu.wang@nxp.com, daniel.baluta@nxp.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, andersson@kernel.org, mathieu.poirier@linaro.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: dsp: fsl,dsp: document debug reset
 control
Message-ID: <20261102-tough-brawny-rooster-a3d3cd@quoll>
References: <20261029073257.84594-1-shengjiu.wang@oss.nxp.com>
 <20261029073257.84594-2-shengjiu.wang@oss.nxp.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261029073257.84594-2-shengjiu.wang@oss.nxp.com>
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 03:32:54PM +0800, shengjiu.wang@oss.nxp.com wrote:
> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> 
> The HIFI4 DSP provides an additional debug reset control that can be
> used by the debug interface.  This patch adds the `dbgreset` entry to

Please do not use "This commit/patch/change", but imperative mood. See
longer explanation here:
https://elixir.bootlin.com/linux/v6.16/source/Documentation/process/submitting-patches.rst#L94

> the `reset-names` property and expands the `resets` array to allow up to
> three entries (runstall, softreset, dbgreset) by setting `maxItems: 3`.

No need to repeat the diff. And if explaining more, say something
useful.

Best regards,
Krzysztof



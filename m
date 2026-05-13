Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C91CCD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 22:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYBjY0bvsRn8fUX1uUBbkQy+QYqws04/bLkni/izJ6U=; b=mTwYlHCA99V/YQEDQyInf4WTzP
	/Z4qH7liBDn6HEgdAfzeEIejgOMeB/3p97uKj6xrrZXDzbM5adEYJ4PHSogoTAbWU1VRWmSWWdYaU
	yMTplqMNPMBM1c0RfRVU5dKCbwTLcCMKz8HdbqteklmPDp9jsxQk7ymeFC/qfZEiY70ProuQnWlEP
	WKwFDznS2FDoP9zdNZSr15cQ2XcBDZPv/9LyBskrwv1II+uFqfKhBf05wdgS4WXT8eJRqh7qzCO0h
	Wj1+wkBe3mGl9mIZgV5ZSr/Q74B+5AXBXb5L3wOwe3OSKce8Aaaodgm/bAWIXtM9Tj0ohKMdqUed+
	urJYuDEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHeZ-00000003slN-3MT3;
	Wed, 13 May 2026 22:02:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHeY-00000003skk-2ufd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 22:02:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC85660052;
	Wed, 13 May 2026 22:02:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C189DC19425;
	Wed, 13 May 2026 22:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778709725;
	bh=/gJKXcfLpffrosVi62SdDLKP271qgTVAvxV27fCg7NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4nyM2h/Axw+JFALNF1A5fN/+YSUOUtit/xhwczDhyMJIWOKizSHqQLB67heCkcX9
	 vcvp53DAE0tslSBqx7B3qNyE4PlskBZoRT4TBzs4QT422btlzKRLYG8MRO+mPdebjA
	 UbMEQXLXxbQFOFeMTAOGh6/83NI+823W/GVmGQaaSxHTtV0YzqeX+TmpAXjeU6rpND
	 y5ualPNMtFSkvyiaFE7+59UIviDwhMKInFb4bKzWM5W64uukWE/rUlsxNo11l2OYNO
	 oczODsdeUh7fR1N9UBdhiwNNJ67wUFonuvLwNHi2wpFhNdu8miY9HUFAhh7mV6pGsu
	 p1CdA+zwOCaog==
Date: Thu, 14 May 2026 00:02:00 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	brgl@kernel.org, bartosz.golaszewski@oss.qualcomm.com, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] dt-bindings: i2c: convert davinci i2c to dt-schema
Message-ID: <agT0xYb-Do2rcob5@zenone.zhora.eu>
References: <20260513123758.4955-1-chaitanya.msabnis@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513123758.4955-1-chaitanya.msabnis@gmail.com>
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

Hi Chaitanya,

On Wed, May 13, 2026 at 06:07:57PM +0530, Chaitanya Sabnis wrote:
> Convert the Texas Instruments DaVinci and Keystone I2C controller
> bindings from legacy text format to modern dt-schema (YAML).
> 
> During the conversion, the `interrupts` property was made required
> to match the strict requirement in the driver probe function. The
> custom `ti,has-pfunc` and `power-domains` properties were also
> properly defined to match SoC-specific hardware features.
> 
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

merged to i2c/i2c-host.

Thanks,
Andi


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640B4C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r8lSY8NO4A3szmC1L5/5rT11RHjhDBjjWSNP2NRw8Aw=; b=Gv8dIK2WIYXz0fpRZw8iXAll0m
	r0OpJiOBgaGAyvUtHxUsCa0DjpD6s2wxyQo9WX0/u+q0CkXFX9nr7MfcrTQ2p5JXQojwaqEyM1mPR
	sBEd0fxWr1cG/naRxYsQOrQ672pZj3lcIIEK3KHxyQIdhkTcpBa/JAXeAUtsQOe6KdKDkJ3Px0o6D
	mBSE9+8sGeloz+F9Tno8AU0zE5y/X9J9OuNKT+3k7HfAwUAHFtVDQv43xrYip87NlrYVg1ERzYYM1
	8N9TIfqqY3H5rZg9DR4u77GjR2tlueATPbgeo7A62Kz9b2mKzrKvEDo4lasCkWkq9RvM8Ez3op8M5
	LbuTcwQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQgh-0000000Gvp5-2eWT;
	Mon, 10 Feb 2025 10:06:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQcm-0000000Guk3-1p6I;
	Mon, 10 Feb 2025 10:02:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 09BE85C4936;
	Mon, 10 Feb 2025 10:02:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2935C4CEE5;
	Mon, 10 Feb 2025 10:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739181763;
	bh=kAPX7U4HOemMCHpMi6ojF51w0Vel5PxxbwLGLMG+LsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rQqs/zShPLbbCKZnUDqiVh2YXCC0g9uohS3xzZhnklcHYZmsZ/MGIB+l48sn6e+px
	 2ItQqbq126z1vWIqCeSbyOI1/tlUZAy95wa9m1tgoXERtu4Y7fYqp+kX7kJ40Dqbxh
	 SwbViyJpA8pl1kFoHBDpiaDiDyNYyvysSnd3ZjJDLY1Vs1CnToSH9AUDkZxVCibRFU
	 Dcgn3utMB1Ule6/49RTN+SPnOcJZYvgZZ9hyJlg4hiHggC4Ou5zLw/eXOyU/+Yqiyv
	 BeczPbox/kscg1ojhF05q1fwj+4Dgi9W1ncBWhfXzpUe+DNJspl2QGhdEUtBNLiURZ
	 bMQ0vE3afSXHw==
Date: Mon, 10 Feb 2025 11:02:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 10/13] dt-bindings: display: vop2: describe
 constraint SoC by SoC
Message-ID: <20250210-poised-free-pronghorn-4b7fa9@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064457.11396-11-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064457.11396-11-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020244_516589_5EE6DC27 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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

On Thu, Feb 06, 2025 at 02:44:38PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> As more SoCs variants are introduced, each SoC brings its own
> unique set of constraints, describe this constraints SoC by
> SoC will make things easier.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9321AC79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 09:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CUawfQC7/LAyZY4Kl0/s6vNzD4v3nyDgqcXc32WNi3g=; b=y7/6tUYuG/3nCjzj6En2czdbH3
	16YK2Gu4AxqqQcgXf6VAJ6rM+EI4BWFW1hnI88MVcQwx5T6JjTG9BizULHCQ/SL1sefMU2Q6zoeIO
	kTaNBFpznuJBxLWL7Bm5QunhAXN93mdozuwTama+En0IGamqU4f8CjlCoUbSv5MfYn3GxqLqSVSZd
	VNAJRjTvkQLZ3QUJgYUDry/+EW/Fd86JFiw0MfZWNmBdAaZU9O3zBdrSLePK70RukXcb+o46zER4b
	sDCn26+AFWkobhjUS8RbU/L+lU9kTZEKH51m8NECW90E80tqKQLHg7/5+z74NxrbT/y58iUthUBPj
	Ej2J66/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EhY-0000000BJTx-43Ic;
	Wed, 09 Sep 2026 09:34:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4EhX-0000000BJT8-3JbG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 09:34:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6972442DCD;
	Wed,  9 Sep 2026 09:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2B531F00A3A;
	Wed,  9 Sep 2026 09:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788946483;
	bh=CUawfQC7/LAyZY4Kl0/s6vNzD4v3nyDgqcXc32WNi3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HDYVlr3mUzQGleKqudyysbR/48OBE8zzBOeawhJ82l7JW5dNT1jCUZxJJZxpNai7l
	 OumP9ELkK1UyL55vxMA7MzfY8cA8fWHWI6Y6vUJK3YOKhLpb0GJbheqGRJCKXp2fP1
	 ykbmoeKUe8HbJFjGFtW2v+0BmjLvmLXf8T34+20238ziGxmVeOPN7z84m8JZgVKuf0
	 y75HOm2Kb3frdYLS/ABauAwFishuuHHKNqsuEZUQUF6VRuANWofSL0ou47gdZ1QRlD
	 8jwlNlrG8hn6q4pJkMzzRcze+q/DSkxaM5VdSQeBjd0CqpZu2otRYzMguPbABKUKy4
	 dv0ZsV8vU2BNg==
Date: Wed, 9 Sep 2026 11:34:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: vendor-prefixes: add Free Mobile
Message-ID: <20260909-hilarious-ant-of-success-580f24@quoll>
References: <20260908-for-upstream-nbxv3-dts-v3-0-1d88b2c11680@free.fr>
 <20260908-for-upstream-nbxv3-dts-v3-1-1d88b2c11680@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260908-for-upstream-nbxv3-dts-v3-1-1d88b2c11680@free.fr>
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

On Tue, Sep 08, 2026 at 04:12:43AM +0200, Vincent Jardin wrote:
> Free Mobile is a French mobile network operator. Add its vendor
> prefix, used by the Nodebox v3 CPU Module (freemobile,nbxv3).
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



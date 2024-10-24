Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CFED0BB66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPUJkDB045xCy7BlZHgL9Y0u7dh6EAwuPEvF6Ze2qOM=; b=rHu1jJ/IaLDqhFEce3IizQ7zvo
	Gl/Z9rdw+EdCMCpC+A8QsaXspNoE4l69FM6XSum14OTcRPq6LE3lZhp820JP+H4AKJczF4RgmC44V
	qyROO4ygETr6ylvwKvRYzPO7DwzZiVyA6DxcA3FBlDLf2rp0vJMfsW+smUbwLyu9C0+/+2nBvuW/v
	wCT1GG/2j3JV21ePApt2NmwxNr7LhKVN4bUXSfkT6tt8CaCPaEeNgCkFLIIqWoBR+yhscoGIugbxD
	NvBpd6It7uK09L0qcZXlFPZVElyE7Euc3XLH0Dtall40ume+qH2HV/CbR/4gClxZbjBCCwYdQ9m7v
	edF4V33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sWb-0000000H8zL-0eXh;
	Thu, 24 Oct 2024 07:44:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sTg-0000000H8BI-2byR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:41:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C6975C02A5;
	Thu, 24 Oct 2024 07:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA5AC4CEC7;
	Thu, 24 Oct 2024 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755711;
	bh=Ua9tBHTrpORpuWVXGVnMTsm/OluQSGISJqqykkfb7zU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CaAjK7m79S1env10bWY8Ob3KJYJeGnSOmCJfe7b8bUM9UQgleW70PIykcibFdP1Y7
	 IkRuMAGBk4jwHzCF/9bUZoAHb0cYEzQo6GiJi0sl/ZeB6b8J7Atc7ZXzZjK0VfuBae
	 hX14U0mN3C/XOWO4kAGZlzhYA8Zhf5RlM9VnWm5EHQHOU+eq+by5dUH4WEQ4022stN
	 NsqYttzS4jNpinIcvCwxSYaO72sW0odQtvAuaG+NBmYrSPXh2aOTBwRpCf0chZuY56
	 +vR91OnvnYmho5Q5gMcNqpz1VuRZwMj+BFMkbceQ1j1PCfbFn3LJkx7TJmCEY3TVQJ
	 fzQdkkdQdYmXQ==
Date: Thu, 24 Oct 2024 09:41:47 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: hverkuil-cisco@xs4all.nl, lars@metafoo.de, mchehab@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, shawnguo@kernel.org, 
	francesco.dolcini@toradex.com, linux-arm-kernel@lists.infradead.org, 
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] media: dt-bindings: adv7180: Document
 'adi,force-bt656-4'
Message-ID: <qekjhuzgyyhyugf7c6qcqckuxtnz64au2eaotbdoly5ucksg2l@5y2va7uaf6ei>
References: <20241023144206.1099622-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023144206.1099622-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_004152_722709_1E53430F 
X-CRM114-Status: UNSURE (   6.44  )
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

On Wed, Oct 23, 2024 at 11:42:04AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
> 
> The "adv,force-bt656-4" compatible string causes several dt-schema

compatible? Or property?

With above sorted:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



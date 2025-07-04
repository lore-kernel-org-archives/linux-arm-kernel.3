Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3123BC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 15:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4zfUJz82lCcOlEvES9OKZvhzjAWT7OKMPA/+q8H16l8=; b=hy2bj1JtTxgMb/IEY/UyEuf99i
	XglTT7pywvvi6R3IBVOgFbbqERz32Xh7kU99CbhdTq4u9uu7hBl1mBbuZrNNla+a4hEhg2qaPM/F8
	l9LF3kfBB9Wy+IaY6bnUZQjzLeQRlYWAC67sdMtxeuzDfyO7eR94Md/IqbWjptPAascupRExmQode
	eiQrd4bVeOo7jmB8MXFJsCtDJ5HIe6Iegd+X/iQChPtzQKeXqFVbvi+FaBNQxL4T3uUEHU1yIpXk7
	LbywxEKQ6tmGf2xTilsiYQTOwC3mlr6uqIJUmyhfxDOxYtfFxlri3aXhk+9jIhmyRVkZl2icOit6Q
	2eW5cITQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi0g-0000000ElOK-14E7;
	Fri, 04 Jul 2025 15:07:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhmE-0000000Ej9X-2A4t;
	Fri, 04 Jul 2025 14:52:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C97D1A53C98;
	Fri,  4 Jul 2025 14:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45462C4CEE3;
	Fri,  4 Jul 2025 14:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751640753;
	bh=wvOUH9o5gF0uSYr6gvxt4vxQuZRlLrBQ6mBTFf1tR+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pkDeEF/aBKKjiyfySfAjHWe+wKIukH1FABhdvHAn5Focb1nEhYzIM0QS2MWnKCp17
	 SkWenXLA1NkTCT9p0SjGCICseqYQ3ZoHgXXyLCWUIOMHNVFl2A9b4psdS7MYRJZ+lM
	 tHlMG5+EYOmuCJL/KfaFn9fRZ6KCD5eGAGeARiEK5FmjtZ7ofBqjnfjzeAIrEcJ3Hf
	 CNQLW+Yy680g0P4W5Ew84TgJj3MFNiYJsqzD4qEw7yN7qqPpNqqqcgHW8cg68FAL1n
	 Sat727tIQTMcYeJteADAs1b/ryX051qt07Xv67OValRQ7mzDqIMy32Q614E0sqcb3Y
	 LFkWfSKsuK2qQ==
Date: Fri, 4 Jul 2025 15:52:28 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 5/6] net: airoha: npu: Enable core 3 for WiFi
 offloading
Message-ID: <20250704145228.GC41770@horms.kernel.org>
References: <20250702-airoha-en7581-wlan-offlaod-v1-0-803009700b38@kernel.org>
 <20250702-airoha-en7581-wlan-offlaod-v1-5-803009700b38@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702-airoha-en7581-wlan-offlaod-v1-5-803009700b38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_075234_627727_3BD8998D 
X-CRM114-Status: UNSURE (   7.14  )
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

On Wed, Jul 02, 2025 at 12:23:34AM +0200, Lorenzo Bianconi wrote:
> NPU core 3 is responsible for WiFi offloading so enable it during NPU
> probe.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBC3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJjx6Ab2G7PaKxOpdukebnYn8A+Lrk4/5WhohIG5gao=; b=PIkroiOXjSW5wdoyqrmGGAhmj9
	FD5C4iW0nih/3HjOdj8ThYOgxl4UPbFZwmSSVHcHytMIUBlmuOHD7e/p2UMMJ9fKhwszVB2Gu1/tH
	We4SX5pZ6m4yBtUCO56PSl2AbCIPaaV+wwzNVAGjZen1kMCYy2h7CU4qjTAqnG7cAi6Hb2yEulxRZ
	8Kzr6Uiy9BYTmZodFMbGNiQpzNu2yxTtLgPxrHtXS8S3iPgNcpJImYFSPCClX61f9/2JbCNsMNZnC
	EOnK9m3IXH4jkM8WfemYnluzJPoKx4oftTdUO+OOjfEnF5W94iOa+AmM+A75gmI1CZF9DfMrk6c++
	gguXcANA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQkn-0000000Gwcp-1BRa;
	Mon, 10 Feb 2025 10:11:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQeX-0000000GvFa-2frp;
	Mon, 10 Feb 2025 10:04:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 817095C4922;
	Mon, 10 Feb 2025 10:03:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378B1C4CED1;
	Mon, 10 Feb 2025 10:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739181872;
	bh=7L2ha/YngK5jMueC7mLCC2P45ZJ5Oa8CNhph4EuCsSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HadQvcNyiQEIpvzP3QIYWdrOT4ClSpOay4MttGI3cYGp1ebeBhcOa0DDJKg6s8HoF
	 jZZSB9vjhe6AsdiCODgld+unX+vNka5AtWMmdfxMPgxl7iZ8LL6LO7RjVUHMdb77yO
	 PzdHJFtbj5Ob4p9LeZHVpFjGhYgFpuuBwYaUwit/owGKHjAImUCa9X7UE+00irIuaJ
	 YOX5zj3qacz5vE3shms4d2Vo7dJHPv/eMNd8/wN5HZFtR8O50y9hJCvkR5sMl6f7AR
	 eLai+TAWMGLswIpUkt7KRPy98nAhg8T4xKllMQiJOeXCaaHMn6kFy0BpxqW82zwB+w
	 rW1sEIV4YF/VQ==
Date: Mon, 10 Feb 2025 11:04:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: heiko@sntech.de, hjc@rock-chips.com, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	derek.foreman@collabora.com, detlev.casanova@collabora.com, daniel@fooishbar.org, 
	robh@kernel.org, sebastian.reichel@collabora.com, 
	Andy Yan <andy.yan@rock-chips.com>
Subject: Re: [PATCH v13 12/13] dt-bindings: display: vop2: Add rk3576 support
Message-ID: <20250210-crimson-weasel-of-diversity-ece7c5@krzk-bin>
References: <20250206064457.11396-1-andyshrk@163.com>
 <20250206064607.11495-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250206064607.11495-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020433_719576_9EF6D8C0 
X-CRM114-Status: UNSURE (   7.44  )
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

On Thu, Feb 06, 2025 at 02:46:03PM +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add vop found on rk3576, the main difference between rk3576 and the
> previous vop is that each VP has its own interrupt line.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof



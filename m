Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F551E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=myPGJtQShLdWQVyusT0R+YbAKIhDS9JqUOg0Y0FiQuw=; b=rhOvljVTORU8JVBl/Bv6JD0tec
	BJu6xSu7TGZbelnDzvDTw3jccgClwE8+apCnvOkDH6LmLYL+XikBlZX5tfpOo0TCQdJFmTAggPqJs
	6rQfYcr3WcqZaY/sxG+nv0kDYmm4LHmMQy2/C3xJN2n7I/DWolIRRw4kjpJDVZHnKtYdvEd9GqgTU
	Ogd5g6FgM+MlA5fWE3YISAbYsrCbkL+E2f4HxO+fo6eLTUUNIwlIXH4nmmz7y9ZAqrzidSROvgZLR
	MqS4MONYoqydNQ2rCxkDaAJS3y4MWQSf4KRjVIp3+sPYYGURlY5xlmTWUVfIT+n578nDY5xgMryU7
	iih7/y2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTn18-0000000Dnbq-3JNV;
	Fri, 03 Jan 2025 19:07:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTmy5-0000000DnBT-3YAa;
	Fri, 03 Jan 2025 19:04:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 05FBBA4106D;
	Fri,  3 Jan 2025 19:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 958EAC4CECE;
	Fri,  3 Jan 2025 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735931060;
	bh=DafI9g1XNuT7MPMDVqmKvgRQVNguGNF9YtDmgVH8Iow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hHn2/J0sJx6vjiRvnr3BjTE74srVelov907d8VsnVm0ANis/x9aebgim/iDefjDuh
	 WbL9RMwudR/ejSBUlulYqopxODhLwySitf+m0o7p+q/VmjMwp2muKB8n67wjfi7Fnb
	 TYeLymDrlKfoj5l+6GaGf7tFA7V1CRU7bwkkS0qWX/2c15hlrpgQHTejk0KMsfhmJ1
	 Q2vaUlyUHEECVj5vuwWQK6hum8IqxZzYtlWUKhOFJ+qJXPqkiYqZMFZZ7jo9NC1OoM
	 FyXxFG83is1AvXAwbsWgRrLCZvmUh7ZXQ2Tsw/cAuMvs6Npkfw8fhRRrAj02W2BZVu
	 xyoO0FY4hRQzQ==
Date: Fri, 3 Jan 2025 13:04:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: cristian.ciocaltea@collabora.com, Andy Yan <andy.yan@rock-chips.com>,
	krzk+dt@kernel.org, devicetree@vger.kernel.org,
	detlev.casanova@collabora.com, sebastian.reichel@collabora.com,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	heiko@sntech.de, linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH v1] dt-bindings: soc: rockchip: add rk3576
 hdptxphy grf syscon
Message-ID: <173593105799.2574254.3863097129830130474.robh@kernel.org>
References: <20241231091841.252103-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231091841.252103-1-andyshrk@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_110422_073223_C6104BF5 
X-CRM114-Status: UNSURE (   8.45  )
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


On Tue, 31 Dec 2024 17:18:41 +0800, Andy Yan wrote:
> From: Andy Yan <andy.yan@rock-chips.com>
> 
> Add hdptxphy grf syscon compatibles for rk3576.
> 
> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
> 
> ---
> 
> (no changes since v1)
> 
>  Documentation/devicetree/bindings/soc/rockchip/grf.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



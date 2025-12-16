Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 651ADD609C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 16:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/BvO+riTDQ0S5kYZewzfaUaRKDJ3mDY3pwEoOpQ5TAI=; b=Y3vDYCTS2IHbkY9COaaXI7FAhz
	er0Ah/RZ2lw+FTTPv0CqV3R4EMRsPBNAbGF3FRr3oY5MkGug6REUFMOXhBfCHqXOktmw+ZQ7wE6vA
	XUkjShsibBRr51+KT1zXB5LJ2HSCwQwZ7Q04KqOQ8F6gpz1mpiQGciUquqbGhG+eVUUb0mRKCQz+6
	xg+C4Fpojf3zsBUFIGA0Jg8tuIweVMoqpddpEvFuXFPn0z4/tDpyiGZuZYL1+IkGTbfDGafC1hIqE
	jioVt/MzlYvIiX5Jw8ZGfBtJAN6TpNc22QESchSpcuWexXbaSA40Xj4zlwhyIJWIepFt4pkY9u//F
	70N9BTGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY78-00000005XyP-2tY2;
	Tue, 16 Dec 2025 16:41:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVY76-00000005XxG-40jn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 16:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A47E54421C;
	Tue, 16 Dec 2025 16:41:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EF5C113D0;
	Tue, 16 Dec 2025 16:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765903288;
	bh=glph62P7/Du4L/3zXD5ZSp61IfKb8z3u5NBivwGvyHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UTSV+DLObsuIg8F42cTPdSxFgpaSaHhToXwVdstqF3sHCOidUNUBhS68w184Nhqks
	 s//HVY2Kzi3RWoTBzOve0RRyfroC5brIzvI3RZfl2bdpRMSYLO9i270EXaSMGHQ+gt
	 eJI8E66Zo4PjdHlSAEe2NhN9ayKou8oQ0pwEh7SKx62R7czgfBVQ7veUq1jEkTlMDQ
	 XN0ipskMG/x7vaE3ubud0qTrv7aAkdAWXGbU3p7a8ngdoRef9m8t4sor4EgMmAVqvk
	 zSQKBvD48JP/LWaUQu6Otnw8jFYX1lBIkwUCZ3rJdpZQKEqchIURbgjKmptRW1smDD
	 mk0ZPEXtUdlGg==
Date: Tue, 16 Dec 2025 10:41:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Gatien Chevallier <gatien.chevallier@foss.st.com>,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: bus: stm32mp25-rifsc: Allow 2 size cells
Message-ID: <176590328507.2607309.18218209388270739835.robh@kernel.org>
References: <20251215212700.3320634-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215212700.3320634-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_084129_010744_D505E3DB 
X-CRM114-Status: UNSURE (   9.72  )
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


On Mon, 15 Dec 2025 15:26:59 -0600, Rob Herring (Arm) wrote:
> There are users already with 2 size cells, and there's no reason to not
> support that.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  Documentation/devicetree/bindings/bus/st,stm32mp25-rifsc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Applied, thanks!



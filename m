Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2795C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 22:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hDWDe2+CVqStW5/SpYkGfiyUlgShlkFOZrJU24j/fSM=; b=D2qDkqVZJOranxT2RLlM34GhoX
	Pv56nDz7M0rdimG5m5rEmWVyZ4zKf0BpGKefOW4tOgfR1PjXaXxgXv0N67r6w+CuW5uFYf+1jsATd
	dV9+D7tga8N2KwaWpXyZQ9nNXwtKxT8aYTuWI6h2/64otKHYIQiSJru4BZbABlRvPrj3NuaWmG7hQ
	zfA1OyofCX8hz5JwFfvNx6r+7rv3wTOQ+hsD50RNqhy5cv+j0hBsDnk3HGXmqvWu9FhFvUL5l1b+W
	LFxpg/ufWFPNngUARS5eDX9In6MFMDtSSJzZak4nGLKYnZtqGi+V+6+83Mb30O1tLVgV/ouQWhdpV
	XlCmA/fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfR7y-00000001fw8-47Ls;
	Tue, 04 Feb 2025 22:10:42 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfR6d-00000001fnd-3fOc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 22:09:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A74F85C28F6;
	Tue,  4 Feb 2025 22:08:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16101C4CEDF;
	Tue,  4 Feb 2025 22:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738706957;
	bh=Q/b2TXibazPA+Xu3VHO5Z1c4UqPVO/0QWz4Naf8gPcA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=s2iUmSSzuJGtFM57XyI6FA+MAJ3tJ6KBOe8Rzm59XZdCeUJ7BhlNlRVOAUOpbPhv+
	 VxLR2ZKlg8tIkqlG+aLnv9JOiYR6lIOjc8AaHvWv0eS3RMSeRiFXK5jg8FfEvwkFD+
	 KZCiofC5faT0RjGDXj4KHS5DMt6dj892wj7sW35RA5k6IuoVnJibpWHbh2WNQXJlNi
	 rGGneUaCih6m5Fiplc0+nLOGxHii1da++uHuzruSGfhb0UaNXtddkfYAZ2iFLfzsEx
	 Xgp7bMEt4W/5kstkLQougMdtxxtraKq7ZecQgNlOYTiV0l44uosA+e0AgVP2/HLuxq
	 TI75f5HJsjIng==
Date: Tue, 4 Feb 2025 14:09:14 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek
 Vasut <marex@denx.de>, Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Shawn Guo
 <shawnguo@kernel.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: net: smsc,lan9115: Ensure all
 properties are defined
Message-ID: <20250204140914.5a91499c@kernel.org>
In-Reply-To: <20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
References: <20250203-dt-lan9115-fix-v1-0-eb35389a7365@kernel.org>
	<20250203-dt-lan9115-fix-v1-4-eb35389a7365@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_140919_958260_A4691BCB 
X-CRM114-Status: UNSURE (   8.76  )
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

On Mon, 03 Feb 2025 15:29:16 -0600 Rob Herring (Arm) wrote:
> Device specific schemas should not allow undefined properties which is
> what 'additionalProperties: true' allows. Add a reference to
> mc-peripheral-props.yaml which has the additional properties used, and
> fix this constraint.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Jakub Kicinski <kuba@kernel.org>


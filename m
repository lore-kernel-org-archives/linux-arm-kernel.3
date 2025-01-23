Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A4CC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 22:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LRPyClg3EsQbuPGoIm4DyxtDIXG2VDQIOtJhIA48rqk=; b=FbUrE8XIC5eNUseZ/1cxzUB0WA
	IKefwHgn3vO3LX9+fw593ceFyPCKzHRnC+alxqwdzvoAfGWa2rckQypEwzVSWnwKicNmt7g96MvRH
	AwOT6eqiU47N4m2VoW0lrvIi+QtSQs8UxQxLKExc3Ee/3WlLeJhHxQNoe6RG5zyJf6AMPUfzdj4WH
	y24s7asjAAoDKrudrM8GxOEWCXCQw0AmQmpJqVWuuOh8UAptR/BAGYGVyen9TpjOQ2JJcfIRU/rrC
	w7NFhu6/76ayoEq53yqmJkdHImcjDh2QA+MGiwhwZ8bUQT7D/ZKdyQBevypOYg4wnEN+SvCBbwvQj
	0bWs37tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5SA-0000000DO27-3Qfi;
	Thu, 23 Jan 2025 22:13:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb5Qq-0000000DNro-0J3y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 22:12:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C791EA40B1F;
	Thu, 23 Jan 2025 22:10:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D677C4CED3;
	Thu, 23 Jan 2025 22:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737670330;
	bh=h5zYZEeh2fayA+qgYt1ROno/TFyCfT21k9zimU507Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pS0PydAP+A2YJMSiI8R5iPpvEnHyM7oUr40s3uHQxbFxq6iXZ498P+qYTBYL5FiG9
	 98ffwKSrAFQvn9NDtjAD0K87PpxCpCsK6QXof+baFrDGreCApwkNQ2vmEuqNXQu+Kv
	 t6pyoV7HiNuLnpxeSUQPHwzR9n4Af9dU6mCCXwY7HXLAbXf+0xDZZfq8IFEW797fuL
	 Wvc5n0H8yOZaKN4VElcrUqH4XdlT2AfYnkHZYFINZC+3L3iS8PP6SfaN/r5TJWuik1
	 wjpwY2Kn/I7M3bLekd2YYYhV8/+KYrxRXUJXBzyBldxEU0xqvYvokHfM/QoJLFgqRS
	 VUARXO7KPHoWA==
Date: Thu, 23 Jan 2025 16:12:09 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ninad Palsule <ninad@linux.ibm.com>
Cc: pabeni@redhat.com, davem@davemloft.net, edumazet@google.com,
	conor+dt@kernel.org, kuba@kernel.org, andrew+netdev@lunn.ch,
	joel@jms.id.au, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	krzk+dt@kernel.org, eajames@linux.ibm.com,
	andrew@codeconstruct.com.au, minyard@acm.org,
	openipmi-developer@lists.sourceforge.net,
	devicetree@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 02/10] bindings: ipmi: Add binding for IPMB device intf
Message-ID: <173767032899.448455.5833909744401276024.robh@kernel.org>
References: <20250116203527.2102742-1-ninad@linux.ibm.com>
 <20250116203527.2102742-3-ninad@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250116203527.2102742-3-ninad@linux.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_141212_171990_DDB88772 
X-CRM114-Status: UNSURE (   9.91  )
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


On Thu, 16 Jan 2025 14:35:17 -0600, Ninad Palsule wrote:
> Add device tree binding document for the IPMB device interface.
> This device is already in use in both driver and .dts files.
> 
> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
> ---
>  .../devicetree/bindings/ipmi/ipmb-dev.yaml    | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/ipmi/ipmb-dev.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



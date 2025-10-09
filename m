Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C07CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 18:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbh8TMXYf+etZgUAQPjpPZ7XfLQwYq9N1IeDlkqaRKc=; b=oMbxLpiMtzZSrxMazST6oYO/uk
	o0uxBC+3H2q6IOGNoZKd9GABmUG2b1EICTw+6ZMCyNYLhzF0rNWy37iFH1LtX4AY/8uZGZnDXqsHZ
	fx7bXtFDZoH95UUb6FXw2UuZgzOmdzS/IHI/USbAWGw6q6EvninbaaVRdcVK0qzunVFEWcHzgcFNa
	Ee15lHoMdblqIroUHfBvU+VMpUlSG+5mrbCTXsrEi9/vK64RwaR5hPXWgUWPX+J+EiZ3KIrr6DYw/
	kdcxV4/97I5XCHkyY20LxcrkpCXt5CsY+tOFAa8NnV78/43OcbOB5ueK9Jdv9voqlT6+NvkyVOzqJ
	IlDZPwTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vW7-00000006vE8-1LF6;
	Thu, 09 Oct 2025 18:37:31 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6vW4-00000006vDk-288O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 18:37:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=hbh8
	TMXYf+etZgUAQPjpPZ7XfLQwYq9N1IeDlkqaRKc=; b=Kx7NX9ARTd1R4rOgttHw
	1k8S6rIbd6gCkSWYKa5sgtH7eBb8+YK9ZBEgD5XxvFx/zZvAcQomuo9GO55GfuC6
	6FXAcoi7w9B70fGipy2hbfE5pf9eSnVTGDNu0f2hexfWdMUwMkOW2W4fxqB0aDp5
	p6Ol5K09JVC/XLwwVdG2GgOGk87LiGaHSRn9wkXFKiwj8yLDYok/F0xHQYtwpz+z
	KVqE7tLqId/xm6NNea1uclzKcUjJSmbNZJVmDoderElAMX6R68GB0be80g4wfiyR
	ThEgE5T9QHF+9LSHjCA36T7LNQmUk4dBHZ0B9QkeURGtAaiyYRMPzQkF1sKhWBlw
	9A==
Received: (qmail 1186063 invoked from network); 9 Oct 2025 20:37:22 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Oct 2025 20:37:22 +0200
X-UD-Smtp-Session: l3s3148p1@bx15F75Ajq0ujnv2
Date: Thu, 9 Oct 2025 20:37:21 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: bus: allwinner,sun50i-a64-de2: don't check
 node names
Message-ID: <aOgA4UnDDaTBR7Nw@shikoro>
References: <20251009111500.75198-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009111500.75198-2-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_113728_820241_724C676F 
X-CRM114-Status: UNSURE (   6.33  )
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


>  patternProperties:
>    # All other properties should be child nodes with unit-address and 'reg'
> -  "^[a-zA-Z][a-zA-Z0-9,+\\-._]{0,63}@[0-9a-fA-F]+$":
> +  "^.*@[0-9a-fA-F]+$":

'^.*' can go, too.



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1E3C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 07:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5vuh78kClq7KGvNejQQj0xWgLvOfNW79nm/EQCjh7xM=; b=mmm9BjxCy3SGwa+pwwI6M5dcKQ
	SevGRyp14I9MadWSZsXOxjQyc4n2FH0TPVtwLdgYEhSvjB8yIG6KjL4csZ3QSEEQq6NLejEcLXkim
	pl22G51k9mYHxjtNKM1tqPbCGfAMChTHPSGknnqehun1Q68TnoOMK/nAjU8WTSb4xrIJYoucnKDiA
	FZ/LI3l5QWqTqFLTkmickTq/LqSqJ1nNVOhSxXGK0QGP1h4vq1iCJqowhL9MdjiDr29o6wSKj8hCM
	j9wJ9oiNJKwfDoX/bTH+UZyMcBljOyOkJGZn2ZTXAcDcl5Gd10omJw5q+JwgsQrQv8OzwbYJ+jX4h
	Pv5QltOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D6A-0000000B1t1-1660;
	Wed, 09 Sep 2026 07:52:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4D68-0000000B1sh-30R3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 07:52:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1643A601FD;
	Wed,  9 Sep 2026 07:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E2751F00A3D;
	Wed,  9 Sep 2026 07:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788940319;
	bh=5vuh78kClq7KGvNejQQj0xWgLvOfNW79nm/EQCjh7xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KRC2oOA996pcNN3ePwBT2Aj3PJb5c180iP1CZ3GDkEW9Tm7In9H55tc1zN4j130Lh
	 6HlGVdRu6z78+bjhJqHnLE9yVRsjUxwImOAdCCR83SJX8rJjDpn0z/xzoPnww1ZgEf
	 PhD++BDphIUiac/NAoWZ6A1HkJtB6yDBD3W1Omcgp/zZVPOLsbiudnaujERNlIzVE6
	 bGFOV8T+gnv77bZhh8BqTdDdnKWQ7VfnGUqDYIuf6M7R/ZD6Qb+WELWBKvNm9NixIz
	 BebInEfVLIWNjg5uxGXcyecPMAKzIRdnTTiU/1nSyxYbMGwRlDMbW8G6iCf+kCf9kq
	 usy+3sDjogSrA==
Date: Wed, 9 Sep 2026 09:51:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hongliang Yang <hongliang.yang@cixtech.com>
Cc: peter.chen@kernel.org, gregkh@linuxfoundation.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	p.zabel@pengutronix.de, vkoul@kernel.org, neil.armstrong@linaro.org, pawell@cadence.com, 
	rogerq@kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: usb: Add CIX Sky1 USBSSP controller
Message-ID: <20260909-sceptical-eager-cobra-b550a2@quoll>
References: <20260906032440.470788-1-hongliang.yang@cixtech.com>
 <20260906032440.470788-3-hongliang.yang@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260906032440.470788-3-hongliang.yang@cixtech.com>
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

On Sun, Sep 06, 2026 at 11:24:38AM +0800, Hongliang Yang wrote:
> Add device tree binding for the CIX Sky1 Cadence USBSSP controller
> glue layer. The integration adds glue registers and mode strap
> controls in the Sky1 S5 system controller. The CIX glue node wraps
> a Cadence USBSSP core as a child node.
> 
> The per-controller RCSU control and status registers live in a shared
> RCSU region described by the cix,sky1-usbss-rcsu binding and are
> referenced through the cix,usb-rcsu phandle.
> 
> The per-controller RCSU registers are accessed through a syscon regmap
> referenced by the cix,usb-rcsu phandle.
> Signed-off-by: Hongliang Yang <hongliang.yang@cixtech.com>

One more note:

Please use git to write commit msgs and then actually commit.

Missing blank line before tag. This is triviality, but why you can't
just use tools which solve such trivialities and no one ever has to care
about noticing them?

Best regards,
Krzysztof



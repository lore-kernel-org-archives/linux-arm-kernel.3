Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41400C7113E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4xFAvj2G5VnN2oADUrjOMQLWSOzD8+mWMWxdA4/gXps=; b=YStsgJqcfTNIXwr6mZ4Pgn5R5m
	z+DL9QnF2YRjANgj4aMd2KZKrgQP6F3GBoGNQ1ZJ0dsHBOp89qUFYk2QgfghyAU0pWJSzazfBBd3R
	t+6T8H52g24BFHtqGAsR4eF2KYBcWOcDBsfC9jgc8WGcivBtgabbez+mSdy6dvV8cg8eebMWcb0Yf
	rTPftHCP+UqEZfEvQ3UkySCA8ABd6TwoPfuZp9l2TOKxMnZheWAxJeshvQQTV+oJ83ecBAjAUqjK1
	yEBP5U/F8ZqL8AVFvEwPMYOVSHYCmgV6HiDIQaQ8C54nGvB9jwqnpmn9/+V/6qpnLba7REkbRsC+W
	UIv19rNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPS8C-0000000BApk-3VOq;
	Wed, 11 Jun 2025 20:33:08 +0000
Received: from out-181.mta0.migadu.com ([2001:41d0:1004:224b::b5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPch-0000000Akza-2vUk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 17:52:29 +0000
Date: Wed, 11 Jun 2025 13:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1749664344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4xFAvj2G5VnN2oADUrjOMQLWSOzD8+mWMWxdA4/gXps=;
	b=WkGh9g68gWOHLnoNJXve7+hzhqKiQAdR0Rj2NXjDUlGVWZX161sjbqguO+g/sxHPJ0Hpq+
	KLWaJQh0bx6ndqXMpvcQP/Y3tnZVGEU7ZheePnFoegfMFq5p2wn/CraG//QBRUH032nazx
	HTPz8t4b+NrczcM3aEMNBf8xZeAaVnxIioyk+5t9SolpoofK9fGl/v4RJIFSe/+Y4FSz/S
	xCJ7tetaSPzQk7U4usSIJCroH6cbYALUSXstGLeSR+/Fk4t3usc3vWWZRoHdfMjy19Od98
	jql7hgU2r+FswNQ0YiQY7H7YD4ArtkVbBjV1RA2krIu5r0TsjfqMsKByaXa+GQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: fnkl.kernel@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
Message-ID: <aEnCUycX_x1zNN1D@blossom>
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com>
 <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_105227_936607_8F170CD9 
X-CRM114-Status: UNSURE (   7.15  )
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

> +      - description: Driver-opaque calibration blob
> +      - description: Calibration blob
...
> +      - const: hw-cal-a
> +      - const: hw-cal-b

For me these descriptions raise more questions than what they're meant
to describe... Maybe "First hardware calibration blob" and "Second
hardware calibration blob" or something. I don't fully get why A is
opaque and B is not, I don't think there's really such a distinction in
reality.

> +    description:
> +      MacOS version the current firmware is paired with, used to pick

macOS


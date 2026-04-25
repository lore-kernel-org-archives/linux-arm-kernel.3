Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9F49FF8862
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 09:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=figXkUSrwcrRbxhwSRmzw/loZUUqJx5BTJHJ4wdLmoo=; b=P2RQEzRTta4t4V+459KCpe6T/X
	t9YVRRGmo4eNEXO5VH24/H6XCblRaGXTfj/b95x11/+rrQ9xB4zHwKa1KNgjZaYsbCJybmSqb+8+W
	Xb5SoG+6HfVpxPVEepxv1YO7UOlwD2sOK15o1eJtrzP/9n7n4nawXLaPZWwWvwgn+BVpZ86aC5Oav
	HphKC8QmDWm63SkxYsBNMweGY1e1S1JIo1piJlb8m4kfsNDjso/zB/BjN+bPqQXidomn3VT0oOS0W
	xs9xvX/pPM2ORFhZsghN7ASRCzTuD7O0vPnONLyZeGmF+rONC2XN7skF+IV6rgV0XseaQfNwFYfYk
	TPCuuEZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZUc-0000000EJ5n-1uzg;
	Sat, 25 Apr 2026 09:40:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGZUZ-0000000EJ5P-3Vum
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 09:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BA46C434CF;
	Sat, 25 Apr 2026 09:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECBC6C2BCB0;
	Sat, 25 Apr 2026 09:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777110002;
	bh=hadfq1e14Gw0z8hl3xYnUIRAy4eOpTXE+uwQc3E3bUo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tur0dzb51y8TATb8JDT+pezGHhqTSQBt0Swj6mLygDhBhkbd2DnhODtFMYJ82MVx9
	 67VHfvDOqkcVDstMrTyeUX70NeYCpcu4Ww1heMSvW5SHvZO3tkmyEOLBS1eIXaARjZ
	 lv2HNVtOXaQryKd/1TlYTClu6RK3QWHkc1WuU9P13UoQ3CXuIp0z2V0PQr/rtq+hkw
	 S67KgSGLqr9nHDCKlm/gHjYOr5RQMOM5vohrQhcxidoc/AnRtbbI42QZsg7qou01o2
	 q9z4kJCONakyfU6UlSdYxZ8gHX3Xwx0tZSb8QPAA4zjEVy2CEHJMDaopmaPWfwbVlq
	 AaODB8KgAVpow==
Date: Sat, 25 Apr 2026 11:40:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, maciej.lawniczak@intel.com
Subject: Re: [PATCH v4 2/3] dt-bindings: mfd: syscon: add
 aspeed,ast2600-i3c-global compatible
Message-ID: <20260425-poised-accomplished-hyena-d2c1a0@quoll>
References: <cover.1777058942.git.dawid.glazik@linux.intel.com>
 <41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41d66492e1a1d42f6888459288311094c8b7bc51.1777058942.git.dawid.glazik@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_024003_898555_113B6BFB 
X-CRM114-Status: UNSURE (   9.09  )
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

On Fri, Apr 24, 2026 at 10:21:00PM +0200, Dawid Glazik wrote:
> Add aspeed,ast2600-i3c-global to the syscon binding compatible
> lists to document the AST2600 I3C global register syscon node.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607FACAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpzZPI5AkDnYadZOHn/2pbou0UbCh0bMPXdpxvkbXhg=; b=G6oCeqhucSJ8rUbVKoG1J0cu9/
	yb62feYp4y1AJ383rvgxR0g9cnUhGq7WsqKmp41h6P8gkO+/d5OWNj7Ex7tupkXb+SbZXQ+RzJdXL
	R7mT+cWpAJUv+7PDjYXbKACtUms6VTnefbNWBsHQUlv1yDZYS+qp/QOLE/R95JZyhQ4L73GY+AO81
	CPaxthyk+ap8mmCbQP8a5LK5hFiwo88cYrZxLmg1PgBui0qB+DFt5E+OXJJ5M2dfWM/XRWYE5z2fR
	NuL7aF84HmVX+QlE4+kkc41RvQDH5ls4pwmFRVqlArpsyzQEMrsJiy35m7qzFVCNXpAPmXjbjzTpr
	BXEzn66Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy99g-00000004IRH-1OcE;
	Mon, 15 Sep 2025 13:22:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy99d-00000004IQn-49ED
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 13:22:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5842640891;
	Mon, 15 Sep 2025 13:22:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE07C4CEF1;
	Mon, 15 Sep 2025 13:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757942521;
	bh=O/mnM44tzuvdBUrl/CyJVRM6ZYLrlrkqYwTIqm29UZU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=u4GsmYuoaQzZElLXxaxCK0gKRH/XZDNwqYk409E42Jh/AiZag78CI8xKJ3kwzT9rX
	 E1ghEo+f3jRCp8y+eVRqwaW8EO39bW6MpL1rwkrVnkl3ZHNxQGKpjZ3hr1BMwQ7Xmc
	 de5fzLZcozznlgblsclHLJVi+675z4SyX4NpZmjmlpRivqrkZTj85JdlSBSznOOyq6
	 +vLxTucV+VwVlrChnnZYoEsx4PwZ+ymybjD0Mb+ZabtZn6ZjIImjUYGoAQAqPLKUyu
	 Yj8Zj1gQRiu/h23jQd/ruB3gy4wY/bfaFdpzwNWN6PPnQIJKUlcI2N73dS2DGncyOI
	 vnI1Qp5OoVcLw==
Date: Mon, 15 Sep 2025 08:21:59 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-hardening@vger.kernel.org, 
 Kees Cook <kees@kernel.org>, devicetree@vger.kernel.org, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Luck <tony.luck@intel.com>
To: Alexandru Chimac <alex@chimac.ro>
In-Reply-To: <20250914-exynos9610-devicetree-v1-1-2000fc3bbe0b@chimac.ro>
References: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@chimac.ro>
 <20250914-exynos9610-devicetree-v1-1-2000fc3bbe0b@chimac.ro>
Message-Id: <175794237027.2496748.5518990883398170186.robh@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: arm: samsung: Document gta4xl board
 binding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_062202_046536_4E8EC799 
X-CRM114-Status: GOOD (  10.75  )
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


On Sun, 14 Sep 2025 20:43:56 +0000, Alexandru Chimac wrote:
> Add binding for the Samsung Galaxy Tab S6 Lite (SM-P610/SM-P615)
> board.
> 
> Signed-off-by: Alexandru Chimac <alex@chimac.ro>
> ---
>  Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/arm/samsung/samsung-boards.yaml:250:13: [warning] wrong indentation: expected 14 but found 12 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250914-exynos9610-devicetree-v1-1-2000fc3bbe0b@chimac.ro

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



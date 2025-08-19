Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6FA5CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 12:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZnXdzTpoRqrd0eGJqjpctP1o6JfomLCHe430f9bQ5S4=; b=ptkD8zMX+YYNZd/Uj8oHIIp13/
	FRv2wU7rEl5kFQ3ilhKABkv+jfhQRnfjvngo87aPVdLd4i13ydBdWghtgQWJbSc5cLhxJVAdkS/Ov
	bXd0f65b3pSmKPgiSsBWo4xh+PN1WpvYwXkXPZhvj973TF9/KdlEEeqrvc1+4VYsKZ5xm3kiQVurN
	5Yg6Y6hkWtz+CIr1PLyYlpRvZs02Lx+/bugm2+LruQSM4v/gqcBht2oNru9tYUZbaszPwY6TAo0wc
	EwMW14O+Gf/JLxUeDgBUlojObG52j2v2jx5jq6APT/kpvJ8xChvRexgcSNGLbyYo7F2Xj/FLtlNHz
	9JwvrLYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoLlu-0000000AU6j-1rXq;
	Tue, 19 Aug 2025 12:49:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoK5c-0000000ACvP-1fh7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:01:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 71B224397D;
	Tue, 19 Aug 2025 11:01:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30151C113D0;
	Tue, 19 Aug 2025 11:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755601275;
	bh=55YCx4Ic6F/7q7AGUwl1QnZj0i5Qlknaw7+fctybJW8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=kOMpDl6wCZPTcqSUklmDaJ1BkUfkAvN2tKsQdQR4oU41qK+KQpMOdlJ2OQYhm8nb1
	 BsT0nmWHccyekHWl2ub35xav2wocw59ywWzobyn8fLPymrJXcECAVw5W82UBA/QZJw
	 Q3dzKgFPd3YbTxHOg1xlYMYqgXL/OZkTz0mlVy8mNNTELLdQMpoEtkoAHYyOrGR6iQ
	 hd7Ba4gVDAY3K0UeeDezdNSQ/7oqVe27QhLNy3510uPHaaOWDOsDZj2wpVZ5CQks/7
	 0aWa+vQu5C3s6GGoepUowNeyC81ZtJkzpSLNID1sL63iG9n01W7jw7zAgv2mRtoyZ8
	 TpYRkZSQX9tOA==
Date: Tue, 19 Aug 2025 06:01:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Christophe Roullier <christophe.roullier@foss.st.com>, 
 Will Deacon <will@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
In-Reply-To: <20250819-drm-misc-next-v3-2-04153978ebdb@foss.st.com>
References: <20250819-drm-misc-next-v3-0-04153978ebdb@foss.st.com>
 <20250819-drm-misc-next-v3-2-04153978ebdb@foss.st.com>
Message-Id: <175560127097.3969141.6615836877357567088.robh@kernel.org>
Subject: Re: [PATCH v3 02/13] dt-bindings: display: st,stm32-ltdc: add
 access-controllers property
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_040116_454966_2075784D 
X-CRM114-Status: GOOD (  14.25  )
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


On Tue, 19 Aug 2025 11:15:55 +0200, Raphael Gallais-Pou wrote:
> access-controllers is an optional property that allows a peripheral to
> refer to one or more domain access controller(s).
> 
> This property is added when the peripheral is under the STM32 firewall
> controller.  It allows an accurate representation of the hardware, where
> the peripheral is connected to a firewall bus.  The firewall can then check
> the peripheral accesses before allowing its device to probe.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
> ---
>  Documentation/devicetree/bindings/display/st,stm32-ltdc.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250819-drm-misc-next-v3-2-04153978ebdb@foss.st.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.



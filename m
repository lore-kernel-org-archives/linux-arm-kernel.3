Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20381CA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Io0VdTzspOUoQfmXiS6pO+3XlynAY1HrDJDwAjTi+Vg=; b=L8kxPrNrEu8il6WwijVy7GbaHB
	ddIiQQigH4VV36iX2yr8PVV82Tl3T/cVlFi3w6b5EFo6WwQniv3mFXBNMlmgMZb54kRfqBpELzg9U
	dpt25OVLmICOpKjDrmmaYAGhF4vYKQ/Dk3rXWM+vPBXVMjV13XuZeQI3+ZQhkNSqHafDMjk6zOvLS
	FwicEZESugu2lhHy7e31eRuGBxSb0TYCxKHqjWejLBBiX4qXwTFM5goAZ4sQJ9jVyRecDngef8c+a
	x70GMpOQmQbEWJBMuWNSnydQDDuYG9E4OZQfk3eyGB4VsStjiAdFkV5h0zGYugEYtwYvx66+iQVev
	e+a83qKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuSZ-00000004zrl-2F0H;
	Thu, 08 Oct 2026 20:11:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEuSY-00000004zre-21MG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 20:11:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 405E441168;
	Thu,  8 Oct 2026 20:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7631F000FF;
	Thu,  8 Oct 2026 20:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791490282;
	bh=Io0VdTzspOUoQfmXiS6pO+3XlynAY1HrDJDwAjTi+Vg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cC49oUNf+J5PrD+quAF7zq+i8lJrcNqZTViFFWBMyp4Qsgi5PmKXIGn007XN6nuFk
	 YWmksK85DaJWUfOc8GgbAYSOTbHvJ448qz5fMTK3elE9k7ZPFMGED31GsBL58KPNut
	 gPZaoq6ta6TX9rmO51UOvSKOvmDuqsXv+RCcO+59/7z+MiHz4UvFinj/hLq9oe2FVv
	 9QvrgUV4st+kqyfz/Dp/wr01MAUaDRBL1JvBF0vWJ8fE+Ifm5KialNmvTWfpRU0EYF
	 IF3XBI0VimagcNcTOYx5c1CkZHMNWNaZjxWROjapPbU5KwR9Yl7deOolwZ17Qwg+XD
	 FABUhxrW1ny/Q==
Date: Thu, 8 Oct 2026 15:11:19 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Subject: Re: [PATCH] dt-bindings: arm: keystone: ti,sci: Correct reg and
 mboxes constraints
Message-ID: <179149027928.982727.4439836373000201333.robh@kernel.org>
References: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002063011.38972-2-krzysztof.kozlowski@oss.qualcomm.com>
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


On Fri, 02 Oct 2026 08:30:12 +0200, Krzysztof Kozlowski wrote:
> minItems does not impose any limit on actual maximum number of items in
> a list, thus it needs maxItems.  maxItems on the other hand does imply
> minItems.  Add missing upper bound on 'reg' and 'mboxes'.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/arm/keystone/ti,sci.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Applied, thanks!



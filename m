Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3C3C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 02:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f4J/lV9oDu5O+QjCGiWx3R7MU92RzGWD6b7CY//ngrk=; b=eU34jO6NQ4/t0ysOaTzRkG62+K
	OgtBo8y9GQDq+N5xTf9MwntngZGCyYLp/SxYMHHk88R596eRbi0UgkXFjf2YmC8DNJkWmA+9ID1vQ
	H6Cmv++aVPNoem9Gg+rwV3Cj4r+8zL4WBfqp7kmpuMwYxDPW3NF2xgQcRHKNrQ1Qpk4Cx/UZEOBdI
	IO5Fpez3OkdoQzmF7fz2CYxibHKJKWKNbAXuJZoCB9Xx1Iv1MtCOgzjdJNO1M4PkORhKyg8pPhJnA
	r39tzS0YTvrS2c4r7nZSm1jcVZn/advFUBXudzLtGs+25/cniRwAtVo2PN+e925vf6C7kEEPP8Bq9
	uciFYfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz61-0000000FJaR-3mcX;
	Wed, 12 Aug 2026 02:53:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtz60-0000000FJaG-26Us
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 02:53:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BCB341AEF;
	Wed, 12 Aug 2026 02:53:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31401F000E9;
	Wed, 12 Aug 2026 02:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786503216;
	bh=f4J/lV9oDu5O+QjCGiWx3R7MU92RzGWD6b7CY//ngrk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jNcjboZt2Z7UlufpgYTK8tRHm0AYNs1JTTLra/Hay3yBXn+Zuvl7zyfWDVFdtw5Mp
	 AvKEKokWYOqiOYzROmiX5HeY7e5yW9j0wBGPHs76uXYLZADESaPwOgfA0nkBZFCiye
	 ZXdKzkM0JlDItX7JCrAgmjo19su9Zbh631MJk91MxFHlRHU3ixuc2oesWRCHRteRuz
	 1jn87szYOoVyi2l8BNFD1VfMscvtFJUjINPzhqqqArwcW6Y+ny2RqATJZ37+qnS09x
	 ZwFGdAFguOiOOM4OA/aA7qN/cf4Ha/JWy4hLM7vErNkzWHlq+EOi3mIH+UBJ8mXVjN
	 zgEUCXnzwCYRA==
Date: Tue, 11 Aug 2026 21:53:35 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sasha Finkelstein <k@chaosmail.tech>
Cc: linux-arm-kernel@lists.infradead.org, Janne Grunau <j@jannau.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: usb: tps6598x: Add sn201202x/ACE3
Message-ID: <178650321482.626908.7700828369794152716.robh@kernel.org>
References: <20260806-tipd-ace3-v4-0-79855b150914@chaosmail.tech>
 <20260806-tipd-ace3-v4-1-79855b150914@chaosmail.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-tipd-ace3-v4-1-79855b150914@chaosmail.tech>
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


On Thu, 06 Aug 2026 11:37:20 +0200, Sasha Finkelstein wrote:
> A variant of tps6598x that is attached to a SPMI bus and is found on
> Apple devices starting from the M3 series
> 
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  Documentation/devicetree/bindings/usb/apple,sn201202x.yaml | 78 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  MAINTAINERS                                                |  1 +
>  2 files changed, 79 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



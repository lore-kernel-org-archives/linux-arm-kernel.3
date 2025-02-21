Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A42EC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 22:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AHL/QiQVXr/kolDvH0uf6FSLzTyqsF6n1s5GvP4a86o=; b=XA54nxc/6PDaegCCggqVWDPX/3
	Xxl7/wNK0ewFYs2UOfUhdUmLvUdLlsBg7Arv0DXqq3cV0XvJz1fXdQfEQwtPxEv6SWlMxSILRqCTP
	bGbmG9eKtBCJG7h7zpX1S/EwhN/m0yKaxpsER620k6PFO8N1oDzEsJxknftScqwFSeJHTVkqRrYrW
	FLerrKwUQ3YNysiqLAw7ObbnkogiOxYFOzrn6KHYA0Atsli3lHLw8o7eiIOAcYQjtl+E9I0XXXVWA
	UMV5Dl9DkPCItNjSUSU+C6vZM5aJbfTV/kQjTDphHV5u8t+vAlfJieUzukLpjxX8D0GiYs+X1lZKD
	m+CKt4OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbXV-000000071MH-3tUn;
	Fri, 21 Feb 2025 22:30:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbVw-000000070z8-1qPN;
	Fri, 21 Feb 2025 22:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6C2645C6D40;
	Fri, 21 Feb 2025 22:28:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2F1CC4CEE4;
	Fri, 21 Feb 2025 22:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740176934;
	bh=owLObRNz3Zq5zzg+bZTyewojtAhwVXd/ithJC+PS2yk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eS/5yKdFnThYLq7jIEIsc4TbOUlZqMfLscKeSH6tI/PH/JaFRiInndtXl3ca9t+uK
	 L+pjm3msTGXQHkzF6gIASswasQAkLce2ze2zEDHEkJ7hN7s3mbpDplKBT+MTHlW4JT
	 DM3spNIISzjf7iTlg02/8sernpEUCWXQEw+3GJiFTquhfmtPxB+fPUyzibrD/69M0N
	 cuW76bmpl62T159B//daco013a3GixGGZJ8hj1Kzv6UpEWPSil5I3VnCbXDKNT4hL8
	 TVXIBykN7XBBvit8ek5fy8BNql3Exl/r5IkxKN0AJYqNSKTxKiVf50lXzbBkjbIQtz
	 Ht6dav0bBQGWg==
Date: Fri, 21 Feb 2025 16:28:52 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH UNTESTED v5 1/4] dt-bindings: arm: rockchip: Add Xunlong
 Orange Pi 5 Ultra
Message-ID: <174017693062.190244.17507097212576105556.robh@kernel.org>
References: <20250220041010.3801-1-honyuenkwun@gmail.com>
 <20250220041010.3801-2-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220041010.3801-2-honyuenkwun@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_142856_531720_8A6DEA74 
X-CRM114-Status: GOOD (  10.81  )
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


On Wed, 19 Feb 2025 22:10:07 -0600, Jimmy Hon wrote:
> Add devicetree binding for the Xunlong Orange Pi 5 Ultra board.
> 
> The Orange Pi 5 Ultra is a single board computer powered by the Rockchip
> RK3588 with similar board layout as the 5 Max but with the HDMI0 swapped
> for HDMI IN.
> 
> Signed-off-by: Jimmy Hon <honyuenkwun@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



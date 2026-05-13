Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF68CD4F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 19:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXm+rWrdlDv0lhq7EN/0/i+Ea2wznLx+dx0Olp8pxY4=; b=UsbfdSfA6AvibfOvRRLa9iMzMf
	J32uUqbmtjQG9GQV6hAbK7ObxG1oLWzLb3+P30jFMs2AaUJvlu0Kpps3em4TYfWS2OOs/PGuWbVet
	jPDhES63oDEVWkdHiIkPbr9xWOM3WuClxmWiSCsVhMuun0LkEbsBDWF6hkTyN/mNQFz0k/20rOx3M
	/K4IVHAkVKR851BWZ96AzV1OpZkKM8Ilz4kSJI4JTl5rustm7XOw5BgR0VHf8bAoR/3oh2eY4eCq3
	SJvQhYNYiGyD/fHiyT4wrYbfEMddBy73dqPhaJvSTJ0vwBtzBwUCJ5VEU8tq7g0saJAT2rqYqRDMz
	i3dXH/+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF9E-00000003Z1l-1tIJ;
	Wed, 13 May 2026 19:21:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF9B-00000003Z17-3ydE;
	Wed, 13 May 2026 19:21:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EB5742D8C;
	Wed, 13 May 2026 19:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB02C19425;
	Wed, 13 May 2026 19:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778700093;
	bh=lWXs1bqOmPoc46gGSfD4IrJfDLSHEiOP2ZwgIfqFCeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MDDXiRpAo6z5wRS/5+yaIYY4EQErovhLH41ZDVkr0qB8WpqWuFgcJLMgOy/H/Q3N1
	 Jji9uMHWIExSdd3X4E/ua7UQ0tp1T6G4c0x2G3u89CKeAy76o9LIM4yjFVtClZUj7w
	 33R0wttETSyam5oZ/LMjoTJYcP1gc1T2kpJqTbxPUB4ARyk8aeOWdhePWqWLyWmt3v
	 vyy6ueMehMy2siXqW5O72ZBjxGvvMe6Q4F6b4vH88WXDE52mB4yxag2RHIi9WN5/rQ
	 aWKP0muE7fpTNSCMxT5Wlc1s5uPsv+9NQe8Sxfp4ftwQ7x3d+riQ/9arfYg+oUdmsc
	 LqRy4Ur0wODZw==
Date: Wed, 13 May 2026 14:21:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Changjie <liucj1228@outlook.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org, krzk+dt@kernel.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: arm: rockchip: Add LCKFB Taishan Pi 3M
Message-ID: <177870008974.1728187.1071588098659841130.robh@kernel.org>
References: <MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN0PR19MB6091C07C729B83E594722E84AC3C2@MN0PR19MB6091.namprd19.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_122134_008744_28CAF007 
X-CRM114-Status: UNSURE (   8.71  )
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


On Thu, 07 May 2026 11:07:52 +0800, Liu Changjie wrote:
> Add the compatible string for LCKFB Taishan Pi 3M, a board based on
> the Rockchip RK3576 SoC.
> 
> Signed-off-by: Liu Changjie <liucj1228@outlook.com>
> ---
>  Documentation/devicetree/bindings/arm/rockchip.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



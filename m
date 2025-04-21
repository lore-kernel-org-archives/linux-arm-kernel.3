Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D9B2C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 18:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CuKtstebHl0iYXBW0+S3MZR7uDa4WhH3zGgyWOrf1Qk=; b=USNXPiR7mMHVG8s8pvueHr7zAh
	ipmBCA10BIxRExRs2/okw2O8T1Lo74m6nOwHb75R8VxWOHv5f+XVwWTt2fzAWlzxa7O9JItSSJ2CY
	FD1YkH4OHtjQAWzxX/gkOTSJwT2irXKAGKP/bGv/eCxkRjwTXN4Mns2qX1xL6vuKJRtxlWb2vlmWg
	RYWj83hTfNNM6j4jB5BAq1dFYadjVtXIyUyEej+8yruVBpIaHZRwFJA6b0oh9hxO5qjjsXXQ+U12w
	0CF6sE/YiHAO89OUke+Z29JOJUJm/e+PzHAjBiu0Z/JowdAJDUYjhrtnzqPIg3me4TBRJgoMbLVE3
	6nrzkI1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6wDm-00000004wwp-3EJq;
	Mon, 21 Apr 2025 18:50:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6w9D-00000004wSx-3VBE;
	Mon, 21 Apr 2025 18:45:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 352775C5943;
	Mon, 21 Apr 2025 18:43:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB978C4CEE4;
	Mon, 21 Apr 2025 18:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745261138;
	bh=dCkTnUBLg+0/XJ/SASAZxMykW2757Adc+Od7Um/fspQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LK5uJYgZ/J/VPCthMipXYAI6HtkiqJ/uBDr9yBG7zqiyOrcP0y2gVi2Am2Nlj0cTn
	 O4cZXCACC/we0XjQZSjbBQMx7QlVoTtyBn9REKSF6Clke7/MQA70il94yDnyfplhPk
	 Gg3ODUTL6n9ZMjhcH6eixVwrG6IKzQz7BCbaCsexD6nHSE/2h+3Qz2x7eBtO8+7EYW
	 Wf36jfsHzmNKLx17OH3TK81UtOAQoq3BYf6rXQ1s3AC+Wyf+pGjnoJHnrYasIz8vJR
	 GFgagbgc35MvEtY8foP+Cop9b4LiKyIJ6DtdnW2GHUJ+fIY7m2vILBSY8mq9oHFy3n
	 7C/nF7MYSYENw==
Date: Mon, 21 Apr 2025 13:45:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, heiko@sntech.de,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: nvmem: rockchip,otp: Add support for
 rk3562 and rk3568
Message-ID: <174526113626.2604105.2555938938491872990.robh@kernel.org>
References: <20250415103203.82972-1-kever.yang@rock-chips.com>
 <20250415103203.82972-2-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250415103203.82972-2-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_114539_914540_008B88F6 
X-CRM114-Status: GOOD (  11.65  )
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


On Tue, 15 Apr 2025 18:32:01 +0800, Kever Yang wrote:
> Add compatible entry for the otp controller in rk3562 and rk3568, add schema
> for different clock names for new entry.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v3:
> - update the clock name from "usr" to "otp" and re-order to sync with
>  other soc.
> 
> Changes in v2:
> - Update the commit message and add maxItems in schema.
> 
>  .../bindings/nvmem/rockchip,otp.yaml          | 53 ++++++++++++++++---
>  1 file changed, 46 insertions(+), 7 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



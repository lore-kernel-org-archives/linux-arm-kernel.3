Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12ADBC282C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 20:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tHRGFkRGQT1s17XHIdoFHaBnU5sHXaFhPM/ZexKp+CQ=; b=FdS7FdkrCF0SD4jvnXU56QB2QQ
	oNT8AhGF1Sd3dECUwax5VwADICVvDsKGg2KjyLzXKwRR+tHFfCF+ZJVRyg5kdfsinJZHrQM5pALqc
	TUupKfP0ufYLEM/EBCPzX2EYcpHNhaamubAQ5p+sguq/FY7tegShUp6JekSgeLWaeg4T6+CkhaCiF
	QRPOdXLEnI+ru2cmMsuw9D6XKqOXkHq6HPUT66cQYW4keiu2bhdRr1W1snLA6ZKT2Kg+CCG7grOGr
	B0cL/o6KscmQJNDYjYPiSe97B+JhxHRRP8S5Xs7gPaNybca8Fswk26S+fWIr4DYwQr/T6xPEFSDRD
	LowH/YSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6i9-0000000CWWs-2D4Z;
	Fri, 28 Feb 2025 20:11:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6dS-0000000CUqN-2Pmm;
	Fri, 28 Feb 2025 20:07:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0F1415C69E0;
	Fri, 28 Feb 2025 20:04:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E717C4CEE2;
	Fri, 28 Feb 2025 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740773221;
	bh=tZRFoklkUux8FCQb6KBOPuB3nq0cmUFuwcY/POd6QUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NAP1IMNoNo6NGUJpkv/r6RUuAyInFtcWGTOZBrFXXeP8WxPkleWTkU0AS+V+7PnfP
	 jTawWceiUhVUmTde+jyywIAcSRUf7Ru1h9nLoGTFJlTK825IMvrXijynBXDb8aXLgF
	 shBI0tFoyofL8GH7c9u6gACDDNbwwPTtZTCceJKSsdjSt8H9vv6fUIrv3Akt4O9wZY
	 Sg10MxheIcwnqpyZ1nOL5FUYcWLqaVs7sewniJsIT6DYhnkUz1H+fPsWFFDfA1KvFZ
	 QmI/mR5wwc8QB6lVK6gjcqcz13vfZhu8b5miNl8H0W9j7ZVmOwmVQs2IOsaT8QfCJZ
	 OrceR3y9XpFDw==
Date: Fri, 28 Feb 2025 14:06:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	Jonathan Cameron <jic23@kernel.org>, heiko@sntech.de,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add rockchip,rk3562-saradc
 string
Message-ID: <174077321955.3490993.13046330315407577605.robh@kernel.org>
References: <20250227110343.2342017-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227110343.2342017-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_120702_669094_F5F751B2 
X-CRM114-Status: UNSURE (   9.66  )
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


On Thu, 27 Feb 2025 19:03:42 +0800, Kever Yang wrote:
> Add rockchip,rk3562-saradc compatible string.
> The saradc on rk3562 is v2 controller, with 10bit width which is different
> with rk3588.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---
> 
> Changes in v2:
> - fix dtb check error
> 
>  Documentation/devicetree/bindings/iio/adc/rockchip-saradc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>



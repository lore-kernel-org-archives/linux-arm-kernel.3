Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418E8E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Dec 2024 09:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ha9eaZKe2pPLaVPj/BlrvwxCVnKMNdxIOtRX6jvdDl4=; b=EtU4Gin92axS45VZurcDIeaYCu
	kM61fzq28w+rHSG80BYB/+9RaapMsEZMRRKDtnms101R88t/Sen3HMlaTTvFF0qYZ2oI5FPr0xids
	9xPsElIJI7RLEdWaDOriX2kyw6JtrpPMRwf6FqVS1F56yLyRYmszXNTv3M4RoWGjLbB9mOIKg7tLj
	9xS3FN79mel1k7JZE2j4SWrqI2NHl0QvTdkps4cXWILVhGREEt9gpuXtUKQCI6Yn1Yzc2eTn4s3wn
	WWzQ/uJa3UOYCrwYYcNZsh/C62Ut3ZytCvNu4KPt3nSHkYIR2BfbVFuvgBk+9aEy/JbuGIdn/ZF32
	bKmvMPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6FL-0000000HRpr-2LEZ;
	Fri, 27 Dec 2024 09:03:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tR6C8-0000000HRKL-0y2s;
	Fri, 27 Dec 2024 08:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DD5D5C621C;
	Fri, 27 Dec 2024 08:59:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F0EC4CED0;
	Fri, 27 Dec 2024 08:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735289983;
	bh=Ha9eaZKe2pPLaVPj/BlrvwxCVnKMNdxIOtRX6jvdDl4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0OgJ3LWV3lMZcfL0iy221Bm/Ia5/6HMN8xhv1smt/qqzKgO37JkxWiXmyBruURwU
	 ZzxARQxgi68rbBqmP33CfcmCzIhixmWwdAheU/6St2LKkvpL0g92hNYLDgopwbBxFh
	 YP8WVjpFltuTYCTwGYrlHsClX992XwjP5Ipsl9wAuxTs8W527T8hqXkQmdOWWiKPZr
	 O/9Z5gX8uKbBkcJOjhYT4WUinUjUVt2XZ96B0x0+lQfbXmxCCP4WvYsw2TYr2XdwpK
	 yS5lREtCxJvHxD0+XNTB8xKgvZG6YhFJJ8RzX2T+GTgw1euxmLV7Dy8HG/qIO2elgc
	 1Z2QNDajBKpSg==
Date: Fri, 27 Dec 2024 09:59:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Rob Herring <robh@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-phy@lists.infradead.org, 
	Kishon Vijay Abraham I <kishon@kernel.org>, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: rockchip: Add rk3562
 naneng-combophy compatible
Message-ID: <m3iznr4xjh5hgnca4jyj64uejesf3ulgfpycvrw5phrirca5wv@hx5rx2tumw36>
References: <20241224094217.3817100-1-kever.yang@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094217.3817100-1-kever.yang@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_005944_313972_3D4903B2 
X-CRM114-Status: UNSURE (   5.31  )
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

On Tue, Dec 24, 2024 at 05:42:15PM +0800, Kever Yang wrote:
> rk3562 use the same Naneng Combo Phy driver as rk3568.

Usual comments...

Best regards,
Krzysztof



Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B7CC28B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 22:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=emP1I1C6B70nS2LydbM2tgFBuG2ApYIQiL+sHsaaGPg=; b=PCl5Lwc+NCy6Yn4cCc1LahU/vR
	WyaEyAOQ2duAKJ+TdZpLkwANTHgUDJznfdCCMzkGR/3VPqCf4oM9rwuC+qdxIXzXyusy/J9nIe1UW
	bHOkXKt3cTPDi3qqlwqttZMSgH60sGMkD0XLTV2lKqU05vmZ2RfQIKc9O7094XjIHFdQhIIRT3Et5
	lqNQjWTlA5VI3IlYoqHHHVD5D7kI38lwoGWd1m01nK05OdkT6VlLVhpFfD1g0JGUMQnAVZBmD6J0E
	8CBqNee3rPeW/xSP3i+ioVgs0IR/RXxqorbXFaGL3kGwzbKhTKYVRS4Dgvr7mRAlHnrl2RuahTkCF
	UC98O1CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts7oM-0000000754W-2GSy;
	Tue, 11 Mar 2025 22:10:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts7mi-000000074tm-0Rg2;
	Tue, 11 Mar 2025 22:09:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC6CF5C5C9B;
	Tue, 11 Mar 2025 22:06:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E387C4CEE9;
	Tue, 11 Mar 2025 22:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741730951;
	bh=AK01nVO4lPumiw36k9O3nSQDc+YQE/eCZNaia276vBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZIGvEONWjCH+L8GrjBLqHcnr2JgBA3aJ0kTP724h4DFHw0G9nDV0cF7OZ4/DIr+8a
	 RR83Du3OSU7DFe53Hcf1C4oO3SB2cBS41uj9mP3m73b1/OSrm++QwQmqNm89b/KymC
	 863R4LFDjHu+a1jlr4obhb1/kMhaVaomu8x59bjDf04vkY+4nuAU07Y1fxnltcfJWr
	 gNt6RSlB+P+WCI5RT9Wv3DkS56GMq/TrXo3DPorImnXEwHEMvhbpkLopyJ7cxL8vwZ
	 AcPCkKLjRhJ77sEDdrxUFkziKiE3r+W3AD3hO1pwuYPfPYOTY0ueLNDB5GzZhd2vVI
	 0PriNDnlvnDwA==
Date: Tue, 11 Mar 2025 23:08:59 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Chukun Pan <amadeus@jmu.edu.cn>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: i2c: i2c-rk3x: Add compatible string
 for RK3528
Message-ID: <hzbhauetike6nf6ox3qdpud6hr4cg5kty3a7hlrfizdcwlodyh@rklxe3uhhitg>
References: <20250309070603.35254-1-ziyao@disroot.org>
 <20250309070603.35254-2-ziyao@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250309070603.35254-2-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_150912_185147_BA83D61F 
X-CRM114-Status: UNSURE (   7.56  )
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

Hi,

On Sun, Mar 09, 2025 at 07:06:01AM +0000, Yao Zi wrote:
> Document I2C controllers integrated in RK3528, which are compatible with
> the RK3399 variant.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>

for self reference:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

I will wait for v2 to apply it.

Thanks,
Andi


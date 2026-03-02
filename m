Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0D5E9B376
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9NPsjemStQ87n0xUjwDCJNEh55URKvMtZw+KVT5SDx0=; b=lGdXrjRogWO0IguZWOU3htqQzP
	9ONdSPaHXtVU77llvNJCVtiCmwFrLmI5umExNV0Dda7lzI8OcNFaAsVrYWKc55syNCvJTxrdY/Vqh
	zBoAtFnmyocJWnyN5S8uzMgz2uVYoMx+kVTTT3awGW+0FZnHcCvDHQmEU9O9631EDONcBHSz1eap4
	76Xuvd5AD0RTd6AYoTg+nPKIivhyH2rsF4W4sm3TH2e+nX9HIZrj+eqckfAZX7Xgj9POr91i2Nz98
	j5n8jmgAOEM7TXdiP443RiiIOZ0iGrzwMMUk4iCgUYySpAEYvTfP63FbAoGsaLajE1c71QM/NmLlu
	CF2ZH0zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2qx-0000000D34I-3VtS;
	Mon, 02 Mar 2026 12:58:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2qw-0000000D33H-1SkF;
	Mon, 02 Mar 2026 12:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=9NPsjemStQ87n0xUjwDCJNEh55URKvMtZw+KVT5SDx0=; b=BfG10oUVxmvixMXPcoRYSIphoJ
	cL3DU2ZcPPSWnDPuw5ckVMmFkiP81EoqJ9KUx2MiylA4eOW4ZEY+h+wCfd4PruczlsoBDiIRrshds
	C5FVq9xtxcv6ufjWhWOsxBcH2m/pS8S3FedR4nSj0/YqZZBNk6qBF09NrFrwu059PxJR9ZxUCEIpM
	7mVPomu30ssMCVYe1QLbanY9yMcGrzy6YH84a3CubYIF+Z9MNgsbcrU5IBgLNVqlJHll3zdJ2+BNX
	7Yewb++FSFH0sGVZa5+1BKBuRz+cdfEIKlNyhlxgwVXCUXVPHcb9SbixH8W6CXcwpq06W8brRunge
	57TmQVdQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx2qt-000000005v4-2w61;
	Mon, 02 Mar 2026 12:58:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=9NPsjemStQ87n0xUjwDCJNEh55URKvMtZw+KVT5SDx0=; b=giKMICpIVVMtUJ7eUGhWu5ZoNr
	ZcznH5niLHXn0lCKWuTZSvatyoDDo1tb1wvqEGI+2W95/4tDvRYNn7M9eoGyzolAlSYRZr/6x0af4
	0deMKAeMr9QU9u/1auQ6PrFf+qhegSgB6VoccPI8by3bx9V0eoWqSRNkja7CIqAhB8F44Cz5id54f
	1zTnX6s2hKsrZy1g2d6VCRXdqZBat2EnfSOogHdAT4tSzAvDKY07Y5WcNfI+MiRAGii2Knipsr/fo
	XZPNSNFnSNln7NZWuabigIdoKUTHEKSTu+yw9tPQ8C6zNgksYJ9vgdPRSP12kPOwH+657RYuR+4ku
	VExNP+fA==;
From: Heiko Stuebner <heiko@sntech.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: rockchip: Enable displayport for rk3576 evb2
Date: Mon,  2 Mar 2026 13:58:06 +0100
Message-ID: <177245624813.813665.16227743247073713111.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224083818.109-1-kernel@airkyi.com>
References: <20260224083818.109-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_125823_797339_244CE054 
X-CRM114-Status: UNSURE (   9.04  )
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


On Tue, 24 Feb 2026 16:38:18 +0800, Chaoyi Chen wrote:
> The rk3576 evb2 has a full size displayport connector. Enable it.
> 
> 

Applied, thanks!

[1/1] arm64: dts: rockchip: Enable displayport for rk3576 evb2
      commit: 35dad33703e8b40090e964257eafdd66e53f38eb

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E71C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J3nsr2WcThpiN8HjFFto6IPGsd85QeLC6r00440m0M4=; b=cwc7L3wR83V+9Wzym8meEv/9EW
	Y8e45clzX6OM5LTXoI8/3bTtXuG5H32rTjSDnTmFRePDxtOVnXKG2eo/9YBOtFOM99pOYQGbYkeqa
	hPiQ1hbuX4jHC/21VnOWslpk6HSLKUyXgfsWER6aBm+FwQsBZdlQRO9ZYiW+wRESGGAQFapeQtfUf
	T89tjqMl3AnDSgZdIwglxFuz0LOHSc9IK79Vt4Kia/KqExSSacyJ6O4xjCAJ3mRNqw5apLnJtyqTB
	+MWjp4BAdZdCIgt50rQxiupOVjayt6jsqDZP098du0MGvxv6LGZTs0nUmaRe0cylRfU/GHuRsYFLh
	8YpEKc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81zf-0000000F8Mz-1fO1;
	Thu, 24 Apr 2025 19:12:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80k8-0000000Ex4W-1Qk2
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Apr 2025 17:52:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=J3nsr2WcThpiN8HjFFto6IPGsd85QeLC6r00440m0M4=; b=a3o3KIAjTCPnQs2/mupQkQcQhg
	Nk0Xy3T1L44PpyhHq6OtSk0Ie4GW5aU7jOn5JELggjDGBY591btwKmp+C0Bya3d4NJwMvku0Y7ukF
	lcoTnrb7wi/tKR5IYoN99UNWnoLUbx3ltRDGh59h07zT5fDqh+BnPriB0s6wH/wtsVFmwIsEC+Eeu
	7iIgsjk/hvIKvdDpAixIQ/ngdCJq+Cj9eCo1t2QX5MZ1g/3oqRPRvKrsTxWmmac9baelbShVDZRhm
	cIP9mbLZhEqxVkm0Vf5E9CTkqY18QcKzk//XvJJKSJYrojGCWfIiTsvBG7OfgTf3xD7+eDOK4D/2n
	mFYGjJvQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u80k5-0000000BtDR-0S0H
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 17:52:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 28155A4D053;
	Thu, 24 Apr 2025 17:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF7E8C4CEEC;
	Thu, 24 Apr 2025 17:52:05 +0000 (UTC)
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id 39AB95FE68;
	Fri, 25 Apr 2025 01:52:03 +0800 (CST)
From: Chen-Yu Tsai <wens@csie.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20250416100006.82920-1-amadeus@jmu.edu.cn>
References: <20250416100006.82920-1-amadeus@jmu.edu.cn>
Subject: Re: [PATCH 1/1] arm64: dts: allwinner: correct the model name for
 Radxa Cubie A5E
Message-Id: <174551712323.4050580.15085872783453662439.b4-ty@csie.org>
Date: Fri, 25 Apr 2025 01:52:03 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_185209_305069_CEE6082B 
X-CRM114-Status: UNSURE (   6.48  )
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

On Wed, 16 Apr 2025 18:00:06 +0800, Chukun Pan wrote:
> According to https://radxa.com/products/cubie/a5e,
> the name of this board should be "Radxa Cubie A5E".
> This is also consistent with the dt-bindings.
> 
> 

Applied to dt-for-6.16 in git@github.com:linux-sunxi/linux-sunxi.git, thanks!

[1/1] arm64: dts: allwinner: correct the model name for Radxa Cubie A5E
      commit: 1e5a69d67d1b3c55c9b0cd3933af1436b5d52aa1

Best regards,
-- 
Chen-Yu Tsai <wens@csie.org>



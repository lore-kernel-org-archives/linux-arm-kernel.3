Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 905F3E77173
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Dec 2024 17:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TrdGxxgROWPGf/peMVvtIkoArMTlI7ctFeUvyS0ZGPQ=; b=cpiwtzNhQQvEPyJreafw7tfF5m
	/Wvv4JhJFRLpE1tDDBMiwELU0JhP2R/V3OqzeX/Jc284kUot0ySRl2lUCpfsQghrS9qZozbzytZM0
	Nzaep/EgaQxezfqxMDjyC2Jk9ZexgeeEYE1/qdhTtBa0CV+d+B0abUpRF1fdrzfJN1m0lgFhuxavR
	CSwdVSRAHFn7e4p6Q8qfoBcoL8T6mSPRc2GavIERHJaBrRpWLl1KW1HpZwCorX+tZ14tB1plXrw2w
	uZf/RQ0ONBisoFPUgBIG38oY93n1qaCs4sEQraaxcG/k4sYj2cz6fqAUvelFbkmE6pkd+9HsNJcoK
	FbgpSchg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKkC-00000005cdP-2wKr;
	Sun, 08 Dec 2024 17:06:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKKgm-00000005buU-1YDe;
	Sun, 08 Dec 2024 17:03:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 00F8CA40C61;
	Sun,  8 Dec 2024 17:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A28CC4CEDD;
	Sun,  8 Dec 2024 17:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733677403;
	bh=OQkhVmHg4WqmUgczbEyYtY9bQLY+9YiQA/1vSnNXn7M=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=aB6UnM31+8W26tb/TQGEB9kp4chVw7K+fN1hsk2+kyCzCRph0z3e/3+f1viJd0Yog
	 nq3xYt3QDjgDObDUsA3eB/pOO2Zd7wGTVtZ4j8IiHEHbu4frOIWRwkJ1k7PzcRtAbW
	 MvPhglU7ADKMPeavMaFtruBqJ7KGFFiX5eza6vBFn0SfAkxbh8GHc6NjA2JVsm7Xl4
	 5TomGWUT4SdV1xSaCJQaAk0iZuut3ZYu0OshFFQIZaWXiUNOrSYr8pzQ89NAfPjgYv
	 krs18DD4JjQKAP0aJ8JDncaNlaYdLyl82gG5Xgf+EUK1pAZJ4dFdiweRcQpfWMC7oU
	 JQ7Iog2fEsIBw==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, heiko@sntech.de, Frank Wang <frawang.cn@gmail.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, william.wu@rock-chips.com, 
 tim.chen@rock-chips.com, Frank Wang <frank.wang@rock-chips.com>
In-Reply-To: <20241106021357.19782-1-frawang.cn@gmail.com>
References: <20241106021357.19782-1-frawang.cn@gmail.com>
Subject: Re: [RESEND PATCH v3 1/2] dt-bindings: phy: rockchip: add rk3576
 compatible
Message-Id: <173367739882.1042266.13564574904755489254.b4-ty@kernel.org>
Date: Sun, 08 Dec 2024 22:33:18 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_090324_479512_C563F075 
X-CRM114-Status: UNSURE (   3.44  )
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


On Wed, 06 Nov 2024 10:13:56 +0800, Frank Wang wrote:
> Adds the compatible line to support RK3576 SoC.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: rockchip: add rk3576 compatible
      commit: b136e9928dbe5e71474d9e2c8911c4a094e329c2
[2/2] phy: rockchip-naneng-combo: add rk3576 support
      commit: ba8ad7eece66ac5c579dd8de39efc72770e7cf64

Best regards,
-- 
~Vinod




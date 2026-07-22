Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200EAC4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 05:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hbQw3W0t7DCWGLYQc20VbVCF0idVw+jcX4clr+Pc7k0=; b=fYtz3T7SsKxh1rlu6gQH2Jr3Ye
	UVM6/IWN5GYGu+oEoPMk17mcD4r9vQa1H7yy1q5MludiF4pL4Zd/bTV1VniB6iOoKgxXYYVeXsTXE
	lWtbI5zqhhRg8H+/DFDMnQe55C5IcQxivTtJ45vElgtPlAKCL3rDvEGQCc2qhMZUhiy4pcc1jdhku
	RDJAkzS+Gvyh5OOniyeaGmt5nKMMESVTWKKFgWGkCZdiHjfbtU8FWtCpBYvKBZbrKpPsTHRrxRTMe
	HoJL1tKwu6PIrvBbiz06lO1suZRRyOW4bcR7/CdQAVQsMXbkFo+6ra0dTh3PpgZqrpTnmbk2d3qm4
	ubnql12w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPit-0000000AvxN-0WCU;
	Wed, 22 Jul 2026 05:42:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmPiq-0000000Avx2-3goQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 05:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1784698933;
	bh=hbQw3W0t7DCWGLYQc20VbVCF0idVw+jcX4clr+Pc7k0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=nIScDihU9wxPUYN9bA4sZT6/4MEoB7cAybII5TNLOm4Fc+o9ccci2sNpQA/ji50gV
	 l1VNEZYBy49MJezDHQfIa1rK1xfa3xvV9kF6R67D6S4DDf/voA6PAGQbd6NKwUsURh
	 svx2rmKzC+XFEEdKvBq6Ai4w2VQMqWgS/FVoOakbuwPKk13BDlhSSJ2smYwj1LFYmY
	 X/q0ql7zj1XQbWs3vcE8rpJjCUbvT5AucOdDFHJ+G1StTzw24/hJHcldOq2bYjhksn
	 6VUbDvT2VR6mM870VlKSujo/6W3DZtuX9BwcrmqjTEvqF7BgR+sLcZRR83ByjtoBO0
	 sll7oWMTbxjWQ==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2EE1165B37;
	Wed, 22 Jul 2026 13:42:11 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Patrick Williams <patrick@stwcx.xyz>, Potin Lai <potin.lai.pt@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>
In-Reply-To: <20260721-upstream-sanmiguel-fix-fio-ioexp-intr-v1-1-8245ae0ca590@gmail.com>
References: <20260721-upstream-sanmiguel-fix-fio-ioexp-intr-v1-1-8245ae0ca590@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: sanmiguel: Fix FIO IOEXP interrupt
 pin
Message-Id: <178469893176.629993.5702015627237024967.b4-ty@b4>
Date: Wed, 22 Jul 2026 15:12:11 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_224225_121817_AB69D0BA 
X-CRM114-Status: UNSURE (   8.18  )
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

On Tue, 21 Jul 2026 19:01:59 +0800, Potin Lai wrote:
> The interrupt properties for fio_ioexp (pca9555 on i2c14) were incorrectly
> configured to gpio1 with ASPEED_GPIO(B, 6).
> 
> Update the interrupt-parent to gpio0 and the interrupt pin to
> ASPEED_GPIO(C, 6) according to the hardware specification.
> 
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



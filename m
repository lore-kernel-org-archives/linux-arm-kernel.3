Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kubpm4xnqh0a39pb6Q6Bm7VmLGuw6CnmA3P5cLUgdSA=; b=A+/miCPyMOp4FX9hXINMl4JNLm
	RFdoc9jNaQMTx638vjny8Lj4PPjdzsZm0/ITUWcffBwUXBBbI35fAAaeJr6INQP3M2OjOklgVgkD1
	pF4carHKbBhRqlgnH1J8+RMzbA2tJgGb1+rdagk+yOWoU5FYHTiNoL/Z9nn5L8g++vUlpV4cDpGiN
	NGg6ogPVBzxoTinejcho7lTbUlIcYJjWXYcKaMbe9NdW4Q++yRQljEpyNzDgVSg42Mqt1PfqIVjqn
	QjyJI64w07ifFXkEcHGyxHkuc/gVeojmhLc+MuMY7TsgZxYaHFb0YDdy5/+7WI8KVQtLffJkChqUP
	gALdHnJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8wB-0000000EJBZ-0gEE;
	Mon, 29 Jun 2026 10:09:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8w2-0000000EJ8d-2YNH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:09:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CF5E2600AB;
	Mon, 29 Jun 2026 10:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B531F000E9;
	Mon, 29 Jun 2026 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782727789;
	bh=Kubpm4xnqh0a39pb6Q6Bm7VmLGuw6CnmA3P5cLUgdSA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NgLUVKR3BAKMusaPcrQtz0TKcOl74oftK36KTrMYSEjl1XdEKnsHKQqXbPFO2Nxtg
	 G0mMzPwY2tbASv+FrRNH59ZlNDERPB7koDK26pnBjDnTI3WXHaCSmfcmeOtbvcC9WS
	 1OpSeq26g+vSUVkSjQ/NCQ9Mb/g9oCw7E9EDhIDLBrF6JFLxiUsp/5MwtoboQAihb2
	 +WFV/1WAlQe0bQIS2X8WY+1tKWKwuPRgaAYoc4I8GjCfM/BwUlOj8xy3DSvH4ZjWHv
	 ryitwd2u0iUlmvbZSYcbjqooIyRPp7a6xikR70f1K3/lIKJT1h/0x/SZvZFInY+R0w
	 8uQzddWgzE+Ig==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Peter Griffin <peter.griffin@linaro.org>, linux-kernel@vger.kernel.org, 
 Thomas Huth <thuth@redhat.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>
In-Reply-To: <20260619125827.215977-1-thuth@redhat.com>
References: <20260619125827.215977-1-thuth@redhat.com>
Subject: Re: [PATCH] ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 header files
Message-Id: <178272778707.113362.4140243522437005166.b4-ty@b4>
Date: Mon, 29 Jun 2026 12:09:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
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


On Fri, 19 Jun 2026 14:58:27 +0200, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize now
> on the __ASSEMBLER__ macro that is provided by the compilers.
> 
> [...]

Applied, thanks!

[1/1] ARM: s3c: Replace __ASSEMBLY__ with __ASSEMBLER__ in header files
      https://git.kernel.org/krzk/linux/c/7b06ff772080919fdb194c95af6b1e3acb079b71

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>



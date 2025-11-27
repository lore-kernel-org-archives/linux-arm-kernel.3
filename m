Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED0ED116E1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 00:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSyiRW1FlOenglm2u/M08PCHR36GOfF+K01IO6BA5Ig=; b=Zmkt+EhoF5m4Z5VNqp+I9TgwYD
	E4rjCpqPhEYY9PANVXbLttzoVYdtooz0LnBKtqbTGId7jbsAlz8Xh1Hdb8FGoM3KlY+3LyJLWgPnr
	2uVRZsnwrionA05emjYOdBhQJ0ONb6CnppMEE8wjXiDR7loZlfkZjAi04A7efC28eg3nCA4Qde85C
	EA1ZFtDu+3HCMH411MCYsXiCQderinPaZI7xcodYV4DaF4j4M2sv1s7p+MGv0vAR3ZqmKToG15Pnn
	KEdnc0jC+7JnSYtEfThEZ9W6lmi9vHjb/jo8IWL3bu5qn4s/fCYjjh7TuHPnaK+2EYqrslxb8L68a
	eGCXydVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOPZf-0000000Fn4n-35rW;
	Thu, 27 Nov 2025 00:09:27 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOPZd-0000000Fn4I-1rIU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 00:09:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1764202163;
	bh=YSyiRW1FlOenglm2u/M08PCHR36GOfF+K01IO6BA5Ig=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GE6RTA37oHwxcE3MmkkWQlnKhuyPc50WN4YCD/uIHWekOMcWGHMBIGnpSh1ZsGjMS
	 E02qnWPiyPhJhhkwPiSyk78cnsjwNYsrG/kw6LC3VY9bABUGr+oDRPu56YGv/jXufh
	 VYNSHsscnTxRPnQfhJ/i9BgcRJoGkmvZgZ+ToNgyGbR1Nc9HahM2nUq2V8wK48tR4O
	 dcrbhTSJ/nK9Fiu3RFwsJ4ls6ouGdG3x0Kf1OjgXsp51P7vQoIY5ldZcNuvkUaEW38
	 NE5NhVKc+DLl0fz7jxGireNzjoHA4gwQ8YodAMcnzgRFLzKN5ilGl4ot+C47c8FAcm
	 6jgH2SBAy/bvg==
Received: from [192.168.68.115] (unknown [180.150.112.38])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id D1CE36561D;
	Thu, 27 Nov 2025 08:09:22 +0800 (AWST)
Message-ID: <f1a18e7b8deb5987164b4506f8400dcad67a8862.camel@codeconstruct.com.au>
Subject: Re: [PATCH v4 2/2] dts: aspeed: Add a dts for the nvidia msx4 hpm
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Marc Olberding <molberding@nvidia.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 27 Nov 2025 10:39:22 +1030
In-Reply-To: <20251124-msx1_devicetree-v4-2-a3ebe3110a67@nvidia.com>
References: <20251124-msx1_devicetree-v4-0-a3ebe3110a67@nvidia.com>
	 <20251124-msx1_devicetree-v4-2-a3ebe3110a67@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_160925_682597_74579ABA 
X-CRM114-Status: GOOD (  11.59  )
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

Hi Marc,

On Mon, 2025-11-24 at 15:14 -0800, Marc Olberding wrote:
> Adds a dts for the nvidia mgx pcie switchboard reference
> platformi hpm. This is a dual socket granite rapids based platform.

I was looking to apply this, and set about tweaking the commit message
in the process, but the more I tweaked the more I felt I needed to
tweak. So rather than do all that myself, I'll ask that you work
through these requests :)

The things that I'd like addressed are:

1. The subject prefix needs to begin with "ARM: ", so:

   ARM: dts: aspeed: ...

2. I'd rather stick to formalised naming and capitalisation, so NVIDIA,
MSX4, and HPM, Granite Rapids etc

3. "Add a dts for" in the subject is a bit redundant, as we already
have "dts" in the prefix. We can trim that out:

   ARM: dts: aspeed: Add NVIDIA MSX4 HPM platform

4. "HPM" hasn't yet been expanded anywhere and it's still a mystery to
me. Can we unpack that in the commit message?

5. "Adds a dts for ..." in the commit message is self-evident from the
patch. Rather, can you please talk a bit more about the purpose of the
platform? I'd like to see discussion of its use cases and any
interesting points of design or implementation.

Cheers,

Andrew


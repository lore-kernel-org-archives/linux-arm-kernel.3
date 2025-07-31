Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BB1C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 03:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=quiVJQfgnApnKSx34eCN3/yRSyocJqA7hv+N5gRbILQ=; b=Z+EU8pqFFyzHHF+M4CsdDAorzW
	yhlW/E9mkEoWzI5ThvTltKIA1u+eu+YVVvAtBtVrDame25exCmztu3akPjIwGYAPUU9j/e67U9E7a
	D4h1dFRruIHho2MFvnJNmQ2+ohIawF+P9qcE8NkTlHSxfPA3SI1oOo4R1xhv1ovzkUOFWzb2X9o/1
	SCiZdFJ/Ztl88LXUmzmLtMdbZBPWkMaLImTqe6+deJtwxPhkr95AKmrH8LAOrxYjiNC001c6blhkS
	++rjHSLVp/9usegeMsw7vuYndXLKr0yGzzJJoXklDmJ/gdlhXlI61Yf+Re5rbDjU9iaVb+DuYaXDx
	Qux96nHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhK41-00000002q1t-0aFL;
	Thu, 31 Jul 2025 03:34:41 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhK1Z-00000002pqR-1Rn8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 03:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1753932726;
	bh=quiVJQfgnApnKSx34eCN3/yRSyocJqA7hv+N5gRbILQ=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=HED3WeGHV0Udep18IegiMfm6WyZlqxMnpgN54EKUnt8wMgVd8M0P+zL0YU6xOr1lO
	 QmRpXuJL5BNJ4pgcIoRvFv5u6B6FR8zIjKg7jFqkngbo77xRRVHegq8daiCUNuT9pb
	 3zA/k9KJVq6oeEgE55h+3wpLuwI6MyzLNKmPLhQX/eGppaQ9LSX1rFv5R/EFj+NP2e
	 VWy7+O6U/GcDfhS8/E46pba3iH2HuLmRAFoQcAA2Ztn3cazv800rajqNjABIh/dgOL
	 F/sL5gT+Db9YVVfXP1nkufrPIdBh5i6IKvji58x2S+X456962TN3pQaLf5bcuSwof6
	 b1a3QTn9Ct97w==
Received: from [127.0.1.1] (unknown [180.150.112.70])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0D10F69374;
	Thu, 31 Jul 2025 11:32:04 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>, 
 rentao.bupt@gmail.com
In-Reply-To: <20250728055618.61616-1-rentao.bupt@gmail.com>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
Subject: Re: [PATCH v4 00/13] ARM: dts: aspeed: Add Meta Darwin dts
Message-Id: <175393272444.1011263.10036967590309258484.b4-ty@codeconstruct.com.au>
Date: Thu, 31 Jul 2025 13:02:04 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_203209_574611_1385712C 
X-CRM114-Status: UNSURE (   8.01  )
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

On Sun, 27 Jul 2025 22:56:02 -0700, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> The patch series introduces the initial device tree for Meta/Facebook
> Darwin AST2600 BMC.
> 
> Patches #1, #2 and #3 fixes the DTB warnings in wedge400/fuji dts and
> ast2600-facebook-netbmc-common.dtsi.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



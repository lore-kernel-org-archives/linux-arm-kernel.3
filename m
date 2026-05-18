Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41475CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 11:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqVGUA3uSgAUjexcINA82gz5Nnz3mAqZB4EHGUzNSx0=; b=Off+egbJrRcH8lbeDHLo6B1l8A
	3DPpOCAPMXp3CL7RbnUQxhaokvSwpoZ1kzq6mU0jwJsIyQuwLhXcLQYj2tLXe5hWn1iz6oHsDqXyi
	kszwfxA4W4BFqVPN87t3p1hKLbAqK+slxiBV1+kF1S06xrubpZMRSCwSXgNF3QSSgZUDGhs9ooJkN
	cSdkATCJywLmsBhZ2LLtwk+gUEg79yH55GBBuv3UYtBjqYaze4o8Blwxy5LHPuiuSKOwgOvAveV44
	Y6Ic8t0xkTqR7ELib0/XYPdkLU4XL5Z9YDb4U07Oa3xyzwRj12Sr+Y409LAilo8NtZr6WWSYW8tix
	MVXTVciw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwSS-0000000FUkn-4B7o;
	Mon, 18 May 2026 11:48:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwSR-0000000FUkL-1q3u
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 11:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RqVGUA3uSgAUjexcINA82gz5Nnz3mAqZB4EHGUzNSx0=; b=O+Xki/PDBBaIsHo9ceAF+8aQGb
	KnLo0ulBnKhZPJIzKc2fr99FHrNGesb1dZ+pJmYLeDeTjipNJv4AOYV6Ps8ViwjUklBsDonmbMTRV
	qR8yjRfGcyDOEhhEM4OBAmBieoyn0ohGSiAuuHnq4xa+wOVLu3KSNgRJjRPaulo/honkfyumljk47
	vm7U3BUVJHyjrA3dIWFGuu4ZeoE3F5b5SuF/A6h5zfAlc+mFGCXFLzDjkx7AneWtJ6ujvbvhNvMGD
	POOMuUjGNpsEiDm8tD5DpPzAlsZV20PDQVL3BvfWdEQV0obqOgqtS7LEA5Agj3DjBB2imQCdK1+K9
	LRyemxsA==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwSN-0000000B0DG-42RU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 11:48:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779104897;
	bh=RqVGUA3uSgAUjexcINA82gz5Nnz3mAqZB4EHGUzNSx0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Xdhit/c8ZXUu6hclYtQqjI+ZOMKReIoKuek0qUDo64h9QYqlKaC0SJ8TGIA47m5NU
	 EldYK6ZYamgBeIRR7tMSb8ScpClPRYE4TW/372xHB7W4UUfiSWozN17herbMvVE1EO
	 u3QmYaJw/jFZ2l3zaYKjLvO67E84X0w1NDvgTZODvZW5l55wukjQuhOGLXx9D/UI1N
	 4jUAGFm9mZSRPMVNsKZ9AB1scpwT7gupExcmESL5l2pJFs97/WhAIg6GNDDeVVqfcH
	 +/d56zuLxI0wHiqIzZidd4xSQcsE38KryfYrEa4VIsLS6vd677xlBy6wd5r4TLWJ2A
	 Kagxg9eQLaKGg==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 696F56024D;
	Mon, 18 May 2026 19:48:17 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Rex Fu <Rex.Fu@amd.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260417-anacapa-pca9555-irq-v1-1-9a6d28b1b656@amd.com>
References: <20260417-anacapa-pca9555-irq-v1-1-9a6d28b1b656@amd.com>
Subject: Re: [PATCH] ARM: dts: aspeed: anacapa: add interrupt properties
 for PDB PCA9555
Message-Id: <177910489732.1782799.1747360209738224632.b4-ty@b4>
Date: Mon, 18 May 2026 21:18:17 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_124824_688351_22C2BE0A 
X-CRM114-Status: UNSURE (   6.28  )
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

On Fri, 17 Apr 2026 14:41:49 +0800, Rex Fu wrote:
> Add interrupt-parent and interrupts properties to the PDB PCA9555
> nodes in the anacapa DTS.

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



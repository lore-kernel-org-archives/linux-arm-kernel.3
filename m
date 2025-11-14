Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C19DCDB480
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 03:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LkBcRmHvmZztAg15UTFgf2ghFALYicoycTuXTQeNpLI=; b=rTkKxoM2pcNEsGCeyWjzXYKnJK
	DGcBJCnOiBzsQz3yoTakMKdI01/MMWN3XBkmC793mmEp2diq/mfdzwwJ5Mht1WUYXXDy+PxrhoCZs
	1fYUGsoo362ovJ3Jkl4MypuwoQlHSIg2bh+zWjzCwTamy+JmS19Lank5ZJhncUPT7CnUDhxSwK4lW
	xu+3gLaLVZ2ZwHgHl3nkBcz6+vMbhWVO00KtS67Lo/iZGc//qZ2Rwtj1XYnJVdhK+05KLJtj7VzvO
	MeE/Y6e0nALECfuxu1DrtjMmdS5jrF/p26rmaa9F9kpCkJtA2p9P32q4xCG6hStQA6ONoElUxEB2j
	BAar07Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkBK-0000000BS78-3pMd;
	Fri, 14 Nov 2025 03:09:02 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJkBJ-0000000BS6n-02rg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 03:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1763089738;
	bh=LkBcRmHvmZztAg15UTFgf2ghFALYicoycTuXTQeNpLI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=bxCFrfRGtOhiqaH6YjjW34vey7hfyohGVUDXs4rXRDpIaalml+Kg1H6rhgvU+j8LK
	 AUTtHG/70S0byNZ6N8/heuWQcliGX0ED1yD3+ASVQSWv3hpscxLjFRcLziSX0PAd1a
	 R7ZkEfQCa0XFpuDu/jxjprfJxSnYzpwPUK0xQcKxXP/u270pO4PI03vf/R9HJ+8lxF
	 2q8KHnVMvTBD0WKZ1H5YB2C9bcCTSSY89iUlIcXBy7v5eknwtoroVUxhyrWXLaQDgN
	 zGpY50iQz51euGEntKrXPAQTFDJtyZHiQoYOYReJ3u1pkY/wGG0WkYMoMdUI8s+ire
	 WRvch65URQtZA==
Received: from [127.0.1.1] (unknown [180.150.112.244])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 080CD641F5;
	Fri, 14 Nov 2025 11:08:57 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: joel@jms.id.au, Daniel Hsu <d486250@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Daniel Hsu <Daniel-Hsu@quantatw.com>
In-Reply-To: <20251017134402.2073042-1-Daniel-Hsu@quantatw.com>
References: <20251017134402.2073042-1-Daniel-Hsu@quantatw.com>
Subject: Re: [PATCH] ARM: dts: aspeed: harma: add fanboard presence sgpio
Message-Id: <176308973697.854884.17577431047566755576.b4-ty@codeconstruct.com.au>
Date: Fri, 14 Nov 2025 13:38:56 +1030
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_190901_245879_29250DB7 
X-CRM114-Status: UNSURE (   7.20  )
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

On Fri, 17 Oct 2025 21:44:02 +0800, Daniel Hsu wrote:
> Add the SGPIO definition for detecting fanboard presence on the Harma
> platform. This allows the BMC to determine whether the fanboard is
> attached.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



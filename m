Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9005AC77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 23:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+f5W0eoB477n5tZdxO4dFP4iyclYTFOfRC2PI/WiYY=; b=FxDIwKfnQ+ZcApGqujy6HayWm/
	DxDaP+6MqGwChaLXKAtWlAr3tg4+g94Ecl8NxnD3CuMOT2hCMRcoWddr9BKCj4Wg4VduFyawokN5h
	HDoN7OBhmCB3nY2v8kcdxKptMqStJZkXgaHzE9H4BWc5aa2o/gaSqiGwivmXa3w4bX8QcsUaiJA1J
	llSK83nSrTaHfnBTNUK3b4tIgKSGYX1xVJOflSAjoc3NnFiTE2wLwXOYENL8RzieIweDAoWfqFCFX
	LilKTFBa4j8e7wXYFSjQiUDE6PqfDIjeVwQL+L3cARlUUq66ytGUPlo6w9rWxbqjYFYUrKffvcM87
	xa6EAmZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD3T-000000076B2-2Rgu;
	Tue, 24 Jun 2025 23:27:55 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUD1A-000000075im-3o3K
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 23:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1750807524;
	bh=w+f5W0eoB477n5tZdxO4dFP4iyclYTFOfRC2PI/WiYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SMCN3RjJLGMVXWlCMZWDR6UnRhkHcHT/gEstpcg32yeThnUmB6Gv1XAflf5HeaSRg
	 T3LMr/jtSoAOdYqskjI3FY/MeMJ9+iVYDyin7TYwVsiwS3WrM/M3/Tb1Lc068tVrPN
	 CYrDZOKXWvwqJNAqrVcoCCTPii+Qqdfqwx+uF3PyhMgDrSpdn6Nkh/yhZwQYM2tsf0
	 jga6hPoQ4mJxtCeTP+ReDsJE2Tu2jol6+7d94Yqj2fX7S9yQpFhY5PZN4mB356fM2V
	 uEMSlt6SbF6ZPDwAQYmzS5qK+skcHVO4uXF23f2m84Sf96sq4pU5ttMrWikiK0hBJO
	 qH2eJULGxULRg==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 329D9640CD;
	Wed, 25 Jun 2025 07:25:23 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Cosmo Chou <chou.cosmo@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 cosmo.chou@quantatw.com
In-Reply-To: <20250622034247.3985727-1-chou.cosmo@gmail.com>
References: <20250622034247.3985727-1-chou.cosmo@gmail.com>
Subject: Re: [PATCH] ARM: dts: aspeed: bletchley: enable USB PD negotiation
Message-Id: <175080752310.266748.15058369884173202115.b4-ty@codeconstruct.com.au>
Date: Wed, 25 Jun 2025 08:55:23 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_162533_152873_288B215E 
X-CRM114-Status: UNSURE (   6.75  )
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

On Sun, 22 Jun 2025 11:42:47 +0800, Cosmo Chou wrote:
> - Enable USB Power Delivery with revision 2.0 for all sleds
> - Configure dual power/data roles with sink preference
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



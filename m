Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DBC4C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 06:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uN1gPb2PJM1vKZa2B8fQ33X5LS8Zuqa+quq/5JZM2BA=; b=itfMb1fSADA5pk1Af05zUbAtox
	qKRYVu2jotaD4hHFE01a4NJAjGPzZkDXkTWZx82kVX3r4vGeFahPO8Phc1Eg/erOqlyrqjlVVqHAc
	mniWANwLlDxisARTq41YHtj4GiD95Cnmxma35OR4PG0wGVTaQhELmwXoAmCcnCHoRhLSBIQCINPpl
	0IyvfQbJ7d1fudJJvY4vuUSNoBYy3RgfxWsa34s3zLwKlqt31uJbSWFy9CWV/HphWAqwMO+gHUmEl
	TIXIF39M/kN/yKNAQmqplBZMizogKCQvURrUxVgOXRr5eSDK6q0W0QHbrrz2lE5DY+WlgRTgZEFi8
	M+b7uCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxqc-0000000FU2A-0jnc;
	Fri, 13 Jun 2025 06:25:06 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPxoJ-0000000FToI-3B9Y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 06:22:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749795761;
	bh=uN1gPb2PJM1vKZa2B8fQ33X5LS8Zuqa+quq/5JZM2BA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=B40P4cfSWEj4Q/LwKoGxYvT4RLjXhogL2r3AVuZNFrSQ292nwIkZyyIfsr6TMQwAS
	 CGgpA0sNwE0nIfTa2ujfVAzpvNpLtYq/idY1aK5rrPMFwgOUD8PC1SkqvA3YR65cKr
	 yloqW9w8OQ1lIixBEdWjeJiImDFbd5arK9CATd1Ev3FbqZJcf2SvDFLX3Vf6fNxxlV
	 Sms1eChY2DZW5N395hSbJbPe4nLNGEleb1u1LuAtJUWCLuGIoQ/LC/M5xeLLFwd1Ea
	 h43xtY7ffyR6GKo4TQK95/ceTkELC9GH5HKYOaKbO/roMChk2eF9TqZDGj7oX+iiM6
	 gZYh+bW+Xguzw==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 616D5680F3;
	Fri, 13 Jun 2025 14:22:40 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, Ankit Chauhan <ankitchauhan2065@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250612075057.80433-1-ankitchauhan2065@gmail.com>
References: <20250612075057.80433-1-ankitchauhan2065@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED
 nodes
Message-Id: <174979576026.385457.16320702443597106607.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 15:52:40 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_232243_984364_055B84E1 
X-CRM114-Status: UNSURE (   7.44  )
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

On Thu, 12 Jun 2025 13:20:57 +0530, Ankit Chauhan wrote:
> Fix an obvious spelling error in the DTS file for the Lanyang BMC
> ("lable" → "label"). This was reported by bugzilla a few years ago
> but never got fixed.
> 
> 

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



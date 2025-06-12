Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D4FC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 05:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hua5sQUgLCroJtEA/gusAW9GCKDx3U8bgUR5LPfnzhw=; b=sPoHVebYgroNfY+UvXCaxnfeaJ
	0uIA2R0uwYnB7k8A7yCJNBv6o1GtqRLn0lxMkEvM4MOdBgXZg9D5WZS6Utosctl0i/5vloKQE66i5
	8LJOo3OtAnkjTt+F4fPBdgnakumKwHL2ggzr3IfMmnZSnyrEEbJ5Tciss+YPT+jpTNsq8p8uV12p3
	o/lojuJPu9rjPKpYGMzP9DS5XprNcK/rcVJ14yhPZaYdl9GhQP3cehO06DDAV1wTJnSIWFxk+WQrb
	g5V6ndCvrngE7zafKwJ6lmD4B36AIAjB7mKP77DnrtMYv2HRoYVMj2k9N/NY5TW14B1yRKxmWzMD4
	A2Aj3z4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaZw-0000000CEft-36iM;
	Thu, 12 Jun 2025 05:34:20 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPaXp-0000000CERo-2TV8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 05:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749706321;
	bh=Hua5sQUgLCroJtEA/gusAW9GCKDx3U8bgUR5LPfnzhw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZyN1xgxDp+vYZ2LEUoYVDDFhTjjdGrDq9YygHqnUAVRi+XIpSNL9SQn/omT/w8rVq
	 9SF5ioVDuo+WOuleqE1fkuf2aUlIYRtvj1mnRAWAlkbdj3OIQeR7phkrJEiQ1FXfE0
	 TXOce0dQb3o1mqIDGojdJrVus6GX+6j6Xaed87t75IvC4dXgcseLPyTBRQYwPzy+W+
	 VdqofRLHjm+YdIRmTxzzGhLE7gLhhYuqnMpc+OYZ/Snw90F9KuW5dtS70IFtd2hW6L
	 swnXC3U+xeUnKlF/sV47LLqbIeLI1oGXgKvuSq9TUQe3hTlhPGcvUGJgyBVtHFWHS+
	 cAsM/qFdkoGdA==
Received: from [192.168.68.112] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1BAAF6699C;
	Thu, 12 Jun 2025 13:31:59 +0800 (AWST)
Message-ID: <3fe9885cc54a328932915a63816ac1b7952689a2.camel@codeconstruct.com.au>
Subject: Re: [PATCH] arm: lanyang: fix lable->label typo for lanyang dts
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Ankit Chauhan <ankitchauhan2065@gmail.com>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 12 Jun 2025 15:01:58 +0930
In-Reply-To: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
References: <20250529-lanyang-lable-fix-v1-1-8a2dcb48bda4@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_223209_824362_D37A07F7 
X-CRM114-Status: UNSURE (   8.33  )
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

Hi Ankit, thanks for the fix.

Regarding the subject, can you please use the prefix 'ARM: dts:
aspeed:'? From there, I'd prefer something like:

   ARM: dts: aspeed: lanyang: Fix 'lable' typo in LED nodes

On Thu, 2025-05-29 at 17:09 +0530, Ankit Chauhan wrote:
> Fix an obvious spelling error in the dts file for Lanyang BMC.
> This was reported by bugzilla a few years ago but never got fixed.
>=20
> Reported by: Jens Schleusener <Jens.Schleusener@fossies.org>

Please make sure these tags reflect convention:

https://docs.kernel.org/process/submitting-patches.html#using-reported-by-t=
ested-by-reviewed-by-suggested-by-and-fixes

Rather than spaces, they use `-` to separate words, so:

Reported-by: ...

> Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D205891
>=20
> Signed-off-by: Ankit Chauhan <ankitchauhan2065@gmail.com>

Finally, all the tags should go together in the 'trailer' (final
paragraph). There should not be an empty line between the `Closes:` tag
and your `Signed-off-by:` tag above.

Cheers,

Andrew


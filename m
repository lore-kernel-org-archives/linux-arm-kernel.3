Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EAECA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 07:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B73c6gIij7Gu6gmBOylUKaG4gwTrC9yCJueKMpwDFZU=; b=N66SJKT4vCIRfGZ/+dW/jnl/Dx
	/6Sq/Tj242JuB24//KDfXPXQKFepXhHcdedLAMsZ4cdqNhdH2HXznkaUzfGLmQ/O4PhySlaNdMctE
	keUczQ3EN/je3MFpjmKvKGmX4mBYMEX9dW2ZuErii94DwtSpTpYMQwWqDZh2Nz0qU4OeTfoQ8/fnB
	zmM5AaAsp1Om1FNWthUP7nqe0OhQryQkcEC//kUuxZTUmUqOslRmG+vPAaigGXHJdvSeNotTWaHCr
	WEUIptTj1K4jq6SNEk40FUYVJDyi9YS3ktjzXFOaTDRn8vyMvUUPoe9lVomA2+IM9kTQTmocsPnAr
	il//Mpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uti1T-0000000598w-0xyb;
	Wed, 03 Sep 2025 07:35:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uthtQ-000000054iz-25Yy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 07:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1756884414;
	bh=B73c6gIij7Gu6gmBOylUKaG4gwTrC9yCJueKMpwDFZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=aOf5SlQ264YuDbugUNcQnp9ITm3FW+fR1OtXcY1vH+C8DTn/fQhqFiVfVuG/VSx1n
	 FUsH3jFxrM5/Tk1/pjhY0nOxGio7ty8X4zjqrtcXcI50WjlCUI974zKe78nq+XSMjr
	 yvvWiugSF6MH80RvUzwN2eb2IA4yHehGaJFAhZf+IyvYp+bah0DjAO0W0Nbahb3YCh
	 FwsO7r0EVtwUX9RQabtQGcuqbKnyRuXg1z/SSjgne2RQRtARyNACsVaH09xGat8Cj/
	 oob4cNBE3JHUgxTug5nCvUwWyPoZOlm1ZmlIhbC0bchowqB+Zy+1wvE/kEouCgXjE0
	 T86W4x/Ni5NDQ==
Received: from [127.0.1.1] (unknown [180.150.112.213])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 0ED656445D;
	Wed,  3 Sep 2025 15:26:53 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250829211318.1335862-1-robh@kernel.org>
References: <20250829211318.1335862-1-robh@kernel.org>
Subject: Re: [PATCH] ARM: dts: aspeed: Drop "sdhci" compatibles
Message-Id: <175688441391.934266.14858945902852809199.b4-ty@codeconstruct.com.au>
Date: Wed, 03 Sep 2025 16:56:53 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_002656_732666_CED7221D 
X-CRM114-Status: UNSURE (   7.68  )
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

On Fri, 29 Aug 2025 16:13:17 -0500, Rob Herring (Arm) wrote:
> The "sdhci" compatible is not documented nor very useful on its own given
> the various features and quirks of SDHCI implementations.
> 
> 

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>



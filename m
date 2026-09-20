Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E590C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 18:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwueozU53/C2htJ7Fzwy0OWbRV20vukAL5Bpt59P638=; b=3z9P2RDgjTz9mUGeGt8RB40kAC
	ZnCv4Dy99a0e/Cil3ygza2xjxaFIZr4Z4CafDUZsjUVHiSa9SLdCQoGg8SvXjgILqOHpn7Hiz88lk
	pI9iC1eFIFFTKFg8s+qaJ198dDhg23iU6Vsf9ShVVk+emJBWel1iDtHHkGqzuG/kXUPqDPQATpC0m
	AsD9h1S7mAbsxj400/D5L2rDNfRFztsW3/huxp9SOIQd8YYK9lxIjS+oygyXt1r9688V0BvF7dq4J
	1Jlnw1OcI745v1gkUh/hanjukLFSv3rt7i2lDFtsoWcDThts+ti33Xgk7cyn5GL9DersFzsS59bva
	MlwcC7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MFA-00000000DME-1oO1;
	Sun, 20 Sep 2026 18:26:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8MF9-00000000DLz-2Kjw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 18:26:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0828600C8;
	Sun, 20 Sep 2026 18:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3B141F000FF;
	Sun, 20 Sep 2026 18:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789928786;
	bh=FwueozU53/C2htJ7Fzwy0OWbRV20vukAL5Bpt59P638=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1f23Xz+aFTK3mI51uMNbbCmppEiYPqNdJSPNp+Lbc58x1TTv2AlvldinrQ89kEsj
	 I6i4YnlAKyVp5vq2kJR1SM+V1Rl8pEgeL14SXuCxcmcRpnik05XL4NCir2Qsd+COGb
	 49c7UhfLfAfLeWnh/Bg2kcsbEyAt1vrtCsq4VG8YKxd/HHbU8UgySZIqJqGkT06c/5
	 KNmtf6qCxCCdB2HfxM+Fa2WAq+5B6GG51guSDhlZQdWfHEF4iRcQAURzpiOiN2ilMQ
	 /s5TZrCE/dCMAy+dZ9fEGJH3gcPVNu+NZvqrquXrzPgDMYU5ya7kCsRw3yY8INGjud
	 T3Pr831b0Xb1A==
Date: Sun, 20 Sep 2026 20:26:24 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: vendor-prefixes: Add Sophos
Message-ID: <20260920-musical-kind-dingo-2fbcf6@quoll>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
 <20260919-send-dt-v1-1-365615a74ef3@studio.unibo.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260919-send-dt-v1-1-365615a74ef3@studio.unibo.it>
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

On Sat, Sep 19, 2026 at 09:44:17PM +0200, Nicolo Giuliani wrote:
> Add the "sophos" vendor prefix for Sophos Ltd., a vendor of network
> security appliances. It is used by the compatible string of the XGS 87/107
> firewalls, documented in a following patch.

Drop the second sentence.

With this:
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof



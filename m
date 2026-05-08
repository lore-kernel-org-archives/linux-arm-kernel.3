Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70EF3CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqtuJSGDNO5ECwD5qTpWrG3+H6LLJZbAaU3D2FX/gd4=; b=gx2tHMgo0kenpxarKQLrgyedFP
	t22i2bbKIRD5DpPzKR4dVPt4sgQ6UqVYLjUGiuI7TvXaRgoPGjYWlzwlcomvOMqdmGDdEb8GCVlbm
	GEbFhUBzxjI+cYcrKjZhS4lmOkjOZz2Ti9i33/3KwLJhN0bHeZdLE2eJDlWaeGV/J3chH0P4F636z
	gvF1YPV3a55rVW0zEspvxn01o9cJds9VUYd+NsSY5FRWQMAywGAYf2rEKJHWc/RVX0as6cMrEIhCV
	JCO2hbPcVmKnfltPq0lPWHCwaAj+QMB+kweVA4hpf+rZMnygA2pJ4rfsu3pVTCiIA32KYK80QxLNN
	Wssn0aDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNw0-00000006ybI-3uBX;
	Fri, 08 May 2026 16:20:16 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLNvy-00000006yaM-1sF4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 16:20:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EB0A10D4EC;
	Fri,  8 May 2026 18:20:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1778257212;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=OqtuJSGDNO5ECwD5qTpWrG3+H6LLJZbAaU3D2FX/gd4=;
	b=hRqjGfl6+Hz5Mm1zUBPkNTPEwQEZrJdTheBJmGcHZ6NaCgyPEVTOChWdnyLYCZLq0qUR1k
	wyKVW7M9z5wJD9VxgnZYoKELPhLfJsprJ3b+fXsh3BkL3VzwN9FK4V6XHdqltygfmr6z2a
	DHtLa1oyyKWjroTJ9KYbQNN3rnGyfPecg6MFsjR0ryFfSbGSt+JRMS3rIXZ/Xoefcq9RA8
	j/fB0dJU6a5YB1pBrmtJmfk6S67qvluYMOknwWqhNulPUE2TGx5XaJVMshhLaBUSQFQ/N4
	gkPp2eGek9S7w5BvjDHitaNlX/6ZBjSnUq4m2wdrE1pnBw1MguAFNVrYeuM3nA==
Message-ID: <dec2a7f6-80fd-4692-8936-969f8837a555@nabladev.com>
Date: Fri, 8 May 2026 18:20:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data
 Modul i.MX8M Mini and Plus eDM SBC
To: Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260407211850.79881-1-marex@nabladev.com>
 <65342735-44b3-4a2b-90ab-6093e0fd91c9@nabladev.com>
 <af4FO5vOx3ruwWBE@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <af4FO5vOx3ruwWBE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_092014_649526_887F257A 
X-CRM114-Status: GOOD (  10.81  )
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

On 5/8/26 5:46 PM, Frank Li wrote:

Hello Frank,

>> this patchset is now split. How can we proceed ?
> 
> I am thinking about it. I found an old thread
> https://lore.kernel.org/linux-devicetree/20250902105710.00512c6d@booty/
> 
> The current code base already supportted partitial of it, such as gpio and
> irq map for connector.
> 
> Internal chancel liu have prepared version by use nexus mapping for audio
> boards, which almost done to send out to review.
> 
> I want to wait for a little bit well to resolve or partitial resolve N x M
> problem.
DT connectors have been discussed for the last 10 or so years and three 
is still no real progress.

I would be happy to send a follow up patchset which would convert the 
DTOs to whatever connector implementation format lands in the future, 
but I am concerned that waiting for DT connectors will block this 
patchset from landing for a long time.

So how about finalizing this patchset, landing it, and once connectors 
become available, I will send a follow up conversion patchset ? Would 
that be workable for you ?


Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADBABC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 17:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=791kKsCtvcL27G3F3gD3D1lp1AbZShH0vnShRRRSdXc=; b=SgCnWLZFDjUqNtsB/2mkvfX1i1
	JBdPdGyeVile6U6Gxn8k6xbRLd/CCB3aYvdyOVKhyBGluhFBp+HpsqJgY5G/zaJQ9CeUg9KCrlilQ
	izH3e43eF7N6d8Z3rOwQ2TRPxMzVuHcbGsyTMXYpgNoDlWmdU1uDetaWrvSQEEocZMohoOep2LQyr
	UWoakYmDpepb6Q6QF7ULHW9ccJRcIo0AOJs7ETRPmt+dQsFJ80e3RITt+nNFVHOhNUui8B0VaG43k
	2AdAHLZaSEZONft6TA68QJ5nocoZyrp7lPXZfVLKApDcmtnvDNx77OwLyJQMkf78OKLNPid/T8F0H
	WS/K0HjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEjn-0000000GBdY-2cIO;
	Thu, 05 Jun 2025 17:50:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNEgC-0000000GB9r-3ntA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 17:47:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BBB74A005;
	Thu,  5 Jun 2025 17:47:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8295C4CEEB;
	Thu,  5 Jun 2025 17:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749145624;
	bh=A9RpDTJfroy6Nf58gs7nteWyYIb6O/JiEfFMidvPV4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oALIow4+z7B1COWINlhhGxNrlechLn0+VV9GIwo5q+nxNL7LRD876BkqYHWUx9ulK
	 k8EkcdVm3QfUgoUTNICgJ0KHnC23wmPwLJgZaagQJKnrj0l9k8kFskWm9AH3Nam3/3
	 +yw5MdLL7iazit8LwiJvQJr1M+6pwtiqUclZc5pwSCpF0sqVPLI3l7lqDK7tADKam7
	 b1QNVMjAnnQfI5MgNEUpNgA6QN1elXWlkx/FQqtP5kTo4JQFQmVstsHP0HJ2hDzpgo
	 AF14Os6Qrw4qWwJsVIfl7OGXAw8rf5lM3poqUf8O7NnvrO5KKLgS7nHlRlvdVaqH0D
	 sPq3bgZvWRy9w==
Date: Thu, 5 Jun 2025 12:47:02 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: John Ernberg <john.ernberg@actia.se>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Gaurav Jain <gaurav.jain@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org, linux-crypto@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Horia =?utf-8?Q?Geant=C4=83?= <horia.geanta@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Pankaj Gupta <pankaj.gupta@nxp.com>
Subject: Re: [PATCH v4 3/4] dt-bindings: crypto: fsl,sec-v4.0: Add power
 domains for iMX8QM and iMX8QXP
Message-ID: <174914560256.2922686.17606744758003855636.robh@kernel.org>
References: <20250605132754.1771368-1-john.ernberg@actia.se>
 <20250605132754.1771368-4-john.ernberg@actia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605132754.1771368-4-john.ernberg@actia.se>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_104704_967054_ED998BD3 
X-CRM114-Status: GOOD (  12.67  )
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


On Thu, 05 Jun 2025 13:28:02 +0000, John Ernberg wrote:
> NXP SoCs like the iMX8QM, iMX8QXP or iMX8DXP use power domains for
> resource management.
> 
> Add compatible strings for these SoCs (QXP and DXP gets to share as their
> only difference is a core-count, Q=Quad core and D=Dual core), and allow
> power-domains for them only. Keep the old restriction for others.
> 
> Signed-off-by: John Ernberg <john.ernberg@actia.se>
> 
> ---
> 
> v4:
>  - Reword commit message (Frank Li)
>  - Add explicit imx8qxp compatible (Frank Li)
>  - Move the job-ring constraints back to the job-ring section under an
>    'allOf:' to avoid the warning from v2 (Rob Herring)
> 
> v3:
>  - Fix warnings discovered by Rob Herring's bot
>  - Declare the compatibles correctly (Krzysztof Kozlowski)
> 
> v2:
>  - Adjust commit message (Frank Li)
>  - Only allow power-domains when compatible with imx8qm (Frank Li)
> ---
>  .../bindings/crypto/fsl,sec-v4.0.yaml         | 41 ++++++++++++++++++-
>  1 file changed, 40 insertions(+), 1 deletion(-)
> 

With the indentation fixed,

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>



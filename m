Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A14BFA3726
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 10:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgYp9nDvCADayKPl8seOF7olyWCXl8oVX/Pi2Z4CoI0=; b=dxRLk4tbfiBBRbGd6gZtPkTwR+
	Axw2KllGiFIRZ/n0gzd7b72ZxFDFXox4h/kCW+hexsYpJkuMu9KdYAfwPer+/2GMqu9bYct6C0GLz
	3qvJ+YSOyTGYg6udxq3cBgACaVDHSh/7XVgIZnvTkEYC+Ji5nZf1V3z7Q30eRcxrysGvAHFH3iUtY
	B6Zz3hnakQmCdLhHpayXD4WmE+dDjBTqlT17TkJ8mVsdifMeby6mj/JbIzrDEzoLTNSNxAiS+MXHU
	UArlIlouNf2+f05ZdTHywUrz+qx1EvTspGcLYlzZLmDT5R4mfUqA/82LlDLjfF2S4Hh68onzqty5e
	1jp7ITlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcBp-000000083gi-2Qmi;
	Fri, 02 Jan 2026 10:15:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbcBn-000000083gJ-2P0N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 10:15:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4000743635;
	Fri,  2 Jan 2026 10:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BCB4C116B1;
	Fri,  2 Jan 2026 10:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767348921;
	bh=d4z5sb7bmr1BuMkl4VvfvrNWs5fgs9S+SXf3Cve2jYg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ids168b3usTtwwYcWXFfbfYgr/wmLs1x4U6JIOViMU6eh63w5iwcfY7FiQEmAYHH4
	 vv6lFe6aq6RPyTWoB7pFoRJBhJWoZ+dXbK3w4DR1ryu0cj7y1AJOvAHRoBIv/sbzZH
	 VjzoJHx7BRIQZzix9QL1koqEj8EVzNBkbzW47vgJKXrm3eErBRALWhsvKbTN1mmdpU
	 ZRhZoRIfp/oHVBKTAPfniUBgbuX4/9yD/2NxafO+LFBI0vfY9fNS7vS+91h4n4Dhoy
	 sxkDa6Y5lrHaXKM36ppzH8hCqg3Xg1dowG0Zib93vRq+bdrOH6m2/rwNbg5Rvi2j7U
	 gdwDCQjiVKAXw==
Date: Fri, 2 Jan 2026 11:15:18 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Daniel Palmer <daniel@0x0f.com>
Cc: krzk+dt@kernel.org, romain.perier@gmail.com, robh@kernel.org, 
	conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: clk: mstar msc313 cpupll: Correct
 clock-cells value
Message-ID: <20260102-maroon-dragon-of-expertise-7bb714@quoll>
References: <20260101034306.1233091-1-daniel@0x0f.com>
 <20260101034306.1233091-2-daniel@0x0f.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260101034306.1233091-2-daniel@0x0f.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_021523_634197_99C3B527 
X-CRM114-Status: GOOD (  15.51  )
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

On Thu, Jan 01, 2026 at 12:42:59PM +0900, Daniel Palmer wrote:
> clock-cells should have been 0 and causes warnings when

Why it should have been 0? That's what your commit msg should explain.


> validating devicetrees.
> 
> Fix the value and fix the binding example.
> 
> Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> ---
>  .../devicetree/bindings/clock/mstar,msc313-cpupll.yaml       | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml b/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
> index a9ad7ab5230c..889419fba269 100644
> --- a/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
> +++ b/Documentation/devicetree/bindings/clock/mstar,msc313-cpupll.yaml
> @@ -18,7 +18,7 @@ properties:
>      const: mstar,msc313-cpupll
>  
>    "#clock-cells":
> -    const: 1
> +    const: 0

That's technically ABI break and your commit msg must explain also the
impact of that break.

Best regards,
Krzysztof


